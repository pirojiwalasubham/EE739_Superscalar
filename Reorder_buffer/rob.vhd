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
		valid_exec_alu, valid_exec_ls, alu_c_in,alu_z_in,ls_z_in : in std_logic;

		free_rrf_vect_in, val_rrf_vect_in : in std_logic_vector(31 downto 0);
		arf_tag_in_1, arf_tag_in_2, c_tag_in, z tag_in : in std_logic_vector(4 downto 0);

		robfull, finalc_out, finalz_out : out std_logic
		data_out_1, data_out_2, mem_addr_1, mem_addr_2 : out std_logic_vector(15 downto 0); 
		arf_addr_out_1, arf_addr_out_2 : out std_logic_vector(2 downto 0);
		rrf_addr_out_1, rrf_addr_out_2 : out std_logic_vector(4 downto 0);
		no_of_stores_cleared : out std_logic_vector(1 downto 0);
		free_rrf_vect_out, val_rrf_vect_out : out std_logic_vector(31 downto 0);  
		arf_en_1, arf_en_2, mem_en_1, mem_en_2,c_en,z_en,arf_busy_en_1,arf_busy_en_2,z_busy_en,c_busy_en : out std_logic

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
	
	signal pc, dest1,dest2,dest, ir, result,pc_exec, pc_out, dest_out, ir_out, result_out, pc_exec_out : s_16;
	signal dest_tag_out, dest_tag, c_tag_out, z_tag_out, c_tag, z_tag : s_5;
	--signal spec_tag_out, spec_tag : s_1;
	signal en,valid, complete_exec, mr, c, z, cwr, zwr, valid_out, complete_exec_out, mr_out, c_out, z_out, cwr_out, zwr_out : s_1;

	signal tail_ptr, head_ptr, tail_ptr_out, head_ptr_out, tail_ptr_out_plus1, head_ptr_out_plus1, tail_ptr_out_plus2, head_ptr_out_plus2 : std_logic_vector(4 downto 0);

	signal mr1,mr2,c_en_temp,z_en_temp,mem_en_1_temp,mem_en_2_temp,arf_en_1_temp, arf_en_2_temp : std_logic;

	signal exec_ptr_1, exec_ptr_2: std_logic_vector(4 downto 0);

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

	end generate ReorderBuffer;

	head_ptr_reg : myRegister generic map (5) port map (clk,'1',reset,head_ptr,head_ptr_out);
	tail_ptr_reg : myRegister generic map (5) port map (clk,'1',reset,tail_ptr,tail_ptr_out);

	head_ptr_out_plus1 <= head_ptr + "00001";
	head_ptr_out_plus2 <= head_ptr + "00010";
	tail_ptr_out_plus1 <= tail_ptr + "00001";
	tail_ptr_out_plus2 <= tail_ptr + "00010";


process(all)

	begin

	first : for k in 0 to 31 generate
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
	end generate first;

