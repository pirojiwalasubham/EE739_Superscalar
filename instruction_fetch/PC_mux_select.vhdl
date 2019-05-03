library ieee;
use ieee.numeric_std.all;
use ieee.std_logic_1164.all;
entity PC_mux_select is
	port (
		-- inputs are all pipeline registers and intermediate stuff in datapath
		-- outputs 
		dmemd_out, ra_ir,rb_ir,rc_ir,rd_ir,rc_alu_out3, alu_out2, rf_d2, alu_out3, za7, alu_out1: in std_logic_vector ( 15 downto 0);
		ra_inv,rb_inv, rc_inv,rd_inv, temp_z : in std_logic;
		pc_in : out std_logic_vector( 15 downto 0 )


	);
end entity PC_mux_select;

architecture structure of PC_mux_select is

begin
	-- process( dmemd_out	)
	-- begin
	pc_in <= dmemd_out when ( rd_inv = '0' and rd_ir(15 downto 12) = "0100" and rd_ir(11 downto 9) = "111") else
			rc_alu_out3 when ( rc_inv = '0' and rc_ir(15 downto 12) = "1100" and temp_z = '1') else
			alu_out2 when (rc_inv = '0' and (rc_ir(15 downto 12) = "0000" or rc_ir(15 downto 12) = "0010") and rc_ir(5 downto 3) = "111") else
			alu_out2 when (rc_inv = '0' and rc_ir(15 downto 12) = "0001" and rc_ir(8 downto 6) = "111") else
			rf_d2 when (rb_inv= '0' and rb_ir(15 downto 12) = "1001") else
			alu_out3 when (ra_inv = '0' and ra_ir(15 downto 12)="1000") else
			za7 when (ra_inv = '0' and ra_ir(15 downto 12) = "0011" and ra_ir(11 downto 9) = "111") else
			alu_out1;
			
	
end architecture structure;
