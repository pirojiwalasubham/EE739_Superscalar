library ieee;
use ieee.std_logic_1164.all;
use ieee.math_real.all;
use ieee.numeric_std.all;

entity bit_register is
	port(
		clk,wr,clr : in std_logic;
		din : in std_logic;
		dout :out std_logic
		);	
end entity bit_register;

architecture behave of bit_register is

begin
	process(clk,clr)
	begin
		
		if(clk'event and clk='1') then
			if (wr='1') then
				dout <= din;
			end if;
		end if;
		if(clr = '1') then
			dout <= '0';
		end if;
	end process	;
end architecture behave;