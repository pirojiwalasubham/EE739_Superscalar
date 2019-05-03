library ieee;
use ieee.numeric_std.all;
use ieee.std_logic_1164.all;


entity IF is
	generic(
			data_length_pc : integer := 16
			);
	port(clk, reset: in std_logic ;
		S0,S1,S2,S3:in std_logic;
		pc_en: in std_logic_vector;
		 adder2_out, adder3_out, rb_op2, adder4_out,alu1_out, ZA7_1_out, ZA7_2_out, dmem_out  : in std_logic_vector(15 downto 0) ;
		 ra1_pc, ra2_pc, ra1_ir, ra2_ir : out std_logic_vector(15 downto 0));
end entity;


architecture behave of IITB_RISC is

	component myRegister is
			generic(
			data_length: integer);
			port (
			clk,wr,clr : in std_logic;
			din : in std_logic_vector(data_length-1 downto 0);
			dout :out std_logic_vector(data_length-1 downto 0));
	end component myRegister;

	component ram IS
	PORT
	(
		address		: IN STD_LOGIC_VECTOR (15 DOWNTO 0);
		clock		: IN STD_LOGIC  := '1';
		data		: IN STD_LOGIC_VECTOR (15 DOWNTO 0);
		rden		: IN STD_LOGIC  := '1';
		wren		: IN STD_LOGIC ;
		q		: OUT STD_LOGIC_VECTOR (15 DOWNTO 0)
	);
	END component ram;

	component add2 is
   		port(alu_a: in std_logic_vector(15 downto 0);
			alu_out: out std_logic_vector(15 downto 0) );
	end component;

	component mux6_16 is
   		port(S0,S1,S2,S3:in std_logic;    --S2 is MSB
		D0,D1,D2,D3,D4,D5,D6,D7,D8:in std_logic_vector(15 downto 0);
		Y:out std_logic_vector(15 downto 0));
	end component;
	

	signal pc_out : std_logic_vector(15 downto 0);
begin
		
		PC : myRegister generic map(data_length_pc) port map ( clk, pc_en, reset, pc_in, pc_out); 
		MUX : mux6_16 port map (S0,S1,S2,S3, adder1_out, adder2_out, adder3_out, rb_op2, adder4_out,alu1_out, ZA7_1_out, ZA7_2_out, dmem_out, pc_in);



















