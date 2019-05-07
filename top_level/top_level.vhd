library ieee;
use ieee.numeric_std.all;
use ieee.std_logic_1164.all;


entity top_level is
		port(clk, reset_bar, Clock_50: in std_logic
			);
end entity;



architecture behave of top_level is

component Add is
   port(x,y: in std_logic_vector(15 downto 0);
	
	s0: out std_logic_vector(15 downto 0);
        c_out: out std_logic);
end component;

component add1 is
   port(alu_a: in std_logic_vector(15 downto 0);
		alu_out: out std_logic_vector(15 downto 0) );
end component;

component add2 is
   port(alu_a: in std_logic_vector(15 downto 0);
		alu_out: out std_logic_vector(15 downto 0) );
end component;

component Add5 is
   port(x,y: in std_logic_vector(4 downto 0);
	
	s0: out std_logic_vector(4 downto 0));
end component;

component ALU is
   port(alu_a,alu_b: in std_logic_vector(15 downto 0);
		op: in std_logic;
		alu_out: out std_logic_vector(15 downto 0);
      c_out: out std_logic;
      z_out :out std_logic );
end component;

component alu_p is
	port(
		clk, reset: in std_logic ;
		rb_pc,rb_op1,rb_op2, rb_ir : in std_logic_vector(15 downto 0);
		rb_dest_rrtag,rb_carrytag,rb_zerotag : in std_logic_vector(4 downto 0);
		rb_spectag ; in std_logic_vector(1 downto 0);
		rb_valid,rbdestr7,rb_carry,rb_carryready,rb_zero,rb_zeroready : in std_logic;

		alu_p_out : out std_logic_vector(17 downto 0);
		rrf_tag_out : out std_logic_vector(4 downto 0);
		alu_p_c,alu_p_z,alu_p_brach_taken,alu_p_brach_nottaken,jlr_resolved,alu_r7_resolved,alu_p_valid_out, alu_p_arf_en : out std_logic
		);
end component;

component bit_register is
	port(
		clk,wr,clr : in std_logic;
		din : in std_logic;
		dout :out std_logic
		);	
end component bit_register;

component comp is
   port(alu_a, alu_b : in std_logic_vector(15 downto 0);
		tz : out std_logic );
end component;

component dram is 
  PORT
  (
    address_wr_1,address_wr_2,address_rd   : IN STD_LOGIC_VECTOR (15 DOWNTO 0);
    clock   : IN STD_LOGIC  := '1';
    data_in_1, data_in_2    : IN STD_LOGIC_VECTOR (15 DOWNTO 0);
    rden    : IN STD_LOGIC  := '1';
    wren_1,wren_2    : IN STD_LOGIC ;
    read_data_out  : OUT STD_LOGIC_VECTOR (15 DOWNTO 0)
  );

  component FullAdder is
   port(x0,y0,cin: in std_logic;
        s0,cout: out std_logic);
end component;

component ID is
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
end component;

component IFetch is
	generic(
			data_length16: integer := 16
			);
	port(clk, reset, reset_bar: in std_logic ;
		S0,S1,S2,S3:in std_logic;
		pc_en: in std_logic;
		ra1_invalidate, ra2_invalidate, ra_en : in std_logic;
		 adder2_out, adder3_out, rb_op2, adder4_out,alu1_out, ZA7_1_out, ZA7_2_out, dmem_dout  : in std_logic_vector(15 downto 0) ;
		 ra1_val_out, ra2_val_out : out std_logic;
		 ra1_pc_out, ra1_ir_out ,ra2_pc_out, ra2_ir_out : out std_logic_vector(15 downto 0));
end component;

component ls_p is
	port(
		clk, reset: in std_logic ;
		rc_pc,rc_op1,rc_op2, rc_ir, read_datafrommem : in std_logic_vector(15 downto 0);
		rc_dest_rrtag,rc_carrytag,rc_zerotag : in std_logic_vector(4 downto 0);
		rc_spectag ; in std_logic_vector(1 downto 0);
		rc_valid,rc_carry,rc_carryready,rc_zero,rc_zeroready : in std_logic;

		ls_p_data_out : out std_logic_vector(17 downto 0);
		read_addr,write_addr : out std_logic_vector(15 downto 0);
		rrf_tag_out : out std_logic_vector(4 downto 0);
		mem_read_en, mem_write_en,lw_r7_resolved,ls_p_z,rrf_en_out : out std_logic
		);
end component;

component mux9_16 is
   port(S0,S1,S2,S3:in std_logic;    --S2 is MSB
	D0,D1,D2,D3,D4,D5,D6,D7,D8:in std_logic_vector(15 downto 0);
	Y:out std_logic_vector(15 downto 0));
end mux9_16;

component pen16bit is 
	port (penin: in std_logic_vector(15 downto 0);
			no1found : out std_logic;
			pennext: out std_logic_vector(15 downto 0);
			penout: out std_logic_vector(3 downto 0));
end component;

component pen16bitwith2output is 
	port (penin: in std_logic_vector(15 downto 0);
			twoRRnotFree : out std_logic;
			pennext_twoallotted, pennext_oneallotted: out std_logic_vector(15 downto 0);
			penout1, penout2: out std_logic_vector(3 downto 0));
end component;

component pen32bit is 
	port (penin: in std_logic_vector(31 downto 0);
			no1found : out std_logic;
			pennext: out std_logic_vector(31 downto 0);
			penout: out std_logic_vector(4 downto 0));
end component;

component pen32bitwith2output is 
	port (penin: in std_logic_vector(31 downto 0);
			twoRRnotFree : out std_logic;
			pennext_twoallotted, pennext_oneallotted: out std_logic_vector(31 downto 0);
			penout1, penout2: out std_logic_vector(4 downto 0));
