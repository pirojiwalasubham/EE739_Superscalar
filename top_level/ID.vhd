library ieee;
use ieee.numeric_std.all;
use ieee.std_logic_1164.all;


entity ID is
	port(clk, reset: in std_logic ;
		ra1_val_out, ra2_val_out : in std_logic;
		ra1_pc_out, ra1_ir_out ,ra2_pc_out, ra2_ir_out  : in std_logic_vector(15 downto 0);
		free_rrf_vec: in std_logic_vector(31 downto 0);

		data1, data2, data3, data4 : in std_logic_vector(15 downto 0);
		busy1, busy2, busy3, busy4 : in std_logic;
		tag1, tag2, tag3, tag4 : in std_logic_vector(4 downto 0);
		C_in,Z_in , C_busybit_in, Z_busybit_in, busy_dest1_in, busy_dest2_in: in std_logic;
		C_tag_in, Z_tag_in, tag_dest1_in, tag_dest2_in : in std_logic_vector(4 downto 0);
		taken_branch_detected, not_taken_branch_detected: in std_logic;					-- OR of both execution pipelines
		spec_tag_rb_in :in std_logic_vector(1 downto 0);		-- execution line wala spec tag
		rs_full_in, lm_stall_in : in std_logic;
		lw_r7_resolved, alu_r7_resolved, jlr_resolved : in std_logic;            	-- OR of both execution pipelines
		store_retirement_count: in std_logic_vector(1 downto 0);

		free_rrf_vec_out : out std_logic_vector(31 downto 0);
		Ard1a, Ard1b, Ard2a, Ard2b,Ard1c, Ard2c, Awr1, Awr2 : out std_logic_vector(2 downto 0) ;  -- Ard1a inst1 opr1
		pc1, pc2, ir1, ir2 : out  std_logic_vector(15 downto 0);
		x1_op1, x1_op2, x2_op1, x2_op2 :out  std_logic_vector(15 downto 0);
		x1_op1_ready, x1_op2_ready,x2_op1_ready, x2_op2_ready : out std_logic;
		x1_val,x2_val : out std_logic;
		C_out,Z_out , C_ready, Z_ready, C_wr, Z_wr, C_2_out, C_2_ready,C_2_wr, Z_2_out,Z_2_ready,Z_2_wr: out std_logic; -- For RS
		spec_tag_rs_out1, spec_tag_rs_out2 : out std_logic_vector(1 downto 0);
		store_tag_rs_out1, store_tag_rs_out2 : out std_logic_vector(4 downto 0);
		C_busybit_out,Z_busybit_out, C_2_busybit_out, Z_2_busybit_out : out std_logic ;
		C_tag_out_arf, Z_tag_out_arf, C_2_tag_out_arf, Z_2_tag_out_arf : out std_logic_vector(4 downto 0);
		busy_dest1_out, busy_dest2_out : out std_logic;
		dest_AR_tag_out, dest_AR_tag_2_out : out std_logic_vector(4 downto 0);
		C_tag_out_rs, Z_tag_out_rs, C_2_tag_out_rs, Z_2_tag_out_rs: out std_logic_vector(4 downto 0);
		ra1_invalidate_out, ra2_invalidate_out : out std_logic;
		pc_en_out, ra_en_out : out std_logic;
		arf_busy_wr_en1, arf_busy_wr_en2, arf_tag_wr_en1, arf_tag_wr_en2 : out std_logic;
		adder2_out, adder3_out, ZA7_1_out, ZA7_2_out : out std_logic_vector(15 downto 0);
		S0,S1,S2,S3 : out std_logic


		 );
end entity;


architecture behave of ID is

component RF is
	generic(
		data_length: integer := 16);
	port(
		Ard_1,Ard_2,Ard_3,Ard_4,Awr_1,Awr_2,Awr_3 : in std_logic_vector(2 downto 0);
		Din_1,Din_2,Din_3 : in std_logic_vector(15 downto 0);
		RF_write1,RF_write2,RF_write3,clk,clr : in std_logic;
		Dout_1,Dout_2,Dout_3,Dout_4 : out std_logic_vector( 15 downto 0)
		);
end component;

component RF_tag is
	generic(
		data_length: integer := 5);
	port(
		Ard_1,Ard_2,Ard_3,Ard_4,Ard_5,Ard_6,Awr_1,Awr_2 : in std_logic_vector(2 downto 0);
		Din_1,Din_2 : in std_logic_vector(4 downto 0);
		RF_write1,RF_write2,clk,clr : in std_logic;
		Dout_1,Dout_2,Dout_3,Dout_4,Dout_5,Dout_6 : out std_logic_vector(4 downto 0)
		);
end component;

component RF_busybit is
	port(
		Ard_1,Ard_2,Ard_3,Ard_4,Awr_1,Awr_2 ,Awr_3,Awr_4 : in std_logic_vector(2 downto 0);
		Din_1,Din_2, Din_3, Din_4 : in std_logic_vector(4 downto 0);
		RF_write1,RF_write2,RF_write3,RF_write4,clk,clr : in std_logic;
		Dout_1,Dout_2,Dout_3,Dout_4: out std_logic_vector(4 downto 0)
		);
end component;

component myRegister is
	generic ( data_length: integer);
	port(
		clk,wr,clr : in std_logic;
		din : in std_logic_vector(data_length-1 downto 0);
		dout :out std_logic_vector(data_length-1 downto 0)
		);	
end component;

--component pen32bitwith2output is 
--	port (penin: in std_logic_vector(31 downto 0);
--			twoRRnotFree : out std_logic;
--			pennext: out std_logic_vector(31 downto 0);
--			penout1, penout2: out std_logic_vector(4 downto 0));
--end component;

component pen32bitwith2output is 
	port (penin: in std_logic_vector(31 downto 0);
			twoRRnotFree : out std_logic;
			pennext_twoallotted, pennext_oneallotted: out std_logic_vector(31 downto 0);
			penout1, penout2: out std_logic_vector(4 downto 0));
end component;

component Add is
   port(x,y: in std_logic_vector(15 downto 0);
	
	s0: out std_logic_vector(15 downto 0);
        c_out: out std_logic);
end component;


signal x1_add,x1_adc,x1_adz,x1_adi,x1_ndu,x1_ndc,x1_ndz,x1_lhi,x1_lw,x1_sw,x1_lm,x1_sm,x1_beq,x1_jal,x1_jlr : std_logic :='0';
signal x2_add,x2_adc,x2_adz,x2_adi,x2_ndu,x2_ndc,x2_ndz,x2_lhi,x2_lw,x2_sw,x2_lm,x2_sm,x2_beq,x2_jal,x2_jlr : std_logic :='0';
signal twoRRnotFree : std_logic;
signal penout2,penout1 : std_logic_vector(4 downto 0);
signal SE_Ra1_imm9 ,SE_Ra2_imm9 : std_logic_vector(15 downto 0);
signal c_adder2out,c_adder3out : std_logic;
signal spec_tag_reg_en :  std_logic;
signal store_tag_reg_en : std_logic;
signal spec_tag_reg_in,spec_tag_reg_out : std_logic_vector(1 downto 0);
signal store_tag_reg_in,store_tag_reg_out : std_logic_vector(4 downto 0);
signal store_tag_reg_out_minus_one, store_tag_reg_out_plus_one : std_logic_vector(15 downto 0);
signal store_tag_reg_out_minus_two, store_tag_reg_out_plus_two : std_logic_vector(15 downto 0);
signal SE_store_tag_reg_out : std_logic_vector(15 downto 0);
signal c_store_tag1,c_store_tag2,c_store_tag3,c_store_tag4 : std_logic;
signal free_rrf_vec_out_sig,free_rrf_vec_out_sig2 : std_logic_vector(31 downto 0);



begin

x1_add <= '1' when((ra1_ir_out(15 downto 12) = "0000" and ra1_ir_out(2 downto 0 ) = "000")  and ra1_val_out = '1' ) else '0';
x1_adc <= '1' when((ra1_ir_out(15 downto 12) = "0000" and ra1_ir_out(2 downto 0 ) = "010")  and ra1_val_out = '1' ) else '0';
x1_adz <= '1' when((ra1_ir_out(15 downto 12) = "0000" and ra1_ir_out(2 downto 0 ) = "001")  and ra1_val_out = '1' ) else '0';
x1_adi <= '1' when((ra1_ir_out(15 downto 12) = "0001")  and ra1_val_out = '1' ) else '0';
x1_ndu <= '1' when((ra1_ir_out(15 downto 12) = "0010" and ra1_ir_out(2 downto 0 ) = "000")  and ra1_val_out = '1' ) else '0';
x1_ndc <= '1' when((ra1_ir_out(15 downto 12) = "0010" and ra1_ir_out(2 downto 0 ) = "010")  and ra1_val_out = '1' ) else '0';
x1_ndz <= '1' when((ra1_ir_out(15 downto 12) = "0010" and ra1_ir_out(2 downto 0 ) = "001")  and ra1_val_out = '1' ) else '0';
x1_lhi <= '1' when((ra1_ir_out(15 downto 12) = "0011")  and ra1_val_out = '1' ) else '0';
x1_lw  <= '1' when((ra1_ir_out(15 downto 12) = "0100")  and ra1_val_out = '1' ) else '0';
x1_sw  <= '1' when((ra1_ir_out(15 downto 12) = "0101")  and ra1_val_out = '1' ) else '0';
x1_lm  <= '1' when((ra1_ir_out(15 downto 12) = "0110")  and ra1_val_out = '1' ) else '0';
x1_sm  <= '1' when((ra1_ir_out(15 downto 12) = "0111")  and ra1_val_out = '1' ) else '0';
x1_beq <= '1' when((ra1_ir_out(15 downto 12) = "1100")  and ra1_val_out = '1' ) else '0';
x1_jal <= '1' when((ra1_ir_out(15 downto 12) = "1000")  and ra1_val_out = '1' ) else '0';
x1_jlr <= '1' when((ra1_ir_out(15 downto 12) = "1001")  and ra1_val_out = '1' ) else '0';

x2_add <= '1' when((ra2_ir_out(15 downto 12) = "0000" and ra2_ir_out(2 downto 0 ) = "000")  and ra2_val_out = '1' ) else '0';
x2_adc <= '1' when((ra2_ir_out(15 downto 12) = "0000" and ra2_ir_out(2 downto 0 ) = "010")  and ra2_val_out = '1' ) else '0';
x2_adz <= '1' when((ra2_ir_out(15 downto 12) = "0000" and ra2_ir_out(2 downto 0 ) = "001")  and ra2_val_out = '1' ) else '0';
x2_adi <= '1' when((ra2_ir_out(15 downto 12) = "0001")  and ra2_val_out = '1' ) else '0';
x2_ndu <= '1' when((ra2_ir_out(15 downto 12) = "0010" and ra2_ir_out(2 downto 0 ) = "000")  and ra2_val_out = '1' ) else '0';
x2_ndc <= '1' when((ra2_ir_out(15 downto 12) = "0010" and ra2_ir_out(2 downto 0 ) = "010")  and ra2_val_out = '1' ) else '0';
x2_ndz <= '1' when((ra2_ir_out(15 downto 12) = "0010" and ra2_ir_out(2 downto 0 ) = "001")  and ra2_val_out = '1' ) else '0';
x2_lhi <= '1' when((ra2_ir_out(15 downto 12) = "0011")  and ra2_val_out = '1' ) else '0';
x2_lw  <= '1' when((ra2_ir_out(15 downto 12) = "0100")  and ra2_val_out = '1' ) else '0';
x2_sw  <= '1' when((ra2_ir_out(15 downto 12) = "0101")  and ra2_val_out = '1' ) else '0';
x2_lm  <= '1' when((ra2_ir_out(15 downto 12) = "0110")  and ra2_val_out = '1' ) else '0';
x2_sm  <= '1' when((ra2_ir_out(15 downto 12) = "0111")  and ra2_val_out = '1' ) else '0';
x2_beq <= '1' when((ra2_ir_out(15 downto 12) = "1100")  and ra2_val_out = '1' ) else '0';
x2_jal <= '1' when((ra2_ir_out(15 downto 12) = "1000")  and ra2_val_out = '1' ) else '0';
x2_jlr <= '1' when((ra2_ir_out(15 downto 12) = "1001")  and ra2_val_out = '1' ) else '0';