-------------------------------------------------------------------------------------------
--INPUT LOGIC
-------------------------------------------------------------------------------------------

	

	pc(to_integer(unsigned(tail_ptr_out))) <= pc_1_in when valid_1_in = '1' else
														pc_2_in when (valid_1_in = '0' and valid_2_in = '1') else (others => '0');
	ir(to_integer(unsigned(tail_ptr_out))) <= ir_1_in when valid_1_in = '1' else
														ir_2_in when (valid_1_in = '0' and valid_2_in = '1') else (others => '0');
	dest_tag(to_integer(unsigned(tail_ptr_out))) <= dest_tag_1_in when valid_1_in = '1' else
														dest_tag_2_in when (valid_1_in = '0' and valid_2_in = '1') else (others => '0');
	c_tag(to_integer(unsigned(tail_ptr_out))) <= c_tag_1_in when valid_1_in = '1' else
														c_tag_2_in when (valid_1_in = '0' and valid_2_in = '1') else (others => '0');
	z_tag(to_integer(unsigned(tail_ptr_out))) <= z_tag_1_in when valid_1_in = '1' else
														z_tag_2_in when (valid_1_in = '0' and valid_2_in = '1') else (others => '0');
	--spec_tag(to_integer(unsigned(tail_ptr_out))) <= spec_tag_1_in when valid_1_in = '1' else
	--													spec_tag_2_in when (valid_1_in = '0' and valid_2_in = '1') else (others => '0');
	
	-- 1 for memory; 0 for RF
	mr1 <= '1' when (ir_1_in(15 downto 12) = "0101" or ir_1_in(15 downto 12) = "0111") else '0';

	
	mr(to_integer(unsigned(tail_ptr_out))) <= mr1 when valid_1_in = '1' else
														mr2 when (valid_1_in = '0' and valid_2_in = '1') else '0';
	cwr(to_integer(unsigned(tail_ptr_out))) <= cwr_1_in when valid_1_in = '1' else
														cwr_2_in when (valid_1_in = '0' and valid_2_in = '1') else '0';
	zwr(to_integer(unsigned(tail_ptr_out))) <= zwr_1_in when valid_1_in = '1' else
														zwr_2_in when (valid_1_in = '0' and valid_2_in = '1') else '0';
	valid(to_integer(unsigned(tail_ptr_out))) <= valid_1_in when valid_1_in = '1' else
														valid_2_in when (valid_1_in = '0' and valid_2_in = '1') else '0';
	en(to_integer(unsigned(tail_ptr_out))) <= '1' when valid_1_in = '1' else
														'1' when (valid_1_in = '0' and valid_2_in = '1') else '0';
	


	pc(to_integer(unsigned(tail_ptr_out_plus1))) <= pc_2_in when (valid_2_in = '1' and valid_1_in = '1') else (others => '0');
	ir(to_integer(unsigned(tail_ptr_out_plus1))) <= ir_2_in when (valid_2_in = '1' and valid_1_in = '1') else (others => '0');
	dest_tag(to_integer(unsigned(tail_ptr_out_plus1))) <= dest_tag_2_in when (valid_2_in = '1' and valid_1_in = '1') else (others => '0');
	c_tag(to_integer(unsigned(tail_ptr_out_plus1))) <= c_tag_2_in when (valid_2_in = '1' and valid_1_in = '1') else (others => '0');
	z_tag(to_integer(unsigned(tail_ptr_out_plus1))) <= z_tag_2_in when (valid_2_in = '1' and valid_1_in = '1') else (others => '0');
	--spec_tag(to_integer(unsigned(tail_ptr_out_plus1))) <= spec_tag_2_in when (valid_2_in = '1' and valid_1_in = '1') else (others => '0');
	
	-- 1 for memory; 0 for RF
	mr2 <= '1' when (ir_2_in(25 downto 22) = "0101" or ir_2_in(25 downto 22) = "0111") else '0';
	
	mr(to_integer(unsigned(tail_ptr_out_plus1))) <= mr2 when (valid_2_in = '1' and valid_1_in = '1') else '0';
	cwr(to_integer(unsigned(tail_ptr_out_plus1))) <= cwr_2_in when (valid_2_in = '1' and valid_1_in = '1') else '0';
	zwr(to_integer(unsigned(tail_ptr_out_plus1))) <= zwr_2_in when (valid_2_in = '1' and valid_1_in = '1') else '0';
	valid(to_integer(unsigned(tail_ptr_out_plus1))) <= valid_2_in when (valid_2_in = '1' and valid_1_in = '1') else '0';
	en(to_integer(unsigned(tail_ptr_out_plus1))) <= '1' when (valid_2_in = '1' and valid_1_in = '1') else '0';


	tail_ptr <= tail_ptr_out when (valid_1_in = '0' and valid_2_in = '0') else
				tail_ptr_out_plus1 when (valid_1_in = '1' and valid_2_in = '0') else
				tail_ptr_out_plus1 when (valid_1_in = '0' and valid_2_in = '1') else
				tail_ptr_out_plus2;


	robfull <= '1' when tail_ptr_out_plus2 = head_ptr_out else '0'; 
	
				
