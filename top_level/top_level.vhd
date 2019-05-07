library ieee;
use ieee.numeric_std.all;
use ieee.std_logic_1164.all;


entity top_level is
		port(clk, reset, Clock_50: in std_logic
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
		rb_spectag : in std_logic_vector(1 downto 0);
		rb_valid,rbdestr7,rb_carry,rb_carryready,rb_zero,rb_zeroready : in std_logic;

		alu_p_out : out std_logic_vector(17 downto 0);
		rrf_tag_out : out std_logic_vector(4 downto 0);
		alu_p_c,alu_p_z,alu_p_brach_taken,alu_p_brach_nottaken,jlr_resolved,alu_r7_resolved,alu_p_valid_out, alu_p_rrf_en,alu_p_no_ans : out std_logic
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
end component;

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
		rc_spectag : in std_logic_vector(1 downto 0);
		rc_valid,rc_carry,rc_carryready,rc_zero,rc_zeroready : in std_logic;

		ls_p_data_out : out std_logic_vector(17 downto 0);
		read_addr,write_addr : out std_logic_vector(15 downto 0);
		rrf_tag_out : out std_logic_vector(4 downto 0);
		mem_read_en, mem_write_en,lw_r7_resolved,ls_p_z,rrf_en_out,ls_p_val_out : out std_logic
		);
end component;

component mux9_16 is
   port(S0,S1,S2,S3:in std_logic;    --S2 is MSB
	D0,D1,D2,D3,D4,D5,D6,D7,D8:in std_logic_vector(15 downto 0);
	Y:out std_logic_vector(15 downto 0));
end component;

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

end component;  

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
		valid_exec_alu, valid_exec_ls, alu_c_in,alu_z_in,ls_z_in,alu_p_no_ans : in std_logic;

		free_rrf_vect_in, val_rrf_vect_in : in std_logic_vector(31 downto 0);
		arf_tag_in_1, arf_tag_in_2, c_tag_in, z_tag_in : in std_logic_vector(4 downto 0);

		robfull, finalc_out, finalz_out : out std_logic;
		data_out_1, data_out_2,data_out_3, mem_addr_1, mem_addr_2 : out std_logic_vector(15 downto 0); 
		arf_addr_out_1, arf_addr_out_2 : out std_logic_vector(2 downto 0);
		rrf_addr_out_1, rrf_addr_out_2 : out std_logic_vector(4 downto 0);
		no_of_stores_cleared : out std_logic_vector(1 downto 0);
		free_rrf_vect_out, val_rrf_vect_out : out std_logic_vector(31 downto 0);  
		arf_en_1, arf_en_2,arf_en_3, mem_en_1, mem_en_2,c_en,z_en,arf_busy_en_1,arf_busy_en_2,z_busy_en,c_busy_en : out std_logic

		); -- output
end component;


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
		id_2_op2_in,id_1_op1_in, id_2_op1_in,id_1_op2_in : in std_logic_vector(15 downto 0);
		id_1_store_tag_in,id_2_store_tag_in : in std_logic_vector(4 downto 0);
		id_2_zero_ready_in,id_1_zero_ready_in,id_2_zero_in,id_1_zero_in,id_2_carry_ready_in,id_1_carry_ready_in,id_2_carry_in,id_1_carry_in,id_2_val_in,id_1_val_in,id_2_op2_val_in,id_1_op2_val_in,id_2_op1_val_in,id_1_op1_val_in: in std_logic;


		twoRSnotFree_rs : out std_logic;
		rb_pc,rb_op1,rb_op2, rb_ir :out std_logic_vector(15 downto 0);
		rb_dest_rrtag			   :out std_logic_vector(4 downto 0);
		rb_valid,rb_carry,rb_zero  :out std_logic;
		rc_pc,rc_op1,rc_op2, rc_ir :out std_logic_vector(15 downto 0);
		rc_dest_rrtag  			   :out std_logic_vector(4 downto 0);
		rc_valid,rc_carry,rc_zero  :out std_logic



		); 
