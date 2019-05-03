library ieee;
use ieee.numeric_std.all;
use ieee.std_logic_1164.all;


entity IF is
	generic(
			data_length16: integer := 16
			data_length1: integer := 1
			);
	port(clk, reset, reset_bar: in std_logic ;
		S0,S1,S2,S3:in std_logic;
		pc_en: in std_logic_vector;
		ra1_invalidate, ra2_invalidate, ra_en : in std_logic;
		 adder2_out, adder3_out, rb_op2, adder4_out,alu1_out, ZA7_1_out, ZA7_2_out, dmem_out  : in std_logic_vector(15 downto 0) ;
		 ra1_inv_out, ra2_inv_out : out std_logic;
		 ra1_pc_out, ra1_ir_out ,ra2_pc_out, ra2_ir_out : out std_logic_vector(15 downto 0));
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
	component add1 is
   		port(alu_a: in std_logic_vector(15 downto 0);
			alu_out: out std_logic_vector(15 downto 0) );
	end component;

	component mux6_16 is
   		port(S0,S1,S2,S3:in std_logic;    --S2 is MSB
		D0,D1,D2,D3,D4,D5,D6,D7,D8:in std_logic_vector(15 downto 0);
		Y:out std_logic_vector(15 downto 0));
	end component;
	

	signal pc_out, pc_in, pc_out, adder1_out, pc_out_plus1, imem_dout1, imem_dout2, : std_logic_vector(15 downto 0);
	signal ra1_inv_in, ra2_inv_in : std_logic;
begin
		
		ra1_inv_in <= '1' when (ra1_invalidate) else '0';	
		ra2_inv_in <= '1' when (ra2_invalidate) else '0';
				
		PC : myRegister generic map(data_length16) port map ( clk, pc_en, reset, pc_in, pc_out); 
		ADDER1 : add2 port map(pc_out, adder1_out);
		PC_PLUS1 : add1 port map(pc_out,pc_out_plus1)
		MUX : mux6_16 port map (S0,S1,S2,S3, adder1_out, adder2_out, adder3_out, rb_op2, adder4_out,alu1_out, ZA7_1_out, ZA7_2_out, dmem_dout, pc_in); 

		IMEM : ram port map(pc_out, clk, "0000000000000000", reset_bar, '0', imem_dout1,imem_dout2);

		RA1_PC : myRegister generic map(data_length16) port map (clk, ra_en, reset, pc_out, ra1_pc_out); 
		RA1_IR : myRegister generic map(data_length16) port map (clk, ra_en, reset, imem_dout1,ra1_ir_out); 
		RA1_INV : myRegister generic map(data_length1) port map (clk, ra_en, reset, ra1_inv_in,ra1_inv_out); 

		RA2_PC : myRegister generic map(data_length16) port map (clk, ra_en, reset, pc_out_plus1, ra2_pc_out); 
		RA2_IR : myRegister generic map(data_length16) port map (clk, ra_en, reset, imem_dout2,ra2_ir_out);
		RA2_INV : myRegister generic map(data_length1) port map (clk, ra_en, reset, ra2_inv_in,ra2_inv_out); 




end architecture behave;














