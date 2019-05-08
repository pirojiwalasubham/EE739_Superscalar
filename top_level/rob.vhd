library std;
use std.standard.all;

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_misc.all;


entity rob is 
	port(
		clk,reset : in std_logic;
		pc_1_in, pc_2_in, dest_1_in, dest_2_in, ir_1_in, ir_2_in, pc_exec_1_in, pc_exec_2_in : in std_logic_vector(15 downto 0);
		dest_tag_1_in, dest_tag_2_in, c_tag_1_in, c_tag_2_in, z_tag_1_in, z_tag_2_in : in std_logic_vector(4 downto 0);
		--spec_tag_1_in, spec_tag_2_in : in std_logic;
		valid_1_in, valid_2_in, complete_exec_1_in, complete_exec_2_in, mr_1_in, mr_2_in, c_1_in, c_2_in, z_1_in, z_2_in, cwr_1_in, cwr_2_in, zwr_1_in, zwr_2_in : in std_logic;
		alu_p_in,  ls_p_write_addr, ls_p_data: in std_logic_vector(15 downto 0);
		valid_exec_alu, valid_exec_ls, alu_c_in,alu_z_in,ls_z_in,alu_p_no_ans : in std_logic;

		free_rrf_vect_in, val_rrf_vect_in : in std_logic_vector(31 downto 0);
		arf_tag_in_1, arf_tag_in_2, c_tag_in, z_tag_in : in std_logic_vector(4 downto 0);

		robfull, finalc_out, finalz_out : out std_logic;
		data_out_1, data_out_2,data_out_3, mem_addr_1, mem_addr_2 : out std_logic_vector(15 downto 0); 
		arf_addr_out_1, arf_addr_out_2 : out std_logic_vector(2 downto 0);
		rrf_addr_out_1, rrf_addr_out_2 : out std_logic_vector(4 downto 0);
		no_of_stores_cleared : out std_logic_vector(1 downto 0);
		free_rrf_vect_out, val_rrf_vect_out : out std_logic_vector(31 downto 0);  
		arf_en_1, arf_en_2,arf_en_3, mem_en_1, mem_en_2,c_en,z_en,arf_busy_en_1,arf_busy_en_2,z_busy_en,c_busy_en : out std_logic;
		rrf_tag_out1,rrf_tag_out2 : out std_logic_vector(4 downto 0)

		); -- output
end rob;

--Write result into ARF or memory.
--Write C and Z into global C and Z (optional).
--Edit free_rr_vector to make the RRs of retiring destinations free.
--Edit val_rr_vector to make the RRs of retiring destinations invalid.
--Using tag-matching, make destination AR in ARF non-busy (using ports available).
--Using tag-matching, make C and Z non-busy (optional).
--Check and manage store tag while retiring store instructions.

architecture behave of rob is

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

	component Add5 is
	   port(x,y: in std_logic_vector(4 downto 0);
			s0: out std_logic_vector(4 downto 0));
	end component;


	type s_16 is array (0 to 31) of std_logic_vector(15 downto 0);
	type s_5 is array (0 to 31) of std_logic_vector(4 downto 0);
	type s_1 is array (0 to 31) of std_logic;
	
	signal pc,dest, ir, result,pc_exec, pc_out, dest_out, ir_out, result_out, pc_exec_out : s_16;
	signal dest_tag_out, dest_tag, c_tag_out, z_tag_out, c_tag, z_tag : s_5;
	signal en,valid, complete_exec, mr, c, z, cwr, zwr, valid_out, complete_exec_out, mr_out, c_out, z_out, cwr_out, zwr_out,no_wb,no_wb_out : s_1;

	signal tail_ptr, head_ptr, tail_ptr_out, head_ptr_out, tail_ptr_out_plus1, head_ptr_out_plus1, tail_ptr_out_plus2, head_ptr_out_plus2 : std_logic_vector(4 downto 0);

	signal mr1,mr2,c_en_temp,z_en_temp,mem_en_1_temp,mem_en_2_temp,arf_en_1_temp, arf_en_2_temp : std_logic;

	signal exec_ptr_1, exec_ptr_2: std_logic_vector(4 downto 0);

	signal dest1, dest2 : std_logic_vector(15 downto 0);

	begin

	ReorderBuffer : for i in 0 to 31 generate
		rob_pc : myRegister generic map (16) port map (clk,en(i),reset,pc(i),pc_out(i));
		rob_dest : myRegister generic map (16) port map (clk,en(i),reset,dest(i),dest_out(i));
		rob_ir : myRegister generic map (16) port map (clk,en(i),reset,ir(i),ir_out(i));
		rob_result : myRegister generic map (16) port map (clk,en(i),reset,result(i),result_out(i));
		rob_dest_tag : myRegister generic map (5) port map (clk,en(i),reset,dest_tag(i),dest_tag_out(i));
		rob_c_tag : myRegister generic map (5) port map (clk,en(i),reset,c_tag(i),c_tag_out(i));
		rob_z_tag : myRegister generic map (5) port map (clk,en(i),reset,z_tag(i),z_tag_out(i));
		--rob_spec_tag : bit_register port map (clk,en(i),reset,spec_tag(i),spec_tag_out(i));

		rob_complete_exec : bit_register port map (clk,en(i),reset,complete_exec(i),complete_exec_out(i));
		rob_mr : bit_register port map (clk,en(i),reset,mr(i),mr_out(i));
		rob_c : bit_register port map (clk,en(i),reset,c(i),c_out(i));
		rob_z : bit_register port map (clk,en(i),reset,z(i),z_out(i));
		rob_cwr : bit_register port map (clk,en(i),reset,cwr(i),cwr_out(i));
		rob_zwr : bit_register port map (clk,en(i),reset,zwr(i),zwr_out(i));
		rob_valid : bit_register port map (clk,en(i),reset,valid(i),valid_out(i));
		rob_no_wb : bit_register port map (clk,en(i),reset,no_wb(i),no_wb_out(i));

	end generate ReorderBuffer;

	head_ptr_reg : myRegister generic map (5) port map (clk,'1',reset,head_ptr,head_ptr_out);
	tail_ptr_reg : myRegister generic map (5) port map (clk,'1',reset,tail_ptr,tail_ptr_out);

	a1 : Add5 port map (head_ptr_out,"00001",head_ptr_out_plus1);
	a2 : Add5 port map (head_ptr_out,"00010",head_ptr_out_plus2);
	a3 : Add5 port map (tail_ptr_out,"00001",tail_ptr_out_plus1);
	a4 : Add5 port map (tail_ptr_out,"00010",tail_ptr_out_plus2);


