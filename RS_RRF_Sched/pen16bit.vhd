library std;
use std.standard.all;

library ieee;
use ieee.std_logic_1164.all;

entity pen16bit is 
	port (penin: in std_logic_vector(15 downto 0);
			no1found : out std_logic;
			pennext: out std_logic_vector(15 downto 0);
			penout: out std_logic_vector(3 downto 0));
end entity;

architecture behave of pen16bit is


begin 

	--tp <= not(penin(0) or penin(1) or penin(2) or penin(3) or penin(4) or penin(5) or penin(6) or penin(7));

	proc_pen : process(penin)
	
		variable next_var : std_logic_vector(15 downto 0);
	
	begin
		
		if (penin(0) = '1') then 
			penout <= "0000";
			next_var := ("1111111111111110" and penin);
		elsif (penin(1) = '1') then 
			penout <= "0001";
			next_var := ("1111111111111100" and penin);
		elsif (penin(2) = '1') then 
			penout <= "0010";
			next_var := ("1111111111111000" and penin);
		elsif (penin(3) = '1') then 
			penout <= "0011";
			next_var := ("1111111111110000" and penin);
		elsif (penin(4) = '1') then 
			penout <= "0100";
			next_var := ("1111111111100000" and penin);
		elsif (penin(5) = '1') then 
			penout <= "0101";
			next_var := ("1111111111000000" and penin);
		elsif (penin(6) = '1') then 
			penout <= "0110";
			next_var := ("1111111110000000" and penin);
		elsif (penin(7) = '1') then 
			penout <= "0111";
			next_var := ("1111111100000000" and penin);
		elsif (penin(8) = '1') then 
			penout <= "1000";
			next_var := ("1111111000000000" and penin);
		elsif (penin(9) = '1') then 
			penout <= "1001";
			next_var := ("1111110000000000" and penin);
		elsif (penin(10) = '1') then 
			penout <= "1010";
			next_var := ("1111100000000000" and penin);
		elsif (penin(11) = '1') then 
			penout <= "1011";
			next_var := ("1111000000000000" and penin);
		elsif (penin(12) = '1') then 
			penout <= "1100";
			next_var := ("1110000000000000" and penin);
		elsif (penin(13) = '1') then 
			penout <= "1101";
			next_var := ("1100000000000000" and penin);
		elsif (penin(14) = '1') then 
			penout <= "1110";
			next_var := ("1000000000000000" and penin);
		elsif (penin(15) = '1') then 
			penout <= "1111";
			next_var := ("0000000000000000" and penin);
		else
			penout <= "1111";
			next_var := ("0000000000000000" and penin);
		end if;
			
		pennext <= next_var;
		
		if (penin = "0000000000000000") then
			no1found <= '1';
		else
			no1found <= '0';
		end if;

	end process proc_pen;

end behave;