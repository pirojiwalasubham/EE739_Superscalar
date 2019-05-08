library std;
use std.standard.all;

library ieee;
use ieee.std_logic_1164.all;
use ieee.math_real.all;
use ieee.numeric_std.all;

entity alu_p is
	port(
		clk, reset: in std_logic ;
		rb_pc,rb_op1,rb_op2, rb_ir : in std_logic_vector(15 downto 0);
		rb_dest_rrtag,rb_carrytag,rb_zerotag : in std_logic_vector(4 downto 0);
		rb_spectag : in std_logic_vector(1 downto 0);
		rrf_valid_vect_in : in std_logic_vector(31 downto 0);
		rb_valid,rbdestr7,rb_carry,rb_carryready,rb_zero,rb_zeroready : in std_logic;


		alu_p_out : out std_logic_vector(17 downto 0);
		rrf_tag_out : out std_logic_vector(4 downto 0);
		rrf_valid_vect_alu_p_out : out std_logic_vector(31 downto 0);
		alu_p_c,alu_p_z,alu_p_brach_taken,alu_p_brach_nottaken,jlr_resolved,alu_r7_resolved,alu_p_valid_out, alu_p_rrf_en, alu_p_no_ans : out std_logic;
		alu_p_pc_out,rb_op2_out : out std_logic_vector(15 downto 0)
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

	signal dependency_special_case_c,dependency_special_case_z, dependency_c ,dependency_z, alu_p_z_temp, alu_p_c_temp: std_logic;

	begin



		rbimm6out <= "1111111111" & rb_irout(5 downto 0) when rb_irout(5) = '1' else
					"0000000000" & rb_irout(5 downto 0);

		RB_P_C : myRegister generic map (16) port map (clk,'1',reset,rb_pc,rb_pcout);
		RB_O_P1 : myRegister generic map (16) port map (clk,'1',reset,rb_op1,rb_op1out);
		R_B_OP2 : myRegister generic map (16) port map (clk,'1',reset,rb_op2,rb_op2out);
		RB_I_R : myRegister generic map (16) port map (clk,'1',reset,rb_ir,rb_irout);

		R_B_CARRY_TAG : myRegister generic map (5) port map (clk,'1',reset,rb_carrytag,rb_carrytagout);
		RB_Z_ERO_TAG : myRegister generic map (5) port map (clk,'1',reset,rb_zerotag,rb_zerotagout);
		RB_RR_TAG : myRegister generic map (5) port map (clk,'1',reset,rb_dest_rrtag,rb_dest_rrtagout);
		
		R_B_SPECTAG : myRegister generic map (2) port map (clk,'1',reset,rb_spectag,rb_spectagout);
				
		R_B_DEST_R7 : bit_register port map (clk, '1', reset, rbdestr7, rbdestr7out);
		R_B_VALID : bit_register port map (clk, '1', reset, rb_valid, rb_validout);
		RB_C_ARRY : bit_register port map (clk, '1', reset, rb_carry, rb_carryout);
		RB_CA_RRY_READY : bit_register port map (clk, '1', reset, rb_carryready, rb_carryreadyout);
		RB_ZER_O : bit_register port map (clk, '1', reset, rb_zero, rb_zeroout);
		RB_ZER_O_READY : bit_register port map (clk, '1', reset, rb_zeroready, rb_zeroreadyout);
		alu_p_pc_out<= rb_pcout;
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

		ALU_ADD : Add port map (alu_in_a,alu_in_b,alu_add_out,alu_p_c_temp);
		alu_nand_out <= (alu_in_a nand alu_in_b);
		ALU_COMP : comp port map (alu_in_a,alu_in_b,alu_p_comp);

		alu_p_out_temp <= alu_add_out when rb_irout(15 downto 12) = "0000" else
					alu_add_out when rb_irout(15 downto 12) = "0001" else
					alu_add_out when rb_irout(15 downto 12) = "1100" else
					alu_nand_out when rb_irout(15 downto 12) = "0010" else
					rb_pcout when rb_irout(15 downto 13) = "100" else "0000000000000000";

		alu_p_z_temp <= '1' when alu_p_out_temp = "0000000000000000" else '0';

		alu_p_valid_out_temp <= '1' when dependency_c = '1' and rb_carryout = '0' else
							'1' when dependency_z = '1'and rb_zeroout = '0' else '0';

		alu_p_no_ans <= alu_p_valid_out_temp;

		alu_p_valid_out <= rb_validout;

		rb_op2_out <= rb_op1out;

		alu_p_out <= alu_p_out_temp & alu_p_c_temp & alu_p_z_temp;
		alu_p_z<=alu_p_z_temp;
		alu_p_c <= alu_p_c_temp;
		process(rrf_valid_vect_in, rb_dest_rrtagout,rb_validout)
		begin 

			rrf_valid_vect_alu_p_out <= rrf_valid_vect_in;

			if rb_validout = '1' then
				rrf_valid_vect_alu_p_out(to_integer(unsigned(rb_dest_rrtagout))) <= '1';				
			end if ;

-------------------------------
			--a3: for i in 0 to 31 loop
			--if (i = to_integer(unsigned(rb_dest_rrtagout))) then
			--	rrf_valid_vect_alu_p_out(i) <= '1';
			--else
			--	rrf_valid_vect_alu_p_out(i) <= rrf_valid_vect_in(i);
			--end if ;
			--end loop a3;

		end process;
		 
		

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

		alu_p_rrf_en <= '0' when rb_irout(15 downto 12) = "1100" else
						'0' when dependency_special_case_z = '1' else
						'0' when dependency_special_case_c = '1' else
						(not(alu_p_valid_out_temp) and rb_validout);
							
									
	end architecture behave;
					 
