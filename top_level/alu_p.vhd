library std;
use std.standard.all;

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_misc.all;

entity alu_p is
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
end entity;


architecture behave of alu_p is

	component myRegister is
			generic(
			data_length: integer);
			port (
			clk,wr,clr : in std_logic;
			din : in std_logic_vector(data_length-1 downto 0);
			dout :out std_logic_vector(data_length-1 downto 0));
	end component myRegister;


	component Add is
	   port(x,y: in std_logic_vector(15 downto 0);
		
		s0: out std_logic_vector(15 downto 0);
	        c_out: out std_logic);
	end component;

	component comp is
	   port(alu_a, alu_b : in std_logic_vector(15 downto 0);
			tz : out std_logic );
	end component;

	component bit_register is
		port(
			clk,wr,clr : in std_logic;
			din : in std_logic;
			dout :out std_logic
			);	
	end component bit_register;

	signal rb_pcout,rb_op1out,rb_op2out,alu_in_a,alu_in_b,alu_add_out,alu_nand_out,rb_irout,rbimm6out, alu_p_out_temp : std_logic_vector (15 downto 0);
	signal rb_dest_rrtagout,rb_carrytagout, rb_zerotagout : std_logic_vector (4 downto 0);
	signal rb_spectagout : std_logic_vector(1 downto 0);
	signal rbdestr7out,alu_p_brach_taken_temp,alu_p_brach_nottaken_temp,alu_p_valid_out_temp, rb_validout,rb_carryout,rb_zeroout,rb_carryreadyout,rb_zeroreadyout,alu_p_comp : std_logic;

	signal dependency_special_case_c,dependency_special_case_z, dependency_c ,dependency_z: std_logic;

	begin

		rbimm6out <= "1111111111" & rb_irout(5 downto 0) when rb_irout(5) = '1' else
					"0000000000" & rb_irout(5 downto 0);

		RB_PC : myRegister generic map (16) port map (clk,'1',reset,rb_pc,rb_pcout);
		RB_OP1 : myRegister generic map (16) port map (clk,'1',reset,rb_op1,rb_op1out);
		RB_OP2 : myRegister generic map (16) port map (clk,'1',reset,rb_op2,rb_op2out);
		RB_IR : myRegister generic map (16) port map (clk,'1',reset,rb_ir,rb_irout);

		RB_CARRY_TAG : myRegister generic map (5) port map (clk,'1',reset,rb_carrytag,rb_carrytagout);
		RB_ZERO_TAG : myRegister generic map (5) port map (clk,'1',reset,rb_zerotag,rb_zerotagout);
		RB_RRTAG : myRegister generic map (5) port map (clk,'1',reset,rb_dest_rrtag,rb_dest_rrtagout);
		
		RB_SPECTAG : myRegister generic map (2) port map (clk,'1',reset,rb_spectag,rb_spectagout);
				
		RB_DEST_R7 : bit_register port map (clk, '1', reset, rbdestr7, rbdestr7out);
		RB_VALID : bit_register port map (clk, '1', reset, rb_valid, rb_validout);
		RB_CARRY : bit_register port map (clk, '1', reset, rb_carry, rb_carryout);
		RB_CARRY_READY : bit_register port map (clk, '1', reset, rb_carryready, rb_carryreadyout);
		RB_ZERO : bit_register port map (clk, '1', reset, rb_zero, rb_zeroout);
		RB_ZERO_READY : bit_register port map (clk, '1', reset, rb_zeroready, rb_zeroreadyout);

		rrf_tag_out <= rb_dest_rrtagout;

		dependency_special_case_c <= '1' when ((rb_irout(15 downto 12) = "0000") and (rb_irout(1 downto 0) = "10") and (rb_irout(5 downto 3) = "111")) else
									'1' when ((rb_irout(15 downto 12) = "0010") and (rb_irout(1 downto 0) = "10") and (rb_irout(5 downto 3) = "111")) else
									'0';
		dependency_special_case_z <= '1' when ((rb_irout(15 downto 12) = "0000") and (rb_irout(1 downto 0) = "01") and (rb_irout(5 downto 3) = "111")) else
									'1' when ((rb_irout(15 downto 12) = "0010") and (rb_irout(1 downto 0) = "01") and (rb_irout(5 downto 3) = "111")) else
									'0';
		dependency_c <= '1' when ((rb_irout(15 downto 12) = "0000") and (rb_irout(1 downto 0) = "10")) else
						'1' when ((rb_irout(15 downto 12) = "0010") and (rb_irout(1 downto 0) = "10")) else
						'0';		
		dependency_z <= '1' when ((rb_irout(15 downto 12) = "0000") and (rb_irout(1 downto 0) = "01")) else
						'1' when ((rb_irout(15 downto 12) = "0010") and (rb_irout(1 downto 0) = "01")) else
						'0';

		alu_in_a <= rb_op1out when rb_irout(15 downto 14) = "00" else
					rb_pcout when rb_irout(15 downto 12) = "1100" else "0000000000000000";

		alu_in_b <= rb_op2out when rb_irout(15 downto 12) = "0000" else
					rb_op2out when rb_irout(15 downto 12) = "0010" else
					rbimm6out when rb_irout(15 downto 12) = "0001" else
					rbimm6out when rb_irout(15 downto 12) = "1100" else "0000000000000000";

		ALU_ADD : Add port map (alu_in_a,alu_in_b,alu_add_out,alu_p_c);
		alu_nand_out <= (alu_in_a nand alu_in_b);
		ALU_COMP : comp port map (alu_in_a,alu_in_b,alu_p_comp);

		alu_p_out_temp <= alu_add_out when rb_irout(15 downto 12) = "0000" else
					alu_add_out when rb_irout(15 downto 12) = "0001" else
					alu_add_out when rb_irout(15 downto 12) = "1100" else
					alu_nand_out when rb_irout(15 downto 12) = "0010" else
					rb_pcout when rb_irout(15 downto 13) = "100" else "0000000000000000";

		alu_p_out <= alu_p_out_temp;
		alu_p_z <= '1' when alu_p_out_temp = "0000000000000000" else '0';

		alu_p_valid_out_temp <= '0' when dependency_c = '1' and rb_carryout = '0' else
							'0' when dependency_z = '1'and rb_zeroout = '0' else rb_validout;

		alu_p_valid_out <= alu_p_valid_out_temp;

		alu_p_out <= alu_p_out_temp & alu_p_c & alu_p_z;

		alu_p_brach_taken_temp <= alu_p_comp when rb_irout(15 downto 12) = "1100" else
									'1' when dependency_special_case_c = '1' and rb_carryout = '1' else
									'1' when dependency_special_case_z = '1' and rb_zeroout = '1' else   
									'0';

		alu_p_brach_taken <= alu_p_brach_taken_temp and rb_validout;

		alu_p_brach_nottaken_temp <= not(alu_p_comp) when rb_irout(15 downto 12) = "1100" else
									'1' when dependency_special_case_c = '1' and rb_carryout = '0' else
									'1' when dependency_special_case_z = '1' and rb_zeroout = '0' else   
									'0';


		alu_p_brach_nottaken <= alu_p_brach_nottaken_temp and rb_validout;

		jlr_resolved <= '1' when ((rb_irout(15 downto 12) = "1001") and (rb_validout = '1')) else '0';

		alu_r7_resolved <= '1' when ((rb_irout(15 downto 12) = "0000") and (rb_irout(1 downto 0) = "00") and (rb_irout(5 downto 3) = "111") and (rb_validout = '1')) else
							'1' when ((rb_irout(15 downto 12) = "0010") and (rb_irout(1 downto 0) = "00") and (rb_irout(5 downto 3) = "111") and (rb_validout = '1')) else
							'1' when ((rb_irout(15 downto 12) = "0001") and (rb_irout(8 downto 6) = "111") and (rb_validout = '1')) else
							'0';

		alu_p_arf_en <= '0' when rb_irout(15 downto 12) = "1100" else
						'0' when dependency_special_case_z = '1' else
						'0' when dependency_special_case_c = '1' else
						alu_p_valid_out_temp;
							
									
	end architecture behave;
					 