end component;
------------------------------------SIGNALS-----------------------------------------------------------------------------
--DRAM
signal dram_wr_addr1, dram_wr_addr2, dram_rd_addr, dram_data_in2, dram_data_in1, dram_data_out : std_logic_vector(15 downto 0);
signal dram_wr_en1, dram_wr_en2 : std_logic;
--IFETCH
signal reset_bar, S0, S1, S2, S3, pc_en, ra1_invalidate, ra2_invalidate, ra_en, ra1_val, ra2_val : std_logic;
signal ra1_pc, ra2_pc, ra1_ir, ra2_ir, adder2_out, adder3_out, rb_op2, adder4_out, ZA7_1_out, ZA7_2_out : std_logic_vector(15 downto 0);
--RS_RRF_SCHED
signal rrf_wr_addr1, rrf_wr_addr2, rr_dest_tag1_from_id, rr_dest_tag2_from_id, carry_tag1_from_id, carry_tag2_from_id, 
	zero_tag1_from_id, zero_tag2_from_id, rb_dest_rrtag_from_RS, rc_dest_rrtag_from_RS : std_logic_vector(4 downto 0);
signal rrf_wr_en1, rrf_wr_en2, RS_full, rb_val_from_RS, rb_carry_from_RS, rb_zero_from_RS, rc_val_from_RS, 
	rc_carry_from_RS, rc_zero_from_RS : std_logic;
signal rrf_wr_data1, rrf_wr_data2 : std_logic_vector(17 downto 0);
signal rrf_free_vec_from_id, rrf_free_vec_from_rob, rrf_val_vec_from_ex, rrf_val_vec_from_rob, rrf_free_vec, 
	rrf_val_vec : std_logic_vector(31 downto 0);
signal pc1_from_id, pc2_from_id, ir1_from_id, ir2_from_id, rb_pc_from_RS, rb_op1_from_RS, rb_op2_from_RS, rb_ir_from_RS, 
	rc_pc_from_RS, rc_op1_from_RS, rc_op2_from_RS, rc_ir_from_RS: std_logic_vector(15 downto 0);
signal store_retirement_count : std_logic_vector(1 downto 0);
--ALU_P
signal alu_p_carry, alu_p_zero, branch_taken, branch_not_taken, jlr_resolved, alu_r7_resolved, alu_p_valid, alu_p_no_ans : std_logic;
--LS_P
signal wr_addr_from_ls_p : std_logic_vector(15 downto 0);
signal lw_r7_resolved, ls_p_z, ls_p_valid : std_logic;
--ARF
signal arf_rd_addr1_from_ID, arf_rd_addr2_from_ID, arf_rd_addr3_from_ID, arf_rd_addr4_from_ID, arf_wr_addr1_from_RoB, 
	arf_wr_addr2_from_RoB, arf_wr_addr3_from_RoB : std_logic_vector(2 downto 0);
signal arf_data1_from_RoB, arf_data2_from_RoB, arf_data3_from_RoB, arf_data_out1, arf_data_out2, arf_data_out3, 
	arf_data_out4 : std_logic_vector(15 downto 0);
signal arf_wr_en1_from_RoB, arf_wr_en2_from_RoB, arf_wr_en3_from_RoB : std_logic;
--ARF TAG and BUSY
signal arf_rd_addr5_from_ID, arf_rd_addr6_from_ID, arftag_rd_addr1_from_RoB, arftag_rd_addr2_from_RoB, arftag_wr_addr1_from_ID, 
	arftag_wr_addr2_from_ID : std_logic_vector(2 downto 0);
signal arftag_data1_from_ID, arftag_data2_from_ID, arftag_data_out1, arftag_data_out2, arftag_data_out3, arftag_data_out4, arftag_data_out5, 
	arftag_data_out6, arftag_data_out7, arftag_data_out8 : std_logic_vector(4 downto 0);
signal arftag_wr_en1_from_ID, arftag_wr_en2_from_ID, arfbusy_data1_from_ID, arfbusy_data2_from_ID, 
	arfbusy_data1_from_RoB, arfbusy_data2_from_RoB, arfbusy_wr_en1_from_ID, arfbusy_wr_en2_from_ID,
	arfbusy_wr_en1_from_RoB, arfbusy_wr_en2_from_RoB, arfbusy_data_out1, arfbusy_data_out2, arfbusy_data_out3, 
	arfbusy_data_out4, arfbusy_data_out5, arfbusy_data_out6 : std_logic;
