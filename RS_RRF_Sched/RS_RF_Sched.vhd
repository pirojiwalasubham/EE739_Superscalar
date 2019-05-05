library std;
use std.standard.all;

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_misc.all;


entity RS_RF_Sched is 
	port(
		clk,reset : in std_logic;
		rrf_Awr1_in, rrf_Awr2_in : in std_logic_vector(4 downto 0);
		rrf_Data1_EX_in, rrf_Data2_EX_in : in std_logic_vector(17 downto 0);
		rrf_free_vec_ID_in, rrf_free_vec_Rob_in : in std_logic_vector(31 downto 0);
		rrf_valid_vec_EX_in, rrf_valid_vec_Rob_in : in std_logic_vector(31 downto 0);

		rrf_free_vec_out, rrf_valid_vec_out : out std_logic_vector(31 downto 0) 

		); 
end RS_RF_Sched;

architecture behave of RS_RF_Sched is

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


	type s_18 is array (0 to 31) of std_logic_vector(17 downto 0);
	type s_1 is array (0 to 31) of std_logic;
	
	signal rrf_P_in, rrf_P_out : s_18;
	signal rrf_busy_reg_in, rrf_busy_reg_out, rrf_valid_reg_in, rrf_valid_reg_out, en_for_P, en_for_busy, en_for_valid : s_1;

	begin

	RRF : for i in 0 to 31 generate
		rrf_P_file : myRegister generic map (18) port map (clk, en_for_P(i), reset, rrf_P_in(i), rrf_P_out(i));
		rrf_busy_file : myRegister generic map (1) port map (clk, '1', reset, rrf_busy_reg_in(i), rrf_busy_reg_out(i));
		rrf_valid_file : myRegister generic map (1) port map (clk, '1', reset, rrf_valid_reg_in(i), rrf_valid_reg_out(i));
	end generate RRF;


  en_vec1 <= "00000000000000000000000000000001" when ((Awr_1="00000") and (RF_write1='1')) else
			 "00000000000000000000000000000010" when ((Awr_1="00001") and (RF_write1='1')) else
			 "00000000000000000000000000000100" when ((Awr_1="00010") and (RF_write1='1')) else
			 "00000000000000000000000000001000" when ((Awr_1="00011") and (RF_write1='1')) else
			 "00000000000000000000000000010000" when ((Awr_1="00100") and (RF_write1='1')) else
			 "00000000000000000000000000100000" when ((Awr_1="00101") and (RF_write1='1')) else
			 "00000000000000000000000001000000" when ((Awr_1="00110") and (RF_write1='1')) else
			 "00000000000000000000000010000000" when ((Awr_1="00111") and (RF_write1='1')) else
			 "00000000000000000000000100000000" when ((Awr_1="01000") and (RF_write1='1')) else
			 "00000000000000000000001000000000" when ((Awr_1="01001") and (RF_write1='1')) else
			 "00000000000000000000010000000000" when ((Awr_1="01010") and (RF_write1='1')) else
			 "00000000000000000000100000000000" when ((Awr_1="01011") and (RF_write1='1')) else
			 "00000000000000000001000000000000" when ((Awr_1="01100") and (RF_write1='1')) else
			 "00000000000000000010000000000000" when ((Awr_1="01101") and (RF_write1='1')) else
			 "00000000000000000100000000000000" when ((Awr_1="01110") and (RF_write1='1')) else
			 "00000000000000001000000000000000" when ((Awr_1="01111") and (RF_write1='1')) else
			 "00000000000000010000000000000000" when ((Awr_1="10000") and (RF_write1='1')) else
			 "00000000000000100000000000000000" when ((Awr_1="10001") and (RF_write1='1')) else
			 "00000000000001000000000000000000" when ((Awr_1="10010") and (RF_write1='1')) else
			 "00000000000010000000000000000000" when ((Awr_1="10011") and (RF_write1='1')) else
			 "00000000000100000000000000000000" when ((Awr_1="10100") and (RF_write1='1')) else
			 "00000000001000000000000000000000" when ((Awr_1="10101") and (RF_write1='1')) else
			 "00000000010000000000000000000000" when ((Awr_1="10110") and (RF_write1='1')) else
			 "00000000100000000000000000000000" when ((Awr_1="10111") and (RF_write1='1')) else
			 "00000001000000000000000000000000" when ((Awr_1="11000") and (RF_write1='1')) else
			 "00000010000000000000000000000000" when ((Awr_1="11001") and (RF_write1='1')) else
			 "00000100000000000000000000000000" when ((Awr_1="11010") and (RF_write1='1')) else
			 "00001000000000000000000000000000" when ((Awr_1="11011") and (RF_write1='1')) else
			 "00010000000000000000000000000000" when ((Awr_1="11100") and (RF_write1='1')) else
			 "00100000000000000000000000000000" when ((Awr_1="11101") and (RF_write1='1')) else
			 "01000000000000000000000000000000" when ((Awr_1="11110") and (RF_write1='1')) else
			 "10000000000000000000000000000000" when ((Awr_1="11111") and (RF_write1='1')) else
			 "00000000000000000000000000000000";

  en_vec2 <= "00000000000000000000000000000001" when ((Awr_2="00000") and (RF_write2='1')) else
			 "00000000000000000000000000000010" when ((Awr_2="00001") and (RF_write2='1')) else
			 "00000000000000000000000000000100" when ((Awr_2="00010") and (RF_write2='1')) else
			 "00000000000000000000000000001000" when ((Awr_2="00011") and (RF_write2='1')) else
			 "00000000000000000000000000010000" when ((Awr_2="00100") and (RF_write2='1')) else
			 "00000000000000000000000000100000" when ((Awr_2="00101") and (RF_write2='1')) else
			 "00000000000000000000000001000000" when ((Awr_2="00110") and (RF_write2='1')) else
			 "00000000000000000000000010000000" when ((Awr_2="00111") and (RF_write2='1')) else
			 "00000000000000000000000100000000" when ((Awr_2="01000") and (RF_write2='1')) else
			 "00000000000000000000001000000000" when ((Awr_2="01001") and (RF_write2='1')) else
			 "00000000000000000000010000000000" when ((Awr_2="01010") and (RF_write2='1')) else
			 "00000000000000000000100000000000" when ((Awr_2="01011") and (RF_write2='1')) else
			 "00000000000000000001000000000000" when ((Awr_2="01100") and (RF_write2='1')) else
			 "00000000000000000010000000000000" when ((Awr_2="01101") and (RF_write2='1')) else
			 "00000000000000000100000000000000" when ((Awr_2="01110") and (RF_write2='1')) else
			 "00000000000000001000000000000000" when ((Awr_2="01111") and (RF_write2='1')) else
			 "00000000000000010000000000000000" when ((Awr_2="10000") and (RF_write2='1')) else
			 "00000000000000100000000000000000" when ((Awr_2="10001") and (RF_write2='1')) else
			 "00000000000001000000000000000000" when ((Awr_2="10010") and (RF_write2='1')) else
			 "00000000000010000000000000000000" when ((Awr_2="10011") and (RF_write2='1')) else
			 "00000000000100000000000000000000" when ((Awr_2="10100") and (RF_write2='1')) else
			 "00000000001000000000000000000000" when ((Awr_2="10101") and (RF_write2='1')) else
			 "00000000010000000000000000000000" when ((Awr_2="10110") and (RF_write2='1')) else
			 "00000000100000000000000000000000" when ((Awr_2="10111") and (RF_write2='1')) else
			 "00000001000000000000000000000000" when ((Awr_2="11000") and (RF_write2='1')) else
			 "00000010000000000000000000000000" when ((Awr_2="11001") and (RF_write2='1')) else
			 "00000100000000000000000000000000" when ((Awr_2="11010") and (RF_write2='1')) else
			 "00001000000000000000000000000000" when ((Awr_2="11011") and (RF_write2='1')) else
			 "00010000000000000000000000000000" when ((Awr_2="11100") and (RF_write2='1')) else
			 "00100000000000000000000000000000" when ((Awr_2="11101") and (RF_write2='1')) else
			 "01000000000000000000000000000000" when ((Awr_2="11110") and (RF_write2='1')) else
			 "10000000000000000000000000000000" when ((Awr_2="11111") and (RF_write2='1')) else
			 "00000000000000000000000000000000";

	en_for_P <= en_vec1 or en_vec2;


	Data : for i in 0 to 31 generate 
		rrf_P_in(i) <= rrf_Data1_EX_in when (en_vec1(i) = '1') when else
						rrf_Data2_EX_in;
	end generate Data;

	rrf_busy_reg_in <= not ((not rrf_busy_reg_out) or ((not rrf_busy_reg_out) xor rrf_free_vec_Rob_in) and (not ((not rrf_busy_reg_out) xor rrf_free_vec_ID_in)));
	rrf_valid_reg_in <= (rrf_valid_reg_out) or (( rrf_valid_reg_out) xor rrf_valid_vec_EX_in) and (not ((rrf_valid_reg_out) xor rrf_valid_vec_Rob_in));
	rrf_free_vec_out <= not rrf_busy_reg_out;
	rrf_valid_vec_out <= rrf_valid_reg_out;
				


