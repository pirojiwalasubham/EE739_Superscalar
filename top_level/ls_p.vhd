library std;
use std.standard.all;

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_misc.all;

entity ls_p is
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
end entity;


architecture behave of ls_p is

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

	component bit_register is
		port(
			clk,wr,clr : in std_logic;
			din : in std_logic;
			dout :out std_logic
			);	
	end component bit_register;

	signal rc_pcout,rc_op1out,rc_op2out,add_in_a,add_in_b,add_out,rc_irout,rcimm6out,ls_p_data_out_temp : std_logic_vector (15 downto 0);
	signal rc_dest_rrtagout,rc_carrytagout, rc_zerotagout : std_logic_vector (4 downto 0);
	signal rc_spectagout : std_logic_vector(1 downto 0);
	signal alu_p_brach_taken_temp, rc_validout,rc_carryout,rc_zeroout,rc_carryreadyout,rc_zeroreadyout,unused_c: std_logic;

	begin

		rcimm6out <= "1111111111" & rc_irout(5 downto 0) when rc_irout(5) = '1' else
					"0000000000" & rc_irout(5 downto 0);

		rcimm9out <= rc_irout(8 downto 0) & "0000000";

		RC_PC : myRegister generic map (16) port map (clk,'1',reset,rc_pc,rc_pcout);
		RC_OP1 : myRegister generic map (16) port map (clk,'1',reset,rc_op1,rc_op1out);
		RC_OP2 : myRegister generic map (16) port map (clk,'1',reset,rc_op2,rc_op2out);
		RC_IR : myRegister generic map (16) port map (clk,'1',reset,rc_ir,rc_irout);

		RC_CARRY_TAG : myRegister generic map (5) port map (clk,'1',reset,rc_carrytag,rc_carrytagout);
		RC_ZERO_TAG : myRegister generic map (5) port map (clk,'1',reset,rc_zerotag,rc_zerotagout);
		RC_RRTAG : myRegister generic map (5) port map (clk,'1',reset,rc_dest_rrtag,rc_dest_rrtagout);
	
		RC_SPECTAG : myRegister generic map (2) port map (clk,'1',reset,rc_spectag,rc_spectagout);
				
		RC_VALID : bit_register port map (clk, '1', reset, rc_valid, rc_validout);
		RC_CARRY : bit_register port map (clk, '1', reset, rc_carry, rc_carryout);
		RC_CARRY_READY : bit_register port map (clk, '1', reset, rc_carryready, rc_carryreadyout);
		RC_ZERO : bit_register port map (clk, '1', reset, rc_zero, rc_zeroout);
		RC_ZERO_READY : bit_register port map (clk, '1', reset, rc_zeroready, rc_zeroreadyout);

		rrf_tag_out <= rc_dest_rrtagout;

		add_in_a <= rcimm6out when rc_irout(15 downto 12) = "0100" else
					rcimm6out when rc_irout(15 downto 12) = "0101" else
					rc_op1out when rc_irout(15 downto 12) = "0110" else
					rc_op1out when rc_irout(15 downto 12) = "0111" else
					"0000000000000000";

		add_in_a <= rc_op2out when rc_irout(15 downto 12) = "0100" else
					rc_op2out when rc_irout(15 downto 12) = "0101" else
					"0000000000000000";

		ADDER : Add port map (add_in_a,add_in_b,add_out,unused_c);

		mem_read_en <= '1' when ((rc_irout(15 downto 12) = "0100") and (rc_validout = '1')) else
						'1' when ((rc_irout(15 downto 12) = "0110") and (rc_validout = '1')) else
						'0';
		--mem_write_en <= '1' when ((rc_irout(15 downto 12) = "0101") and (rc_validout = '1')) else
		--				'1' when ((rc_irout(15 downto 12) = "0111") and (rc_validout = '1')) else
		--				'0';

		read_addr <= add_out;
		write_addr <= add_out;

		ls_p_data_out_temp <= rc_op1out when rc_irout(15 downto 12) = "0101" else
						rc_op2out when rc_irout(15 downto 12) = "0111" else
						rcimm9out when rc_irout(15 downto 12) = "0011" else 
						read_datafrommem;


		lw_r7_resolved <= '1' when ((rc_irout(15 downto 12) = "0100") and (rc_validout = '1') and (rc_irout(11 downto 9) = "111")) else '0';

		ls_p_z <= or_reduce(read_datafrommem);

		ls_p_data_out <= ls_p_data_out_temp & '0' & ls_p_z;

		rrf_en_out <= '1' when rc_irout(15 downto 12) = "0100" else
						'1' when rc_irout(15 downto 12) = "0110" else '0';

		ls_p_val_out <= rc_validout;
					
									
	end architecture behave;
					 