process(clk,reset,
		pc_1_in, pc_2_in, dest_1_in, dest_2_in, ir_1_in, ir_2_in, pc_exec_1_in, pc_exec_2_in,
		dest_tag_1_in, dest_tag_2_in, c_tag_1_in, c_tag_2_in, z_tag_1_in, z_tag_2_in,
		valid_1_in, valid_2_in, complete_exec_1_in, complete_exec_2_in, mr_1_in, mr_2_in, c_1_in, c_2_in, z_1_in, z_2_in, cwr_1_in, cwr_2_in, zwr_1_in, zwr_2_in,
		alu_p_in,  ls_p_write_addr, ls_p_data,
		valid_exec_alu, valid_exec_ls, alu_c_in,alu_z_in,ls_z_in,alu_p_no_ans,

		free_rrf_vect_in, val_rrf_vect_in,
		arf_tag_in_1, arf_tag_in_2, c_tag_in, z_tag_in,

		pc,dest, ir, result,pc_exec, pc_out, dest_out, ir_out, result_out, pc_exec_out,
		dest_tag_out, dest_tag, c_tag_out, z_tag_out, c_tag, z_tag,
		en,valid, complete_exec, mr, c, z, cwr, zwr, valid_out, complete_exec_out, mr_out, c_out, z_out, cwr_out, zwr_out,

		tail_ptr, head_ptr, tail_ptr_out, head_ptr_out, tail_ptr_out_plus1, head_ptr_out_plus1, tail_ptr_out_plus2, head_ptr_out_plus2,

		mr1,mr2,c_en_temp,z_en_temp,mem_en_1_temp,mem_en_2_temp,arf_en_1_temp, arf_en_2_temp,

		exec_ptr_1, exec_ptr_2,

		dest1, dest2,no_wb_out,no_wb)

	begin

	first : for k in 0 to 31 loop
		pc(k) <= pc_out(k);
		dest(k) <= dest_out(k);
		ir(k) <= ir_out(k);
		result(k) <= result_out(k);
		dest_tag(k) <= dest_tag_out(k);
		complete_exec(k) <= complete_exec_out(k);
		mr(k) <= mr_out(k);
		c(k) <= c_out(k);
		z(k) <= z_out(k);
		c_tag(k) <= c_tag_out(k);
		z_tag(k) <= z_tag_out(k);
		cwr(k) <= cwr_out(k);
		zwr(k) <= zwr_out(k);
		valid(k) <= valid_out(k);
		no_wb(k) <= no_wb_out(k);
		en(k) <= '0';
	end loop first;