--GLOBAL C and Z
signal global_carry_en_from_RoB, global_carry_data_in_from_RoB, global_carry_out,
		global_zero_en_from_RoB, global_zero_data_in_from_RoB, global_zero_out,
		global_carry_busy_in, global_carry_busy_out, global_carry_busy_from_RoB, global_carry_busy_from_ID, global_carry_busy_en_from_RoB,
		global_zero_busy_in, global_zero_busy_out, global_zero_busy_from_RoB, global_zero_busy_from_ID, global_zero_busy_en_from_RoB, 
		global_carry_busy2_from_ID, global_carry_busy1_from_ID, global_zero_busy2_from_ID, global_zero_busy1_from_ID	 : std_logic;
signal global_carry_tag_data_in_from_ID, global_carry_tag_out, global_zero_tag_data_in_from_ID, 
		global_zero_tag_out : std_logic_vector(4 downto 0);

-- ID
signal inst1_carry_wr_from_ID, inst1_zero_wr_from_ID, inst2_carry_wr_from_ID, inst2_zero_wr_from_ID : std_logic;
---------------------------------------INSTANCES-------------------------------------------------------------------------------
begin
reset_bar <= not reset;

DRAM_INST : dram port map (dram_wr_addr1, dram_wr_addr2, dram_rd_addr, clk, dram_data_in1, dram_data_in2, '1', dram_wr_en1, dram_wr_en2, dram_data_out); 

IFETCH_INST : IFetch generic map (16) port map (clk, reset, reset_bar, S0, S1, S2, S3, pc_en, ra1_invalidate, ra2_invalidate, ra_en, adder2_out, 
	adder3_out, rb_op2, rrf_wr_data1(17 downto 2), rrf_wr_data1(17 downto 2), ZA7_1_out, ZA7_2_out, dram_data_out, ra1_val, ra2_val, ra1_pc, ra1_ir, ra2_pc, ra2_ir);

RS_RRF_SCHED_INST : RS_RF_Sched port map(clk, reset, rrf_wr_addr1, rrf_wr_addr2, rrf_wr_en1, rrf_wr_en2, rrf_wr_data1, rrf_wr_data2, 
		rrf_free_vec_from_id, rrf_free_vec_from_rob, rrf_val_vec_from_ex, rrf_val_vec_from_rob, rrf_free_vec, rrf_val_vec,

		pc1_from_id, pc2_from_id, ir1_from_id, ir2_from_id, rr_dest_tag1_from_id, rr_dest_tag2_from_id,
		carry_tag1_from_id, carry_tag2_from_id, zero_tag1_from_id, zero_tag2_from_id, store_retirement_count, 
		inst1_op1_from_ID, inst1_op2_from_ID, inst2_op1_from_ID, inst2_op2_from_ID, 
		inst1_store_tag_from_ID, inst2_store_tag_from_ID,
		inst1_zero_ready_from_ID, inst2_zero_ready_from_ID,
		inst1_zero_from_ID, inst2_zero_from_ID,
		inst1_carry_ready_from_ID, inst2_carry_ready_from_ID,
		inst1_carry_from_ID, inst2_carry_from_ID,
		inst1_valid_from_ID, inst2_valid_from_ID,
		inst1_op1_valid_from_ID, inst1_op2_valid_from_ID,
		inst2_op1_valid_from_ID, inst2_op2_valid_from_ID,

		RS_full, rb_pc_from_RS, 
		rb_op1_from_RS, rb_op2_from_RS, rb_ir_from_RS, rb_dest_rrtag_from_RS,
		rb_val_from_RS, rb_carry_from_RS, rb_zero_from_RS, rc_pc_from_RS, rc_op1_from_RS, rc_op2_from_RS, rc_ir_from_RS, 
		rc_dest_rrtag_from_RS, rc_val_from_RS, rc_carry_from_RS, rc_zero_from_RS);
rrf_val_vec_from_ex????
ALU_P_INST : alu_p port map(clk, reset, rb_pc_from_RS, rb_op1_from_RS, rc_op2_from_RS, rb_ir_from_RS, rb_dest_rrtag_from_RS,
		rb_dest_rrtag_from_RS, rb_dest_rrtag_from_RS, "00", rb_val_from_RS, '0', rb_carry_from_RS, '1', rb_zero_from_RS, '1', rrf_wr_data1,
		rrf_wr_addr1, alu_p_carry, alu_p_zero, branch_taken, branch_not_taken, jlr_resolved, alu_r7_resolved, alu_p_valid, rrf_wr_en1,alu_p_no_ans);

