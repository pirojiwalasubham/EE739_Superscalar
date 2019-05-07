library std;
use std.standard.all;

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_misc.all;


entity RS_RF_Sched is 
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
		id_1_op1_in,id_1_op2_in, id_2_op1_in, id_2_op2_in : in std_logic_vector(15 downto 0);
		id_1_store_tag_in,id_2_store_tag_in : in std_logic_vector(4 downto 0);
		id_1_zero_ready_in, id_2_zero_ready_in, id_1_zero_in, id_2_zero_in, id_1_carry_ready_in, id_2_carry_ready_in, id_1_carry_in, id_2_carry_in, id_1_val_in, id_2_val_in, id_1_op1_val_in, id_1_op2_val_in, id_2_op1_val_in, id_2_op2_val_in : in std_logic;


		twoRSnotFree_rs : out std_logic;
		rb_pc,rb_op1,rb_op2, rb_ir :out std_logic_vector(15 downto 0);
		rb_dest_rrtag			   :out std_logic_vector(4 downto 0);
		rb_valid,rb_carry,rb_zero  :out std_logic;
		rc_pc,rc_op1,rc_op2, rc_ir :out std_logic_vector(15 downto 0);
		rc_dest_rrtag  			   :out std_logic_vector(4 downto 0);
		rc_valid,rc_carry,rc_zero  :out std_logic


		); 
end RS_RF_Sched;

architecture behave of RS_RF_Sched is

component bit_register1 is
	port(
		clk,wr,clr : in std_logic;
		din : in std_logic;
		dout :out std_logic
		);	
end component;
	component myRegister is
			generic(
			data_length: integer);
			port (
			clk,wr,clr : in std_logic;
			din : in std_logic_vector(data_length-1 downto 0);
			dout :out std_logic_vector(data_length-1 downto 0));
	end component myRegister;

	component bit_register is
		port(
			clk,wr,clr : in std_logic;
			din : in std_logic;
			dout :out std_logic
			);	
	end component bit_register;

component pen16bitwith2output is 
	port (penin: in std_logic_vector(15 downto 0);
			twoRRnotFree : out std_logic;
			pennext_twoallotted, pennext_oneallotted: out std_logic_vector(15 downto 0);
			penout1, penout2: out std_logic_vector(3 downto 0));
end component;
component pen16bit is 
	port (penin: in std_logic_vector(15 downto 0);
			no1found : out std_logic;
			pennext: out std_logic_vector(15 downto 0);
			penout: out std_logic_vector(3 downto 0));
end component;

component Add is
   port(x,y: in std_logic_vector(15 downto 0);
	
	s0: out std_logic_vector(15 downto 0);
        c_out: out std_logic);
end component;

	type s_18 is array (0 to 31) of std_logic_vector(17 downto 0);
	type s_16 is array (0 to 31) of std_logic_vector(15 downto 0);
	type s_5 is array (0 to 31) of std_logic_vector(4 downto 0);
	type s_1 is array (0 to 31) of std_logic;

	type s_18_2 is array (0 to 15) of std_logic_vector(17 downto 0);
	type s_16_2 is array (0 to 15) of std_logic_vector(15 downto 0);
	type s_5_2 is array (0 to 15) of std_logic_vector(4 downto 0);
	type s_1_2 is array (0 to 15) of std_logic;


	
	
	signal rrf_P_in, rrf_P_out : s_18;
	signal rrf_busy_reg_in, rrf_busy_reg_out, rrf_valid_reg_in, rrf_valid_reg_out, en_for_P, en_for_busy, en_for_valid : s_1;
	signal en_vec1, en_vec2 : std_logic_vector(31 downto 0);


	------------------------------------------------------------------------------------------------------------------------------
    -- RS ke signals
    signal sign_extended_store_tag_minus2,  sign_extended_store_tag_minus1, sign_extended_store_tag, pc_in, pc_out,rs_op1_in,rs_op1_out,rs_op2_in,rs_op2_out,rs_ir_out,rs_ir_in : s_16_2;
	signal store_tag_minus2_carry, store_tag_minus1_carry, rs_zero_ready_out,rs_zero_out,rs_carry_ready_out,rs_carry_out,rs_inst_val_out,rs_op2_val_out, rs_op1_val_out, rs_zero_ready_in,rs_zero_in, rs_carry_ready_in, rs_carry_in, rs_inst_val_in, rs_op2_val_in, rs_op1_val_in, pc_en,rs_op1_en,rs_op2_en,rs_ir_en, rs_op1_val_en, rs_op2_val_en, rs_inst_val_en, rs_carry_en, rs_carry_ready_en, rs_zero_en, rs_zero_ready_en, rs_dest_rr_tag_en, rs_carry_tag_en, rs_zero_tag_en, rs_store_tag_en : s_1_2;
	signal store_tag_minus1,store_tag_minus2,rs_store_tag_out,rs_zero_tag_out,rs_carry_tag_out,rs_dest_rr_tag_out,rs_dest_rr_tag_in, rs_carry_tag_in, rs_zero_tag_in, rs_store_tag_in : s_5_2;
	signal pennext_twoallotted_rs,pennext_oneallotted_rs : std_logic_vector(15 downto 0);
	signal penout1_rs_val,penout2_rs_val : std_logic_vector(3 downto 0 );
	signal rs_inst_inval_out_vector,inst_scheduled :std_logic_vector(15 downto 0);
	signal twoRSnotFree_rs_signal : std_logic;
	------------------------------------------------------------------------------------------------------------------------------
    -- Scheduler ke signals
    signal alu_schedulable_vec, ls_schedulable_vec,pennext_alu_sched,pennext_ls_sched  : std_logic_vector(15 downto 0) := "0000000000000000";
    signal no1found_alu_sched,no1found_ls_sched: std_logic;
    signal penout_alu_sched,penout_ls_sched : std_logic_vector(3 downto 0);
	 
	  
	

