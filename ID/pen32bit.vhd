library std;
use std.standard.all;

library ieee;
use ieee.std_logic_1164.all;

entity pen32bit is 
	port (penin: in std_logic_vector(31 downto 0);
			no1found : out std_logic;
			pennext: out std_logic_vector(31 downto 0);
			penout: out std_logic_vector(4 downto 0));
end entity;

architecture behave of pen32bit is


begin 

	--tp <= not(penin(0) or penin(1) or penin(2) or penin(3) or penin(4) or penin(5) or penin(6) or penin(7));

	proc_pen : process(penin)
	
		variable next_var : std_logic_vector(31 downto 0);
	
	begin
		
		if (penin(0) = '1') then 
			penout <= "00000";
			next_var := ("11111111111111111111111111111110" and penin);
		elsif (penin(1) = '1') then 
			penout <= "00001";
			next_var := ("11111111111111111111111111111100" and penin);
		elsif (penin(2) = '1') then 
			penout <= "00010";
			next_var := ("11111111111111111111111111111000" and penin);
		elsif (penin(3) = '1') then 
			penout <= "00011";
			next_var := ("11111111111111111111111111110000" and penin);
		elsif (penin(4) = '1') then 
			penout <= "00100";
			next_var := ("11111111111111111111111111100000" and penin);
		elsif (penin(5) = '1') then 
			penout <= "00101";
			next_var := ("11111111111111111111111111000000" and penin);
		elsif (penin(6) = '1') then 
			penout <= "00110";
			next_var := ("11111111111111111111111110000000" and penin);
		elsif (penin(7) = '1') then 
			penout <= "00111";
			next_var := ("11111111111111111111111100000000" and penin);
		elsif (penin(8) = '1') then 
			penout <= "01000";
			next_var := ("11111111111111111111111000000000" and penin);
		elsif (penin(9) = '1') then 
			penout <= "01001";
			next_var := ("11111111111111111111110000000000" and penin);
		elsif (penin(10) = '1') then 
			penout <= "01010";
			next_var := ("11111111111111111111100000000000" and penin);
		elsif (penin(11) = '1') then 
			penout <= "01011";
			next_var := ("11111111111111111111000000000000" and penin);
		elsif (penin(12) = '1') then 
			penout <= "01100";
			next_var := ("11111111111111111110000000000000" and penin);
		elsif (penin(13) = '1') then 
			penout <= "01101";
			next_var := ("11111111111111111100000000000000" and penin);
		elsif (penin(14) = '1') then 
			penout <= "01110";
			next_var := ("11111111111111111000000000000000" and penin);
		elsif (penin(15) = '1') then 
			penout <= "01111";
			next_var := ("11111111111111110000000000000000" and penin);
		elsif (penin(16) = '1') then 
			penout <= "10000";
			next_var := ("11111111111111100000000000000000" and penin);
		elsif (penin(17) = '1') then 
			penout <= "10001";
			next_var := ("11111111111111000000000000000000" and penin);
		elsif (penin(18) = '1') then 
			penout <= "10010";
			next_var := ("11111111111110000000000000000000" and penin);
		elsif (penin(19) = '1') then 
			penout <= "10011";
			next_var := ("11111111111100000000000000000000" and penin);
		elsif (penin(20) = '1') then 
			penout <= "10100";
			next_var := ("11111111111000000000000000000000" and penin);
		elsif (penin(21) = '1') then 
			penout <= "10101";
			next_var := ("11111111110000000000000000000000" and penin);
		elsif (penin(22) = '1') then 
			penout <= "10110";
			next_var := ("11111111100000000000000000000000" and penin);
		elsif (penin(23) = '1') then 
			penout <= "10111";
			next_var := ("11111111000000000000000000000000" and penin);
		elsif (penin(24) = '1') then 
			penout <= "11000";
			next_var := ("11111110000000000000000000000000" and penin);
		elsif (penin(25) = '1') then 
			penout <= "11001";
			next_var := ("11111100000000000000000000000000" and penin);
		elsif (penin(26) = '1') then 
			penout <= "11010";
			next_var := ("11111000000000000000000000000000" and penin);
		elsif (penin(27) = '1') then 
			penout <= "11011";
			next_var := ("11110000000000000000000000000000" and penin);
		elsif (penin(28) = '1') then 
			penout <= "11100";
			next_var := ("11100000000000000000000000000000" and penin);
		elsif (penin(29) = '1') then 
			penout <= "11101";
			next_var := ("11000000000000000000000000000000" and penin);
		elsif (penin(30) = '1') then 
			penout <= "11110";
			next_var := ("10000000000000000000000000000000" and penin);
		else
			penout <= "11111";
			next_var := ("00000000000000000000000000000000" and penin);
		end if;
			
		pennext <= next_var;
		
		if (penin = "00000000000000000000000000000000") then
			no1found <= '1';
		else
			no1found <= '0';
		end if;

	end process proc_pen;

end behave;