LS_P_INST : ls_p port map(clk, reset, rc_pc_from_RS, rc_op1_from_RS, rc_op2_from_RS, rc_ir_from_RS, dram_data_out, rc_dest_rrtag_from_RS,
	rc_dest_rrtag_from_RS, rc_dest_rrtag_from_RS, "00", rc_val_from_RS, rc_carry_from_RS, '1', rc_zero_from_RS, '1', rrf_wr_data2,
	dram_rd_addr, wr_addr_from_ls_p, rrf_wr_addr2, '1', '1', lw_r7_resolved, ls_p_z, rrf_wr_en2,ls_p_valid);

ARF_INST : RF generic map (16) port map(arf_rd_addr1_from_ID, arf_rd_addr2_from_ID, arf_rd_addr3_from_ID, arf_rd_addr4_from_ID, 
	arf_wr_addr1_from_RoB, arf_wr_addr2_from_RoB, arf_wr_addr3_from_RoB, arf_data1_from_RoB, arf_data2_from_RoB, arf_data3_from_RoB,
	arf_wr_en1_from_RoB, arf_wr_en2_from_RoB, arf_wr_en3_from_RoB, clk, reset, arf_data_out1, arf_data_out2, arf_data_out3, arf_data_out4);

ARF_TAG_INST : RF_tag generic (5) port map (arf_rd_addr1_from_ID, arf_rd_addr2_from_ID, arf_rd_addr3_from_ID, arf_rd_addr4_from_ID,
	arf_rd_addr5_from_ID, arf_rd_addr6_from_ID, arftag_rd_addr1_from_RoB, arftag_rd_addr2_from_RoB, arftag_wr_addr1_from_ID, 
	arftag_wr_addr2_from_ID, arftag_data1_from_ID, arftag_data2_from_ID, arftag_wr_en1_from_ID, arftag_wr_en2_from_ID, clk, reset,
	arftag_data_out1, arftag_data_out2, arftag_data_out3, arftag_data_out4, arftag_data_out5, arftag_data_out6, arftag_data_out7,
	arftag_data_out8);

ARF_BUSY_INST : RF_busybit port map(arf_rd_addr1_from_ID, arf_rd_addr2_from_ID, arf_rd_addr3_from_ID, arf_rd_addr4_from_ID,
	arf_rd_addr5_from_ID, arf_rd_addr6_from_ID, arftag_wr_addr1_from_ID, arftag_wr_addr2_from_ID, arftag_rd_addr1_from_RoB, 
	arftag_rd_addr2_from_RoB, arfbusy_data1_from_ID, arfbusy_data2_from_ID, arfbusy_data1_from_RoB, arfbusy_data2_from_RoB,
	arfbusy_wr_en1_from_ID, arfbusy_wr_en2_from_ID, arfbusy_wr_en1_from_RoB, arfbusy_wr_en2_from_RoB, clk, reset,
	arfbusy_data_out1, arfbusy_data_out2, arfbusy_data_out3, arfbusy_data_out4, arfbusy_data_out5, arfbusy_data_out6);


--C
CARRY_INST : bit_register port map(clk, global_carry_en_from_RoB, reset, global_carry_data_in_from_RoB, global_carry_out); 
CARRY_TAG_INST : myRegister generic map(5) port map(clk, '1', reset, global_carry_tag_data_in_from_ID, global_carry_tag_out);
CARRY_BUSY_INST : bit_register port map(clk, '1', reset, global_carry_busy_in, global_carry_busy_out);
global_carry_busy_in <= global_carry_busy_from_RoB when (global_carry_busy_from_ID = '0' and global_carry_busy_en_from_RoB = '1') else
						global_carry_busy_from_ID;
global_carry_busy_from_ID <= global_carry_busy1_from_ID or global_carry_busy2_from_ID;

global_carry_tag_data_in_from_ID <= global_carry_tag1_from_ID when(global_carry_tag2_from_ID = global_carry_tag_out) else
									global_carry_tag2_from_ID;

