library ieee;   
use ieee.std_logic_1164.all;  
use ieee.std_logic_unsigned.all; 
 
entity ram is 
  PORT
  (
    address   : IN STD_LOGIC_VECTOR (15 DOWNTO 0);
    clock   : IN STD_LOGIC  := '1';
    data    : IN STD_LOGIC_VECTOR (15 DOWNTO 0);
    rden    : IN STD_LOGIC  := '1';
    wren    : IN STD_LOGIC ;
    q,q2  : OUT STD_LOGIC_VECTOR (15 DOWNTO 0)
  );

end ram;   
architecture syn of ram is 

component add1 is
   port(alu_a: in std_logic_vector(15 downto 0);
    alu_out: out std_logic_vector(15 downto 0) );
end component;  
  type ram_type is array (0 to 31)   
        of std_logic_vector (15 downto 0); 
      
      
      
  signal RAM : ram_type :=
  (
 0 => "0100000001000000",  --lhi R1,1110000110000000
 1 => "0001010010000001",  --lhi R5,0000010110000000
 2 => "0001110110000001",  --adi R2 <- R2 + 000100
 3 => "0000001010011000",  --add R0 <- R5 + R1
 8 => "0001010001000000",  --adc R3 <- R5 + R2
 9 => "0001011010000000",  --adi R2 <- R2 + 000100
 10 => "1100000110000010",  --adi R2 <- R2 + 000100
 11 => "1000100111110111",  --adi R2 <- R2 + 000100
 12 => "0101010101000010",  --adi R2 <- R2 + 000100
 13 => "1000111000000000",  --adi R2 <- R2 + 000100
 --2 => "0000011001110000",  
 --3 => "0000000000000000",
 --5 => "0000000000000000",
 --6 => "0000000000000000",
 --7 => "0000000000000000",
 others => "1111000000000000"
  ) ;

  signal address_plus1 : std_logic_vector(15 downto 0);
begin   
  process (clock)   
  begin   
    if (clock'event and clock = '1') then   
      if (wren = '1') then   
        RAM(conv_integer(address)) <= data;   
      end if;   
    end if;   
  end process;
  ADDER_MEM : add1 port map(address, address_plus1) ;
  q <= RAM(conv_integer(address(4 downto 0))) when (rden ='1') else
        "ZZZZZZZZZZZZZZZZ";
  q2 <= RAM(conv_integer(address_plus1(4 downto 0))) when (rden ='1') else
        "ZZZZZZZZZZZZZZZZ";
  
end syn; 