SE_Ra1_imm9 <= ("1111111" & ra1_ir_out(8 downto 0)) when (ra1_ir_out(8) = '1') else
					("0000000" & ra1_ir_out(8 downto 0));
SE_Ra2_imm9 <= ("1111111" & ra2_ir_out(8 downto 0)) when (ra2_ir_out(8) = '1') else
					("0000000" & ra2_ir_out(8 downto 0));

ADDER2 : Add port map (ra1_pc_out, SE_Ra1_imm9, adder2_out, c_adder2out); 	--next pc jal
ADDER3 : Add port map (ra2_pc_out, SE_Ra2_imm9, adder3_out, c_adder3out);
ZA7_1_out <= ra1_ir_out(8 downto 0) & "0000000";
ZA7_2_out <= ra2_ir_out(8 downto 0) & "1111111";

pc1 <= ra1_pc_out;
pc2 <= ra2_pc_out; 
ir1 <= ra1_ir_out;
ir2 <= ra2_ir_out;
SE_store_tag_reg_out <= ("11111111111" & store_tag_reg_out) when (store_tag_reg_out(4) = '1') else
						("00000000000" & store_tag_reg_out);

PE: pen32bitwith2output port map(free_rrf_vec,twoRRnotFree,free_rrf_vec_out_sig,free_rrf_vec_out_sig2,penout1, penout2);
SPEC_TAG_REG: myRegister generic map(2) port map(clk, spec_tag_reg_en, reset, spec_tag_reg_in, spec_tag_reg_out);
STORE_TAG_REG: myRegister generic map(5) port map(clk, store_tag_reg_en, reset, store_tag_reg_in, store_tag_reg_out);
STORE_TAG_DEC: Add port map (SE_store_tag_reg_out, "1111111111111111",store_tag_reg_out_minus_one,c_store_tag1);
STORE_TAG_INC: Add port map (SE_store_tag_reg_out, "0000000000000001",store_tag_reg_out_plus_one,c_store_tag2);
STORE_TAG_DEC2: Add port map (SE_store_tag_reg_out, "1111111111111110",store_tag_reg_out_minus_two,c_store_tag3);
STORE_TAG_INC2: Add port map (SE_store_tag_reg_out, "0000000000000010",store_tag_reg_out_plus_two,c_store_tag4);


process(clk, reset
		,
		ra1_val_out, ra2_val_out ,
		ra1_pc_out, ra1_ir_out ,ra2_pc_out, ra2_ir_out,
		free_rrf_vec, free_rrf_vec_out_sig, free_rrf_vec_out_sig2,
		
		data1, data2, data3, data4 ,
		busy1, busy2, busy3, busy4 ,
		tag1, tag2, tag3, tag4 ,
		C_in,Z_in , C_busybit_in, Z_busybit_in, busy_dest1_in, busy_dest2_in,
		C_tag_in, Z_tag_in, tag_dest1_in, tag_dest2_in ,
		taken_branch_detected, not_taken_branch_detected,				-- OR of both execution pipelines
		spec_tag_rb_in ,		-- execution line wala spec tag
		rs_full_in, lm_stall_in,
		lw_r7_resolved, alu_r7_resolved, jlr_resolved,           	-- OR of both execution pipelines
		store_retirement_count,

		x1_add,x1_adc,x1_adz,x1_adi,x1_ndu,x1_ndc,x1_ndz,x1_lhi,x1_lw,x1_sw,x1_lm,x1_sm,x1_beq,x1_jal,x1_jlr ,
		x2_add,x2_adc,x2_adz,x2_adi,x2_ndu,x2_ndc,x2_ndz,x2_lhi,x2_lw,x2_sw,x2_lm,x2_sm,x2_beq,x2_jal,x2_jlr ,
		twoRRnotFree ,
		penout2,penout1 ,
		SE_Ra1_imm9 ,SE_Ra2_imm9,
		c_adder2out,c_adder3out ,
		spec_tag_reg_en,
		store_tag_reg_en,
		spec_tag_reg_in,spec_tag_reg_out ,
		store_tag_reg_in,store_tag_reg_out ,
		store_tag_reg_out_minus_one, store_tag_reg_out_plus_one ,
		store_tag_reg_out_minus_two, store_tag_reg_out_plus_two ,
		SE_store_tag_reg_out ,
		c_store_tag1,c_store_tag2,c_store_tag3,c_store_tag4
	)

variable x1_val_var, x2_val_var, x1_beq_var, x2_beq_var, x1_sw_var, x2_sw_var, x1_destination_check, x1_carry_write_check, x1_zero_write_check: std_logic;
variable x1_destination : std_logic_vector(2 downto 0);
begin
	
	x1_val_var := ra1_val_out;
	x2_val_var := ra2_val_out;
	x1_beq_var := x1_beq;
	x2_beq_var := x2_beq;
	x2_sw_var := x2_sw;
	x1_sw_var := x1_sw;

	pc_en_out <= '1';
	ra_en_out <='1';
	x1_val <= ra1_val_out;
	arf_busy_wr_en1 <= ra1_val_out;
	arf_tag_wr_en1  <= ra1_val_out;
	x2_val <=ra2_val_out;
	arf_busy_wr_en2 <= ra2_val_out;
	arf_tag_wr_en2 <= ra2_val_out;

	store_tag_reg_en <='0';
	store_tag_reg_in <= store_tag_reg_out;
	store_tag_rs_out1 <= store_tag_reg_out;
	store_tag_rs_out2 <= store_tag_reg_out;

	if(x1_add = '1') then
		Ard1a <= ra1_ir_out(11 downto 9);
		Ard1b <= ra1_ir_out(8 downto 6);
		Ard1c <= "000";
		Awr1  <= ra1_ir_out(5 downto 3);
		if(busy1 = '1') then
			x1_op1 <= "00000000000" & tag1;	
			x1_op1_ready <= '0';		
		else
			x1_op1 <= Data1;
			x1_op1_ready <= '1';
		end if;

		if(busy2 = '1') then
			x1_op2 <= "00000000000" & tag2;	
			x1_op2_ready <= '0';		
		else
			x1_op2 <= Data2;
			x1_op2_ready <= '1';
		end if;

		C_wr <= '1';
		Z_wr <= '1';
		C_out <= '0';
		Z_out <= '0';
		C_ready <= '1';
		Z_ready <= '1';
		C_tag_out_rs <= "00000";
		Z_tag_out_rs <= "00000";

		busy_dest1_out <= '1';
		C_busybit_out <= '1';
		Z_busybit_out <= '1';
		C_tag_out_arf <= penout1;
		Z_tag_out_arf <= penout1;
		dest_AR_tag_out <= penout1;

		x1_destination := ra1_ir_out(5 downto 3);
		x1_destination_check :='1';
		x1_carry_write_check := '1';
		x1_zero_write_check := '1';
-----------------------------------------------------------
	elsif (x1_adc = '1') then
		Ard1a <= ra1_ir_out(11 downto 9);
		Ard1b <= ra1_ir_out(8 downto 6);
		Ard1c <= "000";
		Awr1  <= ra1_ir_out(5 downto 3);
		if(busy1 = '1') then
			x1_op1 <= "00000000000" & tag1;	
			x1_op1_ready <= '0';		
		else
			x1_op1 <= Data1;
			x1_op1_ready <= '1';
		end if;

		if(busy2 = '1') then
			x1_op2 <= "00000000000" & tag2;	
			x1_op2_ready <= '0';		
		else
			x1_op2 <= Data2;
			x1_op2_ready <= '1';
		end if;

		C_wr <= '1';
		Z_wr <= '1';

		if(C_busybit_in = '1') then
			C_ready <= '0';
			C_out <= '0';
			C_tag_out_rs <= C_tag_in;
			Z_out <= '0';
			Z_ready <= '1';
			Z_tag_out_rs <= "00000";
		else 
			C_ready <= '1';
			C_out <= C_in;
			C_tag_out_rs <= C_tag_in;
			Z_out <= '0';
			Z_ready <= '1';
			Z_tag_out_rs <= "00000";
		end if;

		busy_dest1_out <= '1';
		C_busybit_out <= '1';
		Z_busybit_out <= '1';
		C_tag_out_arf <= penout1;
		Z_tag_out_arf <= penout1;
		dest_AR_tag_out <= penout1;

		x1_destination :=ra1_ir_out(5 downto 3);
		x1_destination_check :='1';
		x1_carry_write_check := '1';
		x1_zero_write_check := '1';

-----------------------------------------------------------
	elsif (x1_adz = '1') then
		Ard1a <= ra1_ir_out(11 downto 9);
		Ard1b <= ra1_ir_out(8 downto 6);
		Ard1c <= "000";
		Awr1  <= ra1_ir_out(5 downto 3);
		if(busy1 = '1') then
			x1_op1 <= "00000000000" & tag1;	
			x1_op1_ready <= '0';		
		else
			x1_op1 <= Data1;
			x1_op1_ready <= '1';
		end if;

		if(busy2 = '1') then
			x1_op2 <= "00000000000" & tag2;	
			x1_op2_ready <= '0';		
		else
			x1_op2 <= Data2;
			x1_op2_ready <= '1';
		end if;

		C_wr <= '1';
		Z_wr <= '1';

		if(Z_busybit_in = '1') then
			C_ready <= '1';
			C_out <= '0';
			C_tag_out_rs <= "00000";
			Z_out <= '0';
			Z_ready <= '0';
			Z_tag_out_rs <= Z_tag_in;
		else 
			C_ready <= '1';
			C_out <= '0';
			C_tag_out_rs <= "00000";
			Z_out <= Z_in;
			Z_ready <= '1';
			Z_tag_out_rs <= Z_tag_in;
		end if;

		busy_dest1_out <= '1';
		C_busybit_out <= '1';
		Z_busybit_out <= '1';
		C_tag_out_arf <= penout1;
		Z_tag_out_arf <= penout1;
		dest_AR_tag_out <= penout1;

		x1_destination := ra1_ir_out(5 downto 3);
		x1_destination_check :='1';
		x1_carry_write_check := '1';
		x1_zero_write_check := '1';

-----------------------------------------------------------
	elsif (x1_adi = '1') then
		Ard1a <= ra1_ir_out(11 downto 9);
		Ard1b <= "000";
		Ard1c <= "000";
		Awr1<= ra1_ir_out(8 downto 6);

		if(busy1 = '1') then
			x1_op1 <= "00000000000" & tag1;	
			x1_op1_ready <= '0';		
		else
			x1_op1 <= Data1;
			x1_op1_ready <= '1';
		end if;

		if(ra1_ir_out(5) = '1') then
			x1_op2 <= "1111111111" & ra1_ir_out(5 downto 0);
			x1_op2_ready <= '1';	
		else
			x1_op2 <= "0000000000" & ra1_ir_out(5 downto 0);
			x1_op2_ready <= '1';	
		end if;

		C_wr <= '1';
		Z_wr <= '1';
		C_out <= '0';
		Z_out <= '0';
		C_ready <= '1';
		Z_ready <= '1';
		C_tag_out_rs <= "00000";
		Z_tag_out_rs <= "00000";

		busy_dest1_out <= '1';
		C_busybit_out <= '1';
		Z_busybit_out <= '1';
		C_tag_out_arf <= penout1;
		Z_tag_out_arf <= penout1;
		dest_AR_tag_out <= penout1;

		x1_destination:=ra1_ir_out(8 downto 6);
		x1_destination_check :='1';
		x1_carry_write_check := '1';
		x1_zero_write_check := '1';