--Z
ZERO_INST : bit_register port map(clk, global_zero_en_from_RoB, reset, global_zero_data_in_from_RoB, global_zero_out);
ZERO_TAG_INST : myRegister generic map(5) port map(clk, '1', reset, global_zero_tag_data_in_from_ID, global_zero_tag_out);
ZERO_BUSY_INST : bit_register port map(clk, '1', reset, global_zero_busy_in, global_zero_busy_out);
global_zero_busy_in <= global_zero_busy_from_RoB when (global_zero_busy_from_ID = '0' and global_zero_busy_en_from_RoB = '1') else
						global_zero_busy_from_ID;
global_zero_busy_from_ID <= global_zero_busy1_from_ID or global_zero_busy2_from_ID;

global_zero_tag_data_in_from_ID <= global_zero_tag1_from_ID when(global_zero_tag2_from_ID = global_zero_tag_out) else
									global_zero_tag2_from_ID;


--ID
ID_INST : ID port map(clk, reset, ra1_val, ra2_val, ra1_pc, ra1_ir, ra2_pc, ra2_ir, rrf_free_vec,

	arf_data_out1, arf_data_out2, arf_data_out3, arf_data_out4,
	arfbusy_data_out1, arfbusy_data_out2, arfbusy_data_out3, arfbusy_data_out4,
	arftag_data_out1, arftag_data_out2, arftag_data_out3, arftag_data_out4,
	global_carry_out, global_zero_out, global_carry_busy_out, global_zero_busy_out, arfbusy_data_out5, arfbusy_data_out6,
	global_carry_tag_out, global_zero_tag_out, arftag_data_out5, arftag_data_out6,
	branch_taken, branch_not_taken,
	"00",
	RS_full, '0',
	lw_r7_resolved, alu_r7_resolved, jlr_resolved,
	store_retirement_count

	rrf_free_vec_from_id,
	arf_rd_addr1_from_ID, arf_rd_addr2_from_ID, arf_rd_addr3_from_ID, arf_rd_addr4_from_ID,	arf_rd_addr5_from_ID, arf_rd_addr6_from_ID, arftag_wr_addr1_from_ID, arftag_wr_addr2_from_ID,
	pc1_from_id, pc2_from_id, ir1_from_id, ir2_from_id,
	inst1_op1_from_ID, inst1_op2_from_ID, inst2_op1_from_ID, inst2_op2_from_ID,
	inst1_op1_valid_from_ID, inst1_op2_valid_from_ID, inst2_op1_valid_from_ID, inst2_op2_valid_from_ID,
	inst1_valid_from_ID, inst2_valid_from_ID,
	inst1_carry_from_ID, inst1_zero_from_ID, inst1_carry_ready_from_ID, inst1_zero_ready_from_ID, inst1_carry_wr_from_ID, inst1_zero_wr_from_ID, 
	inst2_carry_from_ID, inst2_carry_ready_from_ID, inst2_carry_wr_from_ID, inst2_zero_from_ID, inst2_zero_ready_from_ID, inst2_zero_wr_from_ID,
	 "00", "00",
	 inst1_store_tag_from_ID, inst2_store_tag_from_ID,
	 global_carry_busy1_from_ID, global_zero_busy1_from_ID, global_carry_busy2_from_ID, global_zero_busy2_from_ID,
	 global_carry_tag1_from_ID, global_zero_tag1_from_ID, global_carry_tag2_from_ID, global_zero_tag2_from_ID,
	 arfbusy_data1_from_ID, arfbusy_data2_from_ID,
	 arftag_data1_from_ID, arftag_data2_from_ID,
	 carry_tag1_from_id, zero_tag1_from_id, carry_tag2_from_id, zero_tag2_from_id,
	 ra1_invalidate, ra2_invalidate, pc_en, ra_en,
	 arfbusy_wr_en1_from_ID, arfbusy_wr_en2_from_ID, arftag_wr_en1_from_ID, arftag_wr_en2_from_ID,
	 adder2_out, adder3_out, ZA7_1_out, ZA7_2_out,
	 S0, S1, S2, S3
	 );

ROB_INST : 



























end architecture behave;