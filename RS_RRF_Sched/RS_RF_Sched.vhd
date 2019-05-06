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
		rrf_write1_in, rrf_write2_in : in std_logic;
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
	signal en_vec1, en_vec2 : std_logic_vector(31 downto 0);

begin
	RRF : for i in 0 to 31 generate
		rrf_P_file : myRegister generic map (18) port map (clk, en_for_P(i), reset, rrf_P_in(i), rrf_P_out(i));
		rrf_busy_file : bit_register port map (clk, '1', reset, rrf_busy_reg_in(i), rrf_busy_reg_out(i));
		rrf_valid_file : bit_register port map (clk, '1', reset, rrf_valid_reg_in(i), rrf_valid_reg_out(i));
	end generate RRF;


  en_vec1 <= "00000000000000000000000000000001" when ((rrf_Awr1_in="00000") and (rrf_write1_in='1')) else
			 "00000000000000000000000000000010" when ((rrf_Awr1_in="00001") and (rrf_write1_in='1')) else
			 "00000000000000000000000000000100" when ((rrf_Awr1_in="00010") and (rrf_write1_in='1')) else
			 "00000000000000000000000000001000" when ((rrf_Awr1_in="00011") and (rrf_write1_in='1')) else
			 "00000000000000000000000000010000" when ((rrf_Awr1_in="00100") and (rrf_write1_in='1')) else
			 "00000000000000000000000000100000" when ((rrf_Awr1_in="00101") and (rrf_write1_in='1')) else
			 "00000000000000000000000001000000" when ((rrf_Awr1_in="00110") and (rrf_write1_in='1')) else
			 "00000000000000000000000010000000" when ((rrf_Awr1_in="00111") and (rrf_write1_in='1')) else
			 "00000000000000000000000100000000" when ((rrf_Awr1_in="01000") and (rrf_write1_in='1')) else
			 "00000000000000000000001000000000" when ((rrf_Awr1_in="01001") and (rrf_write1_in='1')) else
			 "00000000000000000000010000000000" when ((rrf_Awr1_in="01010") and (rrf_write1_in='1')) else
			 "00000000000000000000100000000000" when ((rrf_Awr1_in="01011") and (rrf_write1_in='1')) else
			 "00000000000000000001000000000000" when ((rrf_Awr1_in="01100") and (rrf_write1_in='1')) else
			 "00000000000000000010000000000000" when ((rrf_Awr1_in="01101") and (rrf_write1_in='1')) else
			 "00000000000000000100000000000000" when ((rrf_Awr1_in="01110") and (rrf_write1_in='1')) else
			 "00000000000000001000000000000000" when ((rrf_Awr1_in="01111") and (rrf_write1_in='1')) else
			 "00000000000000010000000000000000" when ((rrf_Awr1_in="10000") and (rrf_write1_in='1')) else
			 "00000000000000100000000000000000" when ((rrf_Awr1_in="10001") and (rrf_write1_in='1')) else
			 "00000000000001000000000000000000" when ((rrf_Awr1_in="10010") and (rrf_write1_in='1')) else
			 "00000000000010000000000000000000" when ((rrf_Awr1_in="10011") and (rrf_write1_in='1')) else
			 "00000000000100000000000000000000" when ((rrf_Awr1_in="10100") and (rrf_write1_in='1')) else
			 "00000000001000000000000000000000" when ((rrf_Awr1_in="10101") and (rrf_write1_in='1')) else
			 "00000000010000000000000000000000" when ((rrf_Awr1_in="10110") and (rrf_write1_in='1')) else
			 "00000000100000000000000000000000" when ((rrf_Awr1_in="10111") and (rrf_write1_in='1')) else
			 "00000001000000000000000000000000" when ((rrf_Awr1_in="11000") and (rrf_write1_in='1')) else
			 "00000010000000000000000000000000" when ((rrf_Awr1_in="11001") and (rrf_write1_in='1')) else
			 "00000100000000000000000000000000" when ((rrf_Awr1_in="11010") and (rrf_write1_in='1')) else
			 "00001000000000000000000000000000" when ((rrf_Awr1_in="11011") and (rrf_write1_in='1')) else
			 "00010000000000000000000000000000" when ((rrf_Awr1_in="11100") and (rrf_write1_in='1')) else
			 "00100000000000000000000000000000" when ((rrf_Awr1_in="11101") and (rrf_write1_in='1')) else
			 "01000000000000000000000000000000" when ((rrf_Awr1_in="11110") and (rrf_write1_in='1')) else
			 "10000000000000000000000000000000" when ((rrf_Awr1_in="11111") and (rrf_write1_in='1')) else
			 "00000000000000000000000000000000";

  en_vec2 <= "00000000000000000000000000000001" when ((rrf_Awr2_in="00000") and (rrf_write2_in='1')) else
			 "00000000000000000000000000000010" when ((rrf_Awr2_in="00001") and (rrf_write2_in='1')) else
			 "00000000000000000000000000000100" when ((rrf_Awr2_in="00010") and (rrf_write2_in='1')) else
			 "00000000000000000000000000001000" when ((rrf_Awr2_in="00011") and (rrf_write2_in='1')) else
			 "00000000000000000000000000010000" when ((rrf_Awr2_in="00100") and (rrf_write2_in='1')) else
			 "00000000000000000000000000100000" when ((rrf_Awr2_in="00101") and (rrf_write2_in='1')) else
			 "00000000000000000000000001000000" when ((rrf_Awr2_in="00110") and (rrf_write2_in='1')) else
			 "00000000000000000000000010000000" when ((rrf_Awr2_in="00111") and (rrf_write2_in='1')) else
			 "00000000000000000000000100000000" when ((rrf_Awr2_in="01000") and (rrf_write2_in='1')) else
			 "00000000000000000000001000000000" when ((rrf_Awr2_in="01001") and (rrf_write2_in='1')) else
			 "00000000000000000000010000000000" when ((rrf_Awr2_in="01010") and (rrf_write2_in='1')) else
			 "00000000000000000000100000000000" when ((rrf_Awr2_in="01011") and (rrf_write2_in='1')) else
			 "00000000000000000001000000000000" when ((rrf_Awr2_in="01100") and (rrf_write2_in='1')) else
			 "00000000000000000010000000000000" when ((rrf_Awr2_in="01101") and (rrf_write2_in='1')) else
			 "00000000000000000100000000000000" when ((rrf_Awr2_in="01110") and (rrf_write2_in='1')) else
			 "00000000000000001000000000000000" when ((rrf_Awr2_in="01111") and (rrf_write2_in='1')) else
			 "00000000000000010000000000000000" when ((rrf_Awr2_in="10000") and (rrf_write2_in='1')) else
			 "00000000000000100000000000000000" when ((rrf_Awr2_in="10001") and (rrf_write2_in='1')) else
			 "00000000000001000000000000000000" when ((rrf_Awr2_in="10010") and (rrf_write2_in='1')) else
			 "00000000000010000000000000000000" when ((rrf_Awr2_in="10011") and (rrf_write2_in='1')) else
			 "00000000000100000000000000000000" when ((rrf_Awr2_in="10100") and (rrf_write2_in='1')) else
			 "00000000001000000000000000000000" when ((rrf_Awr2_in="10101") and (rrf_write2_in='1')) else
			 "00000000010000000000000000000000" when ((rrf_Awr2_in="10110") and (rrf_write2_in='1')) else
			 "00000000100000000000000000000000" when ((rrf_Awr2_in="10111") and (rrf_write2_in='1')) else
			 "00000001000000000000000000000000" when ((rrf_Awr2_in="11000") and (rrf_write2_in='1')) else
			 "00000010000000000000000000000000" when ((rrf_Awr2_in="11001") and (rrf_write2_in='1')) else
			 "00000100000000000000000000000000" when ((rrf_Awr2_in="11010") and (rrf_write2_in='1')) else
			 "00001000000000000000000000000000" when ((rrf_Awr2_in="11011") and (rrf_write2_in='1')) else
			 "00010000000000000000000000000000" when ((rrf_Awr2_in="11100") and (rrf_write2_in='1')) else
			 "00100000000000000000000000000000" when ((rrf_Awr2_in="11101") and (rrf_write2_in='1')) else
			 "01000000000000000000000000000000" when ((rrf_Awr2_in="11110") and (rrf_write2_in='1')) else
			 "10000000000000000000000000000000" when ((rrf_Awr2_in="11111") and (rrf_write2_in='1')) else
			 "00000000000000000000000000000000";

	encoding : for i in 0 to 31 generate
		en_for_P(i) <= en_vec1(i) or en_vec2(i);
		end generate encoding;
	Data : for i in 0 to 31 generate 
		rrf_P_in(i) <= rrf_Data1_EX_in when (en_vec1(i) = '1')  else
						rrf_Data2_EX_in;
	end generate Data;

	busy_valid: for i in 0 to 31 generate
		rrf_busy_reg_in(i) <= not (((not rrf_busy_reg_out(i)) or ((not rrf_busy_reg_out(i)) xor rrf_free_vec_Rob_in(i))) and (not ((not rrf_busy_reg_out(i)) xor rrf_free_vec_ID_in(i))));
		rrf_valid_reg_in(i) <=  ((( rrf_valid_reg_out(i)) or (( rrf_valid_reg_out(i)) xor rrf_valid_vec_EX_in(i))) and (not (( rrf_valid_reg_out(i)) xor rrf_valid_vec_Rob_in(i))));
	end generate busy_valid;

	output_loop: for i in 0 to 31 generate
		rrf_free_vec_out(i)  <= not rrf_busy_reg_out(i);
		rrf_valid_vec_out(i) <= rrf_valid_reg_out(i);
	end generate output_loop;

	end architecture behave;