------------------------------------------------
	elsif(x1_ndu = '1') then
		Ard1a <= ra1_ir_out(11 downto 9);
		Ard1b <= ra1_ir_out(8 downto 6);
		Ard1c <= "000";
		Awr1  <= ra1_ir_out(5 downto 3);
		if(busy1 = '1') then
			x1_op1 <= "00000000000" & tag1;	
			x1_op1_ready <= '0';		
		else
			x1_op1 <= Data1;
			x1_op1_ready <= '1';
		end if;

		if(busy2 = '1') then
			x1_op2 <= "00000000000" & tag2;	
			x1_op2_ready <= '0';		
		else
			x1_op2 <= Data2;
			x1_op2_ready <= '1';
		end if;

		C_wr <= '0';
		Z_wr <= '1';
		C_out <= '0';
		Z_out <= '0';
		C_ready <= '1';
		Z_ready <= '1';
		C_tag_out_rs <= "00000";
		Z_tag_out_rs <= "00000";

		busy_dest1_out <= '1';
		C_busybit_out <= C_busybit_in;
		Z_busybit_out <= '1';
		C_tag_out_arf <= C_tag_in;
		Z_tag_out_arf <= penout1;
		dest_AR_tag_out <= penout1;

		x1_destination  :=ra1_ir_out(5 downto 3);
		x1_destination_check :='1';
		x1_carry_write_check := '0';
		x1_zero_write_check := '1';

-----------------------------------------------------------
	elsif (x1_ndc = '1') then
		Ard1a <= ra1_ir_out(11 downto 9);
		Ard1b <= ra1_ir_out(8 downto 6);
		Ard1c <= "000";
		Awr1  <= ra1_ir_out(5 downto 3);
		if(busy1 = '1') then
			x1_op1 <= "00000000000" & tag1;	
			x1_op1_ready <= '0';		
		else
			x1_op1 <= Data1;
			x1_op1_ready <= '1';
		end if;

		if(busy2 = '1') then
			x1_op2 <= "00000000000" & tag2;	
			x1_op2_ready <= '0';		
		else
			x1_op2 <= Data2;
			x1_op2_ready <= '1';
		end if;

		C_wr <= '0';
		Z_wr <= '1';

		if(C_busybit_in = '1') then
			C_ready <= '0';
			C_out <= '0';
			C_tag_out_rs <= C_tag_in;
			Z_out <= '0';
			Z_ready <= '1';
			Z_tag_out_rs <= "00000";
		else 
			C_ready <= '1';
			C_out <= C_in;
			C_tag_out_rs <= C_tag_in;
			Z_out <= '0';
			Z_ready <= '1';
			Z_tag_out_rs <= "00000";
		end if;

		busy_dest1_out <= '1';
		C_busybit_out <= C_busybit_in;
		Z_busybit_out <= '1';
		C_tag_out_arf <= C_tag_in;
		Z_tag_out_arf <= penout1;
		dest_AR_tag_out <= penout1;

		x1_destination  := ra1_ir_out(5 downto 3);
		x1_destination_check :='1';
		x1_carry_write_check := '0';
		x1_zero_write_check := '1';
-------------------------------------------------------------
	elsif (x1_ndz = '1') then
		Ard1a <= ra1_ir_out(11 downto 9);
		Ard1b <= ra1_ir_out(8 downto 6);
		Ard1c <= "000";
		Awr1  <= ra1_ir_out(5 downto 3);
		if(busy1 = '1') then
			x1_op1 <= "00000000000" & tag1;	
			x1_op1_ready <= '0';		
		else
			x1_op1 <= Data1;
			x1_op1_ready <= '1';
		end if;

		if(busy2 = '1') then
			x1_op2 <= "00000000000" & tag2;	
			x1_op2_ready <= '0';		
		else
			x1_op2 <= Data2;
			x1_op2_ready <= '1';
		end if;

		C_wr <= '0';
		Z_wr <= '1';

		if(Z_busybit_in = '1') then
			C_ready <= '1';
			C_out <= '0';
			C_tag_out_rs <= "00000";
			Z_out <= '0';
			Z_ready <= '0';
			Z_tag_out_rs <= Z_tag_in;
		else 
			C_ready <= '1';
			C_out <= '0';
			C_tag_out_rs <= "00000";
			Z_out <= Z_in;
			Z_ready <= '1';
			Z_tag_out_rs <= Z_tag_in;
		end if;

		busy_dest1_out <= '1';
		C_busybit_out <= C_busybit_in;
		Z_busybit_out <= '1';
		C_tag_out_arf <= C_tag_in;
		Z_tag_out_arf <= penout1;
		dest_AR_tag_out <= penout1;

		x1_destination  := ra1_ir_out(5 downto 3);
		x1_destination_check :='1';
		x1_carry_write_check := '0';
		x1_zero_write_check := '1';

-----------------------------------------------------------
	elsif (x1_lhi = '1') then
		Ard1a <= "000";
		Ard1b <= "000";
		Ard1c <= "000";
		Awr1<= ra1_ir_out(11 downto 9);

		x1_op1 <=  ra1_ir_out(8 downto 0) & "0000000";
		x1_op1_ready <= '1';	
		x1_op2 <= "0000000000000000";
		x1_op2_ready <= '1';	

		C_wr <= '0';
		Z_wr <= '0';
		C_out <= '0';
		Z_out <= '0';
		C_ready <= '1';
		Z_ready <= '1';
		C_tag_out_rs <= "00000";
		Z_tag_out_rs <= "00000";

		busy_dest1_out <= '1';
		C_busybit_out <= C_busybit_in;
		Z_busybit_out <= Z_busybit_in;
		C_tag_out_arf <= C_tag_in;
		Z_tag_out_arf <= Z_tag_in;
		dest_AR_tag_out <= penout1;

		x1_destination:= ra1_ir_out(11 downto 9);
		x1_destination_check :='1';
		x1_carry_write_check := '0';
		x1_zero_write_check := '0';
-----------------------------------------------------------
	elsif (x1_lw = '1') then
		Ard1a <= ra1_ir_out(8 downto 6);
		Ard1b <= "000";
		Ard1c <= "000";
		Awr1<= ra1_ir_out(11 downto 9);

		if(busy1 = '1') then
			x1_op1 <= "00000000000" & tag1;	
			x1_op1_ready <= '0';		
		else
			x1_op1 <= Data1;
			x1_op1_ready <= '1';
		end if;

		if(ra1_ir_out(5) = '1') then
			x1_op2 <= "1111111111" & ra1_ir_out(5 downto 0);
			x1_op2_ready <= '1';	
		else
			x1_op2 <= "0000000000" & ra1_ir_out(5 downto 0);
			x1_op2_ready <= '1';	
		end if;

		C_wr <= '0';
		Z_wr <= '1';
		C_out <= '0';
		Z_out <= '0';
		C_ready <= '1';
		Z_ready <= '1';
		C_tag_out_rs <= "00000";
		Z_tag_out_rs <= "00000";

		busy_dest1_out <= '1';
		C_busybit_out <= C_busybit_in;
		Z_busybit_out <= '1';
		C_tag_out_arf <= C_tag_in;
		Z_tag_out_arf <= penout1;
		dest_AR_tag_out <= penout1;

		x1_destination:= ra1_ir_out(11 downto 9);
		x1_destination_check :='1';
		x1_carry_write_check := '0';
		x1_zero_write_check := '1';

-----------------------------------------------------------
	elsif (x1_sw = '1') then
		Ard1a <= ra1_ir_out(11 downto 9);
		Ard1b <= ra1_ir_out(8 downto 6);
		Ard1c <= "000";
		Awr1<= "000";

		if(busy1 = '1') then
			x1_op1 <= "00000000000" & tag1;	
			x1_op1_ready <= '0';		
		else
			x1_op1 <= Data1;
			x1_op1_ready <= '1';
		end if;

		if(busy2 = '1') then
			x1_op2 <= "00000000000" & tag2;	
			x1_op2_ready <= '0';		
		else
			x1_op2 <= Data2;
			x1_op2_ready <= '1';
		end if;

		C_wr <= '0';
		Z_wr <= '0';
		C_out <= '0';
		Z_out <= '0';
		C_ready <= '1';
		Z_ready <= '1';
		C_tag_out_rs <= "00000";
		Z_tag_out_rs <= "00000";

		busy_dest1_out <= busy_dest1_in;
		C_busybit_out <= C_busybit_in;
		Z_busybit_out <= Z_busybit_in;
		C_tag_out_arf <= C_tag_in;
		Z_tag_out_arf <= Z_tag_in;
		dest_AR_tag_out <= tag_dest1_in;

		x1_destination := ra1_ir_out(11 downto 9);
		x1_destination_check :='0';
		x1_carry_write_check := '0';
		x1_zero_write_check := '0';
---------------------------------------------------------
	elsif (x1_lm = '1' or x1_sm = '1') then  -----DITCHHHHHHHHHHHHHHHHHHHHHHHH HAI
		Ard1a <= ra1_ir_out(11 downto 9);
		Ard1b <= ra1_ir_out(8 downto 6);
		Ard1c <= "000";
		Awr1<= "000";

		if(busy1 = '1') then
			x1_op1 <= "00000000000" & tag1;	
			x1_op1_ready <= '0';		
		else
			x1_op1 <= Data1;
			x1_op1_ready <= '1';
		end if;

		if(busy2 = '1') then
			x1_op2 <= "00000000000" & tag2;	
			x1_op2_ready <= '0';		
		else
			x1_op2 <= Data2;
			x1_op2_ready <= '1';
		end if;

		C_wr <= '0';
		Z_wr <= '0';
		C_out <= '0';
		Z_out <= '0';
		C_ready <= '1';
		Z_ready <= '1';
		C_tag_out_rs <= "00000";
		Z_tag_out_rs <= "00000";

		busy_dest1_out <= busy_dest1_in;
		C_busybit_out <= C_busybit_in;
		Z_busybit_out <= Z_busybit_in;
		C_tag_out_arf <= C_tag_in;
		Z_tag_out_arf <= Z_tag_in;
		dest_AR_tag_out <= tag_dest1_in;

		x1_destination:= ra1_ir_out(11 downto 9);
		x1_destination_check :='0';
		x1_carry_write_check := '0';
		x1_zero_write_check := '0';

-------------------------------------------------
	elsif (x1_beq = '1') then
		Ard1a <= ra1_ir_out(11 downto 9);
		Ard1b <= ra1_ir_out(8 downto 6);
		Ard1c <= "000";
		Awr1<= "000";

		if(busy1 = '1') then
			x1_op1 <= "00000000000" & tag1;	
			x1_op1_ready <= '0';		
		else
			x1_op1 <= Data1;
			x1_op1_ready <= '1';
		end if;

		if(busy2 = '1') then
			x1_op2 <= "00000000000" & tag2;	
			x1_op2_ready <= '0';		
		else
			x1_op2 <= Data2;
			x1_op2_ready <= '1';
		end if;

		C_wr <= '0';
		Z_wr <= '0';
		C_out <= '0';
		Z_out <= '0';
		C_ready <= '1';
		Z_ready <= '1';
		C_tag_out_rs <= "00000";
		Z_tag_out_rs <= "00000";

		busy_dest1_out <= busy_dest1_in;
		C_busybit_out <= C_busybit_in;
		Z_busybit_out <= Z_busybit_in;
		C_tag_out_arf <= C_tag_in;
		Z_tag_out_arf <= Z_tag_in;
		dest_AR_tag_out <= tag_dest1_in;

		x1_destination:= ra1_ir_out(11 downto 9);
		x1_destination_check :='0';
		x1_carry_write_check := '0';
		x1_zero_write_check := '0';

