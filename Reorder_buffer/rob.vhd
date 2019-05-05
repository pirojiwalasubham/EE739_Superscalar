library std;
use std.standard.all;

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_misc.all;


entity rob is 
	port(
		clk,reset : in std_logic;
		pc_1_in, pc_2_in, dest_1_in, dest_2_in, ir_1_in, ir_2_in, result_1_in, result_2_in, pc_exec_1_in, pc_exec_2_in : in std_logic_vector(15 downto 0);
		dest_tag_1_in, dest_tag_2_in : in std_logic_vector(4 downto 0);
		spec_tag_1_in, spec_tag_2_in : in std_logic_vector(1 downto 0);
		valid_1_in, valid_2_in, complete_exec_1_in, complete_exec_2_in, mr_1_in, mr_2_in, c_1_in, c_2_in, z_1_in, z_2_in, cwr_1_in, cwr_2_in, zwr_1_in, zwr_2_in : in std_logic;

		rsfull : out std_logic
		); -- output
end rob;

architecture behave of rob is

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


	type s_16 is array (0 to 31) of std_logic_vector(15 downto 0);
	type s_5 is array (0 to 31) of std_logic_vector(4 downto 0);
	type s_2 is array (0 to 31) of std_logic_vector(1 downto 0);
	type s_1 is array (0 to 31) of std_logic;
	
	signal pc, dest, ir, result,pc_exec, pc_out, dest_out, ir_out, result_out, pc_exec_out : s_16;
	signal dest_tag_out, dest_tag : s_5;
	signal spec_tag_out, spec_tag : s_2;
	signal en,valid, complete_exec, mr, c, z, cwr, zwr, valid_out, complete_exec_out, mr_out, c_out, z_out, cwr_out, zwr_out : s_1;

	


	begin

	ReorderBuffer : for i in 0 to 31 generate
		rob_pc : myRegister generic map (16) port map (clk,en(i),reset,pc(i),pc_out(i));
		rob_dest : myRegister generic map (16) port map (clk,en(i),reset,dest(i),dest_out(i));
		rob_ir : myRegister generic map (16) port map (clk,en(i),reset,ir(i),ir_out(i));
		rob_pc_exec : myRegister generic map (16) port map (clk,en(i),reset,pc_exec(i),pc_exec_out(i));
		rob_dest_tag : myRegister generic map (5) port map (clk,en(i),reset,dest_tag(i),dest_tag_out(i));
		rob_spec_tag : myRegister generic map (2) port map (clk,en(i),reset,spec_tag(i),spec_tag_out(i));
		rob_complete_exec : bit_register port map (clk,en(i),reset,complete_exec(i),complete_exec_out(i));
		rob_mr : bit_register port map (clk,en(i),reset,mr(i),mr_out(i));
		rob_c : bit_register port map (clk,en(i),reset,c(i),c_out(i));
		rob_z : bit_register port map (clk,en(i),reset,z(i),z_out(i));
		rob_cwr : bit_register port map (clk,en(i),reset,cwr(i),cwr_out(i));
		rob_zwr : bit_register port map (clk,en(i),reset,zwr(i),zwr_out(i));
		rob_valid : bit_register port map (clk,en(i),reset,valid(i),valid_out(i));

	end generate ReorderBuffer;















