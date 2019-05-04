library ieee;
use ieee.std_logic_1164.all;
use ieee.math_real.all;
use ieee.numeric_std.all;


entity myRegister is
	generic ( data_length: integer);
	port(
		clk,wr,clr : in std_logic;
		din : in std_logic_vector(data_length-1 downto 0);
		dout :out std_logic_vector(data_length-1 downto 0)
		);	
end entity myRegister;

architecture behave of myRegister is

begin
	process(clk,clr)
	begin
		
		if(clk'event and clk='1') then
			if (wr='1') then
				dout <= din;
			end if;
		end if;
		if(clr = '1') then
			dout <= (others => '0');
		end if;
	end process;	
end architecture behave;