-------------------------------------------------
	elsif (x1_jal = '1') then
		Ard1a <= "000";
		Ard1b <= "000";
		Ard1c <= "000";
		Awr1  <= ra1_ir_out(11 downto 9);

		x1_op1 <= "0000000000000000";	
		x1_op1_ready <= '1';		
		x1_op2 <= "0000000000000000";
		x1_op2_ready <= '1';


		C_wr <= '0';
		Z_wr <= '0';
		C_out <= '0';
		Z_out <= '0';
		C_ready <= '1';
		Z_ready <= '1';
		C_tag_out_rs <= "00000";
		Z_tag_out_rs <= "00000";

		busy_dest1_out <= '1';
		C_busybit_out <= C_busybit_in;
		Z_busybit_out <= Z_busybit_in;
		C_tag_out_arf <= C_tag_in;
		Z_tag_out_arf <= Z_tag_in;
		dest_AR_tag_out <= penout1;

		x1_destination:= ra1_ir_out(11 downto 9);
		x1_destination_check :='1';
		x1_carry_write_check := '0';
		x1_zero_write_check := '0';

-------------------------------------------------
	elsif (x1_jlr = '1') then
		Ard1a <= ra1_ir_out(8 downto 6);
		Ard1b <= "000";
		Ard1c <= "000";
		Awr1  <= ra1_ir_out(11 downto 9);

		if(busy1 = '1') then
			x1_op1 <= "00000000000" & tag1;	
			x1_op1_ready <= '0';		
		else
			x1_op1 <= Data1;
			x1_op1_ready <= '1';
		end if;
	
		x1_op2 <= "0000000000000000";
		x1_op2_ready <= '1';


		C_wr <= '0';
		Z_wr <= '0';
		C_out <= '0';
		Z_out <= '0';
		C_ready <= '1';
		Z_ready <= '1';
		C_tag_out_rs <= "00000";
		Z_tag_out_rs <= "00000";

		busy_dest1_out <= '1';
		C_busybit_out <= C_busybit_in;
		Z_busybit_out <= Z_busybit_in;
		C_tag_out_arf <= C_tag_in;
		Z_tag_out_arf <= Z_tag_in;
		dest_AR_tag_out <= penout1;

		x1_destination:=ra1_ir_out(11 downto 9);
		x1_destination_check :='1';
		x1_carry_write_check := '0';
		x1_zero_write_check := '0';
----------------------------------------------------
	else
		Ard1a <= ra1_ir_out(8 downto 6);
		Ard1b <= "000";
		Ard1c <= "000";
		Awr1  <= ra1_ir_out(11 downto 9);

		if(busy1 = '1') then
			x1_op1 <= "00000000000" & tag1;	
			x1_op1_ready <= '0';		
		else
			x1_op1 <= Data1;
			x1_op1_ready <= '1';
		end if;
	
		x1_op2 <= "0000000000000000";
		x1_op2_ready <= '1';


		C_wr <= '0';
		Z_wr <= '0';
		C_out <= '0';
		Z_out <= '0';
		C_ready <= '1';
		Z_ready <= '1';
		C_tag_out_rs <= "00000";
		Z_tag_out_rs <= "00000";

		busy_dest1_out <= '1';
		C_busybit_out <= C_busybit_in;
		Z_busybit_out <= Z_busybit_in;
		C_tag_out_arf <= C_tag_in;
		Z_tag_out_arf <= Z_tag_in;
		dest_AR_tag_out <= penout1;

		x1_destination:= ra1_ir_out(11 downto 9);
		x1_destination_check :='0';
		x1_carry_write_check := '0';
		x1_zero_write_check := '0';

	end if;

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

--INSTRUCTION 2

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


	if(x2_add = '1') then
		Ard2a <= ra2_ir_out(11 downto 9);
		Ard2b <= ra2_ir_out(8 downto 6);
		Ard2c <= "000";
		Awr2  <= ra2_ir_out(5 downto 3);
		if(busy3 = '1') then
			x2_op1 <= "00000000000" & tag3;	
			x2_op1_ready <= '0';		
		else
			x2_op1 <= Data3;
			x2_op1_ready <= '1';
		end if;

		if(busy4 = '1') then
			x2_op2 <= "00000000000" & tag4;	
			x2_op2_ready <= '0';		
		else
			x2_op2 <= Data4;
			x2_op2_ready <= '1';
		end if;

		C_2_wr <= '1';
		Z_2_wr <= '1';
		C_2_out <= '0';
		Z_2_out <= '0';
		C_2_ready <= '1';
		Z_2_ready <= '1';
		C_2_tag_out_rs <= "00000";
		Z_2_tag_out_rs <= "00000";

		busy_dest2_out <= '1';
		C_2_busybit_out <= '1';
		Z_2_busybit_out <= '1';
		C_2_tag_out_arf <= penout2;
		Z_2_tag_out_arf <= penout2;
		dest_AR_tag_2_out <= penout2;

		if(ra2_ir_out(11 downto 9) = x1_destination and (x1_destination_check = '1')) then
			x2_op1 <= "00000000000" & penout1;	
			x2_op1_ready <= '0';	
		end if;
		if(ra2_ir_out(8 downto 6) = x1_destination and (x1_destination_check = '1')) then
			x2_op2 <= "00000000000" & penout1;	
			x2_op2_ready <= '0';	
		end if;




-----------------------------------------------------------
	elsif (x2_adc = '1') then
		Ard2a <= ra2_ir_out(11 downto 9);
		Ard2b <= ra2_ir_out(8 downto 6);
		Ard2c <= "000";
		Awr2  <= ra2_ir_out(5 downto 3);
		if(busy3 = '1') then
			x2_op1 <= "00000000000" & tag3;	
			x2_op1_ready <= '0';		
		else
			x2_op1 <= Data3;
			x2_op1_ready <= '1';
		end if;

		if(busy4 = '1') then
			x2_op2 <= "00000000000" & tag4;	
			x2_op2_ready <= '0';		
		else
			x2_op2 <= Data4;
			x2_op2_ready <= '1';
		end if;

		C_2_wr <= '1';
		Z_2_wr <= '1';

		if(C_busybit_in = '1') then
			C_2_ready <= '0';
			C_2_out <= '0';
			C_2_tag_out_rs <= C_tag_in;
			Z_2_out <= '0';
			Z_2_ready <= '1';
			Z_2_tag_out_rs <= "00000";
		else 
			C_2_ready <= '1';
			C_2_out <= C_in;
			C_2_tag_out_rs <= C_tag_in;
			Z_2_out <= '0';
			Z_2_ready <= '1';
			Z_2_tag_out_rs <= "00000";
		end if;

		busy_dest2_out <= '1';
		C_2_busybit_out <= '1';
		Z_2_busybit_out <= '1';
		C_2_tag_out_arf <= penout2;
		Z_2_tag_out_arf <= penout2;
		dest_AR_tag_2_out <= penout2;

		if(ra2_ir_out(11 downto 9) = x1_destination and (x1_destination_check = '1')) then
			x2_op1 <= "00000000000" & penout1;	
			x2_op1_ready <= '0';	
		end if;
		if(ra2_ir_out(8 downto 6) = x1_destination and (x1_destination_check = '1')) then
			x2_op2 <= "00000000000" & penout1;	
			x2_op2_ready <= '0';	
		end if;

		if(x1_carry_write_check = '1') then
			C_2_ready <= '0';
			C_2_tag_out_rs <=  penout1;
		end if;

-----------------------------------------------------------
	elsif (x2_adz = '1') then
		Ard2a <= ra2_ir_out(11 downto 9);
		Ard2b <= ra2_ir_out(8 downto 6);
		Ard2c <= "000";
		Awr2  <= ra2_ir_out(5 downto 3);
		if(busy3 = '1') then
			x2_op1 <= "00000000000" & tag3;	
			x2_op1_ready <= '0';		
		else
			x2_op1 <= Data3;
			x2_op1_ready <= '1';
		end if;

		if(busy4 = '1') then
			x2_op2 <= "00000000000" & tag4;	
			x2_op2_ready <= '0';		
		else
			x2_op2 <= Data4;
			x2_op2_ready <= '1';
		end if;

		C_2_wr <= '1';
		Z_2_wr <= '1';

		if(Z_busybit_in = '1') then
			C_2_ready <= '1';
			C_2_out <= '0';
			C_2_tag_out_rs <= "00000";
			Z_2_out <= '0';
			Z_2_ready <= '0';
			Z_2_tag_out_rs <= Z_tag_in;
		else 
			C_2_ready <= '1';
			C_2_out <= '0';
			C_2_tag_out_rs <= "00000";
			Z_2_out <= Z_in;
			Z_2_ready <= '1';
			Z_2_tag_out_rs <= Z_tag_in;
		end if;

		busy_dest2_out <= '1';
		C_2_busybit_out <= '1';
		Z_2_busybit_out <= '1';
		C_2_tag_out_arf <= penout2;
		Z_2_tag_out_arf <= penout2;
		dest_AR_tag_2_out <= penout2;

		if(ra2_ir_out(11 downto 9) = x1_destination and (x1_destination_check = '1')) then
			x2_op1 <= "00000000000" & penout1;	
			x2_op1_ready <= '0';	
		end if;
		if(ra2_ir_out(8 downto 6) = x1_destination and (x1_destination_check = '1')) then
			x2_op2 <= "00000000000" & penout1;	
			x2_op2_ready <= '0';	
		end if;

		if(x1_zero_write_check = '1') then
			Z_2_ready <= '0';
			Z_2_tag_out_rs <=  penout1;
		end if;

-----------------------------------------------------------
	elsif (x2_adi = '1') then
		Ard2a <= ra2_ir_out(11 downto 9);
		Ard2b <= "000";
		Ard2c <= "000";
		Awr2<= ra2_ir_out(8 downto 6);

		if(busy3 = '1') then
			x2_op1 <= "00000000000" & tag3;	
			x2_op1_ready <= '0';		
		else
			x2_op1 <= Data3;
			x2_op1_ready <= '1';
		end if;

		if(ra2_ir_out(5) = '1') then
			x2_op2 <= "1111111111" & ra2_ir_out(5 downto 0);
			x2_op2_ready <= '1';	
		else
			x2_op2 <= "0000000000" & ra2_ir_out(5 downto 0);
			x2_op2_ready <= '1';	
		end if;

		C_2_wr <= '1';
		Z_2_wr <= '1';
		C_2_out <= '0';
		Z_2_out <= '0';
		C_2_ready <= '1';
		Z_2_ready <= '1';
		C_2_tag_out_rs <= "00000";
		Z_2_tag_out_rs <= "00000";

		busy_dest2_out <= '1';
		C_2_busybit_out <= '1';
		Z_2_busybit_out <= '1';
		C_2_tag_out_arf <= penout2;
		Z_2_tag_out_arf <= penout2;
		dest_AR_tag_2_out <= penout2;

		if(ra2_ir_out(11 downto 9) = x1_destination and (x1_destination_check = '1')) then
			x2_op1 <= "00000000000" & penout1;	
			x2_op1_ready <= '0';	
		end if;
