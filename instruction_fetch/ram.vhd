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
    q   : OUT STD_LOGIC_VECTOR (15 DOWNTO 0)
  );

end ram;   
architecture syn of ram is   
  type ram_type is array (0 to 31)   
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
  
	--   0 => "1001000001000000", -- jlr
	--   0 => "0100111000000111", -- lw
	--	0 =>  "1100000000000111", -- beq
	--	  0 => 	"0011010000000000",-- lhi r1 = 2",
	--0 =>		"1000000000000111", -- jal
	--0  =>   "0011010000000000",-- lhi r1 = 0",
	--0 => "1001001010
	--  0  =>   "1000000000000111", -- JAL
   --0  =>   "1100001010000111",-- lhi r0= 1
	-- 0  =>  "0011010000000000",-- lhi r1 = 0",
--	1 => 	 "0011100000000011", --lhi r4=3
	--1  =>  "0011111000000000", -- lhi into r7
--	2 => 	 "0000001100111000", -- add r1 and r4 store in r7
--   --2  =>   "0011010000000000",-- lhi r2= 2
--   3  =>   "0011100000000011", --lhi r4=3
--   --4  =>   "0111001001001001", -- should store r0, r3 and r6 at ram's 12, 13, 14 
--   --5  =>   "0110001010000110", -- should load @12 at r1, @13 at r2, @14 at r7
--   --6  =>   "0011110100000101", --lhi loads r6 with 5
--	4 =>   "0000000001000000", --r0=r1+r0
--	5 =>   "0010011100011000", --r3=r3 nand r4
--	6 =>	 "1001001010000000",  -- jlr to r2 location
--	--6  =>   "0000001010000111", --r4=r4+r5
--	7  =>   "0000001010111000", --r2=r2+r3 if c
--  8  =>   "0000000001000000", --r0=r1+r0
  
 28  =>   "1100000001000010",-- beq r0,r1,2
 29  =>   "1100001010000001",-- beq r1,r2,1
 30  =>   "0011100000000000",-- lhi r4,0
 31  =>   "0011100111111111",-- lhi r4,111111111
 others => "0000000000000000"
  ) ;
begin   
  process (clock)   
  begin   
    if (clock'event and clock = '1') then   
      if (wren = '1') then   
        RAM(conv_integer(address)) <= data;   
      end if;   
    end if;   
  end process;

  q <= RAM(conv_integer(address)) when (rden ='1') else
        "ZZZZZZZZZZZZZZZZ";
  --process()
  --begin
  --  if(rden ='1') then
  --    q <= RAM(conv_integer(address));      
  --  else q<= "ZZZZZZZZZZZZZZZZ";
  --  end if;
  --end process;
end syn; 