library ieee;
use ieee.numeric_std.all;
use ieee.std_logic_1164.all;


entity IF is
	generic(
			data_length : integer := 16;
			data_length_ra: integer := 16*3;	
			data_length_rb: integer := 19+16*4;		
			control_length: integer := 19	
			);
	port(clk, reset_bar, Clock_50: in std_logic
			);
end entity;


architecture behave of IITB_RISC is

component PC_mux_select is
	port (
		-- inputs are all pipeline registers and intermediate stuff in datapath
		-- outputs 
		dmemd_out, ra_ir,rb_ir,rc_ir,rd_ir,rc_alu_out3, alu_out2, rf_d2, alu_out3, za7, alu_out1: in std_logic_vector ( 15 downto 0);
		ra_inv,rb_inv, rc_inv,rd_inv, temp_z : in std_logic;
		pc_in : out std_logic_vector( 15 downto 0 )


	);
	end component PC_mux_select;

	component bit_register is
		port(
			clk,wr,clr : in std_logic;
			din : in std_logic;
			dout :out std_logic
			);	
	end component bit_register;


	component myRegister is
			generic(
			data_length: integer);
			port (
			clk,wr,clr : in std_logic;
			din : in std_logic_vector(data_length-1 downto 0);
			dout :out std_logic_vector(data_length-1 downto 0));
	end component myRegister;