------------------------------------------------
	elsif(x2_ndu = '1') then
		Ard2a <= ra2_ir_out(11 downto 9);
		Ard2b <= ra2_ir_out(8 downto 6);
		Ard2c <= "000";
		Awr2  <= ra2_ir_out(5 downto 3);
		if(busy3 = '1') then
			x2_op1 <= "00000000000" & tag3;	
			x2_op1_ready <= '0';		
		else
			x2_op1 <= Data3;
			x2_op1_ready <= '1';
		end if;

		if(busy4 = '1') then
			x2_op2 <= "00000000000" & tag4;	
			x2_op2_ready <= '0';		
		else
			x2_op2 <= Data4;
			x2_op2_ready <= '1';
		end if;

		C_2_wr <= '0';
		Z_2_wr <= '1';
		C_2_out <= '0';
		Z_2_out <= '0';
		C_2_ready <= '1';
		Z_2_ready <= '1';
		C_2_tag_out_rs <= "00000";
		Z_2_tag_out_rs <= "00000";

		busy_dest2_out <= '1';
		C_2_busybit_out <= C_busybit_in;
		Z_2_busybit_out <= '1';
		C_2_tag_out_arf <= C_tag_in;
		Z_2_tag_out_arf <= penout2;
		dest_AR_tag_2_out <= penout2;

		if(ra2_ir_out(11 downto 9) = x1_destination and (x1_destination_check = '1')) then
			x2_op1 <= "00000000000" & penout1;	
			x2_op1_ready <= '0';	
		end if;
		if(ra2_ir_out(8 downto 6) = x1_destination and (x1_destination_check = '1')) then
			x2_op2 <= "00000000000" & penout1;	
			x2_op2_ready <= '0';	
		end if;

-----------------------------------------------------------
	elsif (x2_ndc = '1') then
		Ard2a <= ra2_ir_out(11 downto 9);
		Ard2b <= ra2_ir_out(8 downto 6);
		Ard2c <= "000";
		Awr2  <= ra2_ir_out(5 downto 3);
		if(busy3 = '1') then
			x2_op1 <= "00000000000" & tag3;	
			x2_op1_ready <= '0';		
		else
			x2_op1 <= Data3;
			x2_op1_ready <= '1';
		end if;

		if(busy4 = '1') then
			x2_op2 <= "00000000000" & tag4;	
			x2_op2_ready <= '0';		
		else
			x2_op2 <= Data4;
			x2_op2_ready <= '1';
		end if;

		C_2_wr <= '0';
		Z_2_wr <= '1';

		if(C_busybit_in = '1') then
			C_2_ready <= '0';
			C_2_out <= '0';
			C_2_tag_out_rs <= C_tag_in;
			Z_2_out <= '0';
			Z_2_ready <= '1';
			Z_2_tag_out_rs <= "00000";
		else 
			C_2_ready <= '1';
			C_2_out <= C_in;
			C_2_tag_out_rs <= C_tag_in;
			Z_2_out <= '0';
			Z_2_ready <= '1';
			Z_2_tag_out_rs <= "00000";
		end if;

		busy_dest2_out <= '1';
		C_2_busybit_out <= C_busybit_in;
		Z_2_busybit_out <= '1';
		C_2_tag_out_arf <= C_tag_in;
		Z_2_tag_out_arf <= penout2;
		dest_AR_tag_2_out <= penout2;

		if(ra2_ir_out(11 downto 9) = x1_destination and (x1_destination_check = '1')) then
			x2_op1 <= "00000000000" & penout1;	
			x2_op1_ready <= '0';	
		end if;
		if(ra2_ir_out(8 downto 6) = x1_destination and (x1_destination_check = '1')) then
			x2_op2 <= "00000000000" & penout1;	
			x2_op2_ready <= '0';	
		end if;

		if(x1_carry_write_check = '1') then
			C_2_ready <= '0';
			C_2_tag_out_rs <=  penout1;
		end if;
-------------------------------------------------------------
	elsif (x2_ndz = '1') then
		Ard2a <= ra2_ir_out(11 downto 9);
		Ard2b <= ra2_ir_out(8 downto 6);
		Ard2c <= "000";
		Awr2  <= ra2_ir_out(5 downto 3);
		if(busy3 = '1') then
			x2_op1 <= "00000000000" & tag3;	
			x2_op1_ready <= '0';		
		else
			x2_op1 <= Data3;
			x2_op1_ready <= '1';
		end if;

		if(busy4 = '1') then
			x2_op2 <= "00000000000" & tag4;	
			x2_op2_ready <= '0';		
		else
			x2_op2 <= Data4;
			x2_op2_ready <= '1';
		end if;

		C_2_wr <= '0';
		Z_2_wr <= '1';

		if(Z_busybit_in = '1') then
			C_2_ready <= '1';
			C_2_out <= '0';
			C_2_tag_out_rs <= "00000";
			Z_2_out <= '0';
			Z_2_ready <= '0';
			Z_2_tag_out_rs <= Z_tag_in;
		else 
			C_2_ready <= '1';
			C_2_out <= '0';
			C_2_tag_out_rs <= "00000";
			Z_2_out <= Z_in;
			Z_2_ready <= '1';
			Z_2_tag_out_rs <= Z_tag_in;
		end if;

		busy_dest2_out <= '1';
		C_2_busybit_out <= C_busybit_in;
		Z_2_busybit_out <= '1';
		C_2_tag_out_arf <= C_tag_in;
		Z_2_tag_out_arf <= penout2;
		dest_AR_tag_2_out <= penout2;

		if(ra2_ir_out(11 downto 9) = x1_destination and (x1_destination_check = '1')) then
			x2_op1 <= "00000000000" & penout1;	
			x2_op1_ready <= '0';	
		end if;
		if(ra2_ir_out(8 downto 6) = x1_destination and (x1_destination_check = '1')) then
			x2_op2 <= "00000000000" & penout1;	
			x2_op2_ready <= '0';	
		end if;

		if(x1_zero_write_check = '1') then
			Z_2_ready <= '0';
			Z_2_tag_out_rs <=  penout1;
		end if;

-----------------------------------------------------------
	elsif (x2_lhi = '1') then
		Ard2a <= "000";
		Ard2b <= "000";
		Ard2c <= "000";
		Awr2<= ra2_ir_out(11 downto 9);

		x2_op1 <=  ra2_ir_out(8 downto 0) & "0000000";
		x2_op1_ready <= '1';	
		x2_op2 <= "0000000000000000";
		x2_op2_ready <= '1';	

		C_2_wr <= '0';
		Z_2_wr <= '0';
		C_2_out <= '0';
		Z_2_out <= '0';
		C_2_ready <= '1';
		Z_2_ready <= '1';
		C_2_tag_out_rs <= "00000";
		Z_2_tag_out_rs <= "00000";

		busy_dest2_out <= '1';
		C_2_busybit_out <= C_busybit_in;
		Z_2_busybit_out <= Z_busybit_in;
		C_2_tag_out_arf <= C_tag_in;
		Z_2_tag_out_arf <= Z_tag_in;
		dest_AR_tag_2_out <= penout2;
-----------------------------------------------------------
	elsif (x2_lw = '1') then
		Ard2a <= ra2_ir_out(8 downto 6);
		Ard2b <= "000";
		Ard2c <= "000";
		Awr2<= ra2_ir_out(11 downto 9);

		if(busy3 = '1') then
			x2_op1 <= "00000000000" & tag3;	
			x2_op1_ready <= '0';		
		else
			x2_op1 <= Data3;
			x2_op1_ready <= '1';
		end if;

		if(ra2_ir_out(5) = '1') then
			x2_op2 <= "1111111111" & ra2_ir_out(5 downto 0);
			x2_op2_ready <= '1';	
		else
			x2_op2 <= "0000000000" & ra2_ir_out(5 downto 0);
			x2_op2_ready <= '1';	
		end if;

		C_2_wr <= '0';
		Z_2_wr <= '1';
		C_2_out <= '0';
		Z_2_out <= '0';
		C_2_ready <= '1';
		Z_2_ready <= '1';
		C_2_tag_out_rs <= "00000";
		Z_2_tag_out_rs <= "00000";

		busy_dest2_out <= '1';
		C_2_busybit_out <= C_busybit_in;
		Z_2_busybit_out <= '1';
		C_2_tag_out_arf <= C_tag_in;
		Z_2_tag_out_arf <= penout2;
		dest_AR_tag_2_out <= penout2;

		if(ra2_ir_out(8 downto 6) = x1_destination and (x1_destination_check = '1')) then
			x2_op1 <= "00000000000" & penout1;	
			x2_op1_ready <= '0';	
		end if;
		

-----------------------------------------------------------
	elsif (x2_sw = '1') then
		Ard2a <= ra2_ir_out(11 downto 9);
		Ard2b <= ra2_ir_out(8 downto 6);
		Ard2c <= "000";
		Awr2<= "000";

		if(busy3 = '1') then
			x2_op1 <= "00000000000" & tag3;	
			x2_op1_ready <= '0';		
		else
			x2_op1 <= Data3;
			x2_op1_ready <= '1';
		end if;

		if(busy4 = '1') then
			x2_op2 <= "00000000000" & tag4;	
			x2_op2_ready <= '0';		
		else
			x2_op2 <= Data4;
			x2_op2_ready <= '1';
		end if;

		C_2_wr <= '0';
		Z_2_wr <= '0';
		C_2_out <= '0';
		Z_2_out <= '0';
		C_2_ready <= '1';
		Z_2_ready <= '1';
		C_2_tag_out_rs <= "00000";
		Z_2_tag_out_rs <= "00000";

		busy_dest2_out <= busy_dest2_in;
		C_2_busybit_out <= C_busybit_in;
		Z_2_busybit_out <= Z_busybit_in;
		C_2_tag_out_arf <= C_tag_in;
		Z_2_tag_out_arf <= Z_tag_in;
		dest_AR_tag_2_out <= tag_dest2_in;

		if(ra2_ir_out(11 downto 9) = x1_destination and (x1_destination_check = '1')) then
			x2_op1 <= "00000000000" & penout1;	
			x2_op1_ready <= '0';	
		end if;
		if(ra2_ir_out(8 downto 6) = x1_destination and (x1_destination_check = '1')) then
			x2_op2 <= "00000000000" & penout1;	
			x2_op2_ready <= '0';	
		end if;
---------------------------------------------------------
	elsif (x2_lm = '1' or x2_sm = '1') then  -----DITCHHHHHHHHHHHHHHHHHHHHHHHH HAI
		Ard2a <= ra2_ir_out(11 downto 9);
		Ard2b <= ra2_ir_out(8 downto 6);
		Ard2c <= "000";
		Awr2<= "000";

		if(busy3 = '1') then
			x2_op1 <= "00000000000" & tag3;	
			x2_op1_ready <= '0';		
		else
			x2_op1 <= Data3;
			x2_op1_ready <= '1';
		end if;

		if(busy4 = '1') then
			x2_op2 <= "00000000000" & tag4;	
			x2_op2_ready <= '0';		
		else
			x2_op2 <= Data4;
			x2_op2_ready <= '1';
		end if;

		C_2_wr <= '0';
		Z_2_wr <= '0';
		C_2_out <= '0';
		Z_2_out <= '0';
		C_2_ready <= '1';
		Z_2_ready <= '1';
		C_2_tag_out_rs <= "00000";
		Z_2_tag_out_rs <= "00000";

		busy_dest2_out <= busy_dest2_in;
		C_2_busybit_out <= C_busybit_in;
		Z_2_busybit_out <= Z_busybit_in;
		C_2_tag_out_arf <= C_tag_in;
		Z_2_tag_out_arf <= Z_tag_in;
		dest_AR_tag_2_out <= tag_dest2_in;