-------------------------------------------------------------------------------------------
--INPUT LOGIC
-------------------------------------------------------------------------------------------


	if ((ir_1_in(15 downto 12) = "0101" or ir_1_in(15 downto 12) = "0111")) then
		mr1 <= '1';
	else
		mr1 <= '0';		
	end if;

	if ((ir_2_in(15 downto 12) = "0101" or ir_2_in(15 downto 12) = "0111")) then
		mr2 <= '1';
	else
		mr2 <= '0';		
	end if;
	

	if (valid_1_in = '1') then

		pc(to_integer(unsigned(tail_ptr_out))) <= pc_1_in;
		ir(to_integer(unsigned(tail_ptr_out))) <= ir_1_in;
		dest_tag(to_integer(unsigned(tail_ptr_out))) <= dest_tag_1_in;
		c_tag(to_integer(unsigned(tail_ptr_out))) <= c_tag_1_in;
		z_tag(to_integer(unsigned(tail_ptr_out))) <= z_tag_1_in;
		mr(to_integer(unsigned(tail_ptr_out))) <= mr1;
		cwr(to_integer(unsigned(tail_ptr_out))) <= cwr_1_in;
		zwr(to_integer(unsigned(tail_ptr_out))) <= zwr_1_in;
		valid(to_integer(unsigned(tail_ptr_out))) <= valid_1_in;
		en(to_integer(unsigned(tail_ptr_out))) <= '1';

	elsif (valid_1_in = '0' and valid_2_in = '1') then

		pc(to_integer(unsigned(tail_ptr_out))) <= pc_2_in;
		ir(to_integer(unsigned(tail_ptr_out))) <= ir_2_in;
		dest_tag(to_integer(unsigned(tail_ptr_out))) <= dest_tag_2_in;
		c_tag(to_integer(unsigned(tail_ptr_out))) <= c_tag_2_in;
		z_tag(to_integer(unsigned(tail_ptr_out))) <= z_tag_2_in;
		mr(to_integer(unsigned(tail_ptr_out))) <= mr2;
		cwr(to_integer(unsigned(tail_ptr_out))) <= cwr_2_in;
		zwr(to_integer(unsigned(tail_ptr_out))) <= zwr_2_in;
		valid(to_integer(unsigned(tail_ptr_out))) <= valid_2_in;
		en(to_integer(unsigned(tail_ptr_out))) <= '1';

	else
		
		pc(to_integer(unsigned(tail_ptr_out))) <= (others => '0');
		ir(to_integer(unsigned(tail_ptr_out))) <= (others => '0');
		dest_tag(to_integer(unsigned(tail_ptr_out))) <= (others => '0');
		c_tag(to_integer(unsigned(tail_ptr_out))) <= (others => '0');
		z_tag(to_integer(unsigned(tail_ptr_out))) <= (others => '0');
		mr(to_integer(unsigned(tail_ptr_out))) <= '0';
		cwr(to_integer(unsigned(tail_ptr_out))) <= '0';
		zwr(to_integer(unsigned(tail_ptr_out))) <= '0';
		valid(to_integer(unsigned(tail_ptr_out))) <= '0';
		en(to_integer(unsigned(tail_ptr_out))) <= '0';
		
	end if;


	if (valid_2_in = '1' and valid_1_in = '1') then
		
		pc(to_integer(unsigned(tail_ptr_out_plus1))) <= pc_2_in;
		ir(to_integer(unsigned(tail_ptr_out_plus1))) <= ir_2_in;
		dest_tag(to_integer(unsigned(tail_ptr_out_plus1))) <= dest_tag_2_in;
		c_tag(to_integer(unsigned(tail_ptr_out_plus1))) <= c_tag_2_in;
		z_tag(to_integer(unsigned(tail_ptr_out_plus1))) <= z_tag_2_in;
		mr(to_integer(unsigned(tail_ptr_out_plus1))) <= mr2;
		cwr(to_integer(unsigned(tail_ptr_out_plus1))) <= cwr_2_in;
		zwr(to_integer(unsigned(tail_ptr_out_plus1))) <= zwr_2_in;
		valid(to_integer(unsigned(tail_ptr_out_plus1))) <= valid_2_in;
		en(to_integer(unsigned(tail_ptr_out_plus1))) <= '1';	

	else
		
		pc(to_integer(unsigned(tail_ptr_out_plus1))) <= (others => '0');
		ir(to_integer(unsigned(tail_ptr_out_plus1))) <= (others => '0');
		dest_tag(to_integer(unsigned(tail_ptr_out_plus1))) <= (others => '0');
		c_tag(to_integer(unsigned(tail_ptr_out_plus1))) <= (others => '0');
		z_tag(to_integer(unsigned(tail_ptr_out_plus1))) <= (others => '0');
		mr(to_integer(unsigned(tail_ptr_out_plus1))) <= '0';
		cwr(to_integer(unsigned(tail_ptr_out_plus1))) <= '0';
		zwr(to_integer(unsigned(tail_ptr_out_plus1))) <= '0';
		valid(to_integer(unsigned(tail_ptr_out_plus1))) <= '0';
		en(to_integer(unsigned(tail_ptr_out_plus1))) <= '0';

	end if;

	if (valid_1_in = '0' and valid_2_in = '0') then
		tail_ptr <= tail_ptr_out;
	elsif ((valid_1_in = '1' and valid_2_in = '0') or (valid_1_in = '0' and valid_2_in = '1')) then
		tail_ptr <= tail_ptr_out_plus1;
	else
		tail_ptr <= tail_ptr_out_plus2;
	end if;

	if (tail_ptr_out_plus2 = head_ptr_out) then
		robfull <= '1';
	else
		robfull <= '0';
	end if;
	
				
