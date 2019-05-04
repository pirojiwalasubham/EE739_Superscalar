library std;
use std.standard.all;

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_misc.all;

entity alu_p is
	port(
		clk, reset: in std_logic ;
		rbpc,rbop1,rbop2 : in std_logic_vector(15 downto 0);
--		rbimm9 : in std_logic_vector(8 downto 0);
		rbimm6 : in std_logic_vector(5 downto 0);
		rbdest_rrtag : in std_logic_vector(4 downto 0);
		rbopcode : in std_logic_vector(3 downto 0);
		rbvalid,rbdestr7 : in std_logic;
		alu_p_out : out std_logic_vector(15 downto 0);
		alu_p_c,alu_p_z,alu_p_comp : out std_logic
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

	signal rbpcout,rbop1out,rbop2out,alu_in_a,alu_in_b,alu_add_out,alu_nand_out : std_logic_vector (15 downto 0);
--	signal rbimm9out : std_logic_vector (8 downto 0);
	signal rbimm6out : std_logic_vector (5 downto 0);
	signal rbdest_rrtagout : std_logic_vector (4 downto 0);
	signal rbopcodeout : std_logic_vector (3 downto 0);
	signal rbdestr7out : std_logic;

	begin

		RB_PC : myRegister generic map (16) port map (clk,rbvalid,reset,rbpc,rbpcout);
		RB_OP1 : myRegister generic map (16) port map (clk,rbvalid,reset,rbop1,rbop1out);
		RB_OP2 : myRegister generic map (16) port map (clk,rbvalid,reset,rbop2,rbop2out);
--		RB_IMM9 : myRegister generic map (9) port map (clk,rbvalid,reset,rbimm9,rbimm9out);
		RB_IMM6 : myRegister generic map (6) port map (clk,rbvalid,reset,rbimm6,rbimm6out);
		RB_RRTAG : myRegister generic map (5) port map (clk,rbvalid,reset,rbdest_rrtag,rbdest_rrtagout);
		RB_OPCODE : myRegister generic map (4) port map (clk,rbvalid,reset,rbopcode,rbopcodeout);
		RB_DEST_R7 : bit_register port map (clk, rbvalid, reset, rbdestr7, rbdestr7out);

		
		alu_in_a <= rbop1out when rbopcodeout(3 downto 2) = "00" else
					rbpcout when rbopcodeout = "1100" else "0000000000000000";

		alu_in_b <= rbop2out when rbopcodeout = "0000" else
					rbop2out when rbopcodeout = "0010" else
					rbimm6out when rbopcodeout = "0001" else
					rbimm6out when rbopcodeout = "1100" else "0000000000000000";

		ALU_ADD : Add port map (alu_in_a,alu_in_b,alu_add_out,alu_p_c);
		alu_nand_out <= (alu_in_a nand alu_in_b);
		ALU_COMP : comp port map (alu_in_a,alu_in_b,alu_p_comp);

		alu_p_out <= alu_add_out when rbopcodeout = "0000" else
					alu_add_out when rbopcodeout = "0001" else
					alu_add_out when rbopcodeout = "1100" else
					alu_nand_out when rbopcodeout = "0010" else "0000000000000000";

		alu_p_z <= '1' when alu_p_out = "0000000000000000" else '0';

	end architecture behave;
					 