-------------------------------------------------
	elsif (x2_beq = '1') then
		Ard2a <= ra2_ir_out(11 downto 9);
		Ard2b <= ra2_ir_out(8 downto 6);
		Ard2c <= "000";
		Awr2<= "000";

		if(busy3 = '1') then
			x2_op1 <= "00000000000" & tag3;	
			x2_op1_ready <= '0';		
		else
			x2_op1 <= Data3;
			x2_op1_ready <= '1';
		end if;

		if(busy4 = '1') then
			x2_op2 <= "00000000000" & tag4;	
			x2_op2_ready <= '0';		
		else
			x2_op2 <= Data4;
			x2_op2_ready <= '1';
		end if;

		C_2_wr <= '0';
		Z_2_wr <= '0';
		C_2_out <= '0';
		Z_2_out <= '0';
		C_2_ready <= '1';
		Z_2_ready <= '1';
		C_2_tag_out_rs <= "00000";
		Z_2_tag_out_rs <= "00000";

		busy_dest2_out <= busy_dest2_in;
		C_2_busybit_out <= C_busybit_in;
		Z_2_busybit_out <= Z_busybit_in;
		C_2_tag_out_arf <= C_tag_in;
		Z_2_tag_out_arf <= Z_tag_in;
		dest_AR_tag_2_out <= tag_dest2_in;

		if(ra2_ir_out(11 downto 9) = x1_destination and (x1_destination_check = '1')) then
			x2_op1 <= "00000000000" & penout1;	
			x2_op1_ready <= '0';	
		end if;
		if(ra2_ir_out(8 downto 6) = x1_destination and (x1_destination_check = '1')) then
			x2_op2 <= "00000000000" & penout1;	
			x2_op2_ready <= '0';	
		end if;

-------------------------------------------------
	elsif (x2_jal = '1') then
		Ard2a <= "000";
		Ard2b <= "000";
		Ard2c <= "000";
		Awr2  <= ra2_ir_out(11 downto 9);

		x2_op1 <= "0000000000000000";	
		x2_op1_ready <= '1';		
		x2_op2 <= "0000000000000000";
		x2_op2_ready <= '1';


		C_2_wr <= '0';
		Z_2_wr <= '0';
		C_2_out <= '0';
		Z_2_out <= '0';
		C_2_ready <= '1';
		Z_2_ready <= '1';
		C_2_tag_out_rs <= "00000";
		Z_2_tag_out_rs <= "00000";

		busy_dest2_out <= '1';
		C_2_busybit_out <= C_busybit_in;
		Z_2_busybit_out <= Z_busybit_in;
		C_2_tag_out_arf <= C_tag_in;
		Z_2_tag_out_arf <= Z_tag_in;
		dest_AR_tag_2_out <= penout2;

-------------------------------------------------
	elsif (x2_jlr = '1') then
		Ard2a <= ra2_ir_out(8 downto 6);
		Ard2b <= "000";
		Ard2c <= "000";
		Awr2  <= ra2_ir_out(11 downto 9);

		if(busy3 = '1') then
			x2_op1 <= "00000000000" & tag3;	
			x2_op1_ready <= '0';		
		else
			x2_op1 <= Data3;
			x2_op1_ready <= '1';
		end if;
	
		x2_op2 <= "0000000000000000";
		x2_op2_ready <= '1';


		C_2_wr <= '0';
		Z_2_wr <= '0';
		C_2_out <= '0';
		Z_2_out <= '0';
		C_2_ready <= '1';
		Z_2_ready <= '1';
		C_2_tag_out_rs <= "00000";
		Z_2_tag_out_rs <= "00000";

		busy_dest2_out <= '1';
		C_2_busybit_out <= C_busybit_in;
		Z_2_busybit_out <= Z_busybit_in;
		C_2_tag_out_arf <= C_tag_in;
		Z_2_tag_out_arf <= Z_tag_in;
		dest_AR_tag_2_out <= penout2;

		if(ra2_ir_out(8 downto 6) = x1_destination and (x1_destination_check = '1')) then
			x2_op1 <= "00000000000" & penout1;	
			x2_op1_ready <= '0';	
		end if;
		
----------------------------------------------------
	else
		Ard2a <= ra2_ir_out(8 downto 6);
		Ard2b <= "000";
		Ard2c <= "000";
		Awr2  <= ra2_ir_out(11 downto 9);

		if(busy3 = '1') then
			x2_op1 <= "00000000000" & tag3;	
			x2_op1_ready <= '0';		
		else
			x2_op1 <= Data3;
			x2_op1_ready <= '1';
		end if;
	
		x2_op2 <= "0000000000000000";
		x2_op2_ready <= '1';


		C_2_wr <= '0';
		Z_2_wr <= '0';
		C_2_out <= '0';
		Z_2_out <= '0';
		C_2_ready <= '1';
		Z_2_ready <= '1';
		C_2_tag_out_rs <= "00000";
		Z_2_tag_out_rs <= "00000";

		busy_dest2_out <= '1';
		C_2_busybit_out <= C_busybit_in;
		Z_2_busybit_out <= Z_busybit_in;
		C_2_tag_out_arf <= C_tag_in;
		Z_2_tag_out_arf <= Z_tag_in;
		dest_AR_tag_2_out <= penout2;
	end if;
------------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------
--CONTROL SIGNALS

--RA_INVALIDATE
------------------------------------------------------------------------------------------------------------------------------------------------------------

if(ra1_val_out = '1') then
	if((x1_add = '1' or x1_ndu = '1') and ra1_ir_out(5 downto 3) = "111") then
		ra1_invalidate_out <= '1';
		ra2_invalidate_out <= '1';
	elsif((x2_add = '1' or x2_ndu = '1') and ra2_ir_out(5 downto 3) = "111") then
		ra1_invalidate_out <= '1';
		ra2_invalidate_out <= '1';
	elsif(x1_adi = '1' and ra1_ir_out(8 downto 6) = "111") then
		ra1_invalidate_out <= '1';
		ra2_invalidate_out <= '1';
	elsif(x2_adi = '1' and ra2_ir_out(8 downto 6) = "111") then
		ra1_invalidate_out <= '1';
		ra2_invalidate_out <= '1';
	elsif (x1_lw = '1' and ra1_ir_out(11 downto 9)= "111") then
		ra1_invalidate_out <= '1';
		ra2_invalidate_out <= '1';
	elsif (x2_lw = '1' and ra2_ir_out(11 downto 9)= "111") then
		ra1_invalidate_out <= '1';
		ra2_invalidate_out <= '1';
	elsif (x1_lm = '1' and ra1_ir_out(7) = '1') then
		ra1_invalidate_out <= '1';
		ra2_invalidate_out <= '1';
	elsif (x2_lm = '1' and ra2_ir_out(7) = '1') then
		ra1_invalidate_out <= '1';
		ra2_invalidate_out <= '1';
	elsif (x1_jlr = '1' or x2_jlr = '1') then
		ra1_invalidate_out <= '1';
		ra2_invalidate_out <= '1';
	elsif (x1_beq = '1' or x2_beq = '1') then
		ra1_invalidate_out <= '1';
		ra2_invalidate_out <= '1';
	elsif (x1_adc = '1' and ra1_ir_out(5 downto 3) = "111") then
		ra1_invalidate_out <= '1';
		ra2_invalidate_out <= '1';
	elsif (x2_adc = '1' and ra2_ir_out(5 downto 3) = "111") then
		ra1_invalidate_out <= '1';
		ra2_invalidate_out <= '1';
	elsif (x1_adz = '1' and ra1_ir_out(5 downto 3) = "111") then
		ra1_invalidate_out <= '1';
		ra2_invalidate_out <= '1';
	elsif (x2_adz = '1' and ra2_ir_out(5 downto 3) = "111") then
		ra1_invalidate_out <= '1';
		ra2_invalidate_out <= '1';
	elsif (x1_ndc = '1' and ra1_ir_out(5 downto 3) = "111") then
		ra1_invalidate_out <= '1';
		ra2_invalidate_out <= '1';
	elsif (x2_ndc = '1' and ra2_ir_out(5 downto 3) = "111") then
		ra1_invalidate_out <= '1';
		ra2_invalidate_out <= '1';
	elsif (x1_ndz = '1' and ra1_ir_out(5 downto 3) = "111") then
		ra1_invalidate_out <= '1';
		ra2_invalidate_out <= '1';
	elsif (x2_ndz = '1' and ra2_ir_out(5 downto 3) = "111") then
		ra1_invalidate_out <= '1';
		ra2_invalidate_out <= '1';	
	else 
		ra1_invalidate_out <= '0';
		ra2_invalidate_out <= '0';
	end if;
else
	if(alu_r7_resolved = '1' or jlr_resolved ='1' or lw_r7_resolved = '1' or taken_branch_detected = '1' or not_taken_branch_detected = '1') then
		ra1_invalidate_out <= '0';
		ra2_invalidate_out <= '0';
	else
		ra1_invalidate_out <= '1';
		ra2_invalidate_out <= '1';
	end if;
end if;

if (ra1_pc_out = "0000000000000000" and ra2_pc_out = "0000000000000000") then
	ra1_invalidate_out <= '0';
	ra2_invalidate_out <= '0';
end if ;
	--------------------------------------------------------------------------------------------------------------------------------

-- RA_EN, PC_EN

--------------------------------------------------------------------------------------------------------------------------------

if(rs_full_in = '1' or twoRRnotFree = '1' or lm_stall_in = '1') then
	pc_en_out <= '0';
	ra_en_out <= '0';
else
	pc_en_out <= '1';
	ra_en_out <= '1';	
end if;

--------------------------------------------------------------------------------------------------------------------------------

-- x1_val, x2_val

--------------------------------------------------------------------------------------------------------------------------------
	
if(taken_branch_detected = '1' or twoRRnotFree = '1') then
	x1_val <= '0';
	x1_val_var := '0';
	arf_busy_wr_en1 <= '0';
	arf_tag_wr_en1  <= '0';
	C_busybit_out <= C_busybit_in;
	Z_busybit_out <= Z_busybit_in;
	C_tag_out_arf <= C_tag_in;
	Z_tag_out_arf <= Z_tag_in;
else
	x1_val <= ra1_val_out;
	arf_busy_wr_en1 <= ra1_val_out;
	arf_tag_wr_en1  <= ra1_val_out;
end if;
------------------------------------------
if(taken_branch_detected = '1' or twoRRnotFree = '1') then
	x2_val <= '0';
	x2_val_var := '0';
	arf_busy_wr_en2 <=  '0';
	arf_tag_wr_en2  <=  '0';
	C_2_busybit_out <= C_busybit_in;
	Z_2_busybit_out <= Z_busybit_in;
	C_2_tag_out_arf <= C_tag_in;
	Z_2_tag_out_arf <= Z_tag_in;
elsif ((x1_add = '1' or x1_adc = '1' or x1_adz = '1' or x1_ndu = '1' or x1_ndc = '1' or x1_ndz = '1' ) and ra1_ir_out(5 downto 3) = "111") then
	x2_val <= '0';
	x2_val_var := '0';
	arf_busy_wr_en2 <=  '0';
	arf_tag_wr_en2  <=  '0';
	C_2_busybit_out <= C_busybit_in;
	Z_2_busybit_out <= Z_busybit_in;
	C_2_tag_out_arf <= C_tag_in;
	Z_2_tag_out_arf <= Z_tag_in;
elsif (x1_adi = '1' and ra1_ir_out(8 downto 6) = "111") then
	x2_val <= '0';
	x2_val_var := '0';
	arf_busy_wr_en2 <=  '0';
	arf_tag_wr_en2  <=  '0';
	C_2_busybit_out <= C_busybit_in;
	Z_2_busybit_out <= Z_busybit_in;
	C_2_tag_out_arf <= C_tag_in;
	Z_2_tag_out_arf <= Z_tag_in;
elsif (x1_lw = '1' and ra1_ir_out(11 downto 9)= "111") then
	x2_val <= '0';
	x2_val_var := '0';
	arf_busy_wr_en2 <=  '0';
	arf_tag_wr_en2  <=  '0';
	C_2_busybit_out <= C_busybit_in;
	Z_2_busybit_out <= Z_busybit_in;
	C_2_tag_out_arf <= C_tag_in;
	Z_2_tag_out_arf <= Z_tag_in;