---------------------------------------------------------------------------------------------------------------------------
--Taking Results from Execution
---------------------------------------------------------------------------------------------------------------------------


	if (pc_out(0) = pc_exec_1_in and valid_exec_alu = '1' and valid_out(0) = '1') then
		exec_ptr_1 <= std_logic_vector(to_unsigned(0,5));
	elsif (pc_out(1) = pc_exec_1_in and valid_exec_alu = '1' and valid_out(1) = '1') then
		exec_ptr_1 <= std_logic_vector(to_unsigned(1,5));
	elsif (pc_out(2) = pc_exec_1_in and valid_exec_alu = '1' and valid_out(2) = '1') then
		exec_ptr_1 <= std_logic_vector(to_unsigned(2,5));
	elsif (pc_out(3) = pc_exec_1_in and valid_exec_alu = '1' and valid_out(3) = '1') then
		exec_ptr_1 <= std_logic_vector(to_unsigned(3,5));
	elsif (pc_out(4) = pc_exec_1_in and valid_exec_alu = '1' and valid_out(4) = '1') then
		exec_ptr_1 <= std_logic_vector(to_unsigned(4,5));
	elsif (pc_out(5) = pc_exec_1_in and valid_exec_alu = '1' and valid_out(5) = '1') then
		exec_ptr_1 <= std_logic_vector(to_unsigned(5,5));
	elsif (pc_out(6) = pc_exec_1_in and valid_exec_alu = '1' and valid_out(6) = '1') then
		exec_ptr_1 <= std_logic_vector(to_unsigned(6,5));
	elsif (pc_out(7) = pc_exec_1_in and valid_exec_alu = '1' and valid_out(7) = '1') then
		exec_ptr_1 <= std_logic_vector(to_unsigned(7,5));
	elsif (pc_out(8) = pc_exec_1_in and valid_exec_alu = '1' and valid_out(8) = '1') then
		exec_ptr_1 <= std_logic_vector(to_unsigned(8,5));
	elsif (pc_out(9) = pc_exec_1_in and valid_exec_alu = '1' and valid_out(9) = '1') then
		exec_ptr_1 <= std_logic_vector(to_unsigned(9,5));
	elsif (pc_out(10) = pc_exec_1_in and valid_exec_alu = '1' and valid_out(10) = '1') then
		exec_ptr_1 <= std_logic_vector(to_unsigned(10,5));
	elsif (pc_out(11) = pc_exec_1_in and valid_exec_alu = '1' and valid_out(11) = '1') then
		exec_ptr_1 <= std_logic_vector(to_unsigned(11,5));
	elsif (pc_out(12) = pc_exec_1_in and valid_exec_alu = '1' and valid_out(12) = '1') then
		exec_ptr_1 <= std_logic_vector(to_unsigned(12,5));
	elsif (pc_out(13) = pc_exec_1_in and valid_exec_alu = '1' and valid_out(13) = '1') then
		exec_ptr_1 <= std_logic_vector(to_unsigned(13,5));
	elsif (pc_out(14) = pc_exec_1_in and valid_exec_alu = '1' and valid_out(14) = '1') then
		exec_ptr_1 <= std_logic_vector(to_unsigned(14,5));
	elsif (pc_out(15) = pc_exec_1_in and valid_exec_alu = '1' and valid_out(15) = '1') then
		exec_ptr_1 <= std_logic_vector(to_unsigned(15,5));
	elsif (pc_out(16) = pc_exec_1_in and valid_exec_alu = '1' and valid_out(16) = '1') then
		exec_ptr_1 <= std_logic_vector(to_unsigned(16,5));
	elsif (pc_out(17) = pc_exec_1_in and valid_exec_alu = '1' and valid_out(17) = '1') then
		exec_ptr_1 <= std_logic_vector(to_unsigned(17,5));
	elsif (pc_out(18) = pc_exec_1_in and valid_exec_alu = '1' and valid_out(18) = '1') then
		exec_ptr_1 <= std_logic_vector(to_unsigned(18,5));
	elsif (pc_out(19) = pc_exec_1_in and valid_exec_alu = '1' and valid_out(19) = '1') then
		exec_ptr_1 <= std_logic_vector(to_unsigned(19,5));
	elsif (pc_out(20) = pc_exec_1_in and valid_exec_alu = '1' and valid_out(20) = '1') then
		exec_ptr_1 <= std_logic_vector(to_unsigned(20,5));
	elsif (pc_out(21) = pc_exec_1_in and valid_exec_alu = '1' and valid_out(21) = '1') then
		exec_ptr_1 <= std_logic_vector(to_unsigned(21,5));
	elsif (pc_out(22) = pc_exec_1_in and valid_exec_alu = '1' and valid_out(22) = '1') then
		exec_ptr_1 <= std_logic_vector(to_unsigned(22,5));
	elsif (pc_out(23) = pc_exec_1_in and valid_exec_alu = '1' and valid_out(23) = '1') then
		exec_ptr_1 <= std_logic_vector(to_unsigned(23,5));
	elsif (pc_out(24) = pc_exec_1_in and valid_exec_alu = '1' and valid_out(24) = '1') then
		exec_ptr_1 <= std_logic_vector(to_unsigned(24,5));
	elsif (pc_out(25) = pc_exec_1_in and valid_exec_alu = '1' and valid_out(25) = '1') then
		exec_ptr_1 <= std_logic_vector(to_unsigned(25,5));
	elsif (pc_out(26) = pc_exec_1_in and valid_exec_alu = '1' and valid_out(26) = '1') then
		exec_ptr_1 <= std_logic_vector(to_unsigned(26,5));
	elsif (pc_out(27) = pc_exec_1_in and valid_exec_alu = '1' and valid_out(27) = '1') then
		exec_ptr_1 <= std_logic_vector(to_unsigned(27,5));
	elsif (pc_out(28) = pc_exec_1_in and valid_exec_alu = '1' and valid_out(28) = '1') then
		exec_ptr_1 <= std_logic_vector(to_unsigned(28,5));
	elsif (pc_out(29) = pc_exec_1_in and valid_exec_alu = '1' and valid_out(29) = '1') then
		exec_ptr_1 <= std_logic_vector(to_unsigned(29,5));
	elsif (pc_out(30) = pc_exec_1_in and valid_exec_alu = '1' and valid_out(30) = '1') then
		exec_ptr_1 <= std_logic_vector(to_unsigned(30,5));
	elsif (pc_out(31) = pc_exec_1_in and valid_exec_alu = '1' and valid_out(31) = '1') then
		exec_ptr_1 <= std_logic_vector(to_unsigned(31,5));
	else
		exec_ptr_1 <= "00000";
	end if;

	if (pc_out(0) = pc_exec_2_in and valid_exec_ls = '1' and valid_out(0) = '1') then
		exec_ptr_2 <= std_logic_vector(to_unsigned(0,5));
	elsif (pc_out(1) = pc_exec_2_in and valid_exec_ls = '1' and valid_out(1) = '1') then
		exec_ptr_2 <= std_logic_vector(to_unsigned(1,5));
	elsif (pc_out(2) = pc_exec_2_in and valid_exec_ls = '1' and valid_out(2) = '1') then
		exec_ptr_2 <= std_logic_vector(to_unsigned(2,5));
	elsif (pc_out(3) = pc_exec_2_in and valid_exec_ls = '1' and valid_out(3) = '1') then
		exec_ptr_2 <= std_logic_vector(to_unsigned(3,5));
	elsif (pc_out(4) = pc_exec_2_in and valid_exec_ls = '1' and valid_out(4) = '1') then
		exec_ptr_2 <= std_logic_vector(to_unsigned(4,5));
	elsif (pc_out(5) = pc_exec_2_in and valid_exec_ls = '1' and valid_out(5) = '1') then
		exec_ptr_2 <= std_logic_vector(to_unsigned(5,5));
	elsif (pc_out(6) = pc_exec_2_in and valid_exec_ls = '1' and valid_out(6) = '1') then
		exec_ptr_2 <= std_logic_vector(to_unsigned(6,5));
	elsif (pc_out(7) = pc_exec_2_in and valid_exec_ls = '1' and valid_out(7) = '1') then
		exec_ptr_2 <= std_logic_vector(to_unsigned(7,5));
	elsif (pc_out(8) = pc_exec_2_in and valid_exec_ls = '1' and valid_out(8) = '1') then
		exec_ptr_2 <= std_logic_vector(to_unsigned(8,5));
	elsif (pc_out(9) = pc_exec_2_in and valid_exec_ls = '1'and valid_out(9) = '1') then
		exec_ptr_2 <= std_logic_vector(to_unsigned(9,5));
	elsif (pc_out(10) = pc_exec_2_in and valid_exec_ls = '1' and valid_out(10) = '1') then
		exec_ptr_2 <= std_logic_vector(to_unsigned(10,5));
	elsif (pc_out(11) = pc_exec_2_in and valid_exec_ls = '1'and valid_out(11) = '1') then
		exec_ptr_2 <= std_logic_vector(to_unsigned(11,5));
	elsif (pc_out(12) = pc_exec_2_in and valid_exec_ls = '1' and valid_out(12) = '1') then
		exec_ptr_2 <= std_logic_vector(to_unsigned(12,5));
	elsif (pc_out(13) = pc_exec_2_in and valid_exec_ls = '1' and valid_out(13) = '1') then
		exec_ptr_2 <= std_logic_vector(to_unsigned(13,5));
	elsif (pc_out(14) = pc_exec_2_in and valid_exec_ls = '1' and valid_out(14) = '1') then
		exec_ptr_2 <= std_logic_vector(to_unsigned(14,5));
	elsif (pc_out(15) = pc_exec_2_in and valid_exec_ls = '1' and valid_out(15) = '1') then
		exec_ptr_2 <= std_logic_vector(to_unsigned(15,5));
	elsif (pc_out(16) = pc_exec_2_in and valid_exec_ls = '1' and valid_out(16) = '1') then
		exec_ptr_2 <= std_logic_vector(to_unsigned(16,5));
	elsif (pc_out(17) = pc_exec_2_in and valid_exec_ls = '1'and valid_out(17) = '1') then
		exec_ptr_2 <= std_logic_vector(to_unsigned(17,5));
	elsif (pc_out(18) = pc_exec_2_in and valid_exec_ls = '1' and valid_out(18) = '1') then
		exec_ptr_2 <= std_logic_vector(to_unsigned(18,5));
	elsif (pc_out(19) = pc_exec_2_in and valid_exec_ls = '1'and valid_out(19) = '1') then
		exec_ptr_2 <= std_logic_vector(to_unsigned(19,5));
	elsif (pc_out(20) = pc_exec_2_in and valid_exec_ls = '1' and valid_out(20) = '1') then
		exec_ptr_2 <= std_logic_vector(to_unsigned(20,5));
	elsif (pc_out(21) = pc_exec_2_in and valid_exec_ls = '1' and valid_out(21) = '1') then
		exec_ptr_2 <= std_logic_vector(to_unsigned(21,5));
	elsif (pc_out(22) = pc_exec_2_in and valid_exec_ls = '1' and valid_out(22) = '1') then
		exec_ptr_2 <= std_logic_vector(to_unsigned(22,5));
	elsif (pc_out(23) = pc_exec_2_in and valid_exec_ls = '1' and valid_out(23) = '1') then
		exec_ptr_2 <= std_logic_vector(to_unsigned(23,5));
	elsif (pc_out(24) = pc_exec_2_in and valid_exec_ls = '1' and valid_out(24) = '1') then
		exec_ptr_2 <= std_logic_vector(to_unsigned(24,5));
	elsif (pc_out(25) = pc_exec_2_in and valid_exec_ls = '1' and valid_out(25) = '1') then
		exec_ptr_2 <= std_logic_vector(to_unsigned(25,5));
	elsif (pc_out(26) = pc_exec_2_in and valid_exec_ls = '1' and valid_out(26) = '1') then
		exec_ptr_2 <= std_logic_vector(to_unsigned(26,5));
	elsif (pc_out(27) = pc_exec_2_in and valid_exec_ls = '1' and valid_out(27) = '1') then
		exec_ptr_2 <= std_logic_vector(to_unsigned(27,5));
	elsif (pc_out(28) = pc_exec_2_in and valid_exec_ls = '1' and valid_out(28) = '1') then
		exec_ptr_2 <= std_logic_vector(to_unsigned(28,5));
	elsif (pc_out(29) = pc_exec_2_in and valid_exec_ls = '1' and valid_out(29) = '1') then
		exec_ptr_2 <= std_logic_vector(to_unsigned(29,5));
	elsif (pc_out(30) = pc_exec_2_in and valid_exec_ls = '1' and valid_out(30) = '1') then
		exec_ptr_2 <= std_logic_vector(to_unsigned(30,5));
	elsif (pc_out(31) = pc_exec_2_in and valid_exec_ls = '1' and valid_out(31) = '1') then
		exec_ptr_2 <= std_logic_vector(to_unsigned(31,5));
	else
		exec_ptr_2 <= "00000";
	end if;


	if (ir_out(to_integer(unsigned(exec_ptr_1)))(15 downto 12) = "0000") then
		dest1 <= ("0000000000000" & ir_out(to_integer(unsigned(exec_ptr_1)))(5 downto 3));
	elsif (ir_out(to_integer(unsigned(exec_ptr_1)))(15 downto 12) = "0001") then
		dest1 <= ("0000000000000" & ir_out(to_integer(unsigned(exec_ptr_1)))(8 downto 6));
	elsif (ir_out(to_integer(unsigned(exec_ptr_1)))(15 downto 12) = "0010") then
		dest1 <= ("0000000000000" & ir_out(to_integer(unsigned(exec_ptr_1)))(5 downto 3));
	elsif (ir_out(to_integer(unsigned(exec_ptr_1)))(15 downto 12) = "1100") then
		dest1 <= "0000000000000000";
	elsif (ir_out(to_integer(unsigned(exec_ptr_1)))(15 downto 12) = "1000") then
		dest1 <= ("0000000000000" & ir_out(to_integer(unsigned(exec_ptr_1)))(11 downto 9));
	elsif (ir_out(to_integer(unsigned(exec_ptr_1)))(15 downto 12) = "1001") then
		dest1 <= ("0000000000000" & ir_out(to_integer(unsigned(exec_ptr_1)))(11 downto 9));
	else
		dest1 <= "0000000000000000";
	end if;

	if (ir_out(to_integer(unsigned(exec_ptr_2)))(15 downto 12) = "0100") then
		dest2 <= ("0000000000000" & ir_out(to_integer(unsigned(exec_ptr_2)))(11 downto 9));
	elsif (ir_out(to_integer(unsigned(exec_ptr_2)))(15 downto 12) = "0011") then
		dest2 <= ("0000000000000" & ir_out(to_integer(unsigned(exec_ptr_2)))(11 downto 9));
	elsif (ir_out(to_integer(unsigned(exec_ptr_2)))(15 downto 12) = "0101") then
		dest2 <= ls_p_write_addr;
	elsif (ir_out(to_integer(unsigned(exec_ptr_2)))(15 downto 12) = "0110") then
		dest2 <= ("0000000000000" & ir_out(to_integer(unsigned(exec_ptr_2)))(11 downto 9));
	elsif (ir_out(to_integer(unsigned(exec_ptr_2)))(15 downto 12) = "0111") then
		dest2 <= ls_p_write_addr;
	else
		dest2 <= "0000000000000000";		
	end if;

	if (valid_exec_alu = '1') then
		
		no_wb(to_integer(unsigned(exec_ptr_1))) <= alu_p_no_ans;
		dest(to_integer(unsigned(exec_ptr_1))) <= dest1 ;
		c(to_integer(unsigned(exec_ptr_1))) <= alu_c_in;
		z(to_integer(unsigned(exec_ptr_1))) <= alu_z_in;
		result(to_integer(unsigned(exec_ptr_1))) <= alu_p_in;
		complete_exec(to_integer(unsigned(exec_ptr_1))) <= '1';
		en(to_integer(unsigned(exec_ptr_1))) <= '1';
	end if;

	if (valid_exec_ls = '1') then
		complete_exec(to_integer(unsigned(exec_ptr_2))) <= '1';
		z(to_integer(unsigned(exec_ptr_2))) <= ls_z_in;
		result(to_integer(unsigned(exec_ptr_2))) <= ls_p_data;
		dest(to_integer(unsigned(exec_ptr_2))) <= dest2 ;
		en(to_integer(unsigned(exec_ptr_2))) <= '1'; 		
	end if;

