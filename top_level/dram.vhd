 library std;
use std.standard.all;

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_misc.all;

entity dram is 
  PORT
  (
    address_wr_1,address_wr_2,address_rd   : IN STD_LOGIC_VECTOR (15 DOWNTO 0);
    clock   : IN STD_LOGIC  := '1';
    data_in_1, data_in_2    : IN STD_LOGIC_VECTOR (15 DOWNTO 0);
    rden    : IN STD_LOGIC  := '1';
    wren_1,wren_2    : IN STD_LOGIC ;
    read_data_out  : OUT STD_LOGIC_VECTOR (15 DOWNTO 0)
  );

end dram;   
architecture syn of dram is 

  type ram_type is array (0 to 64)   
        of std_logic_vector (15 downto 0); 
      
      
      
  signal RAM : ram_type :=
  (
 0 => "0000000000001001",
 1 => "0000000000000000",
 others => "0000000000000000"
  ) ;

  signal data_1_temp : std_logic_vector(15 downto 0);
begin   
  
  data_1_temp <= data_in_2 when (address_wr_1 = address_wr_2 and wren_2 = '1') else data_in_1;

  process (clock)   
  begin   
    if (clock'event and clock = '1') then   
      if (wren_1 = '1') then   
        RAM(to_integer(unsigned(address_wr_1(5 downto 0)))) <= data_1_temp;   
      end if;   
      if (wren_2 = '1') then
        RAM(to_integer(unsigned(address_wr_2(5 downto 0)))) <= data_in_2;
      end if;
    end if;   
  end process;
  read_data_out <= RAM(to_integer(unsigned(address_rd(5 downto 0)))) when (rden ='1') else
        "ZZZZZZZZZZZZZZZZ";
  
end syn; 