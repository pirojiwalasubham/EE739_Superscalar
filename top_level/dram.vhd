library ieee;   
use ieee.std_logic_1164.all;  
use ieee.std_logic_unsigned.all; 
 
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
 0  => "0001001001000001",
 1 => "0001010010000010",
 2 => "0010011011011000",
 3 =>"0000001010100010",
 4 => "0000111011010000",
 5 => "0000001011100010",
 6 => "0001100000000001",
 7 => "0101110110000001",
 8 => "0000001010011001",
 9 => "0100110110000001",
 10 => "0000110010011001",
 11 => "1000101000000011",
 12 => "0000000000000000",
 13 => "0000000000000000",
 14 => "0000000000000000",
 15 => "1100011011000001",
 16 => "0000000000000000",
 17 => "0110110001010000",
 18 => "0111110000101000",
 19 => "0110110000000110",
 20 => "0011000000000000",
 21 =>"0011001000000000",
 22 => "0011010000000000",
 23 => "0011011000000000",
 24 => "0011100000000000",
 25 => "0011101000000000",
 26 => "0011110000000000",
 27 =>"0011111000000000", 
 28  =>   "1100000001000010",-- beq r0,r1,2
 29  =>   "1100001010000001",-- beq r1,r2,1
 30  =>   "0011100000000000",-- lhi r4,0
 31  =>   "0011100111111111",-- lhi r4,111111111
 others => "0000000000000000"
  ) ;

  signal data_1_temp;

  signal address_plus1 : std_logic_vector(15 downto 0);
begin   
  
  data_1_temp <= data_in_2 when address_wr_1 = address_wr_2 else data_in_1;

  process (clock)   
  begin   
    if (clock'event and clock = '1') then   
      if (wren_1 = '1') then   
        RAM(conv_integer(address_wr_2)) <= data_1_temp;   
      end if;   
      if (wren_2 = '1') then
        RAM(conv_integer(address_wr_2)) <= data_in_2;
      end if;
    end if;   
  end process;
  ADDER_MEM : add1 port map(address, address_plus1) ;
  read_data_out <= RAM(conv_integer(address_rd)) when (rden ='1') else
        "ZZZZZZZZZZZZZZZZ";
  
end syn; 