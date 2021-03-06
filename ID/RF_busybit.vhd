library ieee;
use ieee.std_logic_1164.all;
use ieee.math_real.all;
use ieee.numeric_std.all;

entity RF_busybit is
	port(
		Ard_1,Ard_2,Ard_3,Ard_4,Ard_5,Ard_6,Awr_1,Awr_2 ,Awr_3,Awr_4 : in std_logic_vector(2 downto 0);
		Din_1,Din_2, Din_3, Din_4 : std_logic;
		RF_write1,RF_write2,RF_write3,RF_write4,clk,clr : in std_logic;
		Dout_1,Dout_2,Dout_3,Dout_4,Dout_5,Dout_6: out std_logic
		);
end entity;

architecture behave of RF_busybit is
	component bit_register is
	port(
		clk,wr,clr : in std_logic;
		din : in std_logic;
		dout :out std_logic
		);	
end component ;

	signal reg_data0,reg_data1,reg_data2,reg_data3,reg_data4,reg_data5,reg_data6,reg_data7,Data0,Data1,Data2,Data3,Data4,Data5,Data6,Data7 : std_logic;
	signal en_vec,en_vec1,en_vec2,en_vec3,en_vec4 : std_logic_vector(7 downto 0);
	signal e : std_logic;
begin
	

	en_vec1 <= "00000001" when ((Awr_1="000") and (RF_write1='1')) else
			 "00000010" when ((Awr_1="001") and (RF_write1='1')) else
			 "00000100" when ((Awr_1="010") and (RF_write1='1')) else
			 "00001000" when ((Awr_1="011") and (RF_write1='1')) else
			 "00010000" when ((Awr_1="100") and (RF_write1='1')) else
			 "00100000" when ((Awr_1="101") and (RF_write1='1')) else
			 "01000000" when ((Awr_1="110") and (RF_write1='1')) else
			 "10000000" when ((Awr_1="111") and (RF_write1='1')) else
			"00000000";

	en_vec2 <= "00000001" when ((Awr_2="000") and (RF_write2='1')) else
			 "00000010" when ((Awr_2="001") and (RF_write2='1')) else
			 "00000100" when ((Awr_2="010") and (RF_write2='1')) else
			 "00001000" when ((Awr_2="011") and (RF_write2='1')) else
			 "00010000" when ((Awr_2="100") and (RF_write2='1')) else
			 "00100000" when ((Awr_2="101") and (RF_write2='1')) else
			 "01000000" when ((Awr_2="110") and (RF_write2='1')) else
			 "10000000" when ((Awr_2="111") and (RF_write2='1')) else
			"00000000";
	en_vec3 <= "00000001" when ((Awr_3="000") and (RF_write3='1')) else
			 "00000010" when ((Awr_3="001") and (RF_write3='1')) else
			 "00000100" when ((Awr_3="010") and (RF_write3='1')) else
			 "00001000" when ((Awr_3="011") and (RF_write3='1')) else
			 "00010000" when ((Awr_3="100") and (RF_write3='1')) else
			 "00100000" when ((Awr_3="101") and (RF_write3='1')) else
			 "01000000" when ((Awr_3="110") and (RF_write3='1')) else
			 "10000000" when ((Awr_3="111") and (RF_write3='1')) else
			"00000000";
	en_vec4 <= "00000001" when ((Awr_4="000") and (RF_write4='1')) else
			 "00000010" when ((Awr_4="001") and (RF_write4='1')) else
			 "00000100" when ((Awr_4="010") and (RF_write4='1')) else
			 "00001000" when ((Awr_4="011") and (RF_write4='1')) else
			 "00010000" when ((Awr_4="100") and (RF_write4='1')) else
			 "00100000" when ((Awr_4="101") and (RF_write4='1')) else
			 "01000000" when ((Awr_4="110") and (RF_write4='1')) else
			 "10000000" when ((Awr_4="111") and (RF_write4='1')) else
			"00000000";

	Data0 <= Din_1 when(en_vec1(0) = '1') else
			Din_2 when(en_vec2(0) = '1') else
			Din_3 when(en_vec3(0) = '1') else
			Din_4;
	Data1 <= Din_1 when(en_vec1(1) = '1') else
			Din_2 when(en_vec2(1) = '1') else
			Din_3 when(en_vec3(1) = '1') else
			Din_4;
	Data2 <= Din_1 when(en_vec1(2) = '1') else
			Din_2 when(en_vec2(2) = '1') else
			Din_3 when(en_vec3(2) = '1') else
			Din_4;
	Data3 <= Din_1 when(en_vec1(3) = '1') else
			Din_2 when(en_vec2(3) = '1') else
			Din_3 when(en_vec3(3) = '1') else
			Din_4;
	Data4 <= Din_1 when(en_vec1(4) = '1') else
			Din_2 when(en_vec2(4) = '1') else
			Din_3 when(en_vec3(4) = '1') else
			Din_4;
	Data5 <= Din_1 when(en_vec1(5) = '1') else
			Din_2 when(en_vec2(5) = '1') else
			Din_3 when(en_vec3(5) = '1') else
			Din_4;
	Data6 <= Din_1 when(en_vec1(6) = '1') else
			Din_2 when(en_vec2(6) = '1') else
			Din_3 when(en_vec3(6) = '1') else
			Din_4;
	Data7 <= Din_1 when(en_vec1(7) = '1') else
			Din_2 when(en_vec2(7) = '1') else
			Din_3 when(en_vec3(7) = '1') else
			Din_4;
	en_vec <= en_vec1 or en_vec2 or en_vec3 or en_vec4;

	
	R0: bit_Register port map (clk,en_vec(0),clr,Data0, reg_data0);
	R1: bit_register port map (clk,en_vec(1),clr,Data1, reg_data1);
	R2: bit_register port map (clk,en_vec(2),clr,Data2, reg_data2);
	R3: bit_register port map (clk,en_vec(3),clr,Data3, reg_data3);
	R4: bit_register port map (clk,en_vec(4),clr,Data4, reg_data4);
	R5: bit_register port map (clk,en_vec(5),clr,Data5, reg_data5);
	R6: bit_register port map (clk,en_vec(6),clr,Data6, reg_data6);
	R7: bit_register port map (clk,en_vec(7),clr,Data7, reg_data7);

	Dout_1 <= reg_data0 when (Ard_1="000" ) else
	   reg_data1 when (Ard_1="001" ) else
	   reg_data2 when (Ard_1="010" ) else
	   reg_data3 when (Ard_1="011" ) else
	   reg_data4 when (Ard_1="100" ) else
	   reg_data5 when (Ard_1="101" ) else
	   reg_data6 when (Ard_1="110" ) else
	   reg_data7 when (Ard_1="111" ) else
	   '0';

	Dout_2 <= reg_data0 when (Ard_2="000" ) else
	    reg_data1 when (Ard_2="001" ) else
	    reg_data2 when (Ard_2="010" ) else
	    reg_data3 when (Ard_2="011" ) else
	    reg_data4 when (Ard_2="100" ) else
	    reg_data5 when (Ard_2="101" ) else
	    reg_data6 when (Ard_2="110" ) else
	    reg_data7 when (Ard_2="111" ) else
	    '0';

	Dout_3 <= reg_data0 when (Ard_3="000" ) else
	    reg_data1 when (Ard_3="001" ) else
	    reg_data2 when (Ard_3="010" ) else
	    reg_data3 when (Ard_3="011" ) else
	    reg_data4 when (Ard_3="100" ) else
	    reg_data5 when (Ard_3="101" ) else
	    reg_data6 when (Ard_3="110" ) else
	    reg_data7 when (Ard_3="111" ) else
	    '0';

	Dout_4 <= reg_data0 when (Ard_4="000" ) else
	    reg_data1 when (Ard_4="001" ) else
	    reg_data2 when (Ard_4="010" ) else
	    reg_data3 when (Ard_4="011" ) else
	    reg_data4 when (Ard_4="100" ) else
	    reg_data5 when (Ard_4="101" ) else
	    reg_data6 when (Ard_4="110" ) else
	    reg_data7 when (Ard_4="111" ) else
	    '0';	

	Dout_5 <= reg_data0 when (Ard_5="000" ) else
	    reg_data1 when (Ard_5="001" ) else
	    reg_data2 when (Ard_5="010" ) else
	    reg_data3 when (Ard_5="011" ) else
	    reg_data4 when (Ard_5="100" ) else
	    reg_data5 when (Ard_5="101" ) else
	    reg_data6 when (Ard_5="110" ) else
	    reg_data7 when (Ard_5="111" ) else
	    '0';	

	Dout_6 <= reg_data0 when (Ard_6="000" ) else
	    reg_data1 when (Ard_6="001" ) else
	    reg_data2 when (Ard_6="010" ) else
	    reg_data3 when (Ard_6="011" ) else
	    reg_data4 when (Ard_6="100" ) else
	    reg_data5 when (Ard_6="101" ) else
	    reg_data6 when (Ard_6="110" ) else
	    reg_data7 when (Ard_6="111" ) else
	    '0';	
	
end architecture behave;