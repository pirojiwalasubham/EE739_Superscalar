library std;
use std.standard.all;

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity rs is 
	port(
		clk,reset : in std_logic;
		ra1pc,ra2pc,ra1op1,ra2op1,ra1op2,ra2op2,ra1instr,ra2instr : in std_logic_vector(15 downto 0);
		ra1rrtag,ra2rrtag : in std_logic_vector(4 downto 0);
		ra1spectag,ra2spectag : in std_logic_vector(1 downto 0);
		ra1op1valid,ra2op1valid,ra1op2valid,ra2op2valid,ra1instrready,ra2instrready,ra1instrvalid,ra2instrvalid,ra1specbit,ra2specbit : in std_logic;
		rsfull : out std_logic
		); -- output
end rs;

architecture behave of rs is

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

	signal rs1wr,rs2wr,rs3wr,rs4wr,rs5wr,rs6wr,rs7wr,rs8wr,rs9wr,rs10wr,rs11wr,rs12wr,rs13wr,rs14wr,rs15wr,rs16wr : std_logic := '0';
	signal rs1pcin,rs2pcin,rs3pcin,rs4pcin,rs5pcin,rs6pcin,rs7pcin,rs8pcin,rs9pcin,rs10pcin,rs11pcin,rs12pcin,rs13pcin,rs14pcin,rs15pcin,rs16pcin : std_logic_vector(15 downto 0);
	signal rs1pcout,rs2pcout,rs3pcout,rs4pcout,rs5pcout,rs6pcout,rs7pcout,rs8pcout,rs9pcout,rs10pcout,rs11pcout,rs12pcout,rs13pcout,rs14pcout,rs15pcout,rs16pcout : std_logic_vector(15 downto 0);
	signal rs1op1in,rs2op1in,rs3op1in,rs4op1in,rs5op1in,rs6op1in,rs7op1in,rs8op1in,rs9op1in,rs10op1in,rs11op1in,rs12op1in,rs13op1in,rs14op1in,rs15op1in,rs16op1in : std_logic_vector(15 downto 0);
	signal rs1op1out,rs2op1out,rs3op1out,rs4op1out,rs5op1out,rs6op1out,rs7op1out,rs8op1out,rs9op1out,rs10op1out,rs11op1out,rs12op1out,rs13op1out,rs14op1out,rs15op1out,rs16op1out : std_logic_vector(15 downto 0);
	signal rs1op2in,rs2op2in,rs3op2in,rs4op2in,rs5op2in,rs6op2in,rs7op2in,rs8op2in,rs9op2in,rs10op2in,rs11op2in,rs12op2in,rs13op2in,rs14op2in,rs15op2in,rs16op2in : std_logic_vector(15 downto 0);
	signal rs1op2out,rs2op2out,rs3op2out,rs4op2out,rs5op2out,rs6op2out,rs7op2out,rs8op2out,rs9op2out,rs10op2out,rs11op2out,rs12op2out,rs13op2out,rs14op2out,rs15op2out,rs16op2out : std_logic_vector(15 downto 0);
	signal rs1instrin,rs2instrin,rs3instrin,rs4instrin,rs5instrin,rs6instrin,rs7instrin,rs8instrin,rs9instrin,rs10instrin,rs11instrin,rs12instrin,rs13instrin,rs14instrin,rs15instrin,rs16instrin : std_logic_vector(15 downto 0);
	signal rs1instrout,rs2instrout,rs3instrout,rs4instrout,rs5instrout,rs6instrout,rs7instrout,rs8instrout,rs9instrout,rs10instrout,rs11instrout,rs12instrout,rs13instrout,rs14instrout,rs15instrout,rs16instrout : std_logic_vector(15 downto 0);
	signal rs1rrtagin,rs2rrtagin,rs3rrtagin,rs4rrtagin,rs5rrtagin,rs6rrtagin,rs7rrtagin,rs8rrtagin,rs9rrtagin,rs10rrtagin,rs11rrtagin,rs12rrtagin,rs13rrtagin,rs14rrtagin,rs15rrtagin,rs16rrtagin : std_logic_vector(4 downto 0);
	signal rs1rrtagout,rs2rrtagout,rs3rrtagout,rs4rrtagout,rs5rrtagout,rs6rrtagout,rs7rrtagout,rs8rrtagout,rs9rrtagout,rs10rrtagout,rs11rrtagout,rs12rrtagout,rs13rrtagout,rs14rrtagout,rs15rrtagout,rs16rrtagout : std_logic_vector(4 downto 0);
	signal rs1spectagin,rs2spectagin,rs3spectagin,rs4spectagin,rs5spectagin,rs6spectagin,rs7spectagin,rs8spectagin,rs9spectagin,rs10spectagin,rs11spectagin,rs12spectagin,rs13spectagin,rs14spectagin,rs15spectagin,rs16spectagin : std_logic_vector(1 downto 0);
	signal rs1spectagout,rs2spectagout,rs3spectagout,rs4spectagout,rs5spectagout,rs6spectagout,rs7spectagout,rs8spectagout,rs9spectagout,rs10spectagout,rs11spectagout,rs12spectagout,rs13spectagout,rs14spectagout,rs15spectagout,rs16spectagout : std_logic_vector(1 downto 0);
	signal rs1op1validin,rs2op1validin,rs3op1validin,rs4op1validin,rs5op1validin,rs6op1validin,rs7op1validin,rs8op1validin,rs9op1validin,rs10op1validin,rs11op1validin,rs12op1validin,rs13op1validin,rs14op1validin,rs15op1validin,rs16op1validin : std_logic;
	signal rs1op1validout,rs2op1validout,rs3op1validout,rs4op1validout,rs5op1validout,rs6op1validout,rs7op1validout,rs8op1validout,rs9op1validout,rs10op1validout,rs11op1validout,rs12op1validout,rs13op1validout,rs14op1validout,rs15op1validout,rs16op1validout : std_logic;
	signal rs1op2validin,rs2op2validin,rs3op2validin,rs4op2validin,rs5op2validin,rs6op2validin,rs7op2validin,rs8op2validin,rs9op2validin,rs10op2validin,rs11op2validin,rs12op2validin,rs13op2validin,rs14op2validin,rs15op2validin,rs16op2validin : std_logic;
	signal rs1op2validout,rs2op2validout,rs3op2validout,rs4op2validout,rs5op2validout,rs6op2validout,rs7op2validout,rs8op2validout,rs9op2validout,rs10op2validout,rs11op2validout,rs12op2validout,rs13op2validout,rs14op2validout,rs15op2validout,rs16op2validout : std_logic;
	signal rs1instrreadyin,rs2instrreadyin,rs3instrreadyin,rs4instrreadyin,rs5instrreadyin,rs6instrreadyin,rs7instrreadyin,rs8instrreadyin,rs9instrreadyin,rs10instrreadyin,rs11instrreadyin,rs12instrreadyin,rs13instrreadyin,rs14instrreadyin,rs15instrreadyin,rs16instrreadyin : std_logic;
	signal rs1instrreadyout,rs2instrreadyout,rs3instrreadyout,rs4instrreadyout,rs5instrreadyout,rs6instrreadyout,rs7instrreadyout,rs8instrreadyout,rs9instrreadyout,rs10instrreadyout,rs11instrreadyout,rs12instrreadyout,rs13instrreadyout,rs14instrreadyout,rs15instrreadyout,rs16instrreadyout : std_logic;
	signal rs1instrvalidin,rs2instrvalidin,rs3instrvalidin,rs4instrvalidin,rs5instrvalidin,rs6instrvalidin,rs7instrvalidin,rs8instrvalidin,rs9instrvalidin,rs10instrvalidin,rs11instrvalidin,rs12instrvalidin,rs13instrvalidin,rs14instrvalidin,rs15instrvalidin,rs16instrvalidin : std_logic;
	signal rs1instrvalidout,rs2instrvalidout,rs3instrvalidout,rs4instrvalidout,rs5instrvalidout,rs6instrvalidout,rs7instrvalidout,rs8instrvalidout,rs9instrvalidout,rs10instrvalidout,rs11instrvalidout,rs12instrvalidout,rs13instrvalidout,rs14instrvalidout,rs15instrvalidout,rs16instrvalidout : std_logic;
	signal rs1specbitin,rs2specbitin,rs3specbitin,rs4specbitin,rs5specbitin,rs6specbitin,rs7specbitin,rs8specbitin,rs9specbitin,rs10specbitin,rs11specbitin,rs12specbitin,rs13specbitin,rs14specbitin,rs15specbitin,rs16specbitin : std_logic;
	signal rs1specbitout,rs2specbitout,rs3specbitout,rs4specbitout,rs5specbitout,rs6specbitout,rs7specbitout,rs8specbitout,rs9specbitout,rs10specbitout,rs11specbitout,rs12specbitout,rs13specbitout,rs14specbitout,rs15specbitout,rs16specbitout : std_logic;


	begin

		rs1pc : myRegister generic map(16) port map ( clk, rs1wr, reset, rs1pcin, rs1pcout);
		rs2pc : myRegister generic map(16) port map ( clk, rs2wr, reset, rs2pcin, rs2pcout);
		rs3pc : myRegister generic map(16) port map ( clk, rs3wr, reset, rs3pcin, rs3pcout);
		rs4pc : myRegister generic map(16) port map ( clk, rs4wr, reset, rs4pcin, rs4pcout);
		rs5pc : myRegister generic map(16) port map ( clk, rs5wr, reset, rs5pcin, rs5pcout);
		rs6pc : myRegister generic map(16) port map ( clk, rs6wr, reset, rs6pcin, rs6pcout);
		rs7pc : myRegister generic map(16) port map ( clk, rs7wr, reset, rs7pcin, rs7pcout);
		rs8pc : myRegister generic map(16) port map ( clk, rs8wr, reset, rs8pcin, rs8pcout);
		rs9pc : myRegister generic map(16) port map ( clk, rs9wr, reset, rs9pcin, rs9pcout);
		rs10pc : myRegister generic map(16) port map ( clk, rs10wr, reset, rs10pcin, rs10pcout);
		rs11pc : myRegister generic map(16) port map ( clk, rs11wr, reset, rs11pcin, rs11pcout);
		rs12pc : myRegister generic map(16) port map ( clk, rs12wr, reset, rs12pcin, rs12pcout);
		rs13pc : myRegister generic map(16) port map ( clk, rs13wr, reset, rs13pcin, rs13pcout);
		rs14pc : myRegister generic map(16) port map ( clk, rs14wr, reset, rs14pcin, rs14pcout);
		rs15pc : myRegister generic map(16) port map ( clk, rs15wr, reset, rs15pcin, rs15pcout);
		rs16pc : myRegister generic map(16) port map ( clk, rs16wr, reset, rs16pcin, rs16pcout); 

		rs1op1 : myRegister generic map(16) port map ( clk, rs1wr, reset, rs1op1in, rs1op1out);
		rs2op1 : myRegister generic map(16) port map ( clk, rs2wr, reset, rs2op1in, rs2op1out);
		rs3op1 : myRegister generic map(16) port map ( clk, rs3wr, reset, rs3op1in, rs3op1out);
		rs4op1 : myRegister generic map(16) port map ( clk, rs4wr, reset, rs4op1in, rs4op1out);
		rs5op1 : myRegister generic map(16) port map ( clk, rs5wr, reset, rs5op1in, rs5op1out);
		rs6op1 : myRegister generic map(16) port map ( clk, rs6wr, reset, rs6op1in, rs6op1out);
		rs7op1 : myRegister generic map(16) port map ( clk, rs7wr, reset, rs7op1in, rs7op1out);
		rs8op1 : myRegister generic map(16) port map ( clk, rs8wr, reset, rs8op1in, rs8op1out);
		rs9op1 : myRegister generic map(16) port map ( clk, rs9wr, reset, rs9op1in, rs9op1out);
		rs10op1 : myRegister generic map(16) port map ( clk, rs10wr, reset, rs10op1in, rs10op1out);
		rs11op1 : myRegister generic map(16) port map ( clk, rs11wr, reset, rs11op1in, rs11op1out);
		rs12op1 : myRegister generic map(16) port map ( clk, rs12wr, reset, rs12op1in, rs12op1out);
		rs13op1 : myRegister generic map(16) port map ( clk, rs13wr, reset, rs13op1in, rs13op1out);
		rs14op1 : myRegister generic map(16) port map ( clk, rs14wr, reset, rs14op1in, rs14op1out);
		rs15op1 : myRegister generic map(16) port map ( clk, rs15wr, reset, rs15op1in, rs15op1out);
		rs16op1 : myRegister generic map(16) port map ( clk, rs16wr, reset, rs16op1in, rs16op1out);

		rs1op2 : myRegister generic map(16) port map ( clk, rs1wr, reset, rs1op2in, rs1op2out);
		rs2op2 : myRegister generic map(16) port map ( clk, rs2wr, reset, rs2op2in, rs2op2out);
		rs3op2 : myRegister generic map(16) port map ( clk, rs3wr, reset, rs3op2in, rs3op2out);
		rs4op2 : myRegister generic map(16) port map ( clk, rs4wr, reset, rs4op2in, rs4op2out);
		rs5op2 : myRegister generic map(16) port map ( clk, rs5wr, reset, rs5op2in, rs5op2out);
		rs6op2 : myRegister generic map(16) port map ( clk, rs6wr, reset, rs6op2in, rs6op2out);
		rs7op2 : myRegister generic map(16) port map ( clk, rs7wr, reset, rs7op2in, rs7op2out);
		rs8op2 : myRegister generic map(16) port map ( clk, rs8wr, reset, rs8op2in, rs8op2out);
		rs9op2 : myRegister generic map(16) port map ( clk, rs9wr, reset, rs9op2in, rs9op2out);
		rs10op2 : myRegister generic map(16) port map ( clk, rs10wr, reset, rs10op2in, rs10op2out);
		rs11op2 : myRegister generic map(16) port map ( clk, rs11wr, reset, rs11op2in, rs11op2out);
		rs12op2 : myRegister generic map(16) port map ( clk, rs12wr, reset, rs12op2in, rs12op2out);
		rs13op2 : myRegister generic map(16) port map ( clk, rs13wr, reset, rs13op2in, rs13op2out);
		rs14op2 : myRegister generic map(16) port map ( clk, rs14wr, reset, rs14op2in, rs14op2out);
		rs15op2 : myRegister generic map(16) port map ( clk, rs15wr, reset, rs15op2in, rs15op2out);
		rs16op2 : myRegister generic map(16) port map ( clk, rs16wr, reset, rs16op2in, rs16op2out);

		rs1rrtag : myRegister generic map(5) port map ( clk, rs1wr, reset, rs1rrtagin, rs1rrtagout);
		rs2rrtag : myRegister generic map(5) port map ( clk, rs2wr, reset, rs2rrtagin, rs2rrtagout);
		rs3rrtag : myRegister generic map(5) port map ( clk, rs3wr, reset, rs3rrtagin, rs3rrtagout);
		rs4rrtag : myRegister generic map(5) port map ( clk, rs4wr, reset, rs4rrtagin, rs4rrtagout);
		rs5rrtag : myRegister generic map(5) port map ( clk, rs5wr, reset, rs5rrtagin, rs5rrtagout);
		rs6rrtag : myRegister generic map(5) port map ( clk, rs6wr, reset, rs6rrtagin, rs6rrtagout);
		rs7rrtag : myRegister generic map(5) port map ( clk, rs7wr, reset, rs7rrtagin, rs7rrtagout);
		rs8rrtag : myRegister generic map(5) port map ( clk, rs8wr, reset, rs8rrtagin, rs8rrtagout);
		rs9rrtag : myRegister generic map(5) port map ( clk, rs9wr, reset, rs9rrtagin, rs9rrtagout);
		rs10rrtag : myRegister generic map(5) port map ( clk, rs10wr, reset, rs10rrtagin, rs10rrtagout);
		rs11rrtag : myRegister generic map(5) port map ( clk, rs11wr, reset, rs11rrtagin, rs11rrtagout);
		rs12rrtag : myRegister generic map(5) port map ( clk, rs12wr, reset, rs12rrtagin, rs12rrtagout);
		rs13rrtag : myRegister generic map(5) port map ( clk, rs13wr, reset, rs13rrtagin, rs13rrtagout);
		rs14rrtag : myRegister generic map(5) port map ( clk, rs14wr, reset, rs14rrtagin, rs14rrtagout);
		rs15rrtag : myRegister generic map(5) port map ( clk, rs15wr, reset, rs15rrtagin, rs15rrtagout);
		rs16rrtag : myRegister generic map(5) port map ( clk, rs16wr, reset, rs16rrtagin, rs16rrtagout);

		rs1instr : myRegister generic map(16) port map ( clk, rs1wr, reset, rs1instrin, rs1instrout);
		rs2instr : myRegister generic map(16) port map ( clk, rs2wr, reset, rs2instrin, rs2instrout);
		rs3instr : myRegister generic map(16) port map ( clk, rs3wr, reset, rs3instrin, rs3instrout);
		rs4instr : myRegister generic map(16) port map ( clk, rs4wr, reset, rs4instrin, rs4instrout);
		rs5instr : myRegister generic map(16) port map ( clk, rs5wr, reset, rs5instrin, rs5instrout);
		rs6instr : myRegister generic map(16) port map ( clk, rs6wr, reset, rs6instrin, rs6instrout);
		rs7instr : myRegister generic map(16) port map ( clk, rs7wr, reset, rs7instrin, rs7instrout);
		rs8instr : myRegister generic map(16) port map ( clk, rs8wr, reset, rs8instrin, rs8instrout);
		rs9instr : myRegister generic map(16) port map ( clk, rs9wr, reset, rs9instrin, rs9instrout);
		rs10instr : myRegister generic map(16) port map ( clk, rs10wr, reset, rs10instrin, rs10instrout);
		rs11instr : myRegister generic map(16) port map ( clk, rs11wr, reset, rs11instrin, rs11instrout);
		rs12instr : myRegister generic map(16) port map ( clk, rs12wr, reset, rs12instrin, rs12instrout);
		rs13instr : myRegister generic map(16) port map ( clk, rs13wr, reset, rs13instrin, rs13instrout);
		rs14instr : myRegister generic map(16) port map ( clk, rs14wr, reset, rs14instrin, rs14instrout);
		rs15instr : myRegister generic map(16) port map ( clk, rs15wr, reset, rs15instrin, rs15instrout);
		rs16instr : myRegister generic map(16) port map ( clk, rs16wr, reset, rs16instrin, rs16instrout);

		rs1spectag : myRegister generic map(2) port map ( clk, rs1wr, reset, rs1spectagin, rs1spectagout);
		rs2spectag : myRegister generic map(2) port map ( clk, rs2wr, reset, rs2spectagin, rs2spectagout);
		rs3spectag : myRegister generic map(2) port map ( clk, rs3wr, reset, rs3spectagin, rs3spectagout);
		rs4spectag : myRegister generic map(2) port map ( clk, rs4wr, reset, rs4spectagin, rs4spectagout);
		rs5spectag : myRegister generic map(2) port map ( clk, rs5wr, reset, rs5spectagin, rs5spectagout);
		rs6spectag : myRegister generic map(2) port map ( clk, rs6wr, reset, rs6spectagin, rs6spectagout);
		rs7spectag : myRegister generic map(2) port map ( clk, rs7wr, reset, rs7spectagin, rs7spectagout);
		rs8spectag : myRegister generic map(2) port map ( clk, rs8wr, reset, rs8spectagin, rs8spectagout);
		rs9spectag : myRegister generic map(2) port map ( clk, rs9wr, reset, rs9spectagin, rs9spectagout);
		rs10spectag : myRegister generic map(2) port map ( clk, rs10wr, reset, rs10spectagin, rs10spectagout);
		rs11spectag : myRegister generic map(2) port map ( clk, rs11wr, reset, rs11spectagin, rs11spectagout);
		rs12spectag : myRegister generic map(2) port map ( clk, rs12wr, reset, rs12spectagin, rs12spectagout);
		rs13spectag : myRegister generic map(2) port map ( clk, rs13wr, reset, rs13spectagin, rs13spectagout);
		rs14spectag : myRegister generic map(2) port map ( clk, rs14wr, reset, rs14spectagin, rs14spectagout);
		rs15spectag : myRegister generic map(2) port map ( clk, rs15wr, reset, rs15spectagin, rs15spectagout);
		rs16spectag : myRegister generic map(2) port map ( clk, rs16wr, reset, rs16spectagin, rs16spectagout);


		rs1op1valid : bit_register port map ( clk, rs1wr, reset, rs1op1validin, rs1op1validout);
		rs2op1valid : bit_register port map ( clk, rs2wr, reset, rs2op1validin, rs2op1validout);
		rs3op1valid : bit_register port map ( clk, rs3wr, reset, rs3op1validin, rs3op1validout);
		rs4op1valid : bit_register port map ( clk, rs4wr, reset, rs4op1validin, rs4op1validout);
		rs5op1valid : bit_register port map ( clk, rs5wr, reset, rs5op1validin, rs5op1validout);
		rs6op1valid : bit_register port map ( clk, rs6wr, reset, rs6op1validin, rs6op1validout);
		rs7op1valid : bit_register port map ( clk, rs7wr, reset, rs7op1validin, rs7op1validout);
		rs8op1valid : bit_register port map ( clk, rs8wr, reset, rs8op1validin, rs8op1validout);
		rs9op1valid : bit_register port map ( clk, rs9wr, reset, rs9op1validin, rs9op1validout);
		rs10op1valid : bit_register port map ( clk, rs10wr, reset, rs10op1validin, rs10op1validout);
		rs11op1valid : bit_register port map ( clk, rs11wr, reset, rs11op1validin, rs11op1validout);
		rs12op1valid : bit_register port map ( clk, rs12wr, reset, rs12op1validin, rs12op1validout);
		rs13op1valid : bit_register port map ( clk, rs13wr, reset, rs13op1validin, rs13op1validout);
		rs14op1valid : bit_register port map ( clk, rs14wr, reset, rs14op1validin, rs14op1validout);
		rs15op1valid : bit_register port map ( clk, rs15wr, reset, rs15op1validin, rs15op1validout);
		rs16op1valid : bit_register port map ( clk, rs16wr, reset, rs16op1validin, rs16op1validout);


		rs1op2valid : bit_register port map ( clk, rs1wr, reset, rs1op2validin, rs1op2validout);
		rs2op2valid : bit_register port map ( clk, rs2wr, reset, rs2op2validin, rs2op2validout);
		rs3op2valid : bit_register port map ( clk, rs3wr, reset, rs3op2validin, rs3op2validout);
		rs4op2valid : bit_register port map ( clk, rs4wr, reset, rs4op2validin, rs4op2validout);
		rs5op2valid : bit_register port map ( clk, rs5wr, reset, rs5op2validin, rs5op2validout);
		rs6op2valid : bit_register port map ( clk, rs6wr, reset, rs6op2validin, rs6op2validout);
		rs7op2valid : bit_register port map ( clk, rs7wr, reset, rs7op2validin, rs7op2validout);
		rs8op2valid : bit_register port map ( clk, rs8wr, reset, rs8op2validin, rs8op2validout);
		rs9op2valid : bit_register port map ( clk, rs9wr, reset, rs9op2validin, rs9op2validout);
		rs10op2valid : bit_register port map ( clk, rs10wr, reset, rs10op2validin, rs10op2validout);
		rs11op2valid : bit_register port map ( clk, rs11wr, reset, rs11op2validin, rs11op2validout);
		rs12op2valid : bit_register port map ( clk, rs12wr, reset, rs12op2validin, rs12op2validout);
		rs13op2valid : bit_register port map ( clk, rs13wr, reset, rs13op2validin, rs13op2validout);
		rs14op2valid : bit_register port map ( clk, rs14wr, reset, rs14op2validin, rs14op2validout);
		rs15op2valid : bit_register port map ( clk, rs15wr, reset, rs15op2validin, rs15op2validout);
		rs16op2valid : bit_register port map ( clk, rs16wr, reset, rs16op2validin, rs16op2validout);


		rs1instrready : bit_register port map ( clk, rs1wr, reset, rs1instrreadyin, rs1instrreadyout);
		rs2instrready : bit_register port map ( clk, rs2wr, reset, rs2instrreadyin, rs2instrreadyout);
		rs3instrready : bit_register port map ( clk, rs3wr, reset, rs3instrreadyin, rs3instrreadyout);
		rs4instrready : bit_register port map ( clk, rs4wr, reset, rs4instrreadyin, rs4instrreadyout);
		rs5instrready : bit_register port map ( clk, rs5wr, reset, rs5instrreadyin, rs5instrreadyout);
		rs6instrready : bit_register port map ( clk, rs6wr, reset, rs6instrreadyin, rs6instrreadyout);
		rs7instrready : bit_register port map ( clk, rs7wr, reset, rs7instrreadyin, rs7instrreadyout);
		rs8instrready : bit_register port map ( clk, rs8wr, reset, rs8instrreadyin, rs8instrreadyout);
		rs9instrready : bit_register port map ( clk, rs9wr, reset, rs9instrreadyin, rs9instrreadyout);
		rs10instrready : bit_register port map ( clk, rs10wr, reset, rs10instrreadyin, rs10instrreadyout);
		rs11instrready : bit_register port map ( clk, rs11wr, reset, rs11instrreadyin, rs11instrreadyout);
		rs12instrready : bit_register port map ( clk, rs12wr, reset, rs12instrreadyin, rs12instrreadyout);
		rs13instrready : bit_register port map ( clk, rs13wr, reset, rs13instrreadyin, rs13instrreadyout);
		rs14instrready : bit_register port map ( clk, rs14wr, reset, rs14instrreadyin, rs14instrreadyout);
		rs15instrready : bit_register port map ( clk, rs15wr, reset, rs15instrreadyin, rs15instrreadyout);
		rs16instrready : bit_register port map ( clk, rs16wr, reset, rs16instrreadyin, rs16instrreadyout);


		rs1instrvalid : bit_register port map ( clk, rs1wr, reset, rs1instrvalidin, rs1instrvalidout);
		rs2instrvalid : bit_register port map ( clk, rs2wr, reset, rs2instrvalidin, rs2instrvalidout);
		rs3instrvalid : bit_register port map ( clk, rs3wr, reset, rs3instrvalidin, rs3instrvalidout);
		rs4instrvalid : bit_register port map ( clk, rs4wr, reset, rs4instrvalidin, rs4instrvalidout);
		rs5instrvalid : bit_register port map ( clk, rs5wr, reset, rs5instrvalidin, rs5instrvalidout);
		rs6instrvalid : bit_register port map ( clk, rs6wr, reset, rs6instrvalidin, rs6instrvalidout);
		rs7instrvalid : bit_register port map ( clk, rs7wr, reset, rs7instrvalidin, rs7instrvalidout);
		rs8instrvalid : bit_register port map ( clk, rs8wr, reset, rs8instrvalidin, rs8instrvalidout);
		rs9instrvalid : bit_register port map ( clk, rs9wr, reset, rs9instrvalidin, rs9instrvalidout);
		rs10instrvalid : bit_register port map ( clk, rs10wr, reset, rs10instrvalidin, rs10instrvalidout);
		rs11instrvalid : bit_register port map ( clk, rs11wr, reset, rs11instrvalidin, rs11instrvalidout);
		rs12instrvalid : bit_register port map ( clk, rs12wr, reset, rs12instrvalidin, rs12instrvalidout);
		rs13instrvalid : bit_register port map ( clk, rs13wr, reset, rs13instrvalidin, rs13instrvalidout);
		rs14instrvalid : bit_register port map ( clk, rs14wr, reset, rs14instrvalidin, rs14instrvalidout);
		rs15instrvalid : bit_register port map ( clk, rs15wr, reset, rs15instrvalidin, rs15instrvalidout);
		rs16instrvalid : bit_register port map ( clk, rs16wr, reset, rs16instrvalidin, rs16instrvalidout);


		rs1specbit : bit_register port map ( clk, rs1wr, reset, rs1specbitin, rs1specbitout);
		rs2specbit : bit_register port map ( clk, rs2wr, reset, rs2specbitin, rs2specbitout);
		rs3specbit : bit_register port map ( clk, rs3wr, reset, rs3specbitin, rs3specbitout);
		rs4specbit : bit_register port map ( clk, rs4wr, reset, rs4specbitin, rs4specbitout);
		rs5specbit : bit_register port map ( clk, rs5wr, reset, rs5specbitin, rs5specbitout);
		rs6specbit : bit_register port map ( clk, rs6wr, reset, rs6specbitin, rs6specbitout);
		rs7specbit : bit_register port map ( clk, rs7wr, reset, rs7specbitin, rs7specbitout);
		rs8specbit : bit_register port map ( clk, rs8wr, reset, rs8specbitin, rs8specbitout);
		rs9specbit : bit_register port map ( clk, rs9wr, reset, rs9specbitin, rs9specbitout);
		rs10specbit : bit_register port map ( clk, rs10wr, reset, rs10specbitin, rs10specbitout);
		rs11specbit : bit_register port map ( clk, rs11wr, reset, rs11specbitin, rs11specbitout);
		rs12specbit : bit_register port map ( clk, rs12wr, reset, rs12specbitin, rs12specbitout);
		rs13specbit : bit_register port map ( clk, rs13wr, reset, rs13specbitin, rs13specbitout);
		rs14specbit : bit_register port map ( clk, rs14wr, reset, rs14specbitin, rs14specbitout);
		rs15specbit : bit_register port map ( clk, rs15wr, reset, rs15specbitin, rs15specbitout);
		rs16specbit : bit_register port map ( clk, rs16wr, reset, rs16specbitin, rs16specbitout);



	process(rs1instrvalidout,rs2instrvalidout,rs3instrvalidout,rs4instrvalidout,rs5instrvalidout,rs6instrvalidout,rs7instrvalidout,rs8instrvalidout,rs9instrvalidout,rs10instrvalidout,rs11instrvalidout,rs12instrvalidout,rs13instrvalidout,rs14instrvalidout,rs15instrvalidout,rs16instrvalidout,ra1instrvalid,ra2instrvalid)

		begin

		if (ra1instrvalid = '1') then
			if (rs1instrvalidout = '0') then
				rs1pcin <= ra1pc;
				rs1op1in <= ra1op1;
				rs1op2in <= ra1op1;
				rs1instrin <= ra1instr;
				rs1rrtagin <= ra1rrtag;
				rs1spectagin <= ra1spectag;
				rs1op1validin <= ra1op1valid;
				rs1op2validin <= ra1op2valid;
				rs1instrreadyin <= ra1instrready;
				rs1instrvalidin <= ra1instrvalid;
				rs1specbitin <= ra1specbit;
				rs1wr <= '1';
				rsfull <= '0';

			elsif (rs2instrvalidout = '0') then
				rs2pcin <= ra1pc;
				rs2op1in <= ra1op1;
				rs2op2in <= ra1op1;
				rs2instrin <= ra1instr;
				rs2rrtagin <= ra1rrtag;
				rs2spectagin <= ra1spectag;
				rs2op1validin <= ra1op1valid;
				rs2op2validin <= ra1op2valid;
				rs2instrreadyin <= ra1instrready;
				rs2instrvalidin <= ra1instrvalid;
				rs2specbitin <= ra1specbit;
				rs2wr <= '1';
				rsfull <= '0';

			elsif (rs3instrvalidout = '0') then
				rs3pcin <= ra1pc;
				rs3op1in <= ra1op1;
				rs3op2in <= ra1op1;
				rs3instrin <= ra1instr;
				rs3rrtagin <= ra1rrtag;
				rs3spectagin <= ra1spectag;
				rs3op1validin <= ra1op1valid;
				rs3op2validin <= ra1op2valid;
				rs3instrreadyin <= ra1instrready;
				rs3instrvalidin <= ra1instrvalid;
				rs3specbitin <= ra1specbit;
				rs3wr <= '1';
				rsfull <= '0';

			elsif (rs4instrvalidout = '0') then
				rs4pcin <= ra1pc;
				rs4op1in <= ra1op1;
				rs4op2in <= ra1op1;
				rs4instrin <= ra1instr;
				rs4rrtagin <= ra1rrtag;
				rs4spectagin <= ra1spectag;
				rs4op1validin <= ra1op1valid;
				rs4op2validin <= ra1op2valid;
				rs4instrreadyin <= ra1instrready;
				rs4instrvalidin <= ra1instrvalid;
				rs4specbitin <= ra1specbit;
				rs4wr <= '1';
				rsfull <= '0';

			elsif (rs5instrvalidout = '0') then
				rs5pcin <= ra1pc;
				rs5op1in <= ra1op1;
				rs5op2in <= ra1op1;
				rs5instrin <= ra1instr;
				rs5rrtagin <= ra1rrtag;
				rs5spectagin <= ra1spectag;
				rs5op1validin <= ra1op1valid;
				rs5op2validin <= ra1op2valid;
				rs5instrreadyin <= ra1instrready;
				rs5instrvalidin <= ra1instrvalid;
				rs5specbitin <= ra1specbit;
				rs5wr <= '1';
				rsfull <= '0';

			elsif (rs6instrvalidout = '0') then
				rs6pcin <= ra1pc;
				rs6op1in <= ra1op1;
				rs6op2in <= ra1op1;
				rs6instrin <= ra1instr;
				rs6rrtagin <= ra1rrtag;
				rs6spectagin <= ra1spectag;
				rs6op1validin <= ra1op1valid;
				rs6op2validin <= ra1op2valid;
				rs6instrreadyin <= ra1instrready;
				rs6instrvalidin <= ra1instrvalid;
				rs6specbitin <= ra1specbit;
				rs6wr <= '1';
				rsfull <= '0';

			elsif (rs7instrvalidout = '0') then
				rs7pcin <= ra1pc;
				rs7op1in <= ra1op1;
				rs7op2in <= ra1op1;
				rs7instrin <= ra1instr;
				rs7rrtagin <= ra1rrtag;
				rs7spectagin <= ra1spectag;
				rs7op1validin <= ra1op1valid;
				rs7op2validin <= ra1op2valid;
				rs7instrreadyin <= ra1instrready;
				rs7instrvalidin <= ra1instrvalid;
				rs7specbitin <= ra1specbit;
				rs7wr <= '1';
				rsfull <= '0';

			elsif (rs8instrvalidout = '0') then
				rs8pcin <= ra1pc;
				rs8op1in <= ra1op1;
				rs8op2in <= ra1op1;
				rs8instrin <= ra1instr;
				rs8rrtagin <= ra1rrtag;
				rs8spectagin <= ra1spectag;
				rs8op1validin <= ra1op1valid;
				rs8op2validin <= ra1op2valid;
				rs8instrreadyin <= ra1instrready;
				rs8instrvalidin <= ra1instrvalid;
				rs8specbitin <= ra1specbit;
				rs8wr <= '1';
				rsfull <= '0';

			elsif (rs9instrvalidout = '0') then
				rs9pcin <= ra1pc;
				rs9op1in <= ra1op1;
				rs9op2in <= ra1op1;
				rs9instrin <= ra1instr;
				rs9rrtagin <= ra1rrtag;
				rs9spectagin <= ra1spectag;
				rs9op1validin <= ra1op1valid;
				rs9op2validin <= ra1op2valid;
				rs9instrreadyin <= ra1instrready;
				rs9instrvalidin <= ra1instrvalid;
				rs9specbitin <= ra1specbit;
				rs9wr <= '1';
				rsfull <= '0';

			elsif (rs10instrvalidout = '0') then
				rs10pcin <= ra1pc;
				rs10op1in <= ra1op1;
				rs10op2in <= ra1op1;
				rs10instrin <= ra1instr;
				rs10rrtagin <= ra1rrtag;
				rs10spectagin <= ra1spectag;
				rs10op1validin <= ra1op1valid;
				rs10op2validin <= ra1op2valid;
				rs10instrreadyin <= ra1instrready;
				rs10instrvalidin <= ra1instrvalid;
				rs10specbitin <= ra1specbit;
				rs10wr <= '1';
				rsfull <= '0';

			elsif (rs11instrvalidout = '0') then
				rs11pcin <= ra1pc;
				rs11op1in <= ra1op1;
				rs11op2in <= ra1op1;
				rs11instrin <= ra1instr;
				rs11rrtagin <= ra1rrtag;
				rs11spectagin <= ra1spectag;
				rs11op1validin <= ra1op1valid;
				rs11op2validin <= ra1op2valid;
				rs11instrreadyin <= ra1instrready;
				rs11instrvalidin <= ra1instrvalid;
				rs11specbitin <= ra1specbit;
				rs11wr <= '1';
				rsfull <= '0';

			elsif (rs12instrvalidout = '0') then
				rs12pcin <= ra1pc;
				rs12op1in <= ra1op1;
				rs12op2in <= ra1op1;
				rs12instrin <= ra1instr;
				rs12rrtagin <= ra1rrtag;
				rs12spectagin <= ra1spectag;
				rs12op1validin <= ra1op1valid;
				rs12op2validin <= ra1op2valid;
				rs12instrreadyin <= ra1instrready;
				rs12instrvalidin <= ra1instrvalid;
				rs12specbitin <= ra1specbit;
				rs12wr <= '1';
				rsfull <= '0';

			elsif (rs13instrvalidout = '0') then
				rs13pcin <= ra1pc;
				rs13op1in <= ra1op1;
				rs13op2in <= ra1op1;
				rs13instrin <= ra1instr;
				rs13rrtagin <= ra1rrtag;
				rs13spectagin <= ra1spectag;
				rs13op1validin <= ra1op1valid;
				rs13op2validin <= ra1op2valid;
				rs13instrreadyin <= ra1instrready;
				rs13instrvalidin <= ra1instrvalid;
				rs13specbitin <= ra1specbit;
				rs13wr <= '1';
				rsfull <= '0';

			elsif (rs14instrvalidout = '0') then
				rs14pcin <= ra1pc;
				rs14op1in <= ra1op1;
				rs14op2in <= ra1op1;
				rs14instrin <= ra1instr;
				rs14rrtagin <= ra1rrtag;
				rs14spectagin <= ra1spectag;
				rs14op1validin <= ra1op1valid;
				rs14op2validin <= ra1op2valid;
				rs14instrreadyin <= ra1instrready;
				rs14instrvalidin <= ra1instrvalid;
				rs14specbitin <= ra1specbit;
				rs14wr <= '1';
				rsfull <= '0';

			elsif (rs15instrvalidout = '0') then
				rs15pcin <= ra1pc;
				rs15op1in <= ra1op1;
				rs15op2in <= ra1op1;
				rs15instrin <= ra1instr;
				rs15rrtagin <= ra1rrtag;
				rs15spectagin <= ra1spectag;
				rs15op1validin <= ra1op1valid;
				rs15op2validin <= ra1op2valid;
				rs15instrreadyin <= ra1instrready;
				rs15instrvalidin <= ra1instrvalid;
				rs15specbitin <= ra1specbit;
				rs15wr <= '1';
				rsfull <= '0';

			elsif (rs16instrvalidout = '0') then
				rs16pcin <= ra1pc;
				rs16op1in <= ra1op1;
				rs16op2in <= ra1op1;
				rs16instrin <= ra1instr;
				rs16rrtagin <= ra1rrtag;
				rs16spectagin <= ra1spectag;
				rs16op1validin <= ra1op1valid;
				rs16op2validin <= ra1op2valid;
				rs16instrreadyin <= ra1instrready;
				rs16instrvalidin <= ra1instrvalid;
				rs16specbitin <= ra1specbit;
				rs16wr <= '1';
				rsfull <= '0';

			else
				rsfull <= '1'
				
			end if;
		end if;

		if (ra2instrvalid = '1') then
			if (rs1instrvalidout = '0') then
				rs1pcin <= ra2pc;
				rs1op1in <= ra2op1;
				rs1op2in <= ra2op1;
				rs1instrin <= ra2instr;
				rs1rrtagin <= ra2rrtag;
				rs1spectagin <= ra2spectag;
				rs1op1validin <= ra2op1valid;
				rs1op2validin <= ra2op2valid;
				rs1instrreadyin <= ra2instrready;
				rs1instrvalidin <= ra2instrvalid;
				rs1specbitin <= ra2specbit;
				rs1wr <= '1';
				rsfull <= '0';

			elsif (rs2instrvalidout = '0') then
				rs2pcin <= ra2pc;
				rs2op1in <= ra2op1;
				rs2op2in <= ra2op1;
				rs2instrin <= ra2instr;
				rs2rrtagin <= ra2rrtag;
				rs2spectagin <= ra2spectag;
				rs2op1validin <= ra2op1valid;
				rs2op2validin <= ra2op2valid;
				rs2instrreadyin <= ra2instrready;
				rs2instrvalidin <= ra2instrvalid;
				rs2specbitin <= ra2specbit;
				rs2wr <= '1';
				rsfull <= '0';

			elsif (rs3instrvalidout = '0') then
				rs3pcin <= ra2pc;
				rs3op1in <= ra2op1;
				rs3op2in <= ra2op1;
				rs3instrin <= ra2instr;
				rs3rrtagin <= ra2rrtag;
				rs3spectagin <= ra2spectag;
				rs3op1validin <= ra2op1valid;
				rs3op2validin <= ra2op2valid;
				rs3instrreadyin <= ra2instrready;
				rs3instrvalidin <= ra2instrvalid;
				rs3specbitin <= ra2specbit;
				rs3wr <= '1';
				rsfull <= '0';

			elsif (rs4instrvalidout = '0') then
				rs4pcin <= ra2pc;
				rs4op1in <= ra2op1;
				rs4op2in <= ra2op1;
				rs4instrin <= ra2instr;
				rs4rrtagin <= ra2rrtag;
				rs4spectagin <= ra2spectag;
				rs4op1validin <= ra2op1valid;
				rs4op2validin <= ra2op2valid;
				rs4instrreadyin <= ra2instrready;
				rs4instrvalidin <= ra2instrvalid;
				rs4specbitin <= ra2specbit;
				rs4wr <= '1';
				rsfull <= '0';

			elsif (rs5instrvalidout = '0') then
				rs5pcin <= ra2pc;
				rs5op1in <= ra2op1;
				rs5op2in <= ra2op1;
				rs5instrin <= ra2instr;
				rs5rrtagin <= ra2rrtag;
				rs5spectagin <= ra2spectag;
				rs5op1validin <= ra2op1valid;
				rs5op2validin <= ra2op2valid;
				rs5instrreadyin <= ra2instrready;
				rs5instrvalidin <= ra2instrvalid;
				rs5specbitin <= ra2specbit;
				rs5wr <= '1';
				rsfull <= '0';

			elsif (rs6instrvalidout = '0') then
				rs6pcin <= ra2pc;
				rs6op1in <= ra2op1;
				rs6op2in <= ra2op1;
				rs6instrin <= ra2instr;
				rs6rrtagin <= ra2rrtag;
				rs6spectagin <= ra2spectag;
				rs6op1validin <= ra2op1valid;
				rs6op2validin <= ra2op2valid;
				rs6instrreadyin <= ra2instrready;
				rs6instrvalidin <= ra2instrvalid;
				rs6specbitin <= ra2specbit;
				rs6wr <= '1';
				rsfull <= '0';

			elsif (rs7instrvalidout = '0') then
				rs7pcin <= ra2pc;
				rs7op1in <= ra2op1;
				rs7op2in <= ra2op1;
				rs7instrin <= ra2instr;
				rs7rrtagin <= ra2rrtag;
				rs7spectagin <= ra2spectag;
				rs7op1validin <= ra2op1valid;
				rs7op2validin <= ra2op2valid;
				rs7instrreadyin <= ra2instrready;
				rs7instrvalidin <= ra2instrvalid;
				rs7specbitin <= ra2specbit;
				rs7wr <= '1';
				rsfull <= '0';

			elsif (rs8instrvalidout = '0') then
				rs8pcin <= ra2pc;
				rs8op1in <= ra2op1;
				rs8op2in <= ra2op1;
				rs8instrin <= ra2instr;
				rs8rrtagin <= ra2rrtag;
				rs8spectagin <= ra2spectag;
				rs8op1validin <= ra2op1valid;
				rs8op2validin <= ra2op2valid;
				rs8instrreadyin <= ra2instrready;
				rs8instrvalidin <= ra2instrvalid;
				rs8specbitin <= ra2specbit;
				rs8wr <= '1';
				rsfull <= '0';

			elsif (rs9instrvalidout = '0') then
				rs9pcin <= ra2pc;
				rs9op1in <= ra2op1;
				rs9op2in <= ra2op1;
				rs9instrin <= ra2instr;
				rs9rrtagin <= ra2rrtag;
				rs9spectagin <= ra2spectag;
				rs9op1validin <= ra2op1valid;
				rs9op2validin <= ra2op2valid;
				rs9instrreadyin <= ra2instrready;
				rs9instrvalidin <= ra2instrvalid;
				rs9specbitin <= ra2specbit;
				rs9wr <= '1';
				rsfull <= '0';

			elsif (rs10instrvalidout = '0') then
				rs10pcin <= ra2pc;
				rs10op1in <= ra2op1;
				rs10op2in <= ra2op1;
				rs10instrin <= ra2instr;
				rs10rrtagin <= ra2rrtag;
				rs10spectagin <= ra2spectag;
				rs10op1validin <= ra2op1valid;
				rs10op2validin <= ra2op2valid;
				rs10instrreadyin <= ra2instrready;
				rs10instrvalidin <= ra2instrvalid;
				rs10specbitin <= ra2specbit;
				rs10wr <= '1';
				rsfull <= '0';

			elsif (rs11instrvalidout = '0') then
				rs11pcin <= ra2pc;
				rs11op1in <= ra2op1;
				rs11op2in <= ra2op1;
				rs11instrin <= ra2instr;
				rs11rrtagin <= ra2rrtag;
				rs11spectagin <= ra2spectag;
				rs11op1validin <= ra2op1valid;
				rs11op2validin <= ra2op2valid;
				rs11instrreadyin <= ra2instrready;
				rs11instrvalidin <= ra2instrvalid;
				rs11specbitin <= ra2specbit;
				rs11wr <= '1';
				rsfull <= '0';

			elsif (rs12instrvalidout = '0') then
				rs12pcin <= ra2pc;
				rs12op1in <= ra2op1;
				rs12op2in <= ra2op1;
				rs12instrin <= ra2instr;
				rs12rrtagin <= ra2rrtag;
				rs12spectagin <= ra2spectag;
				rs12op1validin <= ra2op1valid;
				rs12op2validin <= ra2op2valid;
				rs12instrreadyin <= ra2instrready;
				rs12instrvalidin <= ra2instrvalid;
				rs12specbitin <= ra2specbit;
				rs12wr <= '1';
				rsfull <= '0';

			elsif (rs13instrvalidout = '0') then
				rs13pcin <= ra2pc;
				rs13op1in <= ra2op1;
				rs13op2in <= ra2op1;
				rs13instrin <= ra2instr;
				rs13rrtagin <= ra2rrtag;
				rs13spectagin <= ra2spectag;
				rs13op1validin <= ra2op1valid;
				rs13op2validin <= ra2op2valid;
				rs13instrreadyin <= ra2instrready;
				rs13instrvalidin <= ra2instrvalid;
				rs13specbitin <= ra2specbit;
				rs13wr <= '1';
				rsfull <= '0';

			elsif (rs14instrvalidout = '0') then
				rs14pcin <= ra2pc;
				rs14op1in <= ra2op1;
				rs14op2in <= ra2op1;
				rs14instrin <= ra2instr;
				rs14rrtagin <= ra2rrtag;
				rs14spectagin <= ra2spectag;
				rs14op1validin <= ra2op1valid;
				rs14op2validin <= ra2op2valid;
				rs14instrreadyin <= ra2instrready;
				rs14instrvalidin <= ra2instrvalid;
				rs14specbitin <= ra2specbit;
				rs14wr <= '1';
				rsfull <= '0';

			elsif (rs15instrvalidout = '0') then
				rs15pcin <= ra2pc;
				rs15op1in <= ra2op1;
				rs15op2in <= ra2op1;
				rs15instrin <= ra2instr;
				rs15rrtagin <= ra2rrtag;
				rs15spectagin <= ra2spectag;
				rs15op1validin <= ra2op1valid;
				rs15op2validin <= ra2op2valid;
				rs15instrreadyin <= ra2instrready;
				rs15instrvalidin <= ra2instrvalid;
				rs15specbitin <= ra2specbit;
				rs15wr <= '1';
				rsfull <= '0';

			elsif (rs16instrvalidout = '0') then
				rs16pcin <= ra2pc;
				rs16op1in <= ra2op1;
				rs16op2in <= ra2op1;
				rs16instrin <= ra2instr;
				rs16rrtagin <= ra2rrtag;
				rs16spectagin <= ra2spectag;
				rs16op1validin <= ra2op1valid;
				rs16op2validin <= ra2op2valid;
				rs16instrreadyin <= ra2instrready;
				rs16instrvalidin <= ra2instrvalid;
				rs16specbitin <= ra2specbit;
				rs16wr <= '1';
				rsfull <= '0';

			else
				rsfull <= '1'
				
			end if;

		end if;

	end process

end behave;