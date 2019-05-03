library ieee;
use ieee.std_logic_1164.all;
use ieee.math_real.all;
use ieee.numeric_std.all;

entity RF is
	generic(
		data_length: integer := 16		);
	port(
		A1,A2,A3 : in std_logic_vector(2 downto 0);
		D3 : in std_logic_vector(15 downto 0);
		RF_write,clk,clr : in std_logic;
		D1,D2 : out std_logic_vector( 15 downto 0)
		);
end entity;

architecture behave of RF is
	component myRegister is
		generic(
		data_length: integer );
		port (
		clk,wr,clr : in std_logic;
		din : in std_logic_vector(data_length-1 downto 0);
		dout :out std_logic_vector(data_length-1 downto 0));
	end component;
	signal reg_data0,reg_data1,reg_data2,reg_data3,reg_data4,reg_data5,reg_data6,reg_data7 : std_logic_vector(15 downto 0);
	signal en_vec : std_logic_vector(7 downto 0);
	signal e : std_logic;
begin
	en_vec  <= "00000001" when ((A3="000") and (RF_write='1')) else
			 "00000010" when ((A3="001") and (RF_write='1')) else
			 "00000100" when ((A3="010") and (RF_write='1')) else
			 "00001000" when ((A3="011") and (RF_write='1')) else
			 "00010000" when ((A3="100") and (RF_write='1')) else
			 "00100000" when ((A3="101") and (RF_write='1')) else
			 "01000000" when ((A3="110") and (RF_write='1')) else
			 "10000000" when ((A3="111") and (RF_write='1')) else
			"00000000";
	--e<=en_vec(0);
	--reg_data(0)<=std_logic_vecot"0000000000000000";
	R0: myRegister generic map(16) port map (clk,en_vec(0),clr,D3, reg_data0);
	R1: myRegister generic map(16) port map (clk,en_vec(1),clr,D3, reg_data1);
	R2: myRegister generic map(16) port map (clk,en_vec(2),clr,D3, reg_data2);
	R3: myRegister generic map(16) port map (clk,en_vec(3),clr,D3, reg_data3);
	R4: myRegister generic map(16) port map (clk,en_vec(4),clr,D3, reg_data4);
	R5: myRegister generic map(16) port map (clk,en_vec(5),clr,D3, reg_data5);
	R6: myRegister generic map(16) port map (clk,en_vec(6),clr,D3, reg_data6);
	R7: myRegister generic map(16) port map (clk,en_vec(7),clr,D3, reg_data7);

	D1 <= reg_data0 when (A1="000" ) else
	   reg_data1 when (A1="001" ) else
	   reg_data2 when (A1="010" ) else
	   reg_data3 when (A1="011" ) else
	   reg_data4 when (A1="100" ) else
	   reg_data5 when (A1="101" ) else
	   reg_data6 when (A1="110" ) else
	   reg_data7 when (A1="111" ) else
	   "0000000000000000";

	D2 <= reg_data0 when (A2="000" ) else
	    reg_data1 when (A2="001" ) else
	    reg_data2 when (A2="010" ) else
	    reg_data3 when (A2="011" ) else
	    reg_data4 when (A2="100" ) else
	    reg_data5 when (A2="101" ) else
	    reg_data6 when (A2="110" ) else
	    reg_data7 when (A2="111" ) else
	    "0000000000000000";
	
	
end architecture behave;