---------------------------------------------------------------------------------------------------------------------------
--Taking Results from Execution
---------------------------------------------------------------------------------------------------------------------------

	exec_ptr_1 <=   "00000" when (pc(0) = pc_exec_1_in and valid_exec_alu = '1') else
					"00001" when (pc(1) = pc_exec_1_in and valid_exec_alu = '1') else
					"00010" when (pc(2) = pc_exec_1_in and valid_exec_alu = '1') else
					"00011" when (pc(3) = pc_exec_1_in and valid_exec_alu = '1') else
					"00100" when (pc(4) = pc_exec_1_in and valid_exec_alu = '1') else
					"00101" when (pc(5) = pc_exec_1_in and valid_exec_alu = '1') else
					"00110" when (pc(6) = pc_exec_1_in and valid_exec_alu = '1') else
					"00111" when (pc(7) = pc_exec_1_in and valid_exec_alu = '1') else
					"01000" when (pc(8) = pc_exec_1_in and valid_exec_alu = '1') else
					"01001" when (pc(9) = pc_exec_1_in and valid_exec_alu = '1') else
					"01010" when (pc(10) = pc_exec_1_in and valid_exec_alu = '1') else
					"01011" when (pc(11) = pc_exec_1_in and valid_exec_alu = '1') else
					"01100" when (pc(12) = pc_exec_1_in and valid_exec_alu = '1') else
					"01101" when (pc(13) = pc_exec_1_in and valid_exec_alu = '1') else
					"01110" when (pc(14) = pc_exec_1_in and valid_exec_alu = '1') else
					"01111" when (pc(15) = pc_exec_1_in and valid_exec_alu = '1') else
					"10000" when (pc(16) = pc_exec_1_in and valid_exec_alu = '1') else
					"10001" when (pc(17) = pc_exec_1_in and valid_exec_alu = '1') else
					"10010" when (pc(18) = pc_exec_1_in and valid_exec_alu = '1') else
					"10011" when (pc(19) = pc_exec_1_in and valid_exec_alu = '1') else
					"10100" when (pc(20) = pc_exec_1_in and valid_exec_alu = '1') else
					"10101" when (pc(21) = pc_exec_1_in and valid_exec_alu = '1') else
					"10110" when (pc(22) = pc_exec_1_in and valid_exec_alu = '1') else
					"10111" when (pc(23) = pc_exec_1_in and valid_exec_alu = '1') else
					"11000" when (pc(24) = pc_exec_1_in and valid_exec_alu = '1') else
					"11001" when (pc(25) = pc_exec_1_in and valid_exec_alu = '1') else
					"11010" when (pc(26) = pc_exec_1_in and valid_exec_alu = '1') else
					"11011" when (pc(27) = pc_exec_1_in and valid_exec_alu = '1') else
					"11100" when (pc(28) = pc_exec_1_in and valid_exec_alu = '1') else
					"11101" when (pc(29) = pc_exec_1_in and valid_exec_alu = '1') else
					"11110" when (pc(30) = pc_exec_1_in and valid_exec_alu = '1') else
					"11111" when (pc(31) = pc_exec_1_in and valid_exec_alu = '1') else "00000";


	exec_ptr_2 <=   "00000" when ( pc(0) = pc_exec_2_in and valid_exec_ls = '1') else
					"00001" when ( pc(1) = pc_exec_2_in and valid_exec_ls = '1') else
					"00010" when ( pc(2) = pc_exec_2_in and valid_exec_ls = '1') else
					"00011" when ( pc(3) = pc_exec_2_in and valid_exec_ls = '1') else
					"00100" when ( pc(4) = pc_exec_2_in and valid_exec_ls = '1') else
					"00101" when ( pc(5) = pc_exec_2_in and valid_exec_ls = '1') else
					"00110" when ( pc(6) = pc_exec_2_in and valid_exec_ls = '1') else
					"00111" when ( pc(7) = pc_exec_2_in and valid_exec_ls = '1') else
					"01000" when ( pc(8) = pc_exec_2_in and valid_exec_ls = '1') else
					"01001" when ( pc(9) = pc_exec_2_in and valid_exec_ls = '1') else
					"01010" when ( pc(10) = pc_exec_2_in and valid_exec_ls = '1') else
					"01011" when ( pc(11) = pc_exec_2_in and valid_exec_ls = '1') else
					"01100" when ( pc(12) = pc_exec_2_in and valid_exec_ls = '1') else
					"01101" when ( pc(13) = pc_exec_2_in and valid_exec_ls = '1') else
					"01110" when ( pc(14) = pc_exec_2_in and valid_exec_ls = '1') else
					"01111" when ( pc(15) = pc_exec_2_in and valid_exec_ls = '1') else
					"10000" when ( pc(16) = pc_exec_2_in and valid_exec_ls = '1') else
					"10001" when ( pc(17) = pc_exec_2_in and valid_exec_ls = '1') else
					"10010" when ( pc(18) = pc_exec_2_in and valid_exec_ls = '1') else
					"10011" when ( pc(19) = pc_exec_2_in and valid_exec_ls = '1') else
					"10100" when ( pc(20) = pc_exec_2_in and valid_exec_ls = '1') else
					"10101" when ( pc(21) = pc_exec_2_in and valid_exec_ls = '1') else
					"10110" when ( pc(22) = pc_exec_2_in and valid_exec_ls = '1') else
					"10111" when ( pc(23) = pc_exec_2_in and valid_exec_ls = '1') else
					"11000" when ( pc(24) = pc_exec_2_in and valid_exec_ls = '1') else
					"11001" when ( pc(25) = pc_exec_2_in and valid_exec_ls = '1') else
					"11010" when ( pc(26) = pc_exec_2_in and valid_exec_ls = '1') else
					"11011" when ( pc(27) = pc_exec_2_in and valid_exec_ls = '1') else
					"11100" when ( pc(28) = pc_exec_2_in and valid_exec_ls = '1') else
					"11101" when ( pc(29) = pc_exec_2_in and valid_exec_ls = '1') else
					"11110" when ( pc(30) = pc_exec_2_in and valid_exec_ls = '1') else
					"11111" when ( pc(31) = pc_exec_2_in and valid_exec_ls = '1') else "00000";


	dest1 <= ("0000000000000" & ir_out(to_integer(unsigned(exec_ptr_1)))(5 downto 3)) when ir_out(to_integer(unsigned(exec_ptr_1)))(15 downto 12) = "0000" else
			("0000000000000" & ir_out(to_integer(unsigned(exec_ptr_1)))(8 downto 6)) when ir_out(to_integer(unsigned(exec_ptr_1)))(15 downto 12) = "0001" else
			("0000000000000" & ir_out(to_integer(unsigned(exec_ptr_1)))(5 downto 3)) when ir_out(to_integer(unsigned(exec_ptr_1)))(15 downto 12) = "0010" else
			("0000000000000" & ir_out(to_integer(unsigned(exec_ptr_1)))(11 downto 9)) when ir_out(to_integer(unsigned(exec_ptr_1)))(15 downto 12) = "0011" else
			"0000000000000000" when ir_out(to_integer(unsigned(exec_ptr_1)))(15 downto 12) = "1100" else
			("0000000000000" & ir_out(to_integer(unsigned(exec_ptr_1)))(11 downto 9)) when ir_out(to_integer(unsigned(exec_ptr_1)))(15 downto 12) = "1000" else
			("0000000000000" & ir_out(to_integer(unsigned(exec_ptr_1)))(11 downto 9)) when ir_out(to_integer(unsigned(exec_ptr_1)))(15 downto 12) = "1001" else "0000000000000000";

	dest2 <= ("0000000000000" & ir_out(to_integer(unsigned(exec_ptr_2)))(11 downto 9)) when ir_out(to_integer(unsigned(exec_ptr_2)))(15 downto 12) = "0100" else
			ls_p_write_addr when ir_out(to_integer(unsigned(exec_ptr_2)))(15 downto 12) = "0101" else
			("0000000000000" & ir_out(to_integer(unsigned(exec_ptr_2)))(11 downto 9)) when ir_out(to_integer(unsigned(exec_ptr_2)))(15 downto 12) = "0110" else
			ls_p_write_addr when ir_out(to_integer(unsigned(exec_ptr_2)))(15 downto 12) = "0111" else "0000000000000000";


	if (valid_exec_alu = '1') then
		dest(to_integer(unsigned(exec_ptr_1))) <= dest1 ;
		c(to_integer(unsigned(exec_ptr_1))) <= alu_c_in;
		z(to_integer(unsigned(exec_ptr_1))) <= alu_z_in;
		result(to_integer(unsigned(exec_ptr_1))) <= alu_p_in;
		complete_exec(to_integer(unsigned(exec_ptr_1))) <= '1';
	end if;

	if (valid_exec_ls = '1') then
		complete_exec(to_integer(unsigned(exec_ptr_2))) <= '1';
		z(to_integer(unsigned(exec_ptr_2))) <= ls_z_in;
		result(to_integer(unsigned(exec_ptr_2))) <= ls_p_data;
		dest(to_integer(unsigned(exec_ptr_2))) <= dest2 ; 		
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

		--robfull, finalc_out, finalz_out : out std_logic
		--data_out_1, data_out_2 : out std_logic_vector(15 downto 0); 
		--arf_addr_out_1, arf_addr_out_2 : out std_logic_vector(2 downto 0);
		--rrf_addr_out_1, rrf_addr_out_2 : out std_logic_vector(4 downto 0);
		--no_of_stores_cleared : out std_logic_vector(1 downto 0);
		--free_rrf_vect_out, val_rrf_vect_out : out std_logic_vector(31 downto 0);  
		--arf_en_1, arf_en_2, mem_en_1, mem_en_2,c_en,z_en,arf_busy_en_1,arf_busy_en_2,z_busy_en,c_busy_en : out std_logic

	if (complete_exec_out(to_integer(unsigned(head_ptr_out))) = '1' and complete_exec_out(to_integer(unsigned(head_ptr_out_plus1))) = '1') then
		
		mem_en_1_temp <= '1' when mr_out(to_integer(unsigned(head_ptr_out))) = '1' else '0';
		mem_en_2_temp <= '1' when mr_out(to_integer(unsigned(head_ptr_out_plus1))) = '1' else '0'
		mem_en_1 <= mem_en_1_temp;
		mem_en_2 <= mem_en_2_temp;
		arf_en_1_temp <= '0' when ((ir_out(to_integer(unsigned(head_ptr_out)))(15 downto 12) = "1100") or (mr_out(to_integer(unsigned(head_ptr_out))) = '1')) else '1';
		arf_en_2_temp <= '0' when ((ir_out(to_integer(unsigned(head_ptr_out_plus1)))(15 downto 12) = "1100") or (mr_out(to_integer(unsigned(head_ptr_out_plus1))) = '1')) else '1';
		arf_en_1 <= arf_en_1_temp;
		arf_en_2 <= arf_en_2_temp;

		c_en_temp <= cwr_out(to_integer(unsigned(head_ptr_out))) or cwr_out(to_integer(unsigned(head_ptr_out_plus1)));
		z_en_temp <= zwr_out(to_integer(unsigned(head_ptr_out))) or zwr_out(to_integer(unsigned(head_ptr_out_plus1)));
		c_en <= c_en_temp;
		z_en <= z_en_temp;


		arf_busy_en_1 <= '1' when arf_tag_in_1 = dest_tag_out(to_integer(unsigned(head_ptr_out))) else '0';
		arf_busy_en_2 <= '1' when arf_tag_in_1 = dest_tag_out(to_integer(unsigned(head_ptr_out_plus1))) else '0';

		c_busy_en <= c_en_temp when (c_tag_in = c_tag_out(to_integer(unsigned(head_ptr_out))) or c_tag_in = c_tag_out(to_integer(unsigned(head_ptr_out_plus1)))) else '0'; 
		z_busy_en <= z_en_temp when (z_tag_in = z_tag_out(to_integer(unsigned(head_ptr_out))) or z_tag_in = z_tag_out(to_integer(unsigned(head_ptr_out_plus1)))) else '0'; 
		
		finalc_out <= c_out(to_integer(unsigned(head_ptr_out))) when cwr_out(to_integer(unsigned(head_ptr_out))) = '1' else
						c_out(to_integer(unsigned(head_ptr_out_plus1))) when cwr_out(to_integer(unsigned(head_ptr_out_plus1))) = '1' else
						'0';
		finalz_out <= z_out(to_integer(unsigned(head_ptr_out))) when zwr_out(to_integer(unsigned(head_ptr_out))) = '1' else
						z_out(to_integer(unsigned(head_ptr_out_plus1))) when zwr_out(to_integer(unsigned(head_ptr_out_plus1))) = '1' else
						'0';

		data_out_1 <= result_out(to_integer(unsigned(head_ptr_out)));
		data_out_2 <= result_out(to_integer(unsigned(head_ptr_out_plus1)));

		arf_addr_out_1 <= dest_out(to_integer(unsigned(head_ptr_out)))(2 downto 0);
		arf_addr_out_1 <= dest_out(to_integer(unsigned(head_ptr_out_plus1)))(2 downto 0);
		
		rrf_addr_out_1 <= dest_tag_out(to_integer(unsigned(head_ptr_out)));
		rrf_addr_out_2 <= dest_tag_out(to_integer(unsigned(head_ptr_out_plus1)));			

		mem_addr_1 <= dest_out(to_integer(unsigned(head_ptr_out)));
		mem_addr_2 <= dest_out(to_integer(unsigned(head_ptr_out_plus1)));

		no_of_stores_cleared <= "10" when mem_en_1_temp = '1' and mem_en_2_temp = '1' else
								"01" when mem_en_1_temp = '1' and mem_en_2_temp = '0' else
								"01" when mem_en_1_temp = '0' and mem_en_2_temp = '1' else
								"00";

		free_rrf_vect_out <= free_rrf_vect_in;

		free_rrf_vect_out((to_integer(unsigned(dest_tag_out(to_integer(unsigned(head_ptr_out))))))) <= '0' when arf_en_1_temp = '1' else
																										free_rrf_vect_in((to_integer(unsigned(dest_tag_out(to_integer(unsigned(head_ptr_out)))))));
		free_rrf_vect_out((to_integer(unsigned(dest_tag_out(to_integer(unsigned(head_ptr_out_plus1))))))) <= '0' when arf_en_1_temp = '1' else
																										free_rrf_vect_in((to_integer(unsigned(dest_tag_out(to_integer(unsigned(head_ptr_out_plus1)))))));

		val_rrf_vect_out <= val_rrf_vect_out;

		val_rrf_vect_out((to_integer(unsigned(dest_tag_out(to_integer(unsigned(head_ptr_out))))))) <= '0' when arf_en_1_temp = '1' else
																										val_rrf_vect_in((to_integer(unsigned(dest_tag_out(to_integer(unsigned(head_ptr_out)))))));
		val_rrf_vect_out((to_integer(unsigned(dest_tag_out(to_integer(unsigned(head_ptr_out_plus1))))))) <= '0' when arf_en_1_temp = '1' else
																										val_rrf_vect_in((to_integer(unsigned(dest_tag_out(to_integer(unsigned(head_ptr_out_plus1)))))));




	end if;





















	end process;
end behave;