end component;

component ram is 
  PORT
  (
    address   : IN STD_LOGIC_VECTOR (15 DOWNTO 0);
    clock   : IN STD_LOGIC  := '1';
    data    : IN STD_LOGIC_VECTOR (15 DOWNTO 0);
    rden    : IN STD_LOGIC  := '1';
    wren    : IN STD_LOGIC ;
    q,q2  : OUT STD_LOGIC_VECTOR (15 DOWNTO 0)
  );

end ram;  

component myRegister is
	generic ( data_length: integer);
	port(
		clk,wr,clr : in std_logic;
		din : in std_logic_vector(data_length-1 downto 0);
		dout :out std_logic_vector(data_length-1 downto 0)
		);	
end component myRegister;

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

component RF_busybit is
	port(
		Ard_1,Ard_2,Ard_3,Ard_4,Ard_5,Ard_6,Awr_1,Awr_2 ,Awr_3,Awr_4 : in std_logic_vector(2 downto 0);
		Din_1,Din_2, Din_3, Din_4 : std_logic;
		RF_write1,RF_write2,RF_write3,RF_write4,clk,clr : in std_logic;
		Dout_1,Dout_2,Dout_3,Dout_4,Dout_5,Dout_6: out std_logic
		);
end component;

component RF_tag is
	generic(
		data_length: integer := 5);
	port(
		Ard_1,Ard_2,Ard_3,Ard_4,Ard_5,Ard_6,Ard_7,Ard_8,Awr_1,Awr_2 : in std_logic_vector(2 downto 0);
		Din_1,Din_2 : in std_logic_vector(4 downto 0);
		RF_write1,RF_write2,clk,clr : in std_logic;
		Dout_1,Dout_2,Dout_3,Dout_4,Dout_5,Dout_6,Dout_7,Dout_8 : out std_logic_vector(4 downto 0)
		);
end component;

component rob is 
	port(
		clk,reset : in std_logic;
		pc_1_in, pc_2_in, dest_1_in, dest_2_in, ir_1_in, ir_2_in, pc_exec_1_in, pc_exec_2_in : in std_logic_vector(15 downto 0);
		dest_tag_1_in, dest_tag_2_in, c_tag_1_in, c_tag_2_in, z_tag_1_in, z_tag_2_in : in std_logic_vector(4 downto 0);
		--spec_tag_1_in, spec_tag_2_in : in std_logic;
		valid_1_in, valid_2_in, complete_exec_1_in, complete_exec_2_in, mr_1_in, mr_2_in, c_1_in, c_2_in, z_1_in, z_2_in, cwr_1_in, cwr_2_in, zwr_1_in, zwr_2_in : in std_logic;
		alu_p_in,  ls_p_write_addr, ls_p_data: in std_logic_vector(15 downto 0);
		valid_exec_alu, valid_exec_ls, alu_c_in,alu_z_in,ls_z_in : in std_logic;

		free_rrf_vect_in, val_rrf_vect_in : in std_logic_vector(31 downto 0);
		arf_tag_in_1, arf_tag_in_2, c_tag_in, z_tag_in : in std_logic_vector(4 downto 0);

		robfull, finalc_out, finalz_out : out std_logic;
		data_out_1, data_out_2, mem_addr_1, mem_addr_2 : out std_logic_vector(15 downto 0); 
		arf_addr_out_1, arf_addr_out_2 : out std_logic_vector(2 downto 0);
		rrf_addr_out_1, rrf_addr_out_2 : out std_logic_vector(4 downto 0);
		no_of_stores_cleared : out std_logic_vector(1 downto 0);
		free_rrf_vect_out, val_rrf_vect_out : out std_logic_vector(31 downto 0);  
		arf_en_1, arf_en_2, mem_en_1, mem_en_2,c_en,z_en,arf_busy_en_1,arf_busy_en_2,z_busy_en,c_busy_en : out std_logic

		); -- output
end rob;


component RS_RF_Sched is 
	port(
		clk,reset : in std_logic;
		rrf_Awr1_in, rrf_Awr2_in : in std_logic_vector(4 downto 0);
		rrf_write1_in, rrf_write2_in : in std_logic;
		rrf_Data1_EX_in, rrf_Data2_EX_in : in std_logic_vector(17 downto 0);
		rrf_free_vec_ID_in, rrf_free_vec_Rob_in : in std_logic_vector(31 downto 0);
		rrf_valid_vec_EX_in, rrf_valid_vec_Rob_in : in std_logic_vector(31 downto 0);

		rrf_free_vec_out, rrf_valid_vec_out : out std_logic_vector(31 downto 0) ;
		------------------------------------------------------------------------------------
		id_pc1_in, id_pc2_in,id_ir1_in,id_ir2_in : in std_logic_vector(15 downto 0);
		id_dest_rr_tag1_in,id_dest_rr_tag2_in,id_carry_tag1_in,id_carry_tag2_in,id_zero_tag1_in,id_zero_tag2_in : in std_logic_vector(4 downto 0);
		store_retirement_count : in std_logic_vector(1 downto 0);


		twoRSnotFree_rs : out std_logic;
		rb_pc,rb_op1,rb_op2, rb_ir :out std_logic_vector(15 downto 0);
		rb_dest_rrtag			   :out std_logic_vector(4 downto 0);
		rb_valid,rb_carry,rb_zero  :out std_logic;
		rc_pc,rc_op1,rc_op2, rc_ir :out std_logic_vector(15 downto 0);
		rc_dest_rrtag  			   :out std_logic_vector(4 downto 0);
		rc_valid,rc_carry,rc_zero  :out std_logic


		); 
end RS_RF_Sched;





































end architecture behave;