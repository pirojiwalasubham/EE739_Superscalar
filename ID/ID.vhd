library ieee;
use ieee.numeric_std.all;
use ieee.std_logic_1164.all;


entity ID is
	port(clk, reset, reset_bar: in std_logic ;
		ra1_val_out, ra2_val_out : in std_logic;
		ra1_pc_out, ra1_ir_out ,ra2_pc_out, ra2_ir_out  : in std_logic_vector(15 downto 0);
		rb_pc, rb_ir, rb_op1, rb_op2 : in  std_logic_vector(15 downto 0);
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

		free_rrf_vec_out : out std_logic_vector(31 downto 0);
		Ard1a, Ard1b, Ard2a, Ard2b,Ard1c, Ard2c, Awr1, Awr2 : out std_logic_vector(2 downto 0) ;  -- Ard1a inst1 opr1
		pc1, pc2, ir1, ir2 : out  std_logic_vector(15 downto 0);
		1_op1, 1_op2, 2_op1, 2_op2 :out  std_logic_vector(15 downto 0);
		1_op1_ready, 1_op2_ready,2_op1_ready, 2_op2_ready : out std_logic;
		1_val,2_val : out std_logic;
		C_out,Z_out , C_ready, Z_ready, C_wr, Z_wr, C_2_out, C_2_ready,C_2_wr, Z_2_out,Z_2_ready,Z_2_wr: out std_logic; -- For RS
		spec_tag_rs_out1, spec_tag_rs_out2 : out std_logic_vector(1 downto 0);
		C_busybit_out,Z_busybit_out, C_2_busybit_out, Z_2_busybit_out : out std_logic ;
		C_tag_out_arf, Z_tag_out_arf, C_2_tag_out_arf, Z_2_tag_out_arf : out std_logic_vector(4 downto 0);
		busy_dest1_out, busy_dest2_out : out std_logic;
		dest_AR_tag_out, dest_AR_tag_2_out : out std_logic_vector(4 downto 0);
		C_tag_out_rs, Z_tag_out_rs, C_2_tag_out_rs, Z_2_tag_out_rs: out std_logic_vector(4 downto 0);
		ra1_invalidate_out, ra2_invalidate_out : out std_logic;
		pc_en_out, ra_en_out : out std_logic;
		arf_busy_wr_en1, arf_busy_wr_en2, arf_tag_wr_en1, arf_tag_wr_en2 : out std_logic;
		adder2_out, adder3_out, ZA7_1_out, ZA7_2_out : out std_logic_vector(15 downto 0)

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

component pen32bitwith2output is 
	port (penin: in std_logic_vector(31 downto 0);
			twoRRnotFree : out std_logic;
			pennext: out std_logic_vector(31 downto 0);
			penout1, penout2: out std_logic_vector(4 downto 0));
end component;

component Add is
   port(x,y: in std_logic_vector(15 downto 0);
	
	s0: out std_logic_vector(15 downto 0);
        c_out: out std_logic);
end component;


signal 1_add,1_adc,1_adz,1_adi,1_ndu,1_ndc,1_ndz,1_lhi,1_lw,1_sw,1_lm,1_sm,1_beq,1_jal,1_jlr : std_logic :='0';
signal 2_add,2_adc,2_adz,2_adi,2_ndu,2_ndc,2_ndz,2_lhi,2_lw,2_sw,2_lm,2_sm,2_beq,2_jal,2_jlr : std_logic :='0';
signal twoRRnotFree : std_logic;
signal penout2,penout1 : std_logic_vector(4 downto 0);
signal SE_Ra1_imm9 : std_logic_vector(15 downto 0);
signal c_adder2out,c_adder3out : std_logic;
spec_tag_reg_en :  std_logic;
spec_tag_reg_in,spec_tag_reg_out : std_logic_vector(1 downto 0);

					



begin

1_add <= '1' when((ra1_ir_out(15 downto 12) = "0000" and ra1_ir_out(2 downto 0 ) = "000")  and ra1_val_out = '1' ) else '0';
1_adc <= '1' when((ra1_ir_out(15 downto 12) = "0000" and ra1_ir_out(2 downto 0 ) = "010")  and ra1_val_out = '1' ) else '0';
1_adz <= '1' when((ra1_ir_out(15 downto 12) = "0000" and ra1_ir_out(2 downto 0 ) = "001")  and ra1_val_out = '1' ) else '0';
1_adi <= '1' when((ra1_ir_out(15 downto 12) = "0001")  and ra1_val_out = '1' ) else '0';
1_ndu <= '1' when((ra1_ir_out(15 downto 12) = "0010" and ra1_ir_out(2 downto 0 ) = "000")  and ra1_val_out = '1' ) else '0';
1_ndc <= '1' when((ra1_ir_out(15 downto 12) = "0010" and ra1_ir_out(2 downto 0 ) = "010")  and ra1_val_out = '1' ) else '0';
1_ndz <= '1' when((ra1_ir_out(15 downto 12) = "0010" and ra1_ir_out(2 downto 0 ) = "001")  and ra1_val_out = '1' ) else '0';
1_lhi <= '1' when((ra1_ir_out(15 downto 12) = "0011")  and ra1_val_out = '1' ) else '0';
1_lw  <= '1' when((ra1_ir_out(15 downto 12) = "0100")  and ra1_val_out = '1' ) else '0';
1_sw  <= '1' when((ra1_ir_out(15 downto 12) = "0101")  and ra1_val_out = '1' ) else '0';
1_lm  <= '1' when((ra1_ir_out(15 downto 12) = "0110")  and ra1_val_out = '1' ) else '0';
1_sm  <= '1' when((ra1_ir_out(15 downto 12) = "0111")  and ra1_val_out = '1' ) else '0';
1_beq <= '1' when((ra1_ir_out(15 downto 12) = "1100")  and ra1_val_out = '1' ) else '0';
1_jal <= '1' when((ra1_ir_out(15 downto 12) = "1000")  and ra1_val_out = '1' ) else '0';
1_jlr <= '1' when((ra1_ir_out(15 downto 12) = "1001")  and ra1_val_out = '1' ) else '0';

2_add <= '1' when((ra2_ir_out(15 downto 12) = "0000" and ra2_ir_out(2 downto 0 ) = "000")  and ra2_val_out = '1' ) else '0';
2_adc <= '1' when((ra2_ir_out(15 downto 12) = "0000" and ra2_ir_out(2 downto 0 ) = "010")  and ra2_val_out = '1' ) else '0';
2_adz <= '1' when((ra2_ir_out(15 downto 12) = "0000" and ra2_ir_out(2 downto 0 ) = "001")  and ra2_val_out = '1' ) else '0';
2_adi <= '1' when((ra2_ir_out(15 downto 12) = "0001")  and ra2_val_out = '1' ) else '0';
2_ndu <= '1' when((ra2_ir_out(15 downto 12) = "0010" and ra2_ir_out(2 downto 0 ) = "000")  and ra2_val_out = '1' ) else '0';
2_ndc <= '1' when((ra2_ir_out(15 downto 12) = "0010" and ra2_ir_out(2 downto 0 ) = "010")  and ra2_val_out = '1' ) else '0';
2_ndz <= '1' when((ra2_ir_out(15 downto 12) = "0010" and ra2_ir_out(2 downto 0 ) = "001")  and ra2_val_out = '1' ) else '0';
2_lhi <= '1' when((ra2_ir_out(15 downto 12) = "0011")  and ra2_val_out = '1' ) else '0';
2_lw  <= '1' when((ra2_ir_out(15 downto 12) = "0100")  and ra2_val_out = '1' ) else '0';
2_sw  <= '1' when((ra2_ir_out(15 downto 12) = "0101")  and ra2_val_out = '1' ) else '0';
2_lm  <= '1' when((ra2_ir_out(15 downto 12) = "0110")  and ra2_val_out = '1' ) else '0';
2_sm  <= '1' when((ra2_ir_out(15 downto 12) = "0111")  and ra2_val_out = '1' ) else '0';
2_beq <= '1' when((ra2_ir_out(15 downto 12) = "1100")  and ra2_val_out = '1' ) else '0';
2_jal <= '1' when((ra2_ir_out(15 downto 12) = "1000")  and ra2_val_out = '1' ) else '0';
2_jlr <= '1' when((ra2_ir_out(15 downto 12) = "1001")  and ra2_val_out = '1' ) else '0';

if(ra1_ir_out(8) = '1') then
	SE_Ra1_imm9 <= "1111111" & ra1_ir_out(8 downto 0);
else
	SE_Ra1_imm9 <= "0000000" & ra1_ir_out(8 downto 0);
end if;
if(ra2_ir_out(8) = '1') then
	SE_Ra2_imm9 <= "1111111" & ra2_ir_out(8 downto 0);
else
	SE_Ra2_imm9 <= "0000000" & ra2_ir_out(8 downto 0);
end if;


ADDER2 : Add port map (ra1_pc_out, SE_Ra1_imm9, adder2_out, c_adder2out); 	--next pc jal
ADDER3 : Add port map (ra2_pc_out, SE_Ra2_imm9, adder3_out, c_adder3out);
ZA7_1_out <= ra1_ir_out(8 downto 0) & "0000000";
ZA7_2_out <= ra2_ir_out(8 downto 0) & "1111111";

pc1 <= ra1_pc_out;
pc2 <= ra2_val_out; 
ir1 <= ra1_ir_out;
ir2 <= ra2_ir_out;


PE: pen32bitwith2output port map(free_rrf_vec,twoRRnotFree,free_rrf_vec_out,penout1, penout2);
SPEC_TAG_REG: myRegister generic map(2) port map(clk, spec_tag_reg_en, reset, spec_tag_reg_in, spec_tag_reg_out);

process()
begin

	if(1_add = '1') then
		Ard1a <= ra1_ir_out(11 downto 9);
		Ard1b <= ra1_ir_out(8 downto 6);
		Ard1c <= "000";
		Awr1  <= ra1_ir_out(5 downto 3);
		if(busy1 = '1') then
			1_op1 <= "00000000000" & tag1;	
			1_op1_ready <= '0';		;
		else
			1_op1 <= Data1;
			1_op1_ready <= '1';
		end if;

		if(busy2 = '1') then
			1_op2 <= "00000000000" & tag2;	
			1_op2_ready <= '0';		;
		else
			1_op2 <= Data2;
			1_op2_ready <= '1';
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

-----------------------------------------------------------
	elsif (1_adc = '1') then
		Ard1a <= ra1_ir_out(11 downto 9);
		Ard1b <= ra1_ir_out(8 downto 6);
		Ard1c <= "000";
		Awr1  <= ra1_ir_out(5 downto 3);
		if(busy1 = '1') then
			1_op1 <= "00000000000" & tag1;	
			1_op1_ready <= '0';		;
		else
			1_op1 <= Data1;
			1_op1_ready <= '1';
		end if;

		if(busy2 = '1') then
			1_op2 <= "00000000000" & tag2;	
			1_op2_ready <= '0';		;
		else
			1_op2 <= Data2;
			1_op2_ready <= '1';
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

-----------------------------------------------------------
	elsif (1_adz = '1') then
		Ard1a <= ra1_ir_out(11 downto 9);
		Ard1b <= ra1_ir_out(8 downto 6);
		Ard1c <= "000";
		Awr1  <= ra1_ir_out(5 downto 3);
		if(busy1 = '1') then
			1_op1 <= "00000000000" & tag1;	
			1_op1_ready <= '0';		;
		else
			1_op1 <= Data1;
			1_op1_ready <= '1';
		end if;

		if(busy2 = '1') then
			1_op2 <= "00000000000" & tag2;	
			1_op2_ready <= '0';		;
		else
			1_op2 <= Data2;
			op2_ready <= '1';
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

-----------------------------------------------------------
	elsif (1_adi = '1') then
		Ard1a <= ra1_ir_out(11 downto 9);
		Ard1b <= "000";
		Ard1c <= "000";
		Awr1<= ra1_ir_out(8 downto 6);

		if(busy1 = '1') then
			1_op1 <= "00000000000" & tag1;	
			1_op1_ready <= '0';		
		else
			1_op1 <= Data1;
			1_op1_ready <= '1';
		end if;

		if(ra1_ir_out(5) = '1') then
			1_op2 <= "1111111111" & ra1_ir_out(5 downto 0);
			1_op2_ready <= '1';	
		else
			1_op2 <= "0000000000" & ra1_ir_out(5 downto 0);
			1_op2_ready <= '1';	
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
------------------------------------------------
	if(1_ndu = '1') then
		Ard1a <= ra1_ir_out(11 downto 9);
		Ard1b <= ra1_ir_out(8 downto 6);
		Ard1c <= "000";
		Awr1  <= ra1_ir_out(5 downto 3);
		if(busy1 = '1') then
			1_op1 <= "00000000000" & tag1;	
			1_op1_ready <= '0';		;
		else
			1_op1 <= Data1;
			1_op1_ready <= '1';
		end if;

		if(busy2 = '1') then
			1_op2 <= "00000000000" & tag2;	
			1_op2_ready <= '0';		;
		else
			1_op2 <= Data2;
			op2_ready <= '1';
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

-----------------------------------------------------------
	elsif (1_ndc = '1') then
		Ard1a <= ra1_ir_out(11 downto 9);
		Ard1b <= ra1_ir_out(8 downto 6);
		Ard1c <= "000";
		Awr1  <= ra1_ir_out(5 downto 3);
		if(busy1 = '1') then
			1_op1 <= "00000000000" & tag1;	
			1_op1_ready <= '0';		;
		else
			1_op1 <= Data1;
			1_op1_ready <= '1';
		end if;

		if(busy2 = '1') then
			1_op2 <= "00000000000" & tag2;	
			1_op2_ready <= '0';		;
		else
			1_op2 <= Data2;
			1_op2_ready <= '1';
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
-------------------------------------------------------------
	elsif (1_ndz = '1') then
		Ard1a <= ra1_ir_out(11 downto 9);
		Ard1b <= ra1_ir_out(8 downto 6);
		Ard1c <= "000";
		Awr1  <= ra1_ir_out(5 downto 3);
		if(busy1 = '1') then
			1_op1 <= "00000000000" & tag1;	
			1_op1_ready <= '0';		;
		else
			1_op1 <= Data1;
			1_op1_ready <= '1';
		end if;

		if(busy2 = '1') then
			1_op2 <= "00000000000" & tag2;	
			1_op2_ready <= '0';		;
		else
			1_op2 <= Data2;
			1_op2_ready <= '1';
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

-----------------------------------------------------------
	elsif (1_lhi = '1') then
		Ard1a <= "000";
		Ard1b <= "000";
		Ard1c <= "000";
		Awr1<= ra1_ir_out(11 downto 9);

		1_op1 <=  ra1_ir_out(8 downto 0) & "0000000";
		1_op1_ready <= '1';	
		1_op2 <= "0000000000000000";
		1_op2_ready <= '1';	

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
-----------------------------------------------------------
	elsif (1_lw = '1') then
		Ard1a <= ra1_ir_out(8 downto 6);
		Ard1b <= "000";
		Ard1c <= "000";
		Awr1<= ra1_ir_out(11 downto 9);

		if(busy1 = '1') then
			1_op1 <= "00000000000" & tag1;	
			1_op1_ready <= '0';		
		else
			1_op1 <= Data1;
			1_op1_ready <= '1';
		end if;

		if(ra1_ir_out(5) = '1') then
			1_op2 <= "1111111111" & ra1_ir_out(5 downto 0);
			1_op2_ready <= '1';	
		else
			1_op2 <= "0000000000" & ra1_ir_out(5 downto 0);
			1_op2_ready <= '1';	
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

-----------------------------------------------------------
	elsif (1_sw = '1') then
		Ard1a <= ra1_ir_out(11 downto 9);
		Ard1b <= ra1_ir_out(8 downto 6);
		Ard1c <= "000";
		Awr1<= "000";

		if(busy1 = '1') then
			1_op1 <= "00000000000" & tag1;	
			1_op1_ready <= '0';		
		else
			1_op1 <= Data1;
			1_op1_ready <= '1';
		end if;

		if(busy2 = '1') then
			1_op2 <= "00000000000" & tag2;	
			1_op2_ready <= '0';		;
		else
			1_op2 <= Data2;
			1_op2_ready <= '1';
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
---------------------------------------------------------
	elsif (1_lm = '1' or 1_sm = '1') then.  -----DITCHHHHHHHHHHHHHHHHHHHHHHHH HAI
		Ard1a <= ra1_ir_out(11 downto 9);
		Ard1b <= ra1_ir_out(8 downto 6);
		Ard1c <= "000";
		Awr1<= "000";

		if(busy1 = '1') then
			1_op1 <= "00000000000" & tag1;	
			1_op1_ready <= '0';		
		else
			1_op1 <= Data1;
			1_op1_ready <= '1';
		end if;

		if(busy2 = '1') then
			1_op2 <= "00000000000" & tag2;	
			1_op2_ready <= '0';		;
		else
			1_op2 <= Data2;
			1_op2_ready <= '1';
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

-------------------------------------------------
	elsif (1_beq = '1') then
		Ard1a <= ra1_ir_out(11 downto 9);
		Ard1b <= ra1_ir_out(8 downto 6);
		Ard1c <= "000";
		Awr1<= "000";

		if(busy1 = '1') then
			1_op1 <= "00000000000" & tag1;	
			1_op1_ready <= '0';		
		else
			1_op1 <= Data1;
			1_op1_ready <= '1';
		end if;

		if(busy2 = '1') then
			1_op2 <= "00000000000" & tag2;	
			1_op2_ready <= '0';		;
		else
			1_op2 <= Data2;
			1_op2_ready <= '1';
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

-------------------------------------------------
	elsif (1_jal = '1') then
		Ard1a <= "000";
		Ard1b <= "000";
		Ard1c <= "000";
		Awr1  <= ra1_ir_out(11 downto 9);

		1_op1 <= "0000000000000000";	
		1_op1_ready <= '1';		
		1_op2 <= "0000000000000000";
		1_op2_ready <= '1';


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

-------------------------------------------------
	elsif (1_jlr = '1') then
		Ard1a <= ra1_ir_out(8 downto 6);
		Ard1b <= "000";
		Ard1c <= "000";
		Awr1  <= ra1_ir_out(11 downto 9);

		if(busy1 = '1') then
			1_op1 <= "00000000000" & tag1;	
			1_op1_ready <= '0';		
		else
			1_op1 <= Data1;
			1_op1_ready <= '1';
		end if;
	
		1_op2 <= "0000000000000000";
		1_op2_ready <= '1';


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
----------------------------------------------------
	else
		Ard1a <= ra1_ir_out(8 downto 6);
		Ard1b <= "000";
		Ard1c <= "000";
		Awr1  <= ra1_ir_out(11 downto 9);

		if(busy1 = '1') then
			1_op1 <= "00000000000" & tag1;	
			1_op1_ready <= '0';		
		else
			1_op1 <= Data1;
			1_op1_ready <= '1';
		end if;
	
		1_op2 <= "0000000000000000";
		1_op2_ready <= '1';


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
	end if;

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

--INSTRUCTION 2


----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


	if(2_add = '1') then
		Ard2a <= ra2_ir_out(11 downto 9);
		Ard2b <= ra2_ir_out(8 downto 6);
		Ard2c <= "000";
		Awr2  <= ra2_ir_out(5 downto 3);
		if(busy3 = '1') then
			2_op1 <= "00000000000" & tag3;	
			2_op1_ready <= '0';		;
		else
			2_op1 <= Data3;
			2_op1_ready <= '1';
		end if;

		if(busy4 = '1') then
			2_op2 <= "00000000000" & tag4;	
			2_op2_ready <= '0';		;
		else
			2_op2 <= Data4;
			2_op2_ready <= '1';
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

-----------------------------------------------------------
	elsif (2_adc = '1') then
		Ard2a <= ra2_ir_out(11 downto 9);
		Ard2b <= ra2_ir_out(8 downto 6);
		Ard2c <= "000";
		Awr2  <= ra2_ir_out(5 downto 3);
		if(busy3 = '1') then
			2_op1 <= "00000000000" & tag3;	
			2_op1_ready <= '0';		;
		else
			2_op1 <= Data3;
			2_op1_ready <= '1';
		end if;

		if(busy4 = '1') then
			2_op2 <= "00000000000" & tag4;	
			2_op2_ready <= '0';		;
		else
			2_op2 <= Data4;
			2_op2_ready <= '1';
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

-----------------------------------------------------------
	elsif (2_adz = '1') then
		Ard2a <= ra2_ir_out(11 downto 9);
		Ard2b <= ra2_ir_out(8 downto 6);
		Ard2c <= "000";
		Awr2  <= ra2_ir_out(5 downto 3);
		if(busy3 = '1') then
			2_op1 <= "00000000000" & tag3;	
			2_op1_ready <= '0';		;
		else
			2_op1 <= Data3;
			2_op1_ready <= '1';
		end if;

		if(busy4 = '1') then
			2_op2 <= "00000000000" & tag4;	
			2_op2_ready <= '0';		;
		else
			2_op2 <= Data4;
			2_op2_ready <= '1';
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

-----------------------------------------------------------
	elsif (2_adi = '1') then
		Ard2a <= ra2_ir_out(11 downto 9);
		Ard2b <= "000";
		Ard2c <= "000";
		Awr2<= ra2_ir_out(8 downto 6);

		if(busy3 = '1') then
			2_op1 <= "00000000000" & tag3;	
			2_op1_ready <= '0';		
		else
			2_op1 <= Data3;
			2_op1_ready <= '1';
		end if;

		if(ra2_ir_out(5) = '1') then
			2_op2 <= "1111111111" & ra2_ir_out(5 downto 0);
			2_op2_ready <= '1';	
		else
			2_op2 <= "0000000000" & ra2_ir_out(5 downto 0);
			2_op2_ready <= '1';	
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
------------------------------------------------
	if(2_ndu = '1') then
		Ard2a <= ra2_ir_out(11 downto 9);
		Ard2b <= ra2_ir_out(8 downto 6);
		Ard2c <= "000";
		Awr2  <= ra2_ir_out(5 downto 3);
		if(busy3 = '1') then
			2_op1 <= "00000000000" & tag3;	
			2_op1_ready <= '0';		;
		else
			2_op1 <= Data3;
			2_op1_ready <= '1';
		end if;

		if(busy4 = '1') then
			2_op2 <= "00000000000" & tag4;	
			2_op2_ready <= '0';		;
		else
			2_op2 <= Data4;
			2_op2_ready <= '1';
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

-----------------------------------------------------------
	elsif (2_ndc = '1') then
		Ard2a <= ra2_ir_out(11 downto 9);
		Ard2b <= ra2_ir_out(8 downto 6);
		Ard2c <= "000";
		Awr2  <= ra2_ir_out(5 downto 3);
		if(busy3 = '1') then
			2_op1 <= "00000000000" & tag3;	
			2_op1_ready <= '0';		;
		else
			2_op1 <= Data3;
			2_op1_ready <= '1';
		end if;

		if(busy4 = '1') then
			2_op2 <= "00000000000" & tag4;	
			2_op2_ready <= '0';		;
		else
			2_op2 <= Data4;
			2_op2_ready <= '1';
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
-------------------------------------------------------------
	elsif (2_ndz = '1') then
		Ard2a <= ra2_ir_out(11 downto 9);
		Ard2b <= ra2_ir_out(8 downto 6);
		Ard2c <= "000";
		Awr2  <= ra2_ir_out(5 downto 3);
		if(busy3 = '1') then
			2_op1 <= "00000000000" & tag3;	
			2_op1_ready <= '0';		;
		else
			2_op1 <= Data3;
			2_op1_ready <= '1';
		end if;

		if(busy4 = '1') then
			2_op2 <= "00000000000" & tag4;	
			2_op2_ready <= '0';		;
		else
			2_op2 <= Data4;
			2_op2_ready <= '1';
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

-----------------------------------------------------------
	elsif (2_lhi = '1') then
		Ard2a <= "000";
		Ard2b <= "000";
		Ard2c <= "000";
		Awr2<= ra2_ir_out(11 downto 9);

		2_op1 <=  ra2_ir_out(8 downto 0) & "0000000";
		2_op1_ready <= '1';	
		2_op2 <= "0000000000000000";
		2_op2_ready <= '1';	

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
	elsif (2_lw = '1') then
		Ard2a <= ra2_ir_out(8 downto 6);
		Ard2b <= "000";
		Ard2c <= "000";
		Awr2<= ra2_ir_out(11 downto 9);

		if(busy3 = '1') then
			2_op1 <= "00000000000" & tag3;	
			2_op1_ready <= '0';		
		else
			2_op1 <= Data3;
			2_op1_ready <= '1';
		end if;

		if(ra2_ir_out(5) = '1') then
			2_op2 <= "1111111111" & ra2_ir_out(5 downto 0);
			2_op2_ready <= '1';	
		else
			2_op2 <= "0000000000" & ra2_ir_out(5 downto 0);
			2_op2_ready <= '1';	
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

-----------------------------------------------------------
	elsif (2_sw = '1') then
		Ard2a <= ra2_ir_out(11 downto 9);
		Ard2b <= ra2_ir_out(8 downto 6);
		Ard2c <= "000";
		Awr2<= "000";

		if(busy3 = '1') then
			2_op1 <= "00000000000" & tag3;	
			2_op1_ready <= '0';		
		else
			2_op1 <= Data3;
			2_op1_ready <= '1';
		end if;

		if(busy4 = '1') then
			2_op2 <= "00000000000" & tag4;	
			2_op2_ready <= '0';		;
		else
			2_op2 <= Data4;
			2_op2_ready <= '1';
		end if;

		C_2_wr <= '0';
		Z_2_wr <= '0';
		C_2_out <= '0';
		Z_2_out <= '0';
		C_2_ready <= '1';
		Z_2_ready <= '1';
		C_2_tag_out_rs <= "00000";
		Z_2_tag_out_rs <= "00000";

		busy_dest2_out <= busy_dest1_in;
		C_2_busybit_out <= C_busybit_in;
		Z_2_busybit_out <= Z_busybit_in;
		C_2_tag_out_arf <= C_tag_in;
		Z_2_tag_out_arf <= Z_tag_in;
		dest_AR_tag_2_out <= tag_dest1_in;
---------------------------------------------------------
	elsif (2_lm = '1' or 2_sm = '1') then.  -----DITCHHHHHHHHHHHHHHHHHHHHHHHH HAI
		Ard2a <= ra2_ir_out(11 downto 9);
		Ard2b <= ra2_ir_out(8 downto 6);
		Ard2c <= "000";
		Awr2<= "000";

		if(busy3 = '1') then
			2_op1 <= "00000000000" & tag3;	
			2_op1_ready <= '0';		
		else
			2_op1 <= Data3;
			2_op1_ready <= '1';
		end if;

		if(busy4 = '1') then
			2_op2 <= "00000000000" & tag4;	
			2_op2_ready <= '0';		;
		else
			2_op2 <= Data4;
			2_op2_ready <= '1';
		end if;

		C_2_wr <= '0';
		Z_2_wr <= '0';
		C_2_out <= '0';
		Z_2_out <= '0';
		C_2_ready <= '1';
		Z_2_ready <= '1';
		C_2_tag_out_rs <= "00000";
		Z_2_tag_out_rs <= "00000";

		busy_dest2_out <= busy_dest1_in;
		C_2_busybit_out <= C_busybit_in;
		Z_2_busybit_out <= Z_busybit_in;
		C_2_tag_out_arf <= C_tag_in;
		Z_2_tag_out_arf <= Z_tag_in;
		dest_AR_tag_2_out <= tag_dest1_in;

-------------------------------------------------
	elsif (2_beq = '1') then
		Ard2a <= ra2_ir_out(11 downto 9);
		Ard2b <= ra2_ir_out(8 downto 6);
		Ard2c <= "000";
		Awr2<= "000";

		if(busy3 = '1') then
			2_op1 <= "00000000000" & tag3;	
			2_op1_ready <= '0';		
		else
			2_op1 <= Data3;
			2_op1_ready <= '1';
		end if;

		if(busy4 = '1') then
			2_op2 <= "00000000000" & tag4;	
			2_op2_ready <= '0';		;
		else
			2_op2 <= Data4;
			2_op2_ready <= '1';
		end if;

		C_2_wr <= '0';
		Z_2_wr <= '0';
		C_2_out <= '0';
		Z_2_out <= '0';
		C_2_ready <= '1';
		Z_2_ready <= '1';
		C_2_tag_out_rs <= "00000";
		Z_2_tag_out_rs <= "00000";

		busy_dest2_out <= busy_dest1_in;
		C_2_busybit_out <= C_busybit_in;
		Z_2_busybit_out <= Z_busybit_in;
		C_2_tag_out_arf <= C_tag_in;
		Z_2_tag_out_arf <= Z_tag_in;
		dest_AR_tag_2_out <= tag_dest1_in;

-------------------------------------------------
	elsif (2_jal = '1') then
		Ard2a <= "000";
		Ard2b <= "000";
		Ard2c <= "000";
		Awr2  <= ra2_ir_out(11 downto 9);

		2_op1 <= "0000000000000000";	
		2_op1_ready <= '1';		
		2_op2 <= "0000000000000000";
		2_op2_ready <= '1';


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
	elsif (2_jlr = '1') then
		Ard2a <= ra2_ir_out(8 downto 6);
		Ard2b <= "000";
		Ard2c <= "000";
		Awr2  <= ra2_ir_out(11 downto 9);

		if(busy3 = '1') then
			2_op1 <= "00000000000" & tag3;	
			2_op1_ready <= '0';		
		else
			2_op1 <= Data3;
			2_op1_ready <= '1';
		end if;
	
		2_op2 <= "0000000000000000";
		2_op2_ready <= '1';


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
----------------------------------------------------
	else
		Ard2a <= ra2_ir_out(8 downto 6);
		Ard2b <= "000";
		Ard2c <= "000";
		Awr2  <= ra2_ir_out(11 downto 9);

		if(busy3 = '1') then
			2_op1 <= "00000000000" & tag3;	
			2_op1_ready <= '0';		
		else
			2_op1 <= Data3;
			2_op1_ready <= '1';
		end if;
	
		2_op2 <= "0000000000000000";
		2_op2_ready <= '1';


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
	if((1_add = '1' or 1_ndu = '1') and ra1_ir_out(5 downto 3) = "111") then
		ra1_invalidate_out <= '1';
		ra2_invalidate_out <= '1';
	elsif((2_add = '1' or 2_ndu = '1') and ra2_ir_out(5 downto 3) = "111") then
		ra1_invalidate_out <= '1';
		ra2_invalidate_out <= '1';
	elsif(1_adi = '1' and ra1_ir_out(8 downto 6) = "111") then
		ra1_invalidate_out <= '1';
		ra2_invalidate_out <= '1';
	elsif(2_adi = '1' and ra2_ir_out(8 downto 6) = "111") then
		ra1_invalidate_out <= '1';
		ra2_invalidate_out <= '1';
	elsif (1_lw = '1' and ra1_ir_out(11 downto 9)= "111") then
		ra1_invalidate_out <= '1';
		ra2_invalidate_out <= '1';
	elsif (2_lw = '1' and ra2_ir_out(11 downto 9)= "111") then
		ra1_invalidate_out <= '1';
		ra2_invalidate_out <= '1';
	elsif (1_lm = '1' and ra1_ir_out(7) = '1') then
		ra1_invalidate_out <= '1';
		ra2_invalidate_out <= '1';
	elsif (2_lm = '1' and ra2_ir_out(7) = '1') then
		ra1_invalidate_out <= '1';
		ra2_invalidate_out <= '1';
	elsif (1_jlr = '1' or 2_jlr = '1') then
		ra1_invalidate_out <= '1';
		ra2_invalidate_out <= '1';
	else 
		ra1_invalidate_out <= '0';
		ra2_invalidate_out <= '0';
	end if;
else
	if(alu_r7_resolved = '1' or jlr_resolved ='1' or lw_r7_resolved = '1') then
		ra1_invalidate_out <= '0';
		ra2_invalidate_out <= '0';
	else
		ra1_invalidate_out <= '1';
		ra2_invalidate_out <= '1';
end if;
	--------------------------------------------------------------------------------------------------------------------------------

-- RA_EN, PC_EN

--------------------------------------------------------------------------------------------------------------------------------

if(rs_full_in = '1' or twoRRnotFree = '1' or lm_stall_in = '1') then
	pc_en_out <= '0';
	ra_en_out <= '0';
--elsif ((1_beq = '1' or 2_beq = '1') and spec_tag_reg_out = "11" ) then
--	pc_en_out <= '0';
--	ra_en_out <= '0';
--elsif (1_beq = '1' and 2_beq = '1' and spec_tag_reg_out = "10") then
--	pc_en_out <= '0';
--	ra_en_out <= '0';
else
	pc_en_out <= '1';
	ra_en_out <= '1';	
end if;

--------------------------------------------------------------------------------------------------------------------------------

-- 1_val, 2_val

--------------------------------------------------------------------------------------------------------------------------------
	
if(taken_branch_detected = '1' or twoRRnotFree = '1')
	1_val <= '0';
	arf_busy_wr_en1 <= '0';
	arf_tag_wr_en1  <= '0';
--elsif ((1_beq = '1' or 2_beq = '1') and spec_tag_reg_out = "11" ) then
--	1_val <= '0';
--	arf_busy_wr_en1 <= '0';
--	arf_tag_wr_en1  <= '0';
--elsif (1_beq = '1' and 2_beq = '1' and spec_tag_reg_out = "10") then
--	1_val <= '0';
--	arf_busy_wr_en1 <= '0';
--	arf_tag_wr_en1  <= '0';	
else
	1_val <= ra1_val_out;
	arf_busy_wr_en1 <= ra1_val_out;
	arf_tag_wr_en1  <= ra1_val_out;
end if;
------------------------------------------
if(taken_branch_detected = '1' or twoRRnotFree = '1') then
	2_val <= '0';
	arf_busy_wr_en2 <=  '0';
	arf_tag_wr_en2  <=  '0';
elsif ((1_add = '1' or 1_adc = '1' or 1_adz = '1' or 1_ndu = '1' or 1_ndc = '1' or 1_ndz = '1' ) and ra1_ir_out(5 downto 3) = "111") then
	2_val <= '0';
	arf_busy_wr_en2 <=  '0';
	arf_tag_wr_en2  <=  '0';
elsif (1_adi = '1' and ra1_ir_out(8 downto 6) = "111") then
	2_val <= '0';
	arf_busy_wr_en2 <=  '0';
	arf_tag_wr_en2  <=  '0';
elsif (1_lw = '1' and ra1_ir_out(11 downto 9)= "111") then
	2_val <= '0';
	arf_busy_wr_en2 <=  '0';
	arf_tag_wr_en2  <=  '0';
elsif (1_lm = '1' and ra1_ir_out(7) = '1') then
	2_val <= '0';
	arf_busy_wr_en2 <=  '0';
	arf_tag_wr_en2  <=  '0';
elsif (1_jlr = '1') then
	2_val <= '0';
	arf_busy_wr_en2 <=  '0';
	arf_tag_wr_en2  <=  '0';
elsif (1_lhi = '1' and ra1_ir_out(11 downto 9 ) = "111") then
	2_val <= '0';
	arf_busy_wr_en2 <=  '0';
	arf_tag_wr_en2  <=  '0';
elsif (1_jal = '1') then
	2_val <= '0';
	arf_busy_wr_en2 <=  '0';
	arf_tag_wr_en2  <=  '0';
--elsif ((1_beq = '1' or 2_beq = '1') and spec_tag_reg_out = "11" ) then
--	2_val <= '0';
--	arf_busy_wr_en2 <= '0';
--	arf_tag_wr_en2  <= '0';
--elsif (1_beq = '1' and 2_beq = '1' and spec_tag_reg_out = "10") then
--	2_val <= '0';
--	arf_busy_wr_en2 <= '0';
--	arf_tag_wr_en2  <= '0';	
else
	2_val <= ra2_val_out;
	arf_busy_wr_en2 <=  ra2_val_out;
	arf_tag_wr_en2  <=  ra2_val_out;
end if;
--------------------------------------------------------------------------------------------------------------------------------

-- S0,S1,S2,S3

--------------------------------------------------------------------------------------------------------------------------------



if(taken_branch_detected = '1' ) then
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
	end if
elsif (1_jal = '1') then
	--0001
		S3 <= '0';
		S2 <= '0';
		S1 <= '0';
		S0 <= '1';
elsif (1_lhi = '1' and ra1_ir_out(11 downto 9) = "111") then
	--0110
		S3 <= '0';
		S2 <= '1';
		S1 <= '1';
		S0 <= '0';
elsif (2_jal = '1') then
	--0010
		S3 <= '0';
		S2 <= '0';
		S1 <= '1';
		S0 <= '0';
elsif (2_lhi = '1' and ra2_ir_out(11 downto 9) = "111") then
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



if(1_beq = '0' and 2_beq = '0' and taken_branch_detected = '1') then
	spec_tag_reg_in <= spec_tag_rb_in;
	spec_tag_reg_en <= '1';
	spec_tag_rs_out1 <= spec_tag_rb_in;
	spec_tag_rs_out2 <= spec_tag_rb_in;
elsif (1_beq = '0' and 2_beq = '0' and not_taken_branch_detected = '1') then
	if(spec_tag_reg_out = "11")
		spec_tag_reg_in <= "10";
		spec_tag_reg_en <= '1';
		spec_tag_rs_out1 <= "10";
		spec_tag_rs_out2 <= "10";
	elsif (spec_tag_reg_out = "10") then
		spec_tag_reg_in <= "01";
		spec_tag_reg_en <= '1';
		spec_tag_rs_out1 <= "01";
		spec_tag_rs_out2 <= "01";
	elsif (spec_tag_reg_out = "01") then
		spec_tag_reg_in <= "00";
		spec_tag_reg_en <= '1';
		spec_tag_rs_out1 <= "00";
		spec_tag_rs_out2 <= "00";
	else
		spec_tag_reg_in <= "00";
		spec_tag_reg_en <= '1';
		spec_tag_rs_out1 <= "00";
		spec_tag_rs_out2 <= "00";
	end if;
elsif (1_beq = '1' and 2_beq = '0' and taken_branch_detected = '1') then
	if(spec_tag_rb_in = "10") then
		spec_tag_reg_in <= "11";
		spec_tag_reg_en <= '1';
		spec_tag_rs_out1 <= "10";
		spec_tag_rs_out2 <= "11";
	elsif (spec_tag_rb_in = "01") then
		spec_tag_reg_in <= "10";
		spec_tag_reg_en <= '1';
		spec_tag_rs_out1 <= "01";
		spec_tag_rs_out2 <= "10";
	elsif (spec_tag_rb_in = "00") then
		spec_tag_reg_in <= "01";
		spec_tag_reg_en <= '1';
		spec_tag_rs_out1 <= "00";
		spec_tag_rs_out2 <= "01";
	else
		spec_tag_reg_in <= "00";
		spec_tag_reg_en <= '1';
		spec_tag_rs_out1 <= "00";
		spec_tag_rs_out2 <= "01";
	end if;
elsif (1_beq = '0' and 2_beq = '1' and taken_branch_detected = '1') then
	if(spec_tag_rb_in = "10") then
		spec_tag_reg_in <= "11";
		spec_tag_reg_en <= '1';
		spec_tag_rs_out1 <= "10";
		spec_tag_rs_out2 <= "10";
	elsif (spec_tag_rb_in = "01") then
		spec_tag_reg_in <= "10";
		spec_tag_reg_en <= '1';
		spec_tag_rs_out1 <= "01";
		spec_tag_rs_out2 <= "01";
	elsif (spec_tag_rb_in = "00") then
		spec_tag_reg_in <= "01";
		spec_tag_reg_en <= '1';
		spec_tag_rs_out1 <= "00";
		spec_tag_rs_out2 <= "00";
	else
		spec_tag_reg_in <= "00";
		spec_tag_reg_en <= '1';
		spec_tag_rs_out1 <= "00";
		spec_tag_rs_out2 <= "00";
	end if;
elsif (1_beq = '1' and 2_beq = '0' and not_taken_branch_detected = '1') then
	if(spec_tag_reg_out = "11")
		spec_tag_reg_in <= "11";
		spec_tag_reg_en <= '1';
		spec_tag_rs_out1 <= "10";
		spec_tag_rs_out2 <= "11";
	elsif (spec_tag_reg_out = "10") then
		spec_tag_reg_in <= "10";
		spec_tag_reg_en <= '1';
		spec_tag_rs_out1 <= "01";
		spec_tag_rs_out2 <= "10";
	elsif (spec_tag_reg_out = "01") then
		spec_tag_reg_in <= "01";
		spec_tag_reg_en <= '1';
		spec_tag_rs_out1 <= "00";
		spec_tag_rs_out2 <= "01";
	else
		spec_tag_reg_in <= "00";
		spec_tag_reg_en <= '1';
		spec_tag_rs_out1 <= "00";
		spec_tag_rs_out2 <= "00";
	end if;

elsif (1_beq = '0' and 2_beq = '1' and not_taken_branch_detected = '1') then
	if(spec_tag_reg_out = "11")
		spec_tag_reg_in <= "11";
		spec_tag_reg_en <= '1';
		spec_tag_rs_out1 <= "10";
		spec_tag_rs_out2 <= "10";
	elsif (spec_tag_reg_out = "10") then
		spec_tag_reg_in <= "10";
		spec_tag_reg_en <= '1';
		spec_tag_rs_out1 <= "01";
		spec_tag_rs_out2 <= "01";
	elsif (spec_tag_reg_out = "01") then
		spec_tag_reg_in <= "01";
		spec_tag_reg_en <= '1';
		spec_tag_rs_out1 <= "00";
		spec_tag_rs_out2 <= "00";
	else
		spec_tag_reg_in <= "00";
		spec_tag_reg_en <= '1';
		spec_tag_rs_out1 <= "00";
		spec_tag_rs_out2 <= "00";
	end if;
elsif (1_beq = '1' and 2_beq = '1' and taken_branch_detected = '1') then
	if(spec_tag_rb_in = "10") then
		spec_tag_reg_in <= "11";
		spec_tag_reg_en <= '1';
		spec_tag_rs_out1 <= "10";
		spec_tag_rs_out2 <= "10";
	elsif (spec_tag_rb_in = "01") then
		spec_tag_reg_in <= "10";
		spec_tag_reg_en <= '1';
		spec_tag_rs_out1 <= "01";
		spec_tag_rs_out2 <= "01";
	elsif (spec_tag_rb_in = "00") then
		spec_tag_reg_in <= "01";
		spec_tag_reg_en <= '1';
		spec_tag_rs_out1 <= "00";
		spec_tag_rs_out2 <= "00";
	else
		spec_tag_reg_in <= "00";
		spec_tag_reg_en <= '1';
		spec_tag_rs_out1 <= "00";
		spec_tag_rs_out2 <= "00";
	end if;
elsif (1_beq = '1' and 2_beq = '1' and not_taken_branch_detected = '1') then
	if(spec_tag_reg_out = "11")
		spec_tag_reg_in <= "11";
		spec_tag_reg_en <= '1';
		spec_tag_rs_out1 <= "10";
		spec_tag_rs_out2 <= "10";
	elsif (spec_tag_reg_out = "10") then
		spec_tag_reg_in <= "10";
		spec_tag_reg_en <= '1';
		spec_tag_rs_out1 <= "01";
		spec_tag_rs_out2 <= "01";
	elsif (spec_tag_reg_out = "01") then
		spec_tag_reg_in <= "01";
		spec_tag_reg_en <= '1';
		spec_tag_rs_out1 <= "00";
		spec_tag_rs_out2 <= "00";
	else
		spec_tag_reg_in <= "00";
		spec_tag_reg_en <= '1';
		spec_tag_rs_out1 <= "00";
		spec_tag_rs_out2 <= "00";
	end if;





	
	
		
		
	


	


		

		


	
	
	
	




	
	
	
	
	














		




























































end architecture behave;