begin
	RRF : for i in 0 to 31 generate
		rrf_P_file : myRegister generic map (18) port map (clk, en_for_P(i), reset, rrf_P_in(i), rrf_P_out(i));
		rrf_busy_file : bit_register port map (clk, '1', reset, rrf_busy_reg_in(i), rrf_busy_reg_out(i));
		rrf_valid_file : bit_register port map (clk, '1', reset, rrf_valid_reg_in(i), rrf_valid_reg_out(i));
	end generate RRF;


  en_vec1 <= "00000000000000000000000000000001" when ((rrf_Awr1_in="00000") and (rrf_write1_in='1')) else
			 "00000000000000000000000000000010" when ((rrf_Awr1_in="00001") and (rrf_write1_in='1')) else
			 "00000000000000000000000000000100" when ((rrf_Awr1_in="00010") and (rrf_write1_in='1')) else
			 "00000000000000000000000000001000" when ((rrf_Awr1_in="00011") and (rrf_write1_in='1')) else
			 "00000000000000000000000000010000" when ((rrf_Awr1_in="00100") and (rrf_write1_in='1')) else
			 "00000000000000000000000000100000" when ((rrf_Awr1_in="00101") and (rrf_write1_in='1')) else
			 "00000000000000000000000001000000" when ((rrf_Awr1_in="00110") and (rrf_write1_in='1')) else
			 "00000000000000000000000010000000" when ((rrf_Awr1_in="00111") and (rrf_write1_in='1')) else
			 "00000000000000000000000100000000" when ((rrf_Awr1_in="01000") and (rrf_write1_in='1')) else
			 "00000000000000000000001000000000" when ((rrf_Awr1_in="01001") and (rrf_write1_in='1')) else
			 "00000000000000000000010000000000" when ((rrf_Awr1_in="01010") and (rrf_write1_in='1')) else
			 "00000000000000000000100000000000" when ((rrf_Awr1_in="01011") and (rrf_write1_in='1')) else
			 "00000000000000000001000000000000" when ((rrf_Awr1_in="01100") and (rrf_write1_in='1')) else
			 "00000000000000000010000000000000" when ((rrf_Awr1_in="01101") and (rrf_write1_in='1')) else
			 "00000000000000000100000000000000" when ((rrf_Awr1_in="01110") and (rrf_write1_in='1')) else
			 "00000000000000001000000000000000" when ((rrf_Awr1_in="01111") and (rrf_write1_in='1')) else
			 "00000000000000010000000000000000" when ((rrf_Awr1_in="10000") and (rrf_write1_in='1')) else
			 "00000000000000100000000000000000" when ((rrf_Awr1_in="10001") and (rrf_write1_in='1')) else
			 "00000000000001000000000000000000" when ((rrf_Awr1_in="10010") and (rrf_write1_in='1')) else
			 "00000000000010000000000000000000" when ((rrf_Awr1_in="10011") and (rrf_write1_in='1')) else
			 "00000000000100000000000000000000" when ((rrf_Awr1_in="10100") and (rrf_write1_in='1')) else
			 "00000000001000000000000000000000" when ((rrf_Awr1_in="10101") and (rrf_write1_in='1')) else
			 "00000000010000000000000000000000" when ((rrf_Awr1_in="10110") and (rrf_write1_in='1')) else
			 "00000000100000000000000000000000" when ((rrf_Awr1_in="10111") and (rrf_write1_in='1')) else
			 "00000001000000000000000000000000" when ((rrf_Awr1_in="11000") and (rrf_write1_in='1')) else
			 "00000010000000000000000000000000" when ((rrf_Awr1_in="11001") and (rrf_write1_in='1')) else
			 "00000100000000000000000000000000" when ((rrf_Awr1_in="11010") and (rrf_write1_in='1')) else
			 "00001000000000000000000000000000" when ((rrf_Awr1_in="11011") and (rrf_write1_in='1')) else
			 "00010000000000000000000000000000" when ((rrf_Awr1_in="11100") and (rrf_write1_in='1')) else
			 "00100000000000000000000000000000" when ((rrf_Awr1_in="11101") and (rrf_write1_in='1')) else
			 "01000000000000000000000000000000" when ((rrf_Awr1_in="11110") and (rrf_write1_in='1')) else
			 "10000000000000000000000000000000" when ((rrf_Awr1_in="11111") and (rrf_write1_in='1')) else
			 "00000000000000000000000000000000";

  en_vec2 <= "00000000000000000000000000000001" when ((rrf_Awr2_in="00000") and (rrf_write2_in='1')) else
			 "00000000000000000000000000000010" when ((rrf_Awr2_in="00001") and (rrf_write2_in='1')) else
			 "00000000000000000000000000000100" when ((rrf_Awr2_in="00010") and (rrf_write2_in='1')) else
			 "00000000000000000000000000001000" when ((rrf_Awr2_in="00011") and (rrf_write2_in='1')) else
			 "00000000000000000000000000010000" when ((rrf_Awr2_in="00100") and (rrf_write2_in='1')) else
			 "00000000000000000000000000100000" when ((rrf_Awr2_in="00101") and (rrf_write2_in='1')) else
			 "00000000000000000000000001000000" when ((rrf_Awr2_in="00110") and (rrf_write2_in='1')) else
			 "00000000000000000000000010000000" when ((rrf_Awr2_in="00111") and (rrf_write2_in='1')) else
			 "00000000000000000000000100000000" when ((rrf_Awr2_in="01000") and (rrf_write2_in='1')) else
			 "00000000000000000000001000000000" when ((rrf_Awr2_in="01001") and (rrf_write2_in='1')) else
			 "00000000000000000000010000000000" when ((rrf_Awr2_in="01010") and (rrf_write2_in='1')) else
			 "00000000000000000000100000000000" when ((rrf_Awr2_in="01011") and (rrf_write2_in='1')) else
			 "00000000000000000001000000000000" when ((rrf_Awr2_in="01100") and (rrf_write2_in='1')) else
			 "00000000000000000010000000000000" when ((rrf_Awr2_in="01101") and (rrf_write2_in='1')) else
			 "00000000000000000100000000000000" when ((rrf_Awr2_in="01110") and (rrf_write2_in='1')) else
			 "00000000000000001000000000000000" when ((rrf_Awr2_in="01111") and (rrf_write2_in='1')) else
			 "00000000000000010000000000000000" when ((rrf_Awr2_in="10000") and (rrf_write2_in='1')) else
			 "00000000000000100000000000000000" when ((rrf_Awr2_in="10001") and (rrf_write2_in='1')) else
			 "00000000000001000000000000000000" when ((rrf_Awr2_in="10010") and (rrf_write2_in='1')) else
			 "00000000000010000000000000000000" when ((rrf_Awr2_in="10011") and (rrf_write2_in='1')) else
			 "00000000000100000000000000000000" when ((rrf_Awr2_in="10100") and (rrf_write2_in='1')) else
			 "00000000001000000000000000000000" when ((rrf_Awr2_in="10101") and (rrf_write2_in='1')) else
			 "00000000010000000000000000000000" when ((rrf_Awr2_in="10110") and (rrf_write2_in='1')) else
			 "00000000100000000000000000000000" when ((rrf_Awr2_in="10111") and (rrf_write2_in='1')) else
			 "00000001000000000000000000000000" when ((rrf_Awr2_in="11000") and (rrf_write2_in='1')) else
			 "00000010000000000000000000000000" when ((rrf_Awr2_in="11001") and (rrf_write2_in='1')) else
			 "00000100000000000000000000000000" when ((rrf_Awr2_in="11010") and (rrf_write2_in='1')) else
			 "00001000000000000000000000000000" when ((rrf_Awr2_in="11011") and (rrf_write2_in='1')) else
			 "00010000000000000000000000000000" when ((rrf_Awr2_in="11100") and (rrf_write2_in='1')) else
			 "00100000000000000000000000000000" when ((rrf_Awr2_in="11101") and (rrf_write2_in='1')) else
			 "01000000000000000000000000000000" when ((rrf_Awr2_in="11110") and (rrf_write2_in='1')) else
			 "10000000000000000000000000000000" when ((rrf_Awr2_in="11111") and (rrf_write2_in='1')) else
			 "00000000000000000000000000000000";

	encoding : for i in 0 to 31 generate
		en_for_P(i) <= en_vec1(i) or en_vec2(i);
		end generate encoding;
	Data : for i in 0 to 31 generate 
		rrf_P_in(i) <= rrf_Data1_EX_in when (en_vec1(i) = '1')  else
						rrf_Data2_EX_in;
	end generate Data;

	busy_valid: for i in 0 to 31 generate
		rrf_busy_reg_in(i) <= not (((not rrf_busy_reg_out(i)) or ((not rrf_busy_reg_out(i)) xor rrf_free_vec_Rob_in(i))) and (not ((not rrf_busy_reg_out(i)) xor rrf_free_vec_ID_in(i))));
		rrf_valid_reg_in(i) <=  ((( rrf_valid_reg_out(i)) or (( rrf_valid_reg_out(i)) xor rrf_valid_vec_EX_in(i))) and (not (( rrf_valid_reg_out(i)) xor rrf_valid_vec_Rob_in(i))));
	end generate busy_valid;

	output_loop: for i in 0 to 31 generate
		rrf_free_vec_out(i)  <= not rrf_busy_reg_out(i);
		rrf_valid_vec_out(i) <= rrf_valid_reg_out(i);
	end generate output_loop;

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--RS
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


	RS : for i in 0 to 15 generate
		RS_PC   : myRegister generic map (16) port map (clk,pc_en(i),reset,pc_in(i),pc_out(i));
		RS_OPR1 : myRegister generic map (16) port map (clk,rs_op1_en(i),reset,rs_op1_in(i),rs_op1_out(i));
		RS_OPR2 : myRegister generic map (16) port map (clk,rs_op2_en(i),reset,rs_op2_in(i),rs_op2_out(i));
		RS_IR   : myRegister generic map (16) port map (clk,rs_ir_en(i),reset,rs_ir_in(i),rs_ir_out(i));

		RS_OP1_VAL :  bit_register port map (clk,rs_op1_val_en(i),reset,rs_op1_val_in(i),rs_op1_val_out(i));
		RS_OP2_VAL :  bit_register port map (clk,rs_op2_val_en(i),reset,rs_op2_val_in(i),rs_op2_val_out(i));
		RS_INST_VAL:  bit_register port map (clk,rs_inst_val_en(i),reset,rs_inst_val_in(i),rs_inst_val_out(i));
		RS_CARRY:     bit_register port map (clk,rs_carry_en(i),reset,rs_carry_in(i),rs_carry_out(i));
		RS_CARR_READY:bit_register port map (clk,rs_carry_ready_en(i),reset,rs_carry_ready_in(i),rs_carry_ready_out(i));
		RS_ZERO:      bit_register port map (clk,rs_zero_en(i),reset,rs_zero_in(i),rs_zero_out(i));
		RS_ZERO_READY:bit_register port map (clk,rs_zero_ready_en(i),reset,rs_zero_ready_in(i),rs_zero_ready_out(i));

		RS_DEST_RR_TAG : myRegister generic map (5) port map (clk,rs_dest_rr_tag_en(i),reset,rs_dest_rr_tag_in(i),rs_dest_rr_tag_out(i));
		RS_CARRY_TAG   : myRegister generic map (5) port map (clk,rs_carry_tag_en(i),reset,rs_carry_tag_in(i),rs_carry_tag_out(i));
		RS_ZERO_RR_TAG : myRegister generic map (5) port map (clk,rs_zero_tag_en(i),reset,rs_zero_tag_in(i),rs_zero_tag_out(i));
		RS_STORE_RR_TAG: myRegister generic map (5) port map (clk,rs_store_tag_en(i),reset,rs_store_tag_in(i),rs_store_tag_out(i));

	end generate RS;


	valid_vector : for i in 0 to 15 generate 
		rs_inst_inval_out_vector(i) <= not rs_inst_val_out(i);
	end generate valid_vector;
	
	TWO_FREE_ENTRIES : pen16bitwith2output port map(( rs_inst_inval_out_vector), twoRSnotFree_rs_signal,pennext_twoallotted_rs,pennext_oneallotted_rs,penout1_rs_val,penout2_rs_val);

	Subtract1 : for i in 0 to 15 generate
		sign_extended_store_tag(i) <= ("11111111111" & rs_store_tag_out(i)) when(rs_store_tag_out(i)(4) = '1') else
									("00000000000" & rs_store_tag_out(i));
		MINUSONE : Add port map(sign_extended_store_tag(i), "1111111111111111", sign_extended_store_tag_minus1(i),store_tag_minus1_carry(i));
		store_tag_minus1(i) <= sign_extended_store_tag_minus1(i)(4 downto 0);

		MINUSTWO : Add port map(sign_extended_store_tag(i), "1111111111111110", sign_extended_store_tag_minus2(i),store_tag_minus2_carry(i));
		store_tag_minus2(i) <= sign_extended_store_tag_minus2(i)(4 downto 0);
	end generate Subtract1;
	--RS_PC

	process(clk,reset, 
		rrf_Awr1_in, rrf_Awr2_in, 
		rrf_write1_in, rrf_write2_in, 
		rrf_Data1_EX_in, rrf_Data2_EX_in, 
		rrf_free_vec_ID_in, rrf_free_vec_Rob_in ,
		rrf_valid_vec_EX_in, rrf_valid_vec_Rob_in, 
		------------------------------------------------------------------------------------
		id_pc1_in, id_pc2_in,id_ir1_in,id_ir2_in ,
		id_dest_rr_tag1_in,id_dest_rr_tag2_in,id_carry_tag1_in,id_carry_tag2_in,id_zero_tag1_in,id_zero_tag2_in ,
		store_retirement_count, 

	 rrf_P_in, rrf_P_out,
	 rrf_busy_reg_in, rrf_busy_reg_out, rrf_valid_reg_in, rrf_valid_reg_out, en_for_P, en_for_busy, en_for_valid, 
	 en_vec1, en_vec2,
	------------------------------------------------------------------------------------------------------------------------------
    -- RS ke signals
     pc_in, pc_out,rs_op1_in,rs_op1_out,rs_op2_in,rs_op2_out,rs_ir_out,rs_ir_in,
	 rs_zero_ready_out,rs_zero_out,rs_carry_ready_out,rs_carry_out,rs_inst_val_out,rs_op2_val_out, rs_op1_val_out, rs_zero_ready_in,rs_zero_in, rs_carry_ready_in, rs_carry_in, rs_inst_val_in, rs_op2_val_in, rs_op1_val_in, pc_en,rs_op1_en,rs_op2_en,rs_ir_en, rs_op1_val_en, rs_op2_val_en, rs_inst_val_en, rs_carry_en, rs_carry_ready_en, rs_zero_en, rs_zero_ready_en, rs_dest_rr_tag_en, rs_carry_tag_en, rs_zero_tag_en, rs_store_tag_en,
	 rs_store_tag_out,rs_zero_tag_out,rs_carry_tag_out,rs_dest_rr_tag_out,rs_dest_rr_tag_in, rs_carry_tag_in, rs_zero_tag_in, rs_store_tag_in,
	 id_2_zero_ready_in,id_1_zero_ready_in,id_2_zero_in,id_1_zero_in,id_2_carry_ready_in,id_1_carry_ready_in,id_2_carry_in,id_1_carry_in,id_2_val_in,id_1_val_in,id_2_op2_val_in,id_1_op2_val_in,id_2_op1_val_in,id_1_op1_val_in,
	 id_2_op2_in,id_1_op1_in, id_2_op1_in,id_1_op2_in, pennext_twoallotted_rs,pennext_oneallotted_rs ,
	 penout1_rs_val,penout2_rs_val ,
	 id_1_store_tag_in,id_2_store_tag_in ,
	 inst_scheduled , twoRSnotFree_rs_signal,
	------------------------------------------------------------------------------------------------------------------------------
    -- Scheduler ke signals
     alu_schedulable_vec, ls_schedulable_vec,pennext_alu_sched,pennext_ls_sched  ,
     no1found_alu_sched,no1found_ls_sched,
     penout_alu_sched,penout_ls_sched,
     store_tag_minus1, store_tag_minus2
		)

	begin
	a1 : for i in 0 to 15 loop 
		if(twoRSnotFree_rs_signal = '0') then 
			if ((i = (to_integer(unsigned(penout1_rs_val))))  or (i = (to_integer(unsigned(penout2_rs_val)))) ) then
				pc_en(i) <= '1';
				rs_dest_rr_tag_en(i) <= '1';
				rs_ir_en(i) <= '1';
				rs_carry_tag_en(i) <= '1';
				rs_zero_tag_en(i) <= '1';
			else
				pc_en(i) <= '0';
				rs_dest_rr_tag_en(i) <= '0';
				rs_ir_en(i) <= '0';
				rs_carry_tag_en(i) <= '0';
				rs_zero_tag_en(i) <= '0';
			end if ;

			if (i = (to_integer(unsigned(penout1_rs_val))) ) then
				pc_in(i)   <= id_pc1_in;
				rs_dest_rr_tag_in(i) <= id_dest_rr_tag1_in;
				rs_ir_in(i) <= id_ir1_in;
				rs_carry_tag_in(i) <= id_carry_tag1_in;
				rs_zero_tag_in(i) <= id_zero_tag1_in;
			elsif (i = (to_integer(unsigned(penout2_rs_val))) ) then
				pc_in(i)   <= id_pc2_in;
				rs_dest_rr_tag_in(i) <= id_dest_rr_tag2_in;
				rs_ir_in(i) <= id_ir2_in;
				rs_carry_tag_in(i) <= id_carry_tag2_in;
				rs_zero_tag_in(i) <= id_zero_tag2_in;
			else
				pc_in(i)   <= "0000000000000000";
				rs_dest_rr_tag_in(i) <= "00000";
				rs_ir_in(i) <= "0000000000000000";
				rs_carry_tag_in(i) <= "00000";
				rs_zero_tag_in(i) <= "00000";
			end if ;
				--pc_en(i) <= '1' when ((i = (to_integer(unsigned(penout1_rs_val))))  or (i = (to_integer(unsigned(penout2_rs_val)))) ) else
				--			'0';
				--pc_in(i)   <= id_pc1_in when (i = (to_integer(unsigned(penout1_rs_val))) ) else
				--			  id_pc2_in when (i = (to_integer(unsigned(penout2_rs_val))) ) else
				--			 "0000000000000000";
				--rs_dest_rr_tag_en(i) <= '1' when ((i = (to_integer(unsigned(penout1_rs_val))))  or (i = (to_integer(unsigned(penout2_rs_val)))) ) else
				--						'0';
				--rs_dest_rr_tag_in(i) <= id_dest_rr_tag1_in when (i = (to_integer(unsigned(penout1_rs_val))) ) else
				--			  			id_dest_rr_tag2_in  when (i = (to_integer(unsigned(penout2_rs_val))) ) else
				--					   "00000";
				--rs_ir_en(i) <= '1' when ((i = (to_integer(unsigned(penout1_rs_val))))  or (i = (to_integer(unsigned(penout2_rs_val)))) ) else
				--			'0';
				--rs_ir_in(i) <= id_ir1_in when (i = (to_integer(unsigned(penout1_rs_val))) ) else
				--			  id_ir2_in when (i = (to_integer(unsigned(penout2_rs_val))) ) else
				--			 "0000000000000000";
				--rs_carry_tag_en(i) <= '1' when ((i = (to_integer(unsigned(penout1_rs_val))))  or (i = (to_integer(unsigned(penout2_rs_val)))) ) else
				--						'0';
				--rs_carry_tag_in(i) <= id_carry_tag1_in when (i = (to_integer(unsigned(penout1_rs_val))) ) else
				--	  			id_carry_tag2_in  when (i = (to_integer(unsigned(penout2_rs_val))) ) else
				--			   "00000";
				--rs_zero_tag_en(i) <= '1' when ((i = (to_integer(unsigned(penout1_rs_val))))  or (i = (to_integer(unsigned(penout2_rs_val)))) ) else
				--						'0';
				--rs_zero_tag_in(i) <= id_zero_tag1_in when (i = (to_integer(unsigned(penout1_rs_val))) ) else
				--	  			id_zero_tag2_in  when (i = (to_integer(unsigned(penout2_rs_val))) ) else
				--			   "00000";		
		else
				pc_en(i) <= '0';
				pc_in(i)   <= "0000000000000000";
				rs_dest_rr_tag_en(i) <= '0';
				rs_dest_rr_tag_in(i) <= "00000";
				rs_ir_en(i) <= '0';
				rs_ir_in(i) <= "0000000000000000";
				rs_carry_tag_en(i) <= '0';
				rs_carry_tag_in(i) <= "00000";
				rs_zero_tag_en(i) <= '0';
				rs_zero_tag_in(i) <= "00000";	

		end if;
	end loop a1;
	

	a2: for i in 0 to 15 loop 
		if(rs_inst_val_out(i) = '0' and twoRSnotFree_rs_signal = '0') then
			if (i = (to_integer(unsigned(penout1_rs_val))))  or (i = (to_integer(unsigned(penout2_rs_val)))) then
				rs_op1_en(i) <= '1';
				rs_op2_en(i) <= '1';
				rs_op1_val_en(i) <= '1';
				rs_op2_val_en(i) <= '1';
				rs_inst_val_en(i) <= '1';
				rs_carry_en(i) <= '1';
				rs_carry_ready_en(i) <= '1';
				rs_zero_en(i) <= '1';
				rs_zero_ready_en(i) <= '1';
				rs_store_tag_en(i) <=  '1';
			else
				rs_op1_en(i) <= '0';
				rs_op2_en(i) <= '0';	
				rs_op1_val_en(i) <= '0';
				rs_op2_val_en(i) <= '0';
				rs_inst_val_en(i) <= '0';
				rs_carry_en(i) <= '0';
				rs_carry_ready_en(i) <= '0';
				rs_zero_en(i) <= '0';
				rs_zero_ready_en(i) <= '0';
				rs_store_tag_en(i) <=  '0';
			end if ;


			if (i = (to_integer(unsigned(penout1_rs_val))) ) then
				rs_op1_in(i) <= id_1_op1_in;
				rs_op2_in(i) <= id_1_op2_in;
				rs_op1_val_in(i) <= id_1_op1_val_in;
				rs_op2_val_in(i) <= id_1_op2_val_in;
				rs_inst_val_in(i) <=  id_1_val_in;
				rs_carry_in(i) <=  id_1_carry_in;
				rs_carry_ready_in(i) <=  id_1_carry_ready_in;
				rs_zero_in(i) <=  id_1_zero_in;
				rs_zero_ready_in(i) <=  id_1_zero_ready_in;
				rs_store_tag_in(i) <= id_1_store_tag_in;
			elsif (i = (to_integer(unsigned(penout2_rs_val))) ) then
				rs_op1_in(i) <= id_2_op1_in;
				rs_op2_in(i) <= id_2_op2_in;
				rs_op1_val_in(i) <= id_2_op1_val_in;
				rs_op2_val_in(i) <= id_2_op2_val_in;
				rs_inst_val_in(i) <=  id_2_val_in;
				rs_carry_in(i) <=  id_2_carry_in;
				rs_carry_ready_in(i) <=  id_2_carry_ready_in;
				rs_zero_in(i) <=  id_2_zero_in;
				rs_zero_ready_in(i) <=  id_2_zero_ready_in;
				rs_store_tag_in(i) <= id_2_store_tag_in;
			else
				rs_op1_in(i) <= "0000000000000000";
				rs_op2_in(i) <= "0000000000000000";
				rs_op1_val_in(i) <= '0';
				rs_op2_val_in(i) <= '0';
				rs_inst_val_in(i) <=  '0';
				rs_carry_in(i) <=  '0';
				rs_carry_ready_in(i) <=  '0';
				rs_zero_in(i) <=  '0';
				rs_zero_ready_in(i) <=  '0';
				rs_store_tag_in(i) <= "00000";
			end if ;
			--rs_op1_en(i) <= '1' when ((i = (to_integer(unsigned(penout1_rs_val))))  or (i = (to_integer(unsigned(penout2_rs_val)))) ) else
			--				'0';
			--rs_op1_in(i) <= id_1_op1_in when (i = (to_integer(unsigned(penout1_rs_val))) ) else
			--				  id_2_op1_in when (i = (to_integer(unsigned(penout2_rs_val))) ) else
			--				 "0000000000000000";
			--rs_op2_en(i) <= '1' when ((i = (to_integer(unsigned(penout1_rs_val))))  or (i = (to_integer(unsigned(penout2_rs_val)))) ) else
			--				'0';
			--rs_op2_in(i) <= id_1_op2_in when (i = (to_integer(unsigned(penout1_rs_val))) ) else
			--				  id_2_op2_in when (i = (to_integer(unsigned(penout2_rs_val))) ) else
			--				 "0000000000000000";
			--rs_op1_val_en(i) <= '1' when ((i = (to_integer(unsigned(penout1_rs_val))))  or (i = (to_integer(unsigned(penout2_rs_val)))) ) else
			--				'0';
			--rs_op1_val_in(i) <= id_1_op1_val_in when (i = (to_integer(unsigned(penout1_rs_val))) ) else
			--				  id_2_op1_val_in when (i = (to_integer(unsigned(penout2_rs_val))) ) else
			--				 '0';
			--rs_op2_val_en(i) <= '1' when ((i = (to_integer(unsigned(penout1_rs_val))))  or (i = (to_integer(unsigned(penout2_rs_val)))) ) else
			--				'0';
			--rs_op2_val_in(i) <= id_1_op2_val_in when (i = (to_integer(unsigned(penout1_rs_val))) ) else
			--				  id_2_op2_val_in when (i = (to_integer(unsigned(penout2_rs_val))) ) else
			--				 '0';
			--rs_inst_val_en(i) <= '1' when ((i = (to_integer(unsigned(penout1_rs_val))))  or (i = (to_integer(unsigned(penout2_rs_val)))) ) else
			--				'0';
			--rs_inst_val_in(i) <=  id_1_val_in when (i = (to_integer(unsigned(penout1_rs_val))) ) else
			--				  id_2_val_in when (i = (to_integer(unsigned(penout2_rs_val))) ) else
			--				 '0';
			--rs_carry_en(i) <= '1' when ((i = (to_integer(unsigned(penout1_rs_val))))  or (i = (to_integer(unsigned(penout2_rs_val)))) ) else
			--				'0';
			--rs_carry_in(i) <=  id_1_carry_in when (i = (to_integer(unsigned(penout1_rs_val))) ) else
			--				  id_2_carry_in when (i = (to_integer(unsigned(penout2_rs_val))) ) else
			--				 '0';
			--rs_carry_ready_en(i) <= '1' when ((i = (to_integer(unsigned(penout1_rs_val))))  or (i = (to_integer(unsigned(penout2_rs_val)))) ) else
			--						'0';
			--rs_carry_ready_in(i) <=  id_1_carry_ready_in when (i = (to_integer(unsigned(penout1_rs_val))) ) else
			--				  id_2_carry_ready_in when (i = (to_integer(unsigned(penout2_rs_val))) ) else
			--				 '0';
			--rs_zero_en(i) <= '1' when ((i = (to_integer(unsigned(penout1_rs_val))))  or (i = (to_integer(unsigned(penout2_rs_val)))) ) else
			--				'0';
			--rs_zero_in(i) <=  id_1_zero_in when (i = (to_integer(unsigned(penout1_rs_val))) ) else
			--				  id_2_zero_in when (i = (to_integer(unsigned(penout2_rs_val))) ) else
			--				 '0';
			--rs_zero_ready_en(i) <= '1' when ((i = (to_integer(unsigned(penout1_rs_val))))  or (i = (to_integer(unsigned(penout2_rs_val)))) ) else
			--						'0';
			--rs_zero_ready_in(i) <=  id_1_zero_ready_in when (i = (to_integer(unsigned(penout1_rs_val))) ) else
			--				  id_2_zero_ready_in when (i = (to_integer(unsigned(penout2_rs_val))) ) else
			--				 '0';
			--rs_store_tag_en(i) <=  '1' when ((i = (to_integer(unsigned(penout1_rs_val))))  or (i = (to_integer(unsigned(penout2_rs_val)))) ) else
			--					'0';
			--rs_store_tag_in(i) <= id_1_store_tag_in when (i = (to_integer(unsigned(penout1_rs_val))) ) else
			--				  id_2_store_tag_in when (i = (to_integer(unsigned(penout2_rs_val))) ) else
			--				 "00000";
		else
			rs_op1_in(i) <= rrf_P_out(to_integer(unsigned(rs_op1_out(i)(4 downto 0))))(17 downto 2);
			rs_op2_in(i) <= rrf_P_out(to_integer(unsigned(rs_op2_out(i)(4 downto 0))))(17 downto 2);
			if (rs_op1_val_out(i) = '0' and rrf_valid_reg_out(to_integer(unsigned(rs_op1_out(i)(4 downto 0)))) = '1') then
			--if (rs_op1_val_out(i) = '0' and rrf_valid_reg_out(i)(1) = '1') then
				rs_op1_en(i) <= '1';
			else
				rs_op1_en(i) <= '0';	
			end if ;
			--rs_op1_en(i) <= '1'  when (rs_op1_val_out(i) = '0' and rrf_valid_reg_out(i)(to_integer(unsigned(rs_op1_out(i)(4 downto 0)))) = '1') else
			--				'0';
			if (rs_op2_val_out(i) = '0' and rrf_valid_reg_out(to_integer(unsigned(rs_op2_out(i)(4 downto 0)))) = '1') then
				rs_op2_en(i) <= '1';
			else
				rs_op2_en(i) <= '0';		
			end if ;
			--rs_op2_en(i) <= '1'  when (rs_op2_val_out(i) = '0' and rrf_valid_reg_out(i)(to_integer(unsigned(rs_op2_out(i)(4 downto 0)))) = '1') else
			--				'0';
			rs_op1_val_in(i) <= '1';
			rs_op2_val_in(i) <= '1';
			if (rs_op1_val_out(i) = '0' and rrf_valid_reg_out(to_integer(unsigned(rs_op1_out(i)(4 downto 0)))) = '1') then
				rs_op1_val_en(i) <= '1';
			else
				rs_op1_val_en(i) <= '0';	
			end if ;
			--rs_op1_val_en(i) <= '1'  when (rs_op1_val_out(i) = '0' and rrf_valid_reg_out(i)(to_integer(unsigned(rs_op1_out(i)(4 downto 0)))) = '1') else 
			--				'0';
			if (rs_op2_val_out(i) = '0' and rrf_valid_reg_out(to_integer(unsigned(rs_op2_out(i)(4 downto 0)))) = '1') then
				rs_op2_val_en(i) <= '1';
			else
				rs_op2_val_en(i) <= '0';					
			end if ;
			--rs_op2_val_en(i) <= '1'  when (rs_op2_val_out(i) = '0' and rrf_valid_reg_out(i)(to_integer(unsigned(rs_op2_out(i)(4 downto 0)))) = '1') else 
			--				'0';
			rs_carry_in(i)  <= rrf_P_out(to_integer(unsigned(rs_carry_tag_out(i))))(1);
			rs_zero_in(i)   <= rrf_P_out(to_integer(unsigned(rs_zero_tag_out(i) )))(0);
			if (rs_carry_ready_out(i) = '0' and rrf_valid_reg_out(to_integer(unsigned(rs_carry_tag_out(i)))) = '1' ) then
				rs_carry_en(i)  <= '1';
			else
				rs_carry_en(i)  <= '0';	
			end if ;
			--rs_carry_en(i)  <= '1' when (rs_carry_ready_out(i) = '0' and rrf_valid_reg_out(i)(to_integer(unsigned(rs_carry_tag_out(i)))) = '1' ) else
			--					'0';
			if (rs_zero_ready_out(i) = '0' and rrf_valid_reg_out(to_integer(unsigned(rs_zero_tag_out(i)))) = '1' ) then
				rs_zero_en(i)  <= '1';
			else
				rs_zero_en(i)  <= '0';	
			end if ;
			--rs_zero_en(i)  <= '1' when (rs_zero_ready_out(i) = '0' and rrf_valid_reg_out(i)(to_integer(unsigned(rs_zero_tag_out(i)))) = '1' ) else
			--					'0';
			rs_carry_ready_in(i) <= '1' ;
			rs_zero_ready_in(i) <= '1';
			if (rs_carry_ready_out(i) = '0' and rrf_valid_reg_out(to_integer(unsigned(rs_carry_tag_out(i)))) = '1' ) then
				rs_carry_ready_en(i) <= '1';
			else
				rs_carry_ready_en(i) <= '0';	
			end if ;
			--rs_carry_ready_en(i) <= '1' when (rs_carry_ready_out(i) = '0' and rrf_valid_reg_out(i)(to_integer(unsigned(rs_carry_tag_out(i)))) = '1' ) else
			--					'0';
			if (rs_zero_ready_out(i) = '0' and rrf_valid_reg_out(to_integer(unsigned(rs_zero_tag_out(i)))) = '1' ) then
				rs_zero_ready_en(i) <= '1';
			else
				rs_zero_ready_en(i) <= '0';	
			end if ;
			--rs_zero_ready_en(i) <= '1' when (rs_zero_ready_out(i) = '0' and rrf_valid_reg_out(i)(to_integer(unsigned(rs_zero_tag_out(i)))) = '1' ) else
			--					'0';
			-------------
			if(store_retirement_count = "00") then
				rs_store_tag_en(i) <= '0';
				rs_store_tag_in(i) <= rs_store_tag_out(i);
			elsif(store_retirement_count = "01") then
				if(rs_store_tag_out(i) = "00000") then
					rs_store_tag_in(i) <= "00000";
					rs_store_tag_en(i) <= '1';
				else 
					rs_store_tag_in(i) <= store_tag_minus1(i);
					rs_store_tag_en(i) <= '1';
				end if;
			elsif(store_retirement_count = "10") then
				if(rs_store_tag_out(i) = "00000" or rs_store_tag_out(i) = "00001") then
					rs_store_tag_in(i) <= "00000";
					rs_store_tag_en(i) <= '1';
				else 
					rs_store_tag_in(i) <= store_tag_minus2(i);
					rs_store_tag_en(i) <= '1';
				end if;
			else
				rs_store_tag_en(i) <= '0';
				rs_store_tag_in(i) <= rs_store_tag_out(i);
			end if;
			---------------
			rs_inst_val_in(i) <= '0';
			if (inst_scheduled(i) = '1') then
				rs_inst_val_en(i) <= '1';
			else
				rs_inst_val_en(i) <= '0';	
			end if ;
			--rs_inst_val_en(i) <= '1' when (inst_scheduled(i) = '1') else
			--					'0';
		end if;

	end loop a2;

	end process;
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Scheduler
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


	
	a3: for i in 0 to 15 generate
		alu_schedulable_vec(i) <= '1' when(rs_inst_val_out(i) = '1' and rs_op1_val_out(i) = '1' and rs_op2_val_out(i) = '1' and rs_carry_ready_out(i) = '1' and rs_zero_ready_out(i) = '1' and (rs_ir_out(i)(15 downto 12) = "0000" or rs_ir_out(i)(15 downto 12) = "0001" or rs_ir_out(i)(15 downto 12) = "0010" or rs_ir_out(i)(15 downto 12) = "1100" or rs_ir_out(i)(15 downto 12) = "1000" or rs_ir_out(i)(15 downto 12) = "1001" ) ) else
									'0';
		ls_schedulable_vec(i) <= '1' when(rs_inst_val_out(i) = '1' and rs_op1_val_out(i) = '1' and rs_op2_val_out(i) = '1' and rs_carry_ready_out(i) = '1' and rs_zero_ready_out(i) = '1' and (rs_ir_out(i)(15 downto 12) = "0011" or rs_ir_out(i)(15 downto 12) = "0100" or rs_ir_out(i)(15 downto 12) = "0101" or rs_ir_out(i)(15 downto 12) = "0110" or rs_ir_out(i)(15 downto 12) = "0111" ) ) else
								'0';
	end generate a3;
	P1: pen16bit port map(alu_schedulable_vec, no1found_alu_sched, pennext_alu_sched, penout_alu_sched);
	P2: pen16bit port map (ls_schedulable_vec, no1found_ls_sched,  pennext_ls_sched , penout_ls_sched);
	inst_scheduled <= (alu_schedulable_vec xor pennext_alu_sched) or (ls_schedulable_vec xor pennext_ls_sched);

	rb_pc 			<= pc_out(to_integer(unsigned(penout_alu_sched)));
	rb_op1			<= rs_op1_out(to_integer(unsigned(penout_alu_sched)));
	rb_op2			<= rs_op2_out(to_integer(unsigned(penout_alu_sched)));
	rb_ir 			<= rs_ir_out(to_integer(unsigned(penout_alu_sched)));
	rb_dest_rrtag   <= rs_dest_rr_tag_out(to_integer(unsigned(penout_alu_sched)));
	rb_carry		<= rs_carry_out(to_integer(unsigned(penout_alu_sched)));
	rb_zero			<= rs_zero_out(to_integer(unsigned(penout_alu_sched)));
	rb_valid		<= '1' when (no1found_alu_sched = '0') else
						'0';


	rc_pc 			<= pc_out(to_integer(unsigned(penout_ls_sched)));
	rc_op1			<= rs_op1_out(to_integer(unsigned(penout_ls_sched)));
	rc_op2			<= rs_op2_out(to_integer(unsigned(penout_ls_sched)));
	rc_ir 			<= rs_ir_out(to_integer(unsigned(penout_ls_sched)));
	rc_dest_rrtag   <= rs_dest_rr_tag_out(to_integer(unsigned(penout_ls_sched)));
	rc_carry		<= rs_carry_out(to_integer(unsigned(penout_ls_sched)));
	rc_zero			<= rs_zero_out(to_integer(unsigned(penout_ls_sched)));
	rc_valid		<= '1' when (no1found_ls_sched = '0') else
						'0';

	twoRSnotFree_rs <= twoRSnotFree_rs_signal;

	
	end architecture behave;