elsif (x1_lm = '1' and ra1_ir_out(7) = '1') then
	x2_val <= '0';
	x2_val_var := '0';
	arf_busy_wr_en2 <=  '0';
	arf_tag_wr_en2  <=  '0';
	C_2_busybit_out <= C_busybit_in;
	Z_2_busybit_out <= Z_busybit_in;
	C_2_tag_out_arf <= C_tag_in;
	Z_2_tag_out_arf <= Z_tag_in;
elsif (x1_jlr = '1') then
	x2_val <= '0';
	x2_val_var := '0';
	arf_busy_wr_en2 <=  '0';
	arf_tag_wr_en2  <=  '0';
	C_2_busybit_out <= C_busybit_in;
	Z_2_busybit_out <= Z_busybit_in;
	C_2_tag_out_arf <= C_tag_in;
	Z_2_tag_out_arf <= Z_tag_in;
elsif (x1_lhi = '1' and ra1_ir_out(11 downto 9 ) = "111") then
	x2_val <= '0';
	x2_val_var := '0';
	arf_busy_wr_en2 <=  '0';
	arf_tag_wr_en2  <=  '0';
	C_2_busybit_out <= C_busybit_in;
	Z_2_busybit_out <= Z_busybit_in;
	C_2_tag_out_arf <= C_tag_in;
	Z_2_tag_out_arf <= Z_tag_in;
elsif (x1_jal = '1') then
	x2_val <= '0';
	x2_val_var := '0';
	arf_busy_wr_en2 <=  '0';
	arf_tag_wr_en2  <=  '0';
	C_2_busybit_out <= C_busybit_in;
	Z_2_busybit_out <= Z_busybit_in;
	C_2_tag_out_arf <= C_tag_in;
	Z_2_tag_out_arf <= Z_tag_in;
elsif (x1_beq = '1') then
	x2_val <= '0';
	x2_val_var := '0';
	arf_busy_wr_en2 <=  '0';
	arf_tag_wr_en2  <=  '0';
	C_2_busybit_out <= C_busybit_in;
	Z_2_busybit_out <= Z_busybit_in;
	C_2_tag_out_arf <= C_tag_in;
	Z_2_tag_out_arf <= Z_tag_in;
else
	x2_val <= ra2_val_out;
	arf_busy_wr_en2 <=  ra2_val_out;
	arf_tag_wr_en2  <=  ra2_val_out;
end if;
--------------------------------------------------------------------------------------------------------------------------------

-- S0,S1,S2,S3

--------------------------------------------------------------------------------------------------------------------------------



if(taken_branch_detected = '1' or not_taken_branch_detected = '1') then
	--0101
	S3 <= '0';
	S2 <= '1';
	S1 <= '0';
	S0 <= '1';
elsif (alu_r7_resolved = '1' or jlr_resolved = '1' or lw_r7_resolved = '1' ) then
	if(alu_r7_resolved = '1') then
	--0101
		S3 <= '0';
		S2 <= '1';
		S1 <= '0';
		S0 <= '1';
	elsif (jlr_resolved = '1') then
		--0011
		S3 <= '0';
		S2 <= '0';
		S1 <= '1';
		S0 <= '1';
	else
		--1000
		S3 <= '1';
		S2 <= '0';
		S1 <= '0';
		S0 <= '0';
	end if;
elsif (x1_jal = '1') then
	--0001
		S3 <= '0';
		S2 <= '0';
		S1 <= '0';
		S0 <= '1';
elsif (x1_lhi = '1' and ra1_ir_out(11 downto 9) = "111") then
	--0110
		S3 <= '0';
		S2 <= '1';
		S1 <= '1';
		S0 <= '0';
elsif (x2_jal = '1') then
	--0010
		S3 <= '0';
		S2 <= '0';
		S1 <= '1';
		S0 <= '0';
elsif (x2_lhi = '1' and ra2_ir_out(11 downto 9) = "111") then
	--0111
		S3 <= '0';
		S2 <= '1';
		S1 <= '1';
		S0 <= '1';
else 
	--0000
		S3 <= '0';
		S2 <= '0';
		S1 <= '0';
		S0 <= '0';
end if;


--------------------------------------------------------------------------------------------------------------------------------

-- SPEC_TAG_REG

--------------------------------------------------------------------------------------------------------------------------------


--x1_beq_var := x1_beq_var and x1_val_var;
--x2_beq_var := x2_beq_var and x2_val_var;

--if(x1_beq_var = '0' and x2_beq_var = '0' and taken_branch_detected = '1') then
--	spec_tag_reg_in <= spec_tag_rb_in;
--	spec_tag_reg_en <= '1';
--	spec_tag_rs_out1 <= spec_tag_rb_in;
--	spec_tag_rs_out2 <= spec_tag_rb_in;
--elsif (x1_beq_var = '0' and x2_beq_var = '0' and not_taken_branch_detected = '1') then
--	if(spec_tag_reg_out = "11") then
--		spec_tag_reg_in <= "10";
--		spec_tag_reg_en <= '1';
--		spec_tag_rs_out1 <= "10";
--		spec_tag_rs_out2 <= "10";
--	elsif (spec_tag_reg_out = "10") then
--		spec_tag_reg_in <= "01";
--		spec_tag_reg_en <= '1';
--		spec_tag_rs_out1 <= "01";
--		spec_tag_rs_out2 <= "01";
--	elsif (spec_tag_reg_out = "01") then
--		spec_tag_reg_in <= "00";
--		spec_tag_reg_en <= '1';
--		spec_tag_rs_out1 <= "00";
--		spec_tag_rs_out2 <= "00";
--	else
--		spec_tag_reg_in <= "00";
--		spec_tag_reg_en <= '1';
--		spec_tag_rs_out1 <= "00";
--		spec_tag_rs_out2 <= "00";
--	end if;
--elsif (x1_beq_var = '1' and x2_beq_var = '0' and taken_branch_detected = '1') then
--	if(spec_tag_rb_in = "10") then
--		spec_tag_reg_in <= "11";
--		spec_tag_reg_en <= '1';
--		spec_tag_rs_out1 <= "10";
--		spec_tag_rs_out2 <= "11";
--	elsif (spec_tag_rb_in = "01") then
--		spec_tag_reg_in <= "10";
--		spec_tag_reg_en <= '1';
--		spec_tag_rs_out1 <= "01";
--		spec_tag_rs_out2 <= "10";
--	elsif (spec_tag_rb_in = "00") then
--		spec_tag_reg_in <= "01";
--		spec_tag_reg_en <= '1';
--		spec_tag_rs_out1 <= "00";
--		spec_tag_rs_out2 <= "01";
--	else
--		spec_tag_reg_in <= "00";
--		spec_tag_reg_en <= '1';
--		spec_tag_rs_out1 <= "00";
--		spec_tag_rs_out2 <= "01";
--	end if;
--elsif (x1_beq_var = '0' and x2_beq_var = '1' and taken_branch_detected = '1') then
--	if(spec_tag_rb_in = "10") then
--		spec_tag_reg_in <= "11";
--		spec_tag_reg_en <= '1';
--		spec_tag_rs_out1 <= "10";
--		spec_tag_rs_out2 <= "10";
--	elsif (spec_tag_rb_in = "01") then
--		spec_tag_reg_in <= "10";
--		spec_tag_reg_en <= '1';
--		spec_tag_rs_out1 <= "01";
--		spec_tag_rs_out2 <= "01";
--	elsif (spec_tag_rb_in = "00") then
--		spec_tag_reg_in <= "01";
--		spec_tag_reg_en <= '1';
--		spec_tag_rs_out1 <= "00";
--		spec_tag_rs_out2 <= "00";
--	else
--		spec_tag_reg_in <= "00";
--		spec_tag_reg_en <= '1';
--		spec_tag_rs_out1 <= "00";
--		spec_tag_rs_out2 <= "00";
--	end if;
--elsif (x1_beq_var = '1' and x2_beq_var = '0' and not_taken_branch_detected = '1') then
--	if(spec_tag_reg_out = "11") then
--		spec_tag_reg_in <= "11";
--		spec_tag_reg_en <= '1';
--		spec_tag_rs_out1 <= "10";
--		spec_tag_rs_out2 <= "11";
--	elsif (spec_tag_reg_out = "10") then
--		spec_tag_reg_in <= "10";
--		spec_tag_reg_en <= '1';
--		spec_tag_rs_out1 <= "01";
--		spec_tag_rs_out2 <= "10";
--	elsif (spec_tag_reg_out = "01") then
--		spec_tag_reg_in <= "01";
--		spec_tag_reg_en <= '1';
--		spec_tag_rs_out1 <= "00";
--		spec_tag_rs_out2 <= "01";
--	else
--		spec_tag_reg_in <= "00";
--		spec_tag_reg_en <= '1';
--		spec_tag_rs_out1 <= "00";
--		spec_tag_rs_out2 <= "00";
--	end if;

--elsif (x1_beq_var = '0' and x2_beq_var = '1' and not_taken_branch_detected = '1') then
--	if(spec_tag_reg_out = "11") then
--		spec_tag_reg_in <= "11";
--		spec_tag_reg_en <= '1';
--		spec_tag_rs_out1 <= "10";
--		spec_tag_rs_out2 <= "10";
--	elsif (spec_tag_reg_out = "10") then
--		spec_tag_reg_in <= "10";
--		spec_tag_reg_en <= '1';
--		spec_tag_rs_out1 <= "01";
--		spec_tag_rs_out2 <= "01";
--	elsif (spec_tag_reg_out = "01") then
--		spec_tag_reg_in <= "01";
--		spec_tag_reg_en <= '1';
--		spec_tag_rs_out1 <= "00";
--		spec_tag_rs_out2 <= "00";
--	else
--		spec_tag_reg_in <= "00";
--		spec_tag_reg_en <= '1';
--		spec_tag_rs_out1 <= "00";
--		spec_tag_rs_out2 <= "00";
--	end if;
--elsif (x1_beq_var = '1' and x2_beq_var = '1' and taken_branch_detected = '1') then
--	if(spec_tag_rb_in = "10") then
--		spec_tag_reg_in <= "10";
--		spec_tag_reg_en <= '1';
--		spec_tag_rs_out1 <= "10";
--		spec_tag_rs_out2 <= "10";
--		pc_en_out <= '0';
--		ra_en_out <='0';
--		x1_val <='0';
--		x2_val <='0';
--		arf_busy_wr_en1 <= '0';
--		arf_busy_wr_en2 <= '0';
--		arf_tag_wr_en1 <= '0';
--		arf_tag_wr_en2 <= '0';
--	elsif (spec_tag_rb_in = "01") then
--		spec_tag_reg_in <= "11";
--		spec_tag_reg_en <= '1';
--		spec_tag_rs_out1 <= "01";
--		spec_tag_rs_out2 <= "10";
--	elsif (spec_tag_rb_in = "00") then
--		spec_tag_reg_in <= "10";
--		spec_tag_reg_en <= '1';
--		spec_tag_rs_out1 <= "00";
--		spec_tag_rs_out2 <= "01";
--	else
--		spec_tag_reg_in <= "00";
--		spec_tag_reg_en <= '1';
--		spec_tag_rs_out1 <= "00";
--		spec_tag_rs_out2 <= "00";
--	end if;
--elsif (x1_beq_var = '1' and x2_beq_var = '1' and not_taken_branch_detected = '1') then
--	if(spec_tag_reg_out = "11") then
--		spec_tag_reg_in <= "10";
--		spec_tag_reg_en <= '1';
--		spec_tag_rs_out1 <= "10";
--		spec_tag_rs_out2 <= "10";
--		pc_en_out <= '0';
--		ra_en_out <='0';
--		x1_val <='0';
--		x2_val <='0';
--		arf_busy_wr_en1 <= '0';
--		arf_busy_wr_en2 <= '0';
--		arf_tag_wr_en1 <= '0';
--		arf_tag_wr_en2 <= '0';
--	elsif (spec_tag_reg_out = "10") then
--		spec_tag_reg_in <= "11";
--		spec_tag_reg_en <= '1';
--		spec_tag_rs_out1 <= "01";
--		spec_tag_rs_out2 <= "10";
--	elsif (spec_tag_reg_out = "01") then
--		spec_tag_reg_in <= "10";
--		spec_tag_reg_en <= '1';
--		spec_tag_rs_out1 <= "00";
--		spec_tag_rs_out2 <= "01";
--	else
--		spec_tag_reg_in <= "00";
--		spec_tag_reg_en <= '1';
--		spec_tag_rs_out1 <= "00";
--		spec_tag_rs_out2 <= "00";
--	end if;

