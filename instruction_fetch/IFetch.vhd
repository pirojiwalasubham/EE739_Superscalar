library ieee;
use ieee.numeric_std.all;
use ieee.std_logic_1164.all;


entity IFetch is
	generic(
			data_length16: integer := 16
			);
	port(clk, reset, reset_bar: in std_logic ;
		S0,S1,S2,S3:in std_logic;
		pc_en: in std_logic;
		ra1_invalidate, ra2_invalidate, ra_en : in std_logic;
		 adder2_out, adder3_out, rb_op2, adder4_out,alu1_out, ZA7_1_out, ZA7_2_out, dmem_dout  : in std_logic_vector(15 downto 0) ;
		 ra1_inv_out, ra2_inv_out : out std_logic;
		 ra1_pc_out, ra1_ir_out ,ra2_pc_out, ra2_ir_out : out std_logic_vector(15 downto 0));
end entity;


architecture behave of IFetch is

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
		q,q2		: OUT STD_LOGIC_VECTOR (15 DOWNTO 0)
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

	component mux9_16 is
   		port(S0,S1,S2,S3:in std_logic;    --S2 is MSB
		D0,D1,D2,D3,D4,D5,D6,D7,D8:in std_logic_vector(15 downto 0);
		Y:out std_logic_vector(15 downto 0));
	end component;
	component bit_register is
		port(
			clk,wr,clr : in std_logic;
			din : in std_logic;
			dout :out std_logic
			);	
	end component bit_register;
	

	signal pc_out, temp_pc, adder1_out, pc_in_plus1, imem_dout1, imem_dout2 : std_logic_vector(15 downto 0);
	signal pc_in : std_logic_vector(15 downto 0) := "0000000000000000";
	signal ra1_inv_in, ra2_inv_in : std_logic;
begin
		
		ra1_inv_in <= '1' when (ra1_invalidate = '1') else '0';	
		ra2_inv_in <= '1' when (ra2_invalidate = '1') else '0';
				
		PC : myRegister generic map(data_length16) port map ( clk, pc_en, reset, adder1_out, pc_out); 
		ADDER1 : add2 port map(temp_pc, adder1_out);
		PC_PLUS1 : add1 port map(pc_in,pc_in_plus1);
		IMEM : ram port map(pc_in, clk, "0000000000000000", reset_bar, '0', imem_dout1,imem_dout2);

		RA1_PC : myRegister generic map(data_length16) port map (clk, ra_en, reset, pc_in, ra1_pc_out); 
		RA1_IR : myRegister generic map(data_length16) port map (clk, ra_en, reset, imem_dout1,ra1_ir_out); 
		RA1_INV : bit_register port map (clk, ra_en, reset, ra1_inv_in,ra1_inv_out); 

		RA2_PC : myRegister generic map(data_length16) port map (clk, ra_en, reset, pc_in_plus1, ra2_pc_out); 
		RA2_IR : myRegister generic map(data_length16) port map (clk, ra_en, reset, imem_dout2,ra2_ir_out);
		RA2_INV : bit_register port map (clk, ra_en, reset, ra2_inv_in,ra2_inv_out); 

		MUX2 : mux9_16 port map (S0,S1,S2,S3, pc_out, adder2_out, adder3_out, rb_op2, adder4_out,alu1_out, ZA7_1_out, ZA7_2_out, dmem_dout, temp_pc); 

		pc_in <= "0000000000000000" when reset ='1' else temp_pc;

		--process(clk, reset)
		--begin
		--	if (clk'event and clk = '1') then 
		--		if (reset = '1') then
		--			pc_in <= "0000000000000000";
		--		else
		--			pc_in <= temp_pc;
		--		end if;
		--	end if;
		--end process;
end architecture behave;














