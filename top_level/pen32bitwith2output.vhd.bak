library std;
use std.standard.all;

library ieee;
use ieee.std_logic_1164.all;

entity pen32bitwith2output is 
	port (penin: in std_logic_vector(31 downto 0);
			twoRRnotFree : out std_logic;
			pennext_twoallotted, pennext_oneallotted: out std_logic_vector(31 downto 0);
			penout1, penout2: out std_logic_vector(4 downto 0));
end entity;

architecture behave of pen32bitwith2output is
	component pen32bit is
	port (penin: in std_logic_vector(31 downto 0);
			no1found : out std_logic;
			pennext: out std_logic_vector(31 downto 0);
			penout: out std_logic_vector(4 downto 0));	
end component ;

signal pentemp : std_logic_vector(31 downto 0);
signal no1found1, no1found2 : out std_logic;

begin
	pen1 : pen32bit port map (penin, no1found1, pentemp, penout1);
	pen2 : pen32bit port map (pentemp, no1found2, pennext_twoallotted, penout2);
	twoRRnotFree <= no1found1 or no1found2;
	pennext_oneallotted <= pentemp;
end architecture behave;