--elsif (x1_beq_var = '0' and x2_beq_var = '0' and not_taken_branch_detected = '0' and taken_branch_detected = '0') then
--		spec_tag_reg_in <= spec_tag_reg_out;
--		spec_tag_reg_en <= '0';
--		spec_tag_rs_out1 <= spec_tag_reg_out;
--		spec_tag_rs_out2 <= spec_tag_reg_out;
	
--elsif (x1_beq_var = '1' and x2_beq_var = '0' and not_taken_branch_detected = '0' and taken_branch_detected = '0') then
--	if(spec_tag_reg_out = "11") then
--		spec_tag_reg_in <= "11";
--		spec_tag_reg_en <= '1';
--		spec_tag_rs_out1 <= "10";
--		spec_tag_rs_out2 <= "11";
--		pc_en_out <= '0';
--		ra_en_out <='0';
--		x1_val <='0';
--		x2_val <='0';
--		arf_busy_wr_en1 <= '0';
--		arf_busy_wr_en2 <= '0';
--		arf_tag_wr_en1 <= '0';
--		arf_tag_wr_en2 <= '0';
--	elsif (spec_tag_reg_out = "10") then
--		spec_tag_reg_in <= "11";
--		spec_tag_reg_en <= '1';
--		spec_tag_rs_out1 <= "10";
--		spec_tag_rs_out2 <= "11";
--	elsif (spec_tag_reg_out = "01") then
--		spec_tag_reg_in <= "10";
--		spec_tag_reg_en <= '1';
--		spec_tag_rs_out1 <= "01";
--		spec_tag_rs_out2 <= "10";
--	else
--		spec_tag_reg_in <= "01";
--		spec_tag_reg_en <= '1';
--		spec_tag_rs_out1 <= "00";
--		spec_tag_rs_out2 <= "01";
--	end if;
--elsif (x1_beq_var = '0' and x2_beq_var = '1' and not_taken_branch_detected = '0' and taken_branch_detected = '0') then
--	if(spec_tag_reg_out = "11") then
--		spec_tag_reg_in <= "11";
--		spec_tag_reg_en <= '1';
--		spec_tag_rs_out1 <= "10";
--		spec_tag_rs_out2 <= "11";
--		pc_en_out <= '0';
--		ra_en_out <='0';
--		x1_val <='0';
--		x2_val <='0';
--		arf_busy_wr_en1 <= '0';
--		arf_busy_wr_en2 <= '0';
--		arf_tag_wr_en1 <= '0';
--		arf_tag_wr_en2 <= '0';
--	elsif (spec_tag_reg_out = "10") then
--		spec_tag_reg_in <= "11";
--		spec_tag_reg_en <= '1';
--		spec_tag_rs_out1 <= "10";
--		spec_tag_rs_out2 <= "10";
--	elsif (spec_tag_reg_out = "01") then
--		spec_tag_reg_in <= "10";
--		spec_tag_reg_en <= '1';
--		spec_tag_rs_out1 <= "01";
--		spec_tag_rs_out2 <= "01";
--	else
--		spec_tag_reg_in <= "01";
--		spec_tag_reg_en <= '1';
--		spec_tag_rs_out1 <= "00";
--		spec_tag_rs_out2 <= "00";
--	end if;
--elsif (x1_beq_var = '1' and x2_beq_var = '1' and not_taken_branch_detected = '0' and taken_branch_detected = '0') then
--	if(spec_tag_reg_out = "11") then
--		spec_tag_reg_in <= "11";
--		spec_tag_reg_en <= '1';
--		spec_tag_rs_out1 <= "10";
--		spec_tag_rs_out2 <= "11";
--		pc_en_out <= '0';
--		ra_en_out <='0';
--		x1_val <='0';
--		x2_val <='0';
--		arf_busy_wr_en1 <= '0';
--		arf_busy_wr_en2 <= '0';
--		arf_tag_wr_en1 <= '0';
--		arf_tag_wr_en2 <= '0';
--	elsif (spec_tag_reg_out = "10") then
--		spec_tag_reg_in <= "10";
--		spec_tag_reg_en <= '1';
--		spec_tag_rs_out1 <= "10";
--		spec_tag_rs_out2 <= "11";
--		pc_en_out <= '0';
--		ra_en_out <='0';
--		x1_val <='0';
--		x2_val <='0';
--		arf_busy_wr_en1 <= '0';
--		arf_busy_wr_en2 <= '0';
--		arf_tag_wr_en1 <= '0';
--		arf_tag_wr_en2 <= '0';
--	elsif (spec_tag_reg_out = "01") then
--		spec_tag_reg_in <= "11";
--		spec_tag_reg_en <= '1';
--		spec_tag_rs_out1 <= "01";
--		spec_tag_rs_out2 <= "10";
--	else
--		spec_tag_reg_in <= "10";
--		spec_tag_reg_en <= '1';
--		spec_tag_rs_out1 <= "00";
--		spec_tag_rs_out2 <= "01";
--	end if;
--else 
--		spec_tag_reg_in <= "00";
--		spec_tag_reg_en <= '0';
--		spec_tag_rs_out1 <= "00";
--		spec_tag_rs_out2 <= "00";
--end if;



--------------------------------------------------------------------------------------------------------------------------------

-- NOP instruction

--------------------------------------------------------------------------------------------------------------------------------

if(ra1_ir_out(15 downto 12) = "1111") then
	x1_val_var :='0';
	x1_val <= '0';
end if;
if(ra2_ir_out(15 downto 12) = "1111") then
	x2_val_var :='0';
	x2_val <= '0';
end if;



--------------------------------------------------------------------------------------------------------------------------------

-- STORE_TAG_REG

--------------------------------------------------------------------------------------------------------------------------------



x1_sw_var := x1_sw_var and x1_val_var;
x2_sw_var := x2_sw_var and x2_val_var;

if(x1_sw_var = '0' and x2_sw_var = '0' and store_retirement_count = "00") then
	store_tag_reg_in <= store_tag_reg_out;
	store_tag_reg_en <= '0';
	store_tag_rs_out1<= store_tag_reg_out;
	store_tag_rs_out1<= store_tag_reg_out;
elsif (x1_sw_var = '0' and x2_sw_var = '1' and store_retirement_count = "00") then
	store_tag_reg_in <= store_tag_reg_out_plus_one(4 downto 0);
	store_tag_reg_en <= '1';
	store_tag_rs_out1<= store_tag_reg_out;
	store_tag_rs_out1<= store_tag_reg_out;
elsif (x1_sw_var = '1' and x2_sw_var = '0' and store_retirement_count = "00") then
	store_tag_reg_in <= store_tag_reg_out_plus_one(4 downto 0);
	store_tag_reg_en <= '1';
	store_tag_rs_out1<= store_tag_reg_out;
	store_tag_rs_out1<= store_tag_reg_out_plus_one(4 downto 0);
elsif (x1_sw_var = '1' and x2_sw_var = '1' and store_retirement_count = "00") then
	store_tag_reg_in <= store_tag_reg_out_plus_two(4 downto 0);
	store_tag_reg_en <= '1';
	store_tag_rs_out1<= store_tag_reg_out;
	store_tag_rs_out1<= store_tag_reg_out_plus_one(4 downto 0);
elsif (x1_sw_var = '0' and x2_sw_var = '0' and store_retirement_count = "01") then
	store_tag_reg_in <= store_tag_reg_out_minus_one(4 downto 0);
	store_tag_reg_en <= '1';
	store_tag_rs_out1<= store_tag_reg_out_minus_one(4 downto 0);
	store_tag_rs_out1<= store_tag_reg_out_minus_one(4 downto 0);
elsif (x1_sw_var = '0' and x2_sw_var = '1' and store_retirement_count = "01") then
	store_tag_reg_in <= store_tag_reg_out(4 downto 0);
	store_tag_reg_en <= '1';
	store_tag_rs_out1<= store_tag_reg_out_minus_one(4 downto 0);
	store_tag_rs_out1<= store_tag_reg_out_minus_one(4 downto 0);
elsif (x1_sw_var = '1' and x2_sw_var = '0' and store_retirement_count = "01") then
	store_tag_reg_in <= store_tag_reg_out;
	store_tag_reg_en <= '1';
	store_tag_rs_out1<= store_tag_reg_out_minus_one(4 downto 0);
	store_tag_rs_out1<= store_tag_reg_out;
elsif (x1_sw_var = '1' and x2_sw_var = '1' and store_retirement_count = "01") then
	store_tag_reg_in <= store_tag_reg_out_plus_one(4 downto 0);
	store_tag_reg_en <= '1';
	store_tag_rs_out1<= store_tag_reg_out_minus_one(4 downto 0);
	store_tag_rs_out1<= store_tag_reg_out;
elsif (x1_sw_var = '0' and x2_sw_var = '0' and store_retirement_count = "10") then
	store_tag_reg_in <= store_tag_reg_out_minus_two(4 downto 0);
	store_tag_reg_en <= '1';
	store_tag_rs_out1<= store_tag_reg_out_minus_two(4 downto 0);
	store_tag_rs_out1<= store_tag_reg_out_minus_two(4 downto 0);
elsif (x1_sw_var = '0' and x2_sw_var = '1' and store_retirement_count = "10") then
	store_tag_reg_in <= store_tag_reg_out_minus_one(4 downto 0);
	store_tag_reg_en <= '1';
	store_tag_rs_out1<= store_tag_reg_out_minus_two(4 downto 0);
	store_tag_rs_out1<= store_tag_reg_out_minus_two(4 downto 0);
elsif (x1_sw_var = '1' and x2_sw_var = '0' and store_retirement_count = "10") then
	store_tag_reg_in <= store_tag_reg_out_minus_one(4 downto 0);
	store_tag_reg_en <= '1';
	store_tag_rs_out1<= store_tag_reg_out_minus_two(4 downto 0);
	store_tag_rs_out1<= store_tag_reg_out_minus_one(4 downto 0);
elsif (x1_sw_var = '1' and x2_sw_var = '1' and store_retirement_count = "10") then
	store_tag_reg_in <= store_tag_reg_out;
	store_tag_reg_en <= '1';
	store_tag_rs_out1<= store_tag_reg_out_minus_two(4 downto 0);
	store_tag_rs_out1<= store_tag_reg_out_minus_one(4 downto 0);
else
	store_tag_reg_in <= store_tag_reg_out;
	store_tag_reg_en <= '0';
	store_tag_rs_out1<= store_tag_reg_out;
	store_tag_rs_out1<= store_tag_reg_out;
end if;


if (x1_val_var = '1' and x2_val_var = '1') then
	free_rrf_vec_out <= free_rrf_vec_out_sig;
elsif (x1_val_var = '1' and x2_val_var = '0') then
	free_rrf_vec_out <= free_rrf_vec_out_sig2;
else
	free_rrf_vec_out <= free_rrf_vec;
end if ;

--free_rrf_vec_out <= free_rrf_vec_out_sig when(x1_val_var = '1' and x2_val_var = '1') else
--					free_rrf_vec_out_sig2 when(x1_val_var = '1' and x2_val_var = '0') else
--					free_rrf_vec;

end process;
end architecture behave;