--------------------------------------------------------------------------------------
--Retiring Logic
--------------------------------------------------------------------------------------

--Write result into ARF or memory.
--Write C and Z into global C and Z (optional).
--Edit free_rr_vector to make the RRs of retiring destinations free.
--Edit val_rr_vector to make the RRs of retiring destinations invalid.
--Using tag-matching, make destination AR in ARF non-busy (using ports available).
--Using tag-matching, make C and Z non-busy (optional).
--Check and manage store tag while retiring store instructions.

	if (complete_exec_out(to_integer(unsigned(head_ptr_out))) = '1' and complete_exec_out(to_integer(unsigned(head_ptr_out_plus1))) = '1') then

		if (mr_out(to_integer(unsigned(head_ptr_out))) = '1') then
			mem_en_1_temp <= '1';
		else
			mem_en_1_temp <= '0';
		end if;

		if (mr_out(to_integer(unsigned(head_ptr_out_plus1))) = '1') then
			mem_en_2_temp <= '1';
		else
			mem_en_2_temp <= '0';
		end if;

		if ((ir_out(to_integer(unsigned(head_ptr_out)))(15 downto 12) = "1100") or (mr_out(to_integer(unsigned(head_ptr_out))) = '1') or (no_wb_out(to_integer(unsigned(head_ptr_out))) = '1')) then
			arf_en_1_temp <= '0';
		else
			arf_en_1_temp <= '1';
		end if;

		if (((ir_out(to_integer(unsigned(head_ptr_out_plus1)))(15 downto 12) = "1100") or (mr_out(to_integer(unsigned(head_ptr_out_plus1))) = '1') or (no_wb_out(to_integer(unsigned(head_ptr_out_plus1))) = '1'))) then
			arf_en_2_temp <= '0';
		else
			arf_en_2_temp <= '1';
		end if;

		mem_en_1 <= mem_en_1_temp;
		mem_en_2 <= mem_en_2_temp;
		arf_en_1 <= arf_en_1_temp;
		arf_en_2 <= arf_en_2_temp;
		arf_en_3 <= '1';

		c_en_temp <= (cwr_out(to_integer(unsigned(head_ptr_out))) and (not(no_wb_out(to_integer(unsigned(head_ptr_out)))))) or (cwr_out(to_integer(unsigned(head_ptr_out_plus1))) and (not(no_wb_out(to_integer(unsigned(head_ptr_out_plus1))))));
		z_en_temp <= (zwr_out(to_integer(unsigned(head_ptr_out))) and (not(no_wb_out(to_integer(unsigned(head_ptr_out)))))) or (zwr_out(to_integer(unsigned(head_ptr_out_plus1))) and (not(no_wb_out(to_integer(unsigned(head_ptr_out_plus1))))));
		c_en <= c_en_temp;
		z_en <= z_en_temp;

		if (arf_tag_in_1 = dest_tag_out(to_integer(unsigned(head_ptr_out)))) then
			arf_busy_en_1 <= '1';
		else 
			arf_busy_en_1 <= '0';
		end if;

		if (arf_tag_in_2 = dest_tag_out(to_integer(unsigned(head_ptr_out_plus1)))) then
			arf_busy_en_2 <= '1';
		else 
			arf_busy_en_2 <= '0';
		end if;

		if ((c_tag_in = c_tag_out(to_integer(unsigned(head_ptr_out))) or c_tag_in = c_tag_out(to_integer(unsigned(head_ptr_out_plus1))))) then
			c_busy_en <= c_en_temp;
		else
			c_busy_en <= '0';
		end if;

		if ((z_tag_in = z_tag_out(to_integer(unsigned(head_ptr_out))) or z_tag_in = z_tag_out(to_integer(unsigned(head_ptr_out_plus1))))) then
			z_busy_en <= z_en_temp;
		else
			z_busy_en <= '0';
		end if;
		
		if (cwr_out(to_integer(unsigned(head_ptr_out_plus1))) = '1') then
			finalc_out <= c_out(to_integer(unsigned(head_ptr_out_plus1)));
		elsif (cwr_out(to_integer(unsigned(head_ptr_out))) = '1') then
			finalc_out <= c_out(to_integer(unsigned(head_ptr_out)));
		else
			finalc_out <= '0';
		end if;		

		if (zwr_out(to_integer(unsigned(head_ptr_out_plus1))) = '1') then
			finalz_out <= z_out(to_integer(unsigned(head_ptr_out_plus1)));
		elsif (zwr_out(to_integer(unsigned(head_ptr_out))) = '1') then
			finalz_out <= z_out(to_integer(unsigned(head_ptr_out)));
		else
			finalz_out <= '0';
		end if;		

		data_out_1 <= result_out(to_integer(unsigned(head_ptr_out)));
		data_out_2 <= result_out(to_integer(unsigned(head_ptr_out_plus1)));
		data_out_3 <= pc_out(to_integer(unsigned(head_ptr_out_plus1)));

		arf_addr_out_1 <= dest_out(to_integer(unsigned(head_ptr_out)))(2 downto 0);
		arf_addr_out_2 <= dest_out(to_integer(unsigned(head_ptr_out_plus1)))(2 downto 0);
		
		rrf_addr_out_1 <= dest_tag_out(to_integer(unsigned(head_ptr_out)));
		rrf_addr_out_2 <= dest_tag_out(to_integer(unsigned(head_ptr_out_plus1)));			

		mem_addr_1 <= dest_out(to_integer(unsigned(head_ptr_out)));
		mem_addr_2 <= dest_out(to_integer(unsigned(head_ptr_out_plus1)));

		if (mem_en_1_temp = '1' and mem_en_2_temp = '1') then
			no_of_stores_cleared <= "10";
		elsif (mem_en_1_temp = '1' and mem_en_2_temp = '0') then
			no_of_stores_cleared <= "01";
		elsif (mem_en_1_temp = '0' and mem_en_2_temp = '1') then
			no_of_stores_cleared <= "01";
		else
			no_of_stores_cleared <= "00";					
		end if;		

		free_rrf_vect_out <= free_rrf_vect_in;

		if (arf_en_1_temp = '1') then
			free_rrf_vect_out((to_integer(unsigned(dest_tag_out(to_integer(unsigned(head_ptr_out))))))) <= '1';
		end if;		

		if (arf_en_2_temp = '1') then
			free_rrf_vect_out((to_integer(unsigned(dest_tag_out(to_integer(unsigned(head_ptr_out_plus1))))))) <= '1';
		end if;		
		
		val_rrf_vect_out <= val_rrf_vect_in;

		if (arf_en_1_temp = '1') then
			val_rrf_vect_out((to_integer(unsigned(dest_tag_out(to_integer(unsigned(head_ptr_out))))))) <= '0';
		end if;		

		if (arf_en_2_temp = '1') then
			val_rrf_vect_out((to_integer(unsigned(dest_tag_out(to_integer(unsigned(head_ptr_out_plus1))))))) <= '0';
		end if;		

		head_ptr <= head_ptr_out_plus2;

		complete_exec(to_integer(unsigned(head_ptr_out))) <= '0';
		complete_exec(to_integer(unsigned(head_ptr_out_plus1))) <= '0';

		valid(to_integer(unsigned(head_ptr_out))) <= '0';
		valid(to_integer(unsigned(head_ptr_out_plus1))) <= '0';
		en(to_integer(unsigned(head_ptr_out))) <= '1';
		en(to_integer(unsigned(head_ptr_out_plus1))) <= '1';

		----------ROB wb and id tag allocation at same time-----------------
		rrf_tag_out1 <= (dest_tag_out(to_integer(unsigned(head_ptr_out))));
		rrf_tag_out2 <= (dest_tag_out(to_integer(unsigned(head_ptr_out_plus1))));
		--------------------------------------------------------------------

	elsif (complete_exec_out(to_integer(unsigned(head_ptr_out))) = '1' and complete_exec_out(to_integer(unsigned(head_ptr_out_plus1))) = '0') then

		if (mr_out(to_integer(unsigned(head_ptr_out))) = '1') then
			mem_en_1_temp <= '1';
		else
			mem_en_1_temp <= '0';
		end if;

		if (mr_out(to_integer(unsigned(head_ptr_out_plus1))) = '1') then
			mem_en_2_temp <= '1';
		else
			mem_en_2_temp <= '0';
		end if;

		if (((ir_out(to_integer(unsigned(head_ptr_out)))(15 downto 12) = "1100") or (mr_out(to_integer(unsigned(head_ptr_out))) = '1') or (no_wb_out(to_integer(unsigned(head_ptr_out))) = '1'))) then
			arf_en_1_temp <= '0';
		else
			arf_en_1_temp <= '1';
		end if;

		if (((ir_out(to_integer(unsigned(head_ptr_out_plus1)))(15 downto 12) = "1100") or (mr_out(to_integer(unsigned(head_ptr_out_plus1))) = '1'))) then
			arf_en_2_temp <= '0';
		else
			arf_en_2_temp <= '1';
		end if;

		mem_en_1 <= mem_en_1_temp;
		mem_en_2 <= '0';
		arf_en_1 <= arf_en_1_temp;
		arf_en_2 <= '0';
		arf_en_3 <= '1';

		c_en_temp <= (cwr_out(to_integer(unsigned(head_ptr_out))) and (not(no_wb_out(to_integer(unsigned(head_ptr_out))))));
		z_en_temp <= (zwr_out(to_integer(unsigned(head_ptr_out))) and (not(no_wb_out(to_integer(unsigned(head_ptr_out))))));
		c_en <= c_en_temp;
		z_en <= z_en_temp;

		if (arf_tag_in_1 = dest_tag_out(to_integer(unsigned(head_ptr_out)))) then
			arf_busy_en_1 <= '1';
		else 
			arf_busy_en_1 <= '0';
		end if;

		if ((c_tag_in = c_tag_out(to_integer(unsigned(head_ptr_out))))) then
			c_busy_en <= c_en_temp;
		else
			c_busy_en <= '0';
		end if;

		if ((z_tag_in = z_tag_out(to_integer(unsigned(head_ptr_out))))) then
			z_busy_en <= z_en_temp;
		else
			z_busy_en <= '0';
		end if;
		
		if (cwr_out(to_integer(unsigned(head_ptr_out))) = '1') then
			finalc_out <= c_out(to_integer(unsigned(head_ptr_out)));
		else
			finalc_out <= '0';
		end if;		

		if (zwr_out(to_integer(unsigned(head_ptr_out))) = '1') then
			finalz_out <= z_out(to_integer(unsigned(head_ptr_out)));
		else
			finalz_out <= '0';
		end if;		

		arf_busy_en_2 <= '0';

		data_out_1 <= result_out(to_integer(unsigned(head_ptr_out)));
		data_out_2 <= "0000000000000000";
		data_out_3 <= pc_out(to_integer(unsigned(head_ptr_out)));

		arf_addr_out_1 <= dest_out(to_integer(unsigned(head_ptr_out)))(2 downto 0);
		arf_addr_out_2 <= "000";
		
		rrf_addr_out_1 <= dest_tag_out(to_integer(unsigned(head_ptr_out)));
		rrf_addr_out_2 <= "00000";			

		mem_addr_1 <= dest_out(to_integer(unsigned(head_ptr_out)));
		mem_addr_2 <= dest_out(to_integer(unsigned(head_ptr_out_plus1)));

		if (mem_en_1_temp = '1') then
			no_of_stores_cleared <= "01";
		else
			no_of_stores_cleared <= "00";
		end if;

		free_rrf_vect_out <= free_rrf_vect_in;

		if (arf_en_1_temp = '1') then
			free_rrf_vect_out((to_integer(unsigned(dest_tag_out(to_integer(unsigned(head_ptr_out))))))) <= '1';
		end if;

		val_rrf_vect_out <= val_rrf_vect_in;

		if (arf_en_1_temp = '1') then
			val_rrf_vect_out((to_integer(unsigned(dest_tag_out(to_integer(unsigned(head_ptr_out))))))) <= '0';
		end if;	

		head_ptr <= head_ptr_out_plus1;

		complete_exec(to_integer(unsigned(head_ptr_out))) <= '0';

		valid(to_integer(unsigned(head_ptr_out))) <= '0';

		en(to_integer(unsigned(head_ptr_out))) <= '1';


		----------ROB wb and id tag allocation at same time-----------------
		rrf_tag_out1 <= (dest_tag_out(to_integer(unsigned(head_ptr_out))));
		rrf_tag_out2 <= "00000";
		--------------------------------------------------------------------


	else

		if (mr_out(to_integer(unsigned(head_ptr_out))) = '1') then
			mem_en_1_temp <= '1';
		else
			mem_en_1_temp <= '0';
		end if;

		if (mr_out(to_integer(unsigned(head_ptr_out_plus1))) = '1') then
			mem_en_2_temp <= '1';
		else
			mem_en_2_temp <= '0';
		end if;

		if (((ir_out(to_integer(unsigned(head_ptr_out)))(15 downto 12) = "1100") or (mr_out(to_integer(unsigned(head_ptr_out))) = '1'))) then
			arf_en_1_temp <= '0';
		else
			arf_en_1_temp <= '1';
		end if;

		if (((ir_out(to_integer(unsigned(head_ptr_out_plus1)))(15 downto 12) = "1100") or (mr_out(to_integer(unsigned(head_ptr_out_plus1))) = '1'))) then
			arf_en_2_temp <= '0';
		else
			arf_en_2_temp <= '1';
		end if;

		mem_en_1 <= '0';
		mem_en_2 <= '0';
		arf_en_1 <= '0';
		arf_en_2 <= '0';
		arf_en_3 <= '0';

		c_en_temp <= cwr_out(to_integer(unsigned(head_ptr_out)));
		z_en_temp <= zwr_out(to_integer(unsigned(head_ptr_out)));
		c_en <= '0';
		z_en <= '0';


		arf_busy_en_1 <= '0';
		arf_busy_en_2 <= '0';

		c_busy_en <= '0'; 
		z_busy_en <= '0'; 
		
		finalc_out <= '0';
		finalz_out <= '0';

		data_out_1 <= "0000000000000000";
		data_out_2 <= "0000000000000000";
		data_out_3 <= "0000000000000000";

		arf_addr_out_1 <= "000";
		arf_addr_out_2 <= "000";
		
		rrf_addr_out_1 <= "00000";
		rrf_addr_out_2 <= "00000";			

		mem_addr_1 <= "0000000000000000";
		mem_addr_2 <= "0000000000000000";

		no_of_stores_cleared <= "00";

		free_rrf_vect_out <= free_rrf_vect_in;		
		val_rrf_vect_out <= val_rrf_vect_in;

		head_ptr <= head_ptr_out;

		----------ROB wb and id tag allocation at same time-----------------
		rrf_tag_out1 <= "00000";
		rrf_tag_out2 <= "00000";
		--------------------------------------------------------------------
		

	end if;





















	end process;
end behave;