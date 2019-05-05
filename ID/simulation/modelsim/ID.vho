-- Copyright (C) 1991-2013 Altera Corporation
-- Your use of Altera Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Altera Program License 
-- Subscription Agreement, Altera MegaCore Function License 
-- Agreement, or other applicable license agreement, including, 
-- without limitation, that your use is for the sole purpose of 
-- programming logic devices manufactured by Altera and sold by 
-- Altera or its authorized distributors.  Please refer to the 
-- applicable agreement for further details.

-- VENDOR "Altera"
-- PROGRAM "Quartus II 64-Bit"
-- VERSION "Version 13.0.0 Build 156 04/24/2013 SJ Web Edition"

-- DATE "05/05/2019 23:19:07"

-- 
-- Device: Altera EP2C70F896C6 Package FBGA896
-- 

-- 
-- This VHDL file should be used for ModelSim-Altera (VHDL) only
-- 

LIBRARY CYCLONEII;
LIBRARY IEEE;
USE CYCLONEII.CYCLONEII_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	ID IS
    PORT (
	clk : IN std_logic;
	reset : IN std_logic;
	ra1_val_out : IN std_logic;
	ra2_val_out : IN std_logic;
	ra1_pc_out : IN std_logic_vector(15 DOWNTO 0);
	ra1_ir_out : IN std_logic_vector(15 DOWNTO 0);
	ra2_pc_out : IN std_logic_vector(15 DOWNTO 0);
	ra2_ir_out : IN std_logic_vector(15 DOWNTO 0);
	free_rrf_vec : IN std_logic_vector(31 DOWNTO 0);
	data1 : IN std_logic_vector(15 DOWNTO 0);
	data2 : IN std_logic_vector(15 DOWNTO 0);
	data3 : IN std_logic_vector(15 DOWNTO 0);
	data4 : IN std_logic_vector(15 DOWNTO 0);
	busy1 : IN std_logic;
	busy2 : IN std_logic;
	busy3 : IN std_logic;
	busy4 : IN std_logic;
	tag1 : IN std_logic_vector(4 DOWNTO 0);
	tag2 : IN std_logic_vector(4 DOWNTO 0);
	tag3 : IN std_logic_vector(4 DOWNTO 0);
	tag4 : IN std_logic_vector(4 DOWNTO 0);
	C_in : IN std_logic;
	Z_in : IN std_logic;
	C_busybit_in : IN std_logic;
	Z_busybit_in : IN std_logic;
	busy_dest1_in : IN std_logic;
	busy_dest2_in : IN std_logic;
	C_tag_in : IN std_logic_vector(4 DOWNTO 0);
	Z_tag_in : IN std_logic_vector(4 DOWNTO 0);
	tag_dest1_in : IN std_logic_vector(4 DOWNTO 0);
	tag_dest2_in : IN std_logic_vector(4 DOWNTO 0);
	taken_branch_detected : IN std_logic;
	not_taken_branch_detected : IN std_logic;
	spec_tag_rb_in : IN std_logic_vector(1 DOWNTO 0);
	rs_full_in : IN std_logic;
	lm_stall_in : IN std_logic;
	lw_r7_resolved : IN std_logic;
	alu_r7_resolved : IN std_logic;
	jlr_resolved : IN std_logic;
	store_retirement_count : IN std_logic_vector(1 DOWNTO 0);
	free_rrf_vec_out : OUT std_logic_vector(31 DOWNTO 0);
	Ard1a : OUT std_logic_vector(2 DOWNTO 0);
	Ard1b : OUT std_logic_vector(2 DOWNTO 0);
	Ard2a : OUT std_logic_vector(2 DOWNTO 0);
	Ard2b : OUT std_logic_vector(2 DOWNTO 0);
	Ard1c : OUT std_logic_vector(2 DOWNTO 0);
	Ard2c : OUT std_logic_vector(2 DOWNTO 0);
	Awr1 : OUT std_logic_vector(2 DOWNTO 0);
	Awr2 : OUT std_logic_vector(2 DOWNTO 0);
	pc1 : OUT std_logic_vector(15 DOWNTO 0);
	pc2 : OUT std_logic_vector(15 DOWNTO 0);
	ir1 : OUT std_logic_vector(15 DOWNTO 0);
	ir2 : OUT std_logic_vector(15 DOWNTO 0);
	x1_op1 : OUT std_logic_vector(15 DOWNTO 0);
	x1_op2 : OUT std_logic_vector(15 DOWNTO 0);
	x2_op1 : OUT std_logic_vector(15 DOWNTO 0);
	x2_op2 : OUT std_logic_vector(15 DOWNTO 0);
	x1_op1_ready : OUT std_logic;
	x1_op2_ready : OUT std_logic;
	x2_op1_ready : OUT std_logic;
	x2_op2_ready : OUT std_logic;
	x1_val : OUT std_logic;
	x2_val : OUT std_logic;
	C_out : OUT std_logic;
	Z_out : OUT std_logic;
	C_ready : OUT std_logic;
	Z_ready : OUT std_logic;
	C_wr : OUT std_logic;
	Z_wr : OUT std_logic;
	C_2_out : OUT std_logic;
	C_2_ready : OUT std_logic;
	C_2_wr : OUT std_logic;
	Z_2_out : OUT std_logic;
	Z_2_ready : OUT std_logic;
	Z_2_wr : OUT std_logic;
	spec_tag_rs_out1 : OUT std_logic_vector(1 DOWNTO 0);
	spec_tag_rs_out2 : OUT std_logic_vector(1 DOWNTO 0);
	store_tag_rs_out1 : OUT std_logic_vector(4 DOWNTO 0);
	store_tag_rs_out2 : OUT std_logic_vector(4 DOWNTO 0);
	C_busybit_out : OUT std_logic;
	Z_busybit_out : OUT std_logic;
	C_2_busybit_out : OUT std_logic;
	Z_2_busybit_out : OUT std_logic;
	C_tag_out_arf : OUT std_logic_vector(4 DOWNTO 0);
	Z_tag_out_arf : OUT std_logic_vector(4 DOWNTO 0);
	C_2_tag_out_arf : OUT std_logic_vector(4 DOWNTO 0);
	Z_2_tag_out_arf : OUT std_logic_vector(4 DOWNTO 0);
	busy_dest1_out : OUT std_logic;
	busy_dest2_out : OUT std_logic;
	dest_AR_tag_out : OUT std_logic_vector(4 DOWNTO 0);
	dest_AR_tag_2_out : OUT std_logic_vector(4 DOWNTO 0);
	C_tag_out_rs : OUT std_logic_vector(4 DOWNTO 0);
	Z_tag_out_rs : OUT std_logic_vector(4 DOWNTO 0);
	C_2_tag_out_rs : OUT std_logic_vector(4 DOWNTO 0);
	Z_2_tag_out_rs : OUT std_logic_vector(4 DOWNTO 0);
	ra1_invalidate_out : OUT std_logic;
	ra2_invalidate_out : OUT std_logic;
	pc_en_out : OUT std_logic;
	ra_en_out : OUT std_logic;
	arf_busy_wr_en1 : OUT std_logic;
	arf_busy_wr_en2 : OUT std_logic;
	arf_tag_wr_en1 : OUT std_logic;
	arf_tag_wr_en2 : OUT std_logic;
	adder2_out : OUT std_logic_vector(15 DOWNTO 0);
	adder3_out : OUT std_logic_vector(15 DOWNTO 0);
	ZA7_1_out : OUT std_logic_vector(15 DOWNTO 0);
	ZA7_2_out : OUT std_logic_vector(15 DOWNTO 0);
	S0 : OUT std_logic;
	S1 : OUT std_logic;
	S2 : OUT std_logic;
	S3 : OUT std_logic
	);
END ID;

-- Design Ports Information
-- free_rrf_vec_out[0]	=>  Location: PIN_F16,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- free_rrf_vec_out[1]	=>  Location: PIN_Y8,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- free_rrf_vec_out[2]	=>  Location: PIN_G28,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- free_rrf_vec_out[3]	=>  Location: PIN_C28,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- free_rrf_vec_out[4]	=>  Location: PIN_H27,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- free_rrf_vec_out[5]	=>  Location: PIN_K29,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- free_rrf_vec_out[6]	=>  Location: PIN_L26,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- free_rrf_vec_out[7]	=>  Location: PIN_M25,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- free_rrf_vec_out[8]	=>  Location: PIN_G29,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- free_rrf_vec_out[9]	=>  Location: PIN_K30,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- free_rrf_vec_out[10]	=>  Location: PIN_K24,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- free_rrf_vec_out[11]	=>  Location: PIN_J26,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- free_rrf_vec_out[12]	=>  Location: PIN_M22,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- free_rrf_vec_out[13]	=>  Location: PIN_L25,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- free_rrf_vec_out[14]	=>  Location: PIN_L27,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- free_rrf_vec_out[15]	=>  Location: PIN_J30,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- free_rrf_vec_out[16]	=>  Location: PIN_M26,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- free_rrf_vec_out[17]	=>  Location: PIN_J29,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- free_rrf_vec_out[18]	=>  Location: PIN_H25,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- free_rrf_vec_out[19]	=>  Location: PIN_K28,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- free_rrf_vec_out[20]	=>  Location: PIN_E29,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- free_rrf_vec_out[21]	=>  Location: PIN_K23,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- free_rrf_vec_out[22]	=>  Location: PIN_F27,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- free_rrf_vec_out[23]	=>  Location: PIN_C30,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- free_rrf_vec_out[24]	=>  Location: PIN_H24,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- free_rrf_vec_out[25]	=>  Location: PIN_D27,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- free_rrf_vec_out[26]	=>  Location: PIN_G27,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- free_rrf_vec_out[27]	=>  Location: PIN_J25,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- free_rrf_vec_out[28]	=>  Location: PIN_E28,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- free_rrf_vec_out[29]	=>  Location: PIN_G22,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- free_rrf_vec_out[30]	=>  Location: PIN_F23,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- free_rrf_vec_out[31]	=>  Location: PIN_E24,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- Ard1a[0]	=>  Location: PIN_AF11,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- Ard1a[1]	=>  Location: PIN_AD11,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- Ard1a[2]	=>  Location: PIN_AF10,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- Ard1b[0]	=>  Location: PIN_AE11,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- Ard1b[1]	=>  Location: PIN_AD12,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- Ard1b[2]	=>  Location: PIN_AE12,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- Ard2a[0]	=>  Location: PIN_A9,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- Ard2a[1]	=>  Location: PIN_H12,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- Ard2a[2]	=>  Location: PIN_F11,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- Ard2b[0]	=>  Location: PIN_U6,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- Ard2b[1]	=>  Location: PIN_U4,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- Ard2b[2]	=>  Location: PIN_T4,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- Ard1c[0]	=>  Location: PIN_Y26,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- Ard1c[1]	=>  Location: PIN_T28,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- Ard1c[2]	=>  Location: PIN_Y27,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- Ard2c[0]	=>  Location: PIN_N21,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- Ard2c[1]	=>  Location: PIN_R24,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- Ard2c[2]	=>  Location: PIN_Y29,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- Awr1[0]	=>  Location: PIN_AJ7,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- Awr1[1]	=>  Location: PIN_AC12,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- Awr1[2]	=>  Location: PIN_AK7,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- Awr2[0]	=>  Location: PIN_B9,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- Awr2[1]	=>  Location: PIN_G12,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- Awr2[2]	=>  Location: PIN_E11,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- pc1[0]	=>  Location: PIN_AK10,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- pc1[1]	=>  Location: PIN_AB12,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- pc1[2]	=>  Location: PIN_AD19,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- pc1[3]	=>  Location: PIN_AB18,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- pc1[4]	=>  Location: PIN_AD24,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- pc1[5]	=>  Location: PIN_AB24,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- pc1[6]	=>  Location: PIN_AC24,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- pc1[7]	=>  Location: PIN_AG26,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- pc1[8]	=>  Location: PIN_Y23,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- pc1[9]	=>  Location: PIN_AH30,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- pc1[10]	=>  Location: PIN_AC28,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- pc1[11]	=>  Location: PIN_AE28,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- pc1[12]	=>  Location: PIN_AJ29,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- pc1[13]	=>  Location: PIN_W24,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- pc1[14]	=>  Location: PIN_Y21,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- pc1[15]	=>  Location: PIN_AE29,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- pc2[0]	=>  Location: PIN_Y5,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- pc2[1]	=>  Location: PIN_AB2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- pc2[2]	=>  Location: PIN_AC3,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- pc2[3]	=>  Location: PIN_W7,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- pc2[4]	=>  Location: PIN_Y1,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- pc2[5]	=>  Location: PIN_V9,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- pc2[6]	=>  Location: PIN_Y3,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- pc2[7]	=>  Location: PIN_M9,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- pc2[8]	=>  Location: PIN_C1,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- pc2[9]	=>  Location: PIN_E2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- pc2[10]	=>  Location: PIN_F1,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- pc2[11]	=>  Location: PIN_J7,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- pc2[12]	=>  Location: PIN_J6,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- pc2[13]	=>  Location: PIN_E3,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- pc2[14]	=>  Location: PIN_K5,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- pc2[15]	=>  Location: PIN_D2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- ir1[0]	=>  Location: PIN_AG12,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- ir1[1]	=>  Location: PIN_AK11,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- ir1[2]	=>  Location: PIN_AC5,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- ir1[3]	=>  Location: PIN_AG22,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- ir1[4]	=>  Location: PIN_AK26,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- ir1[5]	=>  Location: PIN_AD20,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- ir1[6]	=>  Location: PIN_AF22,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- ir1[7]	=>  Location: PIN_AE20,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- ir1[8]	=>  Location: PIN_AG28,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- ir1[9]	=>  Location: PIN_AH10,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- ir1[10]	=>  Location: PIN_AE3,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- ir1[11]	=>  Location: PIN_AB6,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- ir1[12]	=>  Location: PIN_AF16,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- ir1[13]	=>  Location: PIN_AD13,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- ir1[14]	=>  Location: PIN_AD27,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- ir1[15]	=>  Location: PIN_AB23,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- ir2[0]	=>  Location: PIN_AA1,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- ir2[1]	=>  Location: PIN_AE2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- ir2[2]	=>  Location: PIN_AD2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- ir2[3]	=>  Location: PIN_V8,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- ir2[4]	=>  Location: PIN_M3,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- ir2[5]	=>  Location: PIN_N2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- ir2[6]	=>  Location: PIN_T7,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- ir2[7]	=>  Location: PIN_P3,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- ir2[8]	=>  Location: PIN_P1,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- ir2[9]	=>  Location: PIN_G11,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- ir2[10]	=>  Location: PIN_C15,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- ir2[11]	=>  Location: PIN_A10,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- ir2[12]	=>  Location: PIN_F2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- ir2[13]	=>  Location: PIN_B2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- ir2[14]	=>  Location: PIN_G17,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- ir2[15]	=>  Location: PIN_B16,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- x1_op1[0]	=>  Location: PIN_AK20,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- x1_op1[1]	=>  Location: PIN_AG18,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- x1_op1[2]	=>  Location: PIN_AH18,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- x1_op1[3]	=>  Location: PIN_AK19,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- x1_op1[4]	=>  Location: PIN_AK22,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- x1_op1[5]	=>  Location: PIN_AK17,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- x1_op1[6]	=>  Location: PIN_AF18,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- x1_op1[7]	=>  Location: PIN_AG16,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- x1_op1[8]	=>  Location: PIN_AE16,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- x1_op1[9]	=>  Location: PIN_AH16,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- x1_op1[10]	=>  Location: PIN_AJ26,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- x1_op1[11]	=>  Location: PIN_AK28,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- x1_op1[12]	=>  Location: PIN_AF23,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- x1_op1[13]	=>  Location: PIN_AC21,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- x1_op1[14]	=>  Location: PIN_AG24,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- x1_op1[15]	=>  Location: PIN_AD21,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- x1_op2[0]	=>  Location: PIN_AG5,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- x1_op2[1]	=>  Location: PIN_AG8,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- x1_op2[2]	=>  Location: PIN_AH3,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- x1_op2[3]	=>  Location: PIN_AJ5,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- x1_op2[4]	=>  Location: PIN_AK3,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- x1_op2[5]	=>  Location: PIN_AC17,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- x1_op2[6]	=>  Location: PIN_AG7,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- x1_op2[7]	=>  Location: PIN_AD8,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- x1_op2[8]	=>  Location: PIN_AD10,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- x1_op2[9]	=>  Location: PIN_AJ6,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- x1_op2[10]	=>  Location: PIN_AH5,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- x1_op2[11]	=>  Location: PIN_AK21,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- x1_op2[12]	=>  Location: PIN_AK6,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- x1_op2[13]	=>  Location: PIN_AG4,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- x1_op2[14]	=>  Location: PIN_AF9,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- x1_op2[15]	=>  Location: PIN_AK9,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- x2_op1[0]	=>  Location: PIN_P9,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- x2_op1[1]	=>  Location: PIN_N10,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- x2_op1[2]	=>  Location: PIN_J2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- x2_op1[3]	=>  Location: PIN_N8,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- x2_op1[4]	=>  Location: PIN_M5,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- x2_op1[5]	=>  Location: PIN_H2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- x2_op1[6]	=>  Location: PIN_K2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- x2_op1[7]	=>  Location: PIN_M7,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- x2_op1[8]	=>  Location: PIN_M6,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- x2_op1[9]	=>  Location: PIN_H5,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- x2_op1[10]	=>  Location: PIN_V3,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- x2_op1[11]	=>  Location: PIN_W4,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- x2_op1[12]	=>  Location: PIN_U3,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- x2_op1[13]	=>  Location: PIN_U7,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- x2_op1[14]	=>  Location: PIN_W1,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- x2_op1[15]	=>  Location: PIN_U9,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- x2_op2[0]	=>  Location: PIN_H6,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- x2_op2[1]	=>  Location: PIN_H8,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- x2_op2[2]	=>  Location: PIN_G4,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- x2_op2[3]	=>  Location: PIN_C12,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- x2_op2[4]	=>  Location: PIN_H13,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- x2_op2[5]	=>  Location: PIN_E15,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- x2_op2[6]	=>  Location: PIN_C9,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- x2_op2[7]	=>  Location: PIN_D13,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- x2_op2[8]	=>  Location: PIN_A14,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- x2_op2[9]	=>  Location: PIN_A6,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- x2_op2[10]	=>  Location: PIN_G14,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- x2_op2[11]	=>  Location: PIN_A12,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- x2_op2[12]	=>  Location: PIN_C13,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- x2_op2[13]	=>  Location: PIN_J13,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- x2_op2[14]	=>  Location: PIN_C14,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- x2_op2[15]	=>  Location: PIN_H14,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- x1_op1_ready	=>  Location: PIN_AJ18,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- x1_op2_ready	=>  Location: PIN_AD9,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- x2_op1_ready	=>  Location: PIN_D5,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- x2_op2_ready	=>  Location: PIN_D10,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- x1_val	=>  Location: PIN_B21,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- x2_val	=>  Location: PIN_E20,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- C_out	=>  Location: PIN_AB13,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- Z_out	=>  Location: PIN_G9,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- C_ready	=>  Location: PIN_AK14,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- Z_ready	=>  Location: PIN_D7,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- C_wr	=>  Location: PIN_AA29,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- Z_wr	=>  Location: PIN_AJ8,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- C_2_out	=>  Location: PIN_AH15,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- C_2_ready	=>  Location: PIN_AC14,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- C_2_wr	=>  Location: PIN_G16,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- Z_2_out	=>  Location: PIN_C5,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- Z_2_ready	=>  Location: PIN_G10,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- Z_2_wr	=>  Location: PIN_E10,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- spec_tag_rs_out1[0]	=>  Location: PIN_G24,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- spec_tag_rs_out1[1]	=>  Location: PIN_D26,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- spec_tag_rs_out2[0]	=>  Location: PIN_B29,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- spec_tag_rs_out2[1]	=>  Location: PIN_F24,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- store_tag_rs_out1[0]	=>  Location: PIN_B18,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- store_tag_rs_out1[1]	=>  Location: PIN_F18,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- store_tag_rs_out1[2]	=>  Location: PIN_A17,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- store_tag_rs_out1[3]	=>  Location: PIN_G18,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- store_tag_rs_out1[4]	=>  Location: PIN_E17,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- store_tag_rs_out2[0]	=>  Location: PIN_A19,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- store_tag_rs_out2[1]	=>  Location: PIN_D18,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- store_tag_rs_out2[2]	=>  Location: PIN_B17,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- store_tag_rs_out2[3]	=>  Location: PIN_C18,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- store_tag_rs_out2[4]	=>  Location: PIN_B19,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- C_busybit_out	=>  Location: PIN_AK8,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- Z_busybit_out	=>  Location: PIN_AC11,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- C_2_busybit_out	=>  Location: PIN_AJ9,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- Z_2_busybit_out	=>  Location: PIN_D9,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- C_tag_out_arf[0]	=>  Location: PIN_P30,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- C_tag_out_arf[1]	=>  Location: PIN_R25,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- C_tag_out_arf[2]	=>  Location: PIN_P29,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- C_tag_out_arf[3]	=>  Location: PIN_R22,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- C_tag_out_arf[4]	=>  Location: PIN_M29,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- Z_tag_out_arf[0]	=>  Location: PIN_R27,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- Z_tag_out_arf[1]	=>  Location: PIN_N29,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- Z_tag_out_arf[2]	=>  Location: PIN_M30,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- Z_tag_out_arf[3]	=>  Location: PIN_N22,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- Z_tag_out_arf[4]	=>  Location: PIN_P27,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- C_2_tag_out_arf[0]	=>  Location: PIN_B24,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- C_2_tag_out_arf[1]	=>  Location: PIN_D24,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- C_2_tag_out_arf[2]	=>  Location: PIN_D22,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- C_2_tag_out_arf[3]	=>  Location: PIN_C24,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- C_2_tag_out_arf[4]	=>  Location: PIN_H20,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- Z_2_tag_out_arf[0]	=>  Location: PIN_A23,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- Z_2_tag_out_arf[1]	=>  Location: PIN_H19,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- Z_2_tag_out_arf[2]	=>  Location: PIN_E21,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- Z_2_tag_out_arf[3]	=>  Location: PIN_C21,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- Z_2_tag_out_arf[4]	=>  Location: PIN_G20,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- busy_dest1_out	=>  Location: PIN_AH4,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- busy_dest2_out	=>  Location: PIN_B10,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- dest_AR_tag_out[0]	=>  Location: PIN_P25,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- dest_AR_tag_out[1]	=>  Location: PIN_P23,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- dest_AR_tag_out[2]	=>  Location: PIN_N25,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- dest_AR_tag_out[3]	=>  Location: PIN_N28,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- dest_AR_tag_out[4]	=>  Location: PIN_P22,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- dest_AR_tag_2_out[0]	=>  Location: PIN_B23,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- dest_AR_tag_2_out[1]	=>  Location: PIN_B25,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- dest_AR_tag_2_out[2]	=>  Location: PIN_C22,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- dest_AR_tag_2_out[3]	=>  Location: PIN_J19,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- dest_AR_tag_2_out[4]	=>  Location: PIN_G19,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- C_tag_out_rs[0]	=>  Location: PIN_AJ13,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- C_tag_out_rs[1]	=>  Location: PIN_AF14,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- C_tag_out_rs[2]	=>  Location: PIN_AG13,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- C_tag_out_rs[3]	=>  Location: PIN_AK12,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- C_tag_out_rs[4]	=>  Location: PIN_AF15,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- Z_tag_out_rs[0]	=>  Location: PIN_B5,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- Z_tag_out_rs[1]	=>  Location: PIN_H10,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- Z_tag_out_rs[2]	=>  Location: PIN_A5,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- Z_tag_out_rs[3]	=>  Location: PIN_B4,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- Z_tag_out_rs[4]	=>  Location: PIN_A3,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- C_2_tag_out_rs[0]	=>  Location: PIN_AG14,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- C_2_tag_out_rs[1]	=>  Location: PIN_AJ12,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- C_2_tag_out_rs[2]	=>  Location: PIN_AJ14,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- C_2_tag_out_rs[3]	=>  Location: PIN_AE15,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- C_2_tag_out_rs[4]	=>  Location: PIN_AD14,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- Z_2_tag_out_rs[0]	=>  Location: PIN_F8,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- Z_2_tag_out_rs[1]	=>  Location: PIN_D6,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- Z_2_tag_out_rs[2]	=>  Location: PIN_B3,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- Z_2_tag_out_rs[3]	=>  Location: PIN_E8,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- Z_2_tag_out_rs[4]	=>  Location: PIN_C4,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- ra1_invalidate_out	=>  Location: PIN_B7,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- ra2_invalidate_out	=>  Location: PIN_A7,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- pc_en_out	=>  Location: PIN_J18,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- ra_en_out	=>  Location: PIN_H18,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- arf_busy_wr_en1	=>  Location: PIN_D19,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- arf_busy_wr_en2	=>  Location: PIN_A22,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- arf_tag_wr_en1	=>  Location: PIN_C19,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- arf_tag_wr_en2	=>  Location: PIN_F20,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- adder2_out[0]	=>  Location: PIN_AH9,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- adder2_out[1]	=>  Location: PIN_AG9,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- adder2_out[2]	=>  Location: PIN_AD17,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- adder2_out[3]	=>  Location: PIN_AJ20,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- adder2_out[4]	=>  Location: PIN_AH24,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- adder2_out[5]	=>  Location: PIN_AD22,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- adder2_out[6]	=>  Location: PIN_AF24,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- adder2_out[7]	=>  Location: PIN_AG23,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- adder2_out[8]	=>  Location: PIN_AB25,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- adder2_out[9]	=>  Location: PIN_AE30,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- adder2_out[10]	=>  Location: PIN_AF29,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- adder2_out[11]	=>  Location: PIN_AA23,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- adder2_out[12]	=>  Location: PIN_AA24,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- adder2_out[13]	=>  Location: PIN_AB26,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- adder2_out[14]	=>  Location: PIN_AF30,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- adder2_out[15]	=>  Location: PIN_AA25,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- adder3_out[0]	=>  Location: PIN_W6,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- adder3_out[1]	=>  Location: PIN_W10,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- adder3_out[2]	=>  Location: PIN_W9,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- adder3_out[3]	=>  Location: PIN_W8,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- adder3_out[4]	=>  Location: PIN_U1,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- adder3_out[5]	=>  Location: PIN_V4,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- adder3_out[6]	=>  Location: PIN_U5,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- adder3_out[7]	=>  Location: PIN_L5,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- adder3_out[8]	=>  Location: PIN_K6,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- adder3_out[9]	=>  Location: PIN_E4,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- adder3_out[10]	=>  Location: PIN_J5,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- adder3_out[11]	=>  Location: PIN_K7,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- adder3_out[12]	=>  Location: PIN_K8,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- adder3_out[13]	=>  Location: PIN_L9,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- adder3_out[14]	=>  Location: PIN_L7,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- adder3_out[15]	=>  Location: PIN_L8,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- ZA7_1_out[0]	=>  Location: PIN_C26,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- ZA7_1_out[1]	=>  Location: PIN_D21,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- ZA7_1_out[2]	=>  Location: PIN_Y9,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- ZA7_1_out[3]	=>  Location: PIN_V21,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- ZA7_1_out[4]	=>  Location: PIN_V28,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- ZA7_1_out[5]	=>  Location: PIN_B28,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- ZA7_1_out[6]	=>  Location: PIN_V27,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- ZA7_1_out[7]	=>  Location: PIN_AJ15,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- ZA7_1_out[8]	=>  Location: PIN_AE13,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- ZA7_1_out[9]	=>  Location: PIN_AF2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- ZA7_1_out[10]	=>  Location: PIN_AC20,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- ZA7_1_out[11]	=>  Location: PIN_AK23,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- ZA7_1_out[12]	=>  Location: PIN_AJ24,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- ZA7_1_out[13]	=>  Location: PIN_AE19,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- ZA7_1_out[14]	=>  Location: PIN_AF21,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- ZA7_1_out[15]	=>  Location: PIN_AG29,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- ZA7_2_out[0]	=>  Location: PIN_V23,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- ZA7_2_out[1]	=>  Location: PIN_W30,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- ZA7_2_out[2]	=>  Location: PIN_AE24,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- ZA7_2_out[3]	=>  Location: PIN_AD4,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- ZA7_2_out[4]	=>  Location: PIN_T22,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- ZA7_2_out[5]	=>  Location: PIN_AB5,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- ZA7_2_out[6]	=>  Location: PIN_B26,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- ZA7_2_out[7]	=>  Location: PIN_W5,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- ZA7_2_out[8]	=>  Location: PIN_AE1,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- ZA7_2_out[9]	=>  Location: PIN_AA3,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- ZA7_2_out[10]	=>  Location: PIN_V10,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- ZA7_2_out[11]	=>  Location: PIN_T9,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- ZA7_2_out[12]	=>  Location: PIN_P7,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- ZA7_2_out[13]	=>  Location: PIN_T6,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- ZA7_2_out[14]	=>  Location: PIN_N4,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- ZA7_2_out[15]	=>  Location: PIN_P2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- S0	=>  Location: PIN_C10,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- S1	=>  Location: PIN_B8,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- S2	=>  Location: PIN_J12,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- S3	=>  Location: PIN_D8,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- free_rrf_vec[2]	=>  Location: PIN_G15,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- free_rrf_vec[0]	=>  Location: PIN_H15,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- free_rrf_vec[1]	=>  Location: PIN_H23,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- free_rrf_vec[3]	=>  Location: PIN_H28,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- free_rrf_vec[4]	=>  Location: PIN_F30,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- free_rrf_vec[5]	=>  Location: PIN_K25,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- free_rrf_vec[6]	=>  Location: PIN_H26,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- free_rrf_vec[7]	=>  Location: PIN_F29,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- free_rrf_vec[8]	=>  Location: PIN_M27,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- free_rrf_vec[9]	=>  Location: PIN_G30,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- free_rrf_vec[10]	=>  Location: PIN_L22,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- free_rrf_vec[11]	=>  Location: PIN_L21,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- free_rrf_vec[12]	=>  Location: PIN_L28,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- free_rrf_vec[13]	=>  Location: PIN_H30,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- free_rrf_vec[14]	=>  Location: PIN_L24,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- free_rrf_vec[15]	=>  Location: PIN_M23,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- free_rrf_vec[16]	=>  Location: PIN_M24,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- free_rrf_vec[17]	=>  Location: PIN_M21,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- free_rrf_vec[18]	=>  Location: PIN_N23,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- free_rrf_vec[19]	=>  Location: PIN_K26,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- free_rrf_vec[20]	=>  Location: PIN_H29,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- free_rrf_vec[21]	=>  Location: PIN_K27,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- free_rrf_vec[22]	=>  Location: PIN_E30,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- free_rrf_vec[23]	=>  Location: PIN_C29,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- free_rrf_vec[24]	=>  Location: PIN_D29,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- free_rrf_vec[25]	=>  Location: PIN_D28,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- free_rrf_vec[26]	=>  Location: PIN_G25,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- free_rrf_vec[27]	=>  Location: PIN_F28,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- free_rrf_vec[28]	=>  Location: PIN_G26,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- free_rrf_vec[29]	=>  Location: PIN_E27,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- free_rrf_vec[30]	=>  Location: PIN_J24,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- free_rrf_vec[31]	=>  Location: PIN_C27,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- ra1_ir_out[9]	=>  Location: PIN_AG10,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- ra1_ir_out[15]	=>  Location: PIN_AC23,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- ra1_ir_out[6]	=>  Location: PIN_AK24,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- ra1_ir_out[12]	=>  Location: PIN_AG17,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- ra1_ir_out[0]	=>  Location: PIN_AJ16,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- ra1_ir_out[1]	=>  Location: PIN_AC13,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- ra1_ir_out[2]	=>  Location: PIN_AF1,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- ra1_ir_out[14]	=>  Location: PIN_AD26,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- ra1_ir_out[13]	=>  Location: PIN_AF12,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- ra1_val_out	=>  Location: PIN_C17,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- ra1_ir_out[10]	=>  Location: PIN_AA8,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- ra1_ir_out[7]	=>  Location: PIN_AH22,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- ra1_ir_out[11]	=>  Location: PIN_AC6,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- ra1_ir_out[8]	=>  Location: PIN_AH29,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- ra2_ir_out[9]	=>  Location: PIN_E9,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- ra2_ir_out[15]	=>  Location: PIN_H16,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- ra2_ir_out[6]	=>  Location: PIN_T5,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- ra2_ir_out[12]	=>  Location: PIN_H1,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- ra2_ir_out[0]	=>  Location: PIN_AA2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- ra2_ir_out[1]	=>  Location: PIN_Y7,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- ra2_ir_out[2]	=>  Location: PIN_AD1,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- ra2_ir_out[14]	=>  Location: PIN_B22,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- ra2_ir_out[13]	=>  Location: PIN_H7,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- ra2_val_out	=>  Location: PIN_H17,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- ra2_ir_out[10]	=>  Location: PIN_C16,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- ra2_ir_out[7]	=>  Location: PIN_P6,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- ra2_ir_out[11]	=>  Location: PIN_E12,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- ra2_ir_out[8]	=>  Location: PIN_P4,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- ra1_ir_out[3]	=>  Location: PIN_AK25,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- ra1_ir_out[4]	=>  Location: PIN_AJ23,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- ra1_ir_out[5]	=>  Location: PIN_AJ25,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- ra2_ir_out[3]	=>  Location: PIN_AA4,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- ra2_ir_out[4]	=>  Location: PIN_M1,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- ra2_ir_out[5]	=>  Location: PIN_N3,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- ra1_pc_out[0]	=>  Location: PIN_AJ10,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- ra1_pc_out[1]	=>  Location: PIN_AJ11,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- ra1_pc_out[2]	=>  Location: PIN_AC19,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- ra1_pc_out[3]	=>  Location: PIN_AH20,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- ra1_pc_out[4]	=>  Location: PIN_AC26,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- ra1_pc_out[5]	=>  Location: PIN_AF27,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- ra1_pc_out[6]	=>  Location: PIN_AF28,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- ra1_pc_out[7]	=>  Location: PIN_AG27,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- ra1_pc_out[8]	=>  Location: PIN_Y24,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- ra1_pc_out[9]	=>  Location: PIN_AD28,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- ra1_pc_out[10]	=>  Location: PIN_AC27,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- ra1_pc_out[11]	=>  Location: PIN_AE27,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- ra1_pc_out[12]	=>  Location: PIN_AH28,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- ra1_pc_out[13]	=>  Location: PIN_AA26,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- ra1_pc_out[14]	=>  Location: PIN_Y22,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- ra1_pc_out[15]	=>  Location: PIN_AD30,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- ra2_pc_out[0]	=>  Location: PIN_AC1,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- ra2_pc_out[1]	=>  Location: PIN_AB1,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- ra2_pc_out[2]	=>  Location: PIN_AC4,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- ra2_pc_out[3]	=>  Location: PIN_AC2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- ra2_pc_out[4]	=>  Location: PIN_Y2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- ra2_pc_out[5]	=>  Location: PIN_V7,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- ra2_pc_out[6]	=>  Location: PIN_Y4,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- ra2_pc_out[7]	=>  Location: PIN_M8,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- ra2_pc_out[8]	=>  Location: PIN_C2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- ra2_pc_out[9]	=>  Location: PIN_E1,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- ra2_pc_out[10]	=>  Location: PIN_L6,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- ra2_pc_out[11]	=>  Location: PIN_H4,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- ra2_pc_out[12]	=>  Location: PIN_H3,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- ra2_pc_out[13]	=>  Location: PIN_C3,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- ra2_pc_out[14]	=>  Location: PIN_L10,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- ra2_pc_out[15]	=>  Location: PIN_D3,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- tag1[0]	=>  Location: PIN_AF20,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- data1[0]	=>  Location: PIN_AB19,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- busy1	=>  Location: PIN_AJ17,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- tag1[1]	=>  Location: PIN_AD18,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- data1[1]	=>  Location: PIN_AG20,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- tag1[2]	=>  Location: PIN_AF17,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- data1[2]	=>  Location: PIN_AJ21,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- tag1[3]	=>  Location: PIN_AG19,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- data1[3]	=>  Location: PIN_AJ22,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- tag1[4]	=>  Location: PIN_AC18,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- data1[4]	=>  Location: PIN_AJ19,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- data1[5]	=>  Location: PIN_AE17,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- data1[6]	=>  Location: PIN_AH19,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- data1[7]	=>  Location: PIN_AH17,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- data1[8]	=>  Location: PIN_AD16,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- data1[9]	=>  Location: PIN_AC16,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- data1[10]	=>  Location: PIN_AE23,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- data1[11]	=>  Location: PIN_AH26,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- data1[12]	=>  Location: PIN_AJ27,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- data1[13]	=>  Location: PIN_AG25,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- data1[14]	=>  Location: PIN_AH27,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- data1[15]	=>  Location: PIN_AJ28,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- tag2[0]	=>  Location: PIN_AD7,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- data2[0]	=>  Location: PIN_AB7,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- busy2	=>  Location: PIN_AE7,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- tag2[1]	=>  Location: PIN_AF4,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- data2[1]	=>  Location: PIN_AD6,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- tag2[2]	=>  Location: PIN_AA10,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- data2[2]	=>  Location: PIN_AA9,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- tag2[3]	=>  Location: PIN_AC7,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- data2[3]	=>  Location: PIN_AF7,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- tag2[4]	=>  Location: PIN_AJ2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- data2[4]	=>  Location: PIN_AJ4,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- data2[5]	=>  Location: PIN_AE8,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- data2[6]	=>  Location: PIN_AF3,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- data2[7]	=>  Location: PIN_AH7,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- data2[8]	=>  Location: PIN_AD5,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- data2[9]	=>  Location: PIN_AF8,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- data2[10]	=>  Location: PIN_AK5,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- data2[11]	=>  Location: PIN_AH2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- data2[12]	=>  Location: PIN_AE4,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- data2[13]	=>  Location: PIN_AG2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- data2[14]	=>  Location: PIN_AJ3,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- data2[15]	=>  Location: PIN_AG3,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- tag3[0]	=>  Location: PIN_N9,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- data3[0]	=>  Location: PIN_L1,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- busy3	=>  Location: PIN_G2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- tag3[1]	=>  Location: PIN_M2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- data3[1]	=>  Location: PIN_M10,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- tag3[2]	=>  Location: PIN_L3,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- data3[2]	=>  Location: PIN_L4,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- tag3[3]	=>  Location: PIN_L2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- data3[3]	=>  Location: PIN_K1,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- tag3[4]	=>  Location: PIN_J1,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- data3[4]	=>  Location: PIN_M4,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- data3[5]	=>  Location: PIN_K3,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- data3[6]	=>  Location: PIN_N7,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- data3[7]	=>  Location: PIN_G1,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- data3[8]	=>  Location: PIN_K4,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- data3[9]	=>  Location: PIN_G6,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- data3[10]	=>  Location: PIN_T8,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- data3[11]	=>  Location: PIN_W2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- data3[12]	=>  Location: PIN_V2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- data3[13]	=>  Location: PIN_U8,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- data3[14]	=>  Location: PIN_U2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- data3[15]	=>  Location: PIN_W3,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- tag4[0]	=>  Location: PIN_D4,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- data4[0]	=>  Location: PIN_G3,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- busy4	=>  Location: PIN_E7,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- tag4[1]	=>  Location: PIN_F4,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- data4[1]	=>  Location: PIN_G5,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- tag4[2]	=>  Location: PIN_F3,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- data4[2]	=>  Location: PIN_F7,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- tag4[3]	=>  Location: PIN_B11,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- data4[3]	=>  Location: PIN_D12,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- tag4[4]	=>  Location: PIN_G13,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- data4[4]	=>  Location: PIN_A11,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- data4[5]	=>  Location: PIN_F13,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- data4[6]	=>  Location: PIN_B15,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- data4[7]	=>  Location: PIN_B12,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- data4[8]	=>  Location: PIN_E13,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- data4[9]	=>  Location: PIN_D14,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- data4[10]	=>  Location: PIN_D15,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- data4[11]	=>  Location: PIN_B14,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- data4[12]	=>  Location: PIN_E14,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- data4[13]	=>  Location: PIN_R2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- data4[14]	=>  Location: PIN_R3,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- data4[15]	=>  Location: PIN_B13,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- taken_branch_detected	=>  Location: PIN_H21,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- not_taken_branch_detected	=>  Location: PIN_F19,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- C_in	=>  Location: PIN_AH13,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- C_busybit_in	=>  Location: PIN_AH12,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- Z_in	=>  Location: PIN_B6,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- Z_busybit_in	=>  Location: PIN_AD3,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- spec_tag_rb_in[0]	=>  Location: PIN_A26,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- spec_tag_rb_in[1]	=>  Location: PIN_B27,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- store_retirement_count[0]	=>  Location: PIN_B20,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- store_retirement_count[1]	=>  Location: PIN_A20,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- C_tag_in[0]	=>  Location: PIN_Y28,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- C_tag_in[1]	=>  Location: PIN_W27,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- C_tag_in[2]	=>  Location: PIN_V22,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- C_tag_in[3]	=>  Location: PIN_AA30,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- C_tag_in[4]	=>  Location: PIN_W26,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- Z_tag_in[0]	=>  Location: PIN_L30,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- Z_tag_in[1]	=>  Location: PIN_L29,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- Z_tag_in[2]	=>  Location: PIN_M28,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- Z_tag_in[3]	=>  Location: PIN_E23,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- Z_tag_in[4]	=>  Location: PIN_A28,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- busy_dest1_in	=>  Location: PIN_AG6,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- busy_dest2_in	=>  Location: PIN_F12,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- tag_dest1_in[0]	=>  Location: PIN_P24,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- tag_dest1_in[1]	=>  Location: PIN_P28,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- tag_dest1_in[2]	=>  Location: PIN_N24,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- tag_dest1_in[3]	=>  Location: PIN_R23,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- tag_dest1_in[4]	=>  Location: PIN_P26,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- tag_dest2_in[0]	=>  Location: PIN_A24,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- tag_dest2_in[1]	=>  Location: PIN_D25,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- tag_dest2_in[2]	=>  Location: PIN_D23,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- tag_dest2_in[3]	=>  Location: PIN_A25,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- tag_dest2_in[4]	=>  Location: PIN_E22,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- alu_r7_resolved	=>  Location: PIN_H11,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- lw_r7_resolved	=>  Location: PIN_A8,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- jlr_resolved	=>  Location: PIN_C7,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- rs_full_in	=>  Location: PIN_E19,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- lm_stall_in	=>  Location: PIN_A21,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- clk	=>  Location: PIN_T2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- reset	=>  Location: PIN_T3,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default


ARCHITECTURE structure OF ID IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_clk : std_logic;
SIGNAL ww_reset : std_logic;
SIGNAL ww_ra1_val_out : std_logic;
SIGNAL ww_ra2_val_out : std_logic;
SIGNAL ww_ra1_pc_out : std_logic_vector(15 DOWNTO 0);
SIGNAL ww_ra1_ir_out : std_logic_vector(15 DOWNTO 0);
SIGNAL ww_ra2_pc_out : std_logic_vector(15 DOWNTO 0);
SIGNAL ww_ra2_ir_out : std_logic_vector(15 DOWNTO 0);
SIGNAL ww_free_rrf_vec : std_logic_vector(31 DOWNTO 0);
SIGNAL ww_data1 : std_logic_vector(15 DOWNTO 0);
SIGNAL ww_data2 : std_logic_vector(15 DOWNTO 0);
SIGNAL ww_data3 : std_logic_vector(15 DOWNTO 0);
SIGNAL ww_data4 : std_logic_vector(15 DOWNTO 0);
SIGNAL ww_busy1 : std_logic;
SIGNAL ww_busy2 : std_logic;
SIGNAL ww_busy3 : std_logic;
SIGNAL ww_busy4 : std_logic;
SIGNAL ww_tag1 : std_logic_vector(4 DOWNTO 0);
SIGNAL ww_tag2 : std_logic_vector(4 DOWNTO 0);
SIGNAL ww_tag3 : std_logic_vector(4 DOWNTO 0);
SIGNAL ww_tag4 : std_logic_vector(4 DOWNTO 0);
SIGNAL ww_C_in : std_logic;
SIGNAL ww_Z_in : std_logic;
SIGNAL ww_C_busybit_in : std_logic;
SIGNAL ww_Z_busybit_in : std_logic;
SIGNAL ww_busy_dest1_in : std_logic;
SIGNAL ww_busy_dest2_in : std_logic;
SIGNAL ww_C_tag_in : std_logic_vector(4 DOWNTO 0);
SIGNAL ww_Z_tag_in : std_logic_vector(4 DOWNTO 0);
SIGNAL ww_tag_dest1_in : std_logic_vector(4 DOWNTO 0);
SIGNAL ww_tag_dest2_in : std_logic_vector(4 DOWNTO 0);
SIGNAL ww_taken_branch_detected : std_logic;
SIGNAL ww_not_taken_branch_detected : std_logic;
SIGNAL ww_spec_tag_rb_in : std_logic_vector(1 DOWNTO 0);
SIGNAL ww_rs_full_in : std_logic;
SIGNAL ww_lm_stall_in : std_logic;
SIGNAL ww_lw_r7_resolved : std_logic;
SIGNAL ww_alu_r7_resolved : std_logic;
SIGNAL ww_jlr_resolved : std_logic;
SIGNAL ww_store_retirement_count : std_logic_vector(1 DOWNTO 0);
SIGNAL ww_free_rrf_vec_out : std_logic_vector(31 DOWNTO 0);
SIGNAL ww_Ard1a : std_logic_vector(2 DOWNTO 0);
SIGNAL ww_Ard1b : std_logic_vector(2 DOWNTO 0);
SIGNAL ww_Ard2a : std_logic_vector(2 DOWNTO 0);
SIGNAL ww_Ard2b : std_logic_vector(2 DOWNTO 0);
SIGNAL ww_Ard1c : std_logic_vector(2 DOWNTO 0);
SIGNAL ww_Ard2c : std_logic_vector(2 DOWNTO 0);
SIGNAL ww_Awr1 : std_logic_vector(2 DOWNTO 0);
SIGNAL ww_Awr2 : std_logic_vector(2 DOWNTO 0);
SIGNAL ww_pc1 : std_logic_vector(15 DOWNTO 0);
SIGNAL ww_pc2 : std_logic_vector(15 DOWNTO 0);
SIGNAL ww_ir1 : std_logic_vector(15 DOWNTO 0);
SIGNAL ww_ir2 : std_logic_vector(15 DOWNTO 0);
SIGNAL ww_x1_op1 : std_logic_vector(15 DOWNTO 0);
SIGNAL ww_x1_op2 : std_logic_vector(15 DOWNTO 0);
SIGNAL ww_x2_op1 : std_logic_vector(15 DOWNTO 0);
SIGNAL ww_x2_op2 : std_logic_vector(15 DOWNTO 0);
SIGNAL ww_x1_op1_ready : std_logic;
SIGNAL ww_x1_op2_ready : std_logic;
SIGNAL ww_x2_op1_ready : std_logic;
SIGNAL ww_x2_op2_ready : std_logic;
SIGNAL ww_x1_val : std_logic;
SIGNAL ww_x2_val : std_logic;
SIGNAL ww_C_out : std_logic;
SIGNAL ww_Z_out : std_logic;
SIGNAL ww_C_ready : std_logic;
SIGNAL ww_Z_ready : std_logic;
SIGNAL ww_C_wr : std_logic;
SIGNAL ww_Z_wr : std_logic;
SIGNAL ww_C_2_out : std_logic;
SIGNAL ww_C_2_ready : std_logic;
SIGNAL ww_C_2_wr : std_logic;
SIGNAL ww_Z_2_out : std_logic;
SIGNAL ww_Z_2_ready : std_logic;
SIGNAL ww_Z_2_wr : std_logic;
SIGNAL ww_spec_tag_rs_out1 : std_logic_vector(1 DOWNTO 0);
SIGNAL ww_spec_tag_rs_out2 : std_logic_vector(1 DOWNTO 0);
SIGNAL ww_store_tag_rs_out1 : std_logic_vector(4 DOWNTO 0);
SIGNAL ww_store_tag_rs_out2 : std_logic_vector(4 DOWNTO 0);
SIGNAL ww_C_busybit_out : std_logic;
SIGNAL ww_Z_busybit_out : std_logic;
SIGNAL ww_C_2_busybit_out : std_logic;
SIGNAL ww_Z_2_busybit_out : std_logic;
SIGNAL ww_C_tag_out_arf : std_logic_vector(4 DOWNTO 0);
SIGNAL ww_Z_tag_out_arf : std_logic_vector(4 DOWNTO 0);
SIGNAL ww_C_2_tag_out_arf : std_logic_vector(4 DOWNTO 0);
SIGNAL ww_Z_2_tag_out_arf : std_logic_vector(4 DOWNTO 0);
SIGNAL ww_busy_dest1_out : std_logic;
SIGNAL ww_busy_dest2_out : std_logic;
SIGNAL ww_dest_AR_tag_out : std_logic_vector(4 DOWNTO 0);
SIGNAL ww_dest_AR_tag_2_out : std_logic_vector(4 DOWNTO 0);
SIGNAL ww_C_tag_out_rs : std_logic_vector(4 DOWNTO 0);
SIGNAL ww_Z_tag_out_rs : std_logic_vector(4 DOWNTO 0);
SIGNAL ww_C_2_tag_out_rs : std_logic_vector(4 DOWNTO 0);
SIGNAL ww_Z_2_tag_out_rs : std_logic_vector(4 DOWNTO 0);
SIGNAL ww_ra1_invalidate_out : std_logic;
SIGNAL ww_ra2_invalidate_out : std_logic;
SIGNAL ww_pc_en_out : std_logic;
SIGNAL ww_ra_en_out : std_logic;
SIGNAL ww_arf_busy_wr_en1 : std_logic;
SIGNAL ww_arf_busy_wr_en2 : std_logic;
SIGNAL ww_arf_tag_wr_en1 : std_logic;
SIGNAL ww_arf_tag_wr_en2 : std_logic;
SIGNAL ww_adder2_out : std_logic_vector(15 DOWNTO 0);
SIGNAL ww_adder3_out : std_logic_vector(15 DOWNTO 0);
SIGNAL ww_ZA7_1_out : std_logic_vector(15 DOWNTO 0);
SIGNAL ww_ZA7_2_out : std_logic_vector(15 DOWNTO 0);
SIGNAL ww_S0 : std_logic;
SIGNAL ww_S1 : std_logic;
SIGNAL ww_S2 : std_logic;
SIGNAL ww_S3 : std_logic;
SIGNAL \clk~clkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \reset~clkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \PE|pen2|next_var~33_combout\ : std_logic;
SIGNAL \PE|pen1|penout[2]~16_combout\ : std_logic;
SIGNAL \PE|pen1|pennext[26]~27_combout\ : std_logic;
SIGNAL \PE|pen1|penout[1]~18_combout\ : std_logic;
SIGNAL \PE|pen1|pennext[27]~31_combout\ : std_logic;
SIGNAL \PE|pen1|pennext[29]~35_combout\ : std_logic;
SIGNAL \Ard1a~9_combout\ : std_logic;
SIGNAL \Ard1a~10_combout\ : std_logic;
SIGNAL \Ard1a~23_combout\ : std_logic;
SIGNAL \Ard1a~27_combout\ : std_logic;
SIGNAL \Ard2a~7_combout\ : std_logic;
SIGNAL \Ard2a~9_combout\ : std_logic;
SIGNAL \x2_op2~7_combout\ : std_logic;
SIGNAL \Awr2~1_combout\ : std_logic;
SIGNAL \x1_op2~8_combout\ : std_logic;
SIGNAL \x1_op2~25_combout\ : std_logic;
SIGNAL \x1_op2~29_combout\ : std_logic;
SIGNAL \x1_op2~33_combout\ : std_logic;
SIGNAL \x2_op2~10_combout\ : std_logic;
SIGNAL \x2_op2~28_combout\ : std_logic;
SIGNAL \x2_op2~41_combout\ : std_logic;
SIGNAL \x2_op2~50_combout\ : std_logic;
SIGNAL \x2_op2~53_combout\ : std_logic;
SIGNAL \PE|pen1|Equal0~7_combout\ : std_logic;
SIGNAL \process_0~3_combout\ : std_logic;
SIGNAL \spec_tag_rs_out2~0_combout\ : std_logic;
SIGNAL \Equal0~5_combout\ : std_logic;
SIGNAL \pc_en_out~0_combout\ : std_logic;
SIGNAL \spec_tag_rs_out2~7_combout\ : std_logic;
SIGNAL \store_tag_reg_in~15_combout\ : std_logic;
SIGNAL \STORE_TAG_DEC|ist_add:3:F1|s0~combout\ : std_logic;
SIGNAL \PE|pen1|penout~19_combout\ : std_logic;
SIGNAL \PE|pen1|penout~20_combout\ : std_logic;
SIGNAL \PE|pen1|penout~21_combout\ : std_logic;
SIGNAL \PE|pen1|penout~22_combout\ : std_logic;
SIGNAL \PE|pen1|penout~23_combout\ : std_logic;
SIGNAL \PE|pen1|penout~24_combout\ : std_logic;
SIGNAL \PE|pen1|penout~25_combout\ : std_logic;
SIGNAL \PE|pen1|penout~26_combout\ : std_logic;
SIGNAL \PE|pen1|penout~30_combout\ : std_logic;
SIGNAL \Z_tag_out_arf~1_combout\ : std_logic;
SIGNAL \PE|pen2|penout~28_combout\ : std_logic;
SIGNAL \PE|pen2|penout~29_combout\ : std_logic;
SIGNAL \PE|pen2|penout~30_combout\ : std_logic;
SIGNAL \PE|pen2|penout~31_combout\ : std_logic;
SIGNAL \PE|pen2|penout~32_combout\ : std_logic;
SIGNAL \PE|pen2|penout~33_combout\ : std_logic;
SIGNAL \PE|pen2|penout~34_combout\ : std_logic;
SIGNAL \PE|pen2|penout~35_combout\ : std_logic;
SIGNAL \PE|pen2|penout~36_combout\ : std_logic;
SIGNAL \PE|pen2|penout~37_combout\ : std_logic;
SIGNAL \PE|pen2|penout~38_combout\ : std_logic;
SIGNAL \PE|pen2|penout~39_combout\ : std_logic;
SIGNAL \PE|pen2|penout~40_combout\ : std_logic;
SIGNAL \PE|pen2|penout~41_combout\ : std_logic;
SIGNAL \PE|pen2|penout~42_combout\ : std_logic;
SIGNAL \PE|pen2|penout~43_combout\ : std_logic;
SIGNAL \PE|pen2|penout~44_combout\ : std_logic;
SIGNAL \PE|pen2|penout~46_combout\ : std_logic;
SIGNAL \PE|pen2|penout~47_combout\ : std_logic;
SIGNAL \PE|pen2|penout~48_combout\ : std_logic;
SIGNAL \ra1_invalidate_out~0_combout\ : std_logic;
SIGNAL \ra1_invalidate_out~1_combout\ : std_logic;
SIGNAL \ra1_invalidate_out~2_combout\ : std_logic;
SIGNAL \ra1_invalidate_out~5_combout\ : std_logic;
SIGNAL \ra1_invalidate_out~8_combout\ : std_logic;
SIGNAL \spec_tag_reg_in~10_combout\ : std_logic;
SIGNAL \spec_tag_reg_in~11_combout\ : std_logic;
SIGNAL \spec_tag_reg_in~12_combout\ : std_logic;
SIGNAL \spec_tag_reg_in~13_combout\ : std_logic;
SIGNAL \PE|pen2|penout~59_combout\ : std_logic;
SIGNAL \spec_tag_rs_out1~14_combout\ : std_logic;
SIGNAL \spec_tag_reg_in~14_combout\ : std_logic;
SIGNAL \STORE_TAG_REG|dout[0]~18_combout\ : std_logic;
SIGNAL \clk~combout\ : std_logic;
SIGNAL \clk~clkctrl_outclk\ : std_logic;
SIGNAL \PE|pen2|next_var~8_combout\ : std_logic;
SIGNAL \PE|pen2|next_var~9_combout\ : std_logic;
SIGNAL \PE|pen2|next_var~10_combout\ : std_logic;
SIGNAL \PE|pen1|pennext[5]~2_combout\ : std_logic;
SIGNAL \PE|pen2|next_var~11_combout\ : std_logic;
SIGNAL \PE|pen2|next_var~12_combout\ : std_logic;
SIGNAL \PE|pen1|Equal0~0_combout\ : std_logic;
SIGNAL \PE|pen2|next_var~13_combout\ : std_logic;
SIGNAL \PE|pen2|next_var~14_combout\ : std_logic;
SIGNAL \PE|pen2|next_var~15_combout\ : std_logic;
SIGNAL \PE|pen1|penout[3]~44_combout\ : std_logic;
SIGNAL \PE|pen2|penout~14_combout\ : std_logic;
SIGNAL \PE|pen2|penout~15_combout\ : std_logic;
SIGNAL \PE|pen2|next_var~16_combout\ : std_logic;
SIGNAL \PE|pen1|penout[1]~8_combout\ : std_logic;
SIGNAL \PE|pen1|pennext[7]~4_combout\ : std_logic;
SIGNAL \PE|pen2|penout~16_combout\ : std_logic;
SIGNAL \PE|pen1|pennext[9]~3_combout\ : std_logic;
SIGNAL \PE|pen2|next_var~17_combout\ : std_logic;
SIGNAL \PE|pen1|pennext[10]~6_combout\ : std_logic;
SIGNAL \PE|pen2|penout~17_combout\ : std_logic;
SIGNAL \PE|pen2|next_var~18_combout\ : std_logic;
SIGNAL \PE|pen1|pennext[11]~7_combout\ : std_logic;
SIGNAL \PE|pen2|next_var~19_combout\ : std_logic;
SIGNAL \PE|pen2|penout~57_combout\ : std_logic;
SIGNAL \PE|pen1|penout~9_combout\ : std_logic;
SIGNAL \PE|pen1|penout~11_combout\ : std_logic;
SIGNAL \PE|pen1|pennext[12]~8_combout\ : std_logic;
SIGNAL \PE|pen2|next_var~20_combout\ : std_logic;
SIGNAL \PE|pen2|next_var~21_combout\ : std_logic;
SIGNAL \PE|pen2|next_var~22_combout\ : std_logic;
SIGNAL \PE|pen1|penout~12_combout\ : std_logic;
SIGNAL \PE|pen1|pennext[10]~5_combout\ : std_logic;
SIGNAL \PE|pen1|pennext[14]~9_combout\ : std_logic;
SIGNAL \PE|pen2|penout~19_combout\ : std_logic;
SIGNAL \PE|pen2|next_var~23_combout\ : std_logic;
SIGNAL \PE|pen1|pennext[15]~10_combout\ : std_logic;
SIGNAL \PE|pen2|penout~18_combout\ : std_logic;
SIGNAL \PE|pen2|next_var~24_combout\ : std_logic;
SIGNAL \PE|pen2|next_var~25_combout\ : std_logic;
SIGNAL \PE|pen2|penout~20_combout\ : std_logic;
SIGNAL \PE|pen2|next_var~26_combout\ : std_logic;
SIGNAL \PE|pen1|penout~13_combout\ : std_logic;
SIGNAL \PE|pen1|penout[4]~14_combout\ : std_logic;
SIGNAL \PE|pen2|next_var~27_combout\ : std_logic;
SIGNAL \PE|pen2|next_var~28_combout\ : std_logic;
SIGNAL \PE|pen2|next_var~30_combout\ : std_logic;
SIGNAL \PE|pen1|pennext[3]~12_combout\ : std_logic;
SIGNAL \PE|pen2|Equal0~0_combout\ : std_logic;
SIGNAL \PE|pen1|pennext[18]~11_combout\ : std_logic;
SIGNAL \PE|pen2|next_var~29_combout\ : std_logic;
SIGNAL \PE|pen2|next_var~31_combout\ : std_logic;
SIGNAL \PE|pen1|pennext[17]~13_combout\ : std_logic;
SIGNAL \PE|pen1|pennext[17]~14_combout\ : std_logic;
SIGNAL \PE|pen1|pennext[19]~15_combout\ : std_logic;
SIGNAL \PE|pen2|next_var~32_combout\ : std_logic;
SIGNAL \PE|pen1|pennext[20]~17_combout\ : std_logic;
SIGNAL \PE|pen2|next_var~34_combout\ : std_logic;
SIGNAL \PE|pen2|penout~22_combout\ : std_logic;
SIGNAL \PE|pen2|next_var~35_combout\ : std_logic;
SIGNAL \PE|pen2|next_var~36_combout\ : std_logic;
SIGNAL \PE|pen1|pennext[21]~18_combout\ : std_logic;
SIGNAL \PE|pen2|next_var~37_combout\ : std_logic;
SIGNAL \PE|pen1|pennext[20]~16_combout\ : std_logic;
SIGNAL \PE|pen2|penout~23_combout\ : std_logic;
SIGNAL \PE|pen1|penout~15_combout\ : std_logic;
SIGNAL \PE|pen1|penout~17_combout\ : std_logic;
SIGNAL \PE|pen1|Equal0~1_combout\ : std_logic;
SIGNAL \PE|pen1|Equal0~2_combout\ : std_logic;
SIGNAL \PE|pen1|pennext[22]~19_combout\ : std_logic;
SIGNAL \PE|pen2|next_var~38_combout\ : std_logic;
SIGNAL \PE|pen1|pennext[21]~37_combout\ : std_logic;
SIGNAL \PE|pen1|pennext[23]~20_combout\ : std_logic;
SIGNAL \PE|pen2|next_var~39_combout\ : std_logic;
SIGNAL \PE|pen2|next_var~40_combout\ : std_logic;
SIGNAL \PE|pen1|pennext[2]~24_combout\ : std_logic;
SIGNAL \PE|pen2|penout~24_combout\ : std_logic;
SIGNAL \PE|pen2|Equal0~1_combout\ : std_logic;
SIGNAL \PE|pen1|pennext[24]~21_combout\ : std_logic;
SIGNAL \PE|pen1|pennext[24]~22_combout\ : std_logic;
SIGNAL \PE|pen2|next_var~49_combout\ : std_logic;
SIGNAL \PE|pen1|pennext[1]~23_combout\ : std_logic;
SIGNAL \PE|pen1|pennext[26]~25_combout\ : std_logic;
SIGNAL \PE|pen1|pennext[25]~26_combout\ : std_logic;
SIGNAL \PE|pen2|next_var~41_combout\ : std_logic;
SIGNAL \PE|pen1|pennext[26]~28_combout\ : std_logic;
SIGNAL \PE|pen1|pennext[26]~29_combout\ : std_logic;
SIGNAL \PE|pen2|penout~25_combout\ : std_logic;
SIGNAL \PE|pen2|next_var~42_combout\ : std_logic;
SIGNAL \PE|pen2|next_var~50_combout\ : std_logic;
SIGNAL \PE|pen1|pennext[27]~30_combout\ : std_logic;
SIGNAL \PE|pen1|pennext[27]~32_combout\ : std_logic;
SIGNAL \PE|pen2|next_var~43_combout\ : std_logic;
SIGNAL \PE|pen2|next_var~44_combout\ : std_logic;
SIGNAL \PE|pen2|penout~26_combout\ : std_logic;
SIGNAL \PE|pen2|Equal0~2_combout\ : std_logic;
SIGNAL \PE|pen1|pennext[28]~33_combout\ : std_logic;
SIGNAL \PE|pen2|next_var~45_combout\ : std_logic;
SIGNAL \PE|pen2|next_var~46_combout\ : std_logic;
SIGNAL \PE|pen2|next_var~51_combout\ : std_logic;
SIGNAL \PE|pen1|Equal0~4_combout\ : std_logic;
SIGNAL \PE|pen1|Equal0~3_combout\ : std_logic;
SIGNAL \PE|pen1|Equal0~5_combout\ : std_logic;
SIGNAL \PE|pen1|pennext[29]~34_combout\ : std_logic;
SIGNAL \PE|pen2|penout~27_combout\ : std_logic;
SIGNAL \PE|pen1|pennext[30]~36_combout\ : std_logic;
SIGNAL \PE|pen2|next_var~47_combout\ : std_logic;
SIGNAL \PE|pen2|next_var~52_combout\ : std_logic;
SIGNAL \PE|pen2|Equal0~3_combout\ : std_logic;
SIGNAL \PE|pen2|Equal0~4_combout\ : std_logic;
SIGNAL \PE|pen1|Equal0~6_combout\ : std_logic;
SIGNAL \PE|pen2|next_var~48_combout\ : std_logic;
SIGNAL \Ard1a~6_combout\ : std_logic;
SIGNAL \Ard1a~12_combout\ : std_logic;
SIGNAL \Ard1a~11_combout\ : std_logic;
SIGNAL \ra1_val_out~combout\ : std_logic;
SIGNAL \Ard1a~13_combout\ : std_logic;
SIGNAL \Ard1a~14_combout\ : std_logic;
SIGNAL \Ard1a~15_combout\ : std_logic;
SIGNAL \Ard1a~17_combout\ : std_logic;
SIGNAL \x1_op2~4_combout\ : std_logic;
SIGNAL \Ard1a~16_combout\ : std_logic;
SIGNAL \Ard1a~18_combout\ : std_logic;
SIGNAL \Z_tag_out_arf~0_combout\ : std_logic;
SIGNAL \Ard1a~19_combout\ : std_logic;
SIGNAL \Ard1a~20_combout\ : std_logic;
SIGNAL \Ard1a~21_combout\ : std_logic;
SIGNAL \Ard1a~22_combout\ : std_logic;
SIGNAL \Ard1a~28_combout\ : std_logic;
SIGNAL \Ard1a~24_combout\ : std_logic;
SIGNAL \Ard1a~25_combout\ : std_logic;
SIGNAL \Ard1a~26_combout\ : std_logic;
SIGNAL \Awr1~0_combout\ : std_logic;
SIGNAL \Ard1b~0_combout\ : std_logic;
SIGNAL \Ard1b~1_combout\ : std_logic;
SIGNAL \Ard1b~2_combout\ : std_logic;
SIGNAL \Ard1b~3_combout\ : std_logic;
SIGNAL \Ard2a~12_combout\ : std_logic;
SIGNAL \ra2_val_out~combout\ : std_logic;
SIGNAL \Ard2a~13_combout\ : std_logic;
SIGNAL \Z_2_tag_out_arf~0_combout\ : std_logic;
SIGNAL \Ard2a~10_combout\ : std_logic;
SIGNAL \Ard2a~14_combout\ : std_logic;
SIGNAL \Ard2a~15_combout\ : std_logic;
SIGNAL \x2_op2~6_combout\ : std_logic;
SIGNAL \Ard2a~16_combout\ : std_logic;
SIGNAL \Ard2a~18_combout\ : std_logic;
SIGNAL \Ard2a~19_combout\ : std_logic;
SIGNAL \Ard2a~11_combout\ : std_logic;
SIGNAL \Ard2a~20_combout\ : std_logic;
SIGNAL \Ard2a~21_combout\ : std_logic;
SIGNAL \Ard2a~23_combout\ : std_logic;
SIGNAL \Ard2a~22_combout\ : std_logic;
SIGNAL \Ard2a~27_combout\ : std_logic;
SIGNAL \Ard2a~24_combout\ : std_logic;
SIGNAL \Ard2a~25_combout\ : std_logic;
SIGNAL \Ard2a~26_combout\ : std_logic;
SIGNAL \Ard2b~0_combout\ : std_logic;
SIGNAL \Ard2b~1_combout\ : std_logic;
SIGNAL \Ard2b~2_combout\ : std_logic;
SIGNAL \Ard2b~3_combout\ : std_logic;
SIGNAL \Ard2b~4_combout\ : std_logic;
SIGNAL \Ard1a~8_combout\ : std_logic;
SIGNAL \Awr1~1_combout\ : std_logic;
SIGNAL \Awr1~2_combout\ : std_logic;
SIGNAL \Awr1~3_combout\ : std_logic;
SIGNAL \Awr1~4_combout\ : std_logic;
SIGNAL \Awr1~5_combout\ : std_logic;
SIGNAL \Ard1a~7_combout\ : std_logic;
SIGNAL \Awr1~7_combout\ : std_logic;
SIGNAL \Awr1~8_combout\ : std_logic;
SIGNAL \Awr1~6_combout\ : std_logic;
SIGNAL \Awr1~9_combout\ : std_logic;
SIGNAL \Awr1~10_combout\ : std_logic;
SIGNAL \Awr1~11_combout\ : std_logic;
SIGNAL \Awr1~12_combout\ : std_logic;
SIGNAL \Ard2a~8_combout\ : std_logic;
SIGNAL \Awr2~0_combout\ : std_logic;
SIGNAL \Awr2~2_combout\ : std_logic;
SIGNAL \Awr2~5_combout\ : std_logic;
SIGNAL \Awr2~4_combout\ : std_logic;
SIGNAL \Awr2~6_combout\ : std_logic;
SIGNAL \Awr2~3_combout\ : std_logic;
SIGNAL \Awr2~7_combout\ : std_logic;
SIGNAL \Awr2~8_combout\ : std_logic;
SIGNAL \Ard2a~17_combout\ : std_logic;
SIGNAL \Awr2~9_combout\ : std_logic;
SIGNAL \Awr2~10_combout\ : std_logic;
SIGNAL \Awr2~11_combout\ : std_logic;
SIGNAL \busy1~combout\ : std_logic;
SIGNAL \x1_op1~0_combout\ : std_logic;
SIGNAL \x1_op1~1_combout\ : std_logic;
SIGNAL \x1_op1~2_combout\ : std_logic;
SIGNAL \x1_op1~3_combout\ : std_logic;
SIGNAL \x1_op1~4_combout\ : std_logic;
SIGNAL \x1_op1~5_combout\ : std_logic;
SIGNAL \x1_op1~6_combout\ : std_logic;
SIGNAL \x1_op1~7_combout\ : std_logic;
SIGNAL \x1_op1~8_combout\ : std_logic;
SIGNAL \x1_op1~9_combout\ : std_logic;
SIGNAL \x1_op1~11_combout\ : std_logic;
SIGNAL \x1_op1~10_combout\ : std_logic;
SIGNAL \x1_op1~12_combout\ : std_logic;
SIGNAL \x1_op1~13_combout\ : std_logic;
SIGNAL \x1_op1~14_combout\ : std_logic;
SIGNAL \x1_op1~15_combout\ : std_logic;
SIGNAL \x1_op1~17_combout\ : std_logic;
SIGNAL \x1_op1~16_combout\ : std_logic;
SIGNAL \x1_op1~18_combout\ : std_logic;
SIGNAL \x1_op1~19_combout\ : std_logic;
SIGNAL \x1_op1~20_combout\ : std_logic;
SIGNAL \x1_op1~21_combout\ : std_logic;
SIGNAL \x1_op1~22_combout\ : std_logic;
SIGNAL \x1_op1~23_combout\ : std_logic;
SIGNAL \x1_op1~24_combout\ : std_logic;
SIGNAL \x1_op1~25_combout\ : std_logic;
SIGNAL \x1_op1~26_combout\ : std_logic;
SIGNAL \Awr1~13_combout\ : std_logic;
SIGNAL \x1_op2~6_combout\ : std_logic;
SIGNAL \x1_op2~7_combout\ : std_logic;
SIGNAL \busy2~combout\ : std_logic;
SIGNAL \x1_op2~9_combout\ : std_logic;
SIGNAL \x1_op2~63_combout\ : std_logic;
SIGNAL \x1_op2~10_combout\ : std_logic;
SIGNAL \x1_op2~12_combout\ : std_logic;
SIGNAL \x1_op2~11_combout\ : std_logic;
SIGNAL \x1_op2~13_combout\ : std_logic;
SIGNAL \x1_op2~14_combout\ : std_logic;
SIGNAL \x1_op2~15_combout\ : std_logic;
SIGNAL \x1_op2~16_combout\ : std_logic;
SIGNAL \x1_op2~17_combout\ : std_logic;
SIGNAL \x1_op2~18_combout\ : std_logic;
SIGNAL \x1_op2~19_combout\ : std_logic;
SIGNAL \x1_op2~20_combout\ : std_logic;
SIGNAL \x1_op2~21_combout\ : std_logic;
SIGNAL \x1_op2~22_combout\ : std_logic;
SIGNAL \x1_op2~23_combout\ : std_logic;
SIGNAL \x1_op2~27_combout\ : std_logic;
SIGNAL \x1_op2~28_combout\ : std_logic;
SIGNAL \x1_op2~24_combout\ : std_logic;
SIGNAL \x1_op2~30_combout\ : std_logic;
SIGNAL \x1_op2~5_combout\ : std_logic;
SIGNAL \x1_op2~26_combout\ : std_logic;
SIGNAL \x1_op2~31_combout\ : std_logic;
SIGNAL \x1_op2~32_combout\ : std_logic;
SIGNAL \x1_op1~27_combout\ : std_logic;
SIGNAL \x1_op2~34_combout\ : std_logic;
SIGNAL \x1_op2~35_combout\ : std_logic;
SIGNAL \x1_op2~36_combout\ : std_logic;
SIGNAL \x1_op2~37_combout\ : std_logic;
SIGNAL \x1_op2~38_combout\ : std_logic;
SIGNAL \x1_op2~39_combout\ : std_logic;
SIGNAL \x1_op2~40_combout\ : std_logic;
SIGNAL \x1_op2~41_combout\ : std_logic;
SIGNAL \x1_op2~42_combout\ : std_logic;
SIGNAL \x1_op2~43_combout\ : std_logic;
SIGNAL \x1_op2~44_combout\ : std_logic;
SIGNAL \x1_op2~45_combout\ : std_logic;
SIGNAL \x1_op2~46_combout\ : std_logic;
SIGNAL \x1_op2~47_combout\ : std_logic;
SIGNAL \x1_op2~48_combout\ : std_logic;
SIGNAL \x1_op2~49_combout\ : std_logic;
SIGNAL \x1_op2~50_combout\ : std_logic;
SIGNAL \x1_op2~51_combout\ : std_logic;
SIGNAL \x1_op2~52_combout\ : std_logic;
SIGNAL \x1_op2~53_combout\ : std_logic;
SIGNAL \x1_op2~54_combout\ : std_logic;
SIGNAL \x1_op2~55_combout\ : std_logic;
SIGNAL \x1_op2~56_combout\ : std_logic;
SIGNAL \x1_op2~57_combout\ : std_logic;
SIGNAL \x1_op2~58_combout\ : std_logic;
SIGNAL \x1_op2~59_combout\ : std_logic;
SIGNAL \x1_op2~60_combout\ : std_logic;
SIGNAL \x1_op2~61_combout\ : std_logic;
SIGNAL \x1_op2~62_combout\ : std_logic;
SIGNAL \busy3~combout\ : std_logic;
SIGNAL \x2_op1~0_combout\ : std_logic;
SIGNAL \x2_op1~1_combout\ : std_logic;
SIGNAL \x2_op1~2_combout\ : std_logic;
SIGNAL \x2_op1~3_combout\ : std_logic;
SIGNAL \x2_op1~4_combout\ : std_logic;
SIGNAL \x2_op1~5_combout\ : std_logic;
SIGNAL \x2_op1~6_combout\ : std_logic;
SIGNAL \x2_op1~7_combout\ : std_logic;
SIGNAL \x2_op1~8_combout\ : std_logic;
SIGNAL \x2_op1~9_combout\ : std_logic;
SIGNAL \x2_op1~11_combout\ : std_logic;
SIGNAL \x2_op1~10_combout\ : std_logic;
SIGNAL \x2_op1~12_combout\ : std_logic;
SIGNAL \x2_op1~13_combout\ : std_logic;
SIGNAL \x2_op1~14_combout\ : std_logic;
SIGNAL \x2_op1~15_combout\ : std_logic;
SIGNAL \x2_op1~17_combout\ : std_logic;
SIGNAL \x2_op1~16_combout\ : std_logic;
SIGNAL \x2_op1~18_combout\ : std_logic;
SIGNAL \x2_op1~19_combout\ : std_logic;
SIGNAL \x2_op1~20_combout\ : std_logic;
SIGNAL \x2_op1~21_combout\ : std_logic;
SIGNAL \x2_op1~22_combout\ : std_logic;
SIGNAL \x2_op1~23_combout\ : std_logic;
SIGNAL \x2_op1~24_combout\ : std_logic;
SIGNAL \x2_op1~25_combout\ : std_logic;
SIGNAL \x2_op1~26_combout\ : std_logic;
SIGNAL \x2_op2~65_combout\ : std_logic;
SIGNAL \x2_op2~9_combout\ : std_logic;
SIGNAL \busy4~combout\ : std_logic;
SIGNAL \x2_op2~8_combout\ : std_logic;
SIGNAL \x2_op2~11_combout\ : std_logic;
SIGNAL \x2_op2~12_combout\ : std_logic;
SIGNAL \x2_op2~13_combout\ : std_logic;
SIGNAL \x2_op2~14_combout\ : std_logic;
SIGNAL \x2_op2~15_combout\ : std_logic;
SIGNAL \x2_op2~16_combout\ : std_logic;
SIGNAL \x2_op2~18_combout\ : std_logic;
SIGNAL \x2_op2~17_combout\ : std_logic;
SIGNAL \x2_op2~19_combout\ : std_logic;
SIGNAL \x2_op2~21_combout\ : std_logic;
SIGNAL \x2_op2~20_combout\ : std_logic;
SIGNAL \x2_op2~66_combout\ : std_logic;
SIGNAL \x2_op2~22_combout\ : std_logic;
SIGNAL \x2_op2~23_combout\ : std_logic;
SIGNAL \x2_op2~24_combout\ : std_logic;
SIGNAL \x2_op2~25_combout\ : std_logic;
SIGNAL \x2_op2~26_combout\ : std_logic;
SIGNAL \Ard2a~6_combout\ : std_logic;
SIGNAL \x2_op2~30_combout\ : std_logic;
SIGNAL \x2_op2~27_combout\ : std_logic;
SIGNAL \x2_op2~32_combout\ : std_logic;
SIGNAL \x2_op1~27_combout\ : std_logic;
SIGNAL \x2_op2~33_combout\ : std_logic;
SIGNAL \x2_op2~34_combout\ : std_logic;
SIGNAL \x2_op2~29_combout\ : std_logic;
SIGNAL \x2_op2~35_combout\ : std_logic;
SIGNAL \x2_op2~36_combout\ : std_logic;
SIGNAL \x2_op2~37_combout\ : std_logic;
SIGNAL \x2_op2~38_combout\ : std_logic;
SIGNAL \x2_op2~39_combout\ : std_logic;
SIGNAL \x2_op2~40_combout\ : std_logic;
SIGNAL \x2_op2~42_combout\ : std_logic;
SIGNAL \x2_op2~43_combout\ : std_logic;
SIGNAL \x2_op2~44_combout\ : std_logic;
SIGNAL \x2_op2~45_combout\ : std_logic;
SIGNAL \x2_op2~46_combout\ : std_logic;
SIGNAL \x2_op2~47_combout\ : std_logic;
SIGNAL \x2_op2~48_combout\ : std_logic;
SIGNAL \x2_op2~49_combout\ : std_logic;
SIGNAL \x2_op2~51_combout\ : std_logic;
SIGNAL \x2_op2~52_combout\ : std_logic;
SIGNAL \x2_op2~54_combout\ : std_logic;
SIGNAL \x2_op2~55_combout\ : std_logic;
SIGNAL \x2_op2~31_combout\ : std_logic;
SIGNAL \x2_op2~56_combout\ : std_logic;
SIGNAL \x2_op2~57_combout\ : std_logic;
SIGNAL \x2_op2~58_combout\ : std_logic;
SIGNAL \x2_op2~59_combout\ : std_logic;
SIGNAL \x2_op2~60_combout\ : std_logic;
SIGNAL \x2_op2~61_combout\ : std_logic;
SIGNAL \x2_op2~62_combout\ : std_logic;
SIGNAL \x2_op2~63_combout\ : std_logic;
SIGNAL \x2_op2~64_combout\ : std_logic;
SIGNAL \x1_op1_ready~0_combout\ : std_logic;
SIGNAL \x1_op1_ready~1_combout\ : std_logic;
SIGNAL \x1_op2_ready~1_combout\ : std_logic;
SIGNAL \x1_op2_ready~2_combout\ : std_logic;
SIGNAL \x1_op2_ready~0_combout\ : std_logic;
SIGNAL \x1_op2_ready~3_combout\ : std_logic;
SIGNAL \x2_op1_ready~0_combout\ : std_logic;
SIGNAL \x2_op1_ready~1_combout\ : std_logic;
SIGNAL \x2_op2_ready~1_combout\ : std_logic;
SIGNAL \x2_op2_ready~2_combout\ : std_logic;
SIGNAL \x2_op2_ready~0_combout\ : std_logic;
SIGNAL \x2_op2_ready~3_combout\ : std_logic;
SIGNAL \PE|pen2|Equal0~5_combout\ : std_logic;
SIGNAL \PE|twoRRnotFree~combout\ : std_logic;
SIGNAL \not_taken_branch_detected~combout\ : std_logic;
SIGNAL \taken_branch_detected~combout\ : std_logic;
SIGNAL \spec_tag_rs_out1~2_combout\ : std_logic;
SIGNAL \SPEC_TAG_REG|dout[0]~1_combout\ : std_logic;
SIGNAL \reset~combout\ : std_logic;
SIGNAL \reset~clkctrl_outclk\ : std_logic;
SIGNAL \Equal14~0_combout\ : std_logic;
SIGNAL \process_0~4_combout\ : std_logic;
SIGNAL \Equal0~8_combout\ : std_logic;
SIGNAL \process_0~6_combout\ : std_logic;
SIGNAL \x2_val_var~1_combout\ : std_logic;
SIGNAL \Equal0~4_combout\ : std_logic;
SIGNAL \Equal0~3_combout\ : std_logic;
SIGNAL \x2_val_var~0_combout\ : std_logic;
SIGNAL \x2_val_var~2_combout\ : std_logic;
SIGNAL \spec_tag_rs_out2~1_combout\ : std_logic;
SIGNAL \spec_tag_reg_en~0_combout\ : std_logic;
SIGNAL \spec_tag_reg_en~1_combout\ : std_logic;
SIGNAL \process_0~2_combout\ : std_logic;
SIGNAL \Equal0~0_combout\ : std_logic;
SIGNAL \x1_val~0_combout\ : std_logic;
SIGNAL \x1_val~2_combout\ : std_logic;
SIGNAL \x1_val~3_combout\ : std_logic;
SIGNAL \process_0~7_combout\ : std_logic;
SIGNAL \process_0~10_combout\ : std_logic;
SIGNAL \pc_en_out~1_combout\ : std_logic;
SIGNAL \x1_val~5_combout\ : std_logic;
SIGNAL \x2_val~0_combout\ : std_logic;
SIGNAL \Equal0~6_combout\ : std_logic;
SIGNAL \Equal0~7_combout\ : std_logic;
SIGNAL \C_tag_out_rs~0_combout\ : std_logic;
SIGNAL \C_busybit_in~combout\ : std_logic;
SIGNAL \C_in~combout\ : std_logic;
SIGNAL \C_out~0_combout\ : std_logic;
SIGNAL \C_out~1_combout\ : std_logic;
SIGNAL \Z_busybit_in~combout\ : std_logic;
SIGNAL \Equal0~1_combout\ : std_logic;
SIGNAL \Z_ready~0_combout\ : std_logic;
SIGNAL \Z_ready~1_combout\ : std_logic;
SIGNAL \Z_in~combout\ : std_logic;
SIGNAL \Z_out~0_combout\ : std_logic;
SIGNAL \C_ready~0_combout\ : std_logic;
SIGNAL \Z_ready~2_combout\ : std_logic;
SIGNAL \x1_add~0_combout\ : std_logic;
SIGNAL \x1_adi~combout\ : std_logic;
SIGNAL \C_wr~0_combout\ : std_logic;
SIGNAL \Equal0~2_combout\ : std_logic;
SIGNAL \Z_wr~0_combout\ : std_logic;
SIGNAL \process_0~5_combout\ : std_logic;
SIGNAL \Z_wr~1_combout\ : std_logic;
SIGNAL \Equal14~2_combout\ : std_logic;
SIGNAL \Equal14~1_combout\ : std_logic;
SIGNAL \C_2_tag_out_rs~0_combout\ : std_logic;
SIGNAL \x2_adc~0_combout\ : std_logic;
SIGNAL \C_2_out~0_combout\ : std_logic;
SIGNAL \C_2_ready~0_combout\ : std_logic;
SIGNAL \C_2_wr~3_combout\ : std_logic;
SIGNAL \x2_ndz~0_combout\ : std_logic;
SIGNAL \Equal14~3_combout\ : std_logic;
SIGNAL \x2_adi~0_combout\ : std_logic;
SIGNAL \C_2_wr~2_combout\ : std_logic;
SIGNAL \Z_2_ready~0_combout\ : std_logic;
SIGNAL \Z_2_out~0_combout\ : std_logic;
SIGNAL \Z_2_ready~1_combout\ : std_logic;
SIGNAL \Equal14~4_combout\ : std_logic;
SIGNAL \Z_2_wr~0_combout\ : std_logic;
SIGNAL \Equal14~5_combout\ : std_logic;
SIGNAL \Z_2_wr~1_combout\ : std_logic;
SIGNAL \x1_val~1_combout\ : std_logic;
SIGNAL \spec_tag_rs_out1~9_combout\ : std_logic;
SIGNAL \spec_tag_reg_in~6_combout\ : std_logic;
SIGNAL \spec_tag_reg_in~7_combout\ : std_logic;
SIGNAL \spec_tag_rs_out1~10_combout\ : std_logic;
SIGNAL \spec_tag_rs_out1~11_combout\ : std_logic;
SIGNAL \spec_tag_rs_out1~12_combout\ : std_logic;
SIGNAL \spec_tag_rs_out1~7_combout\ : std_logic;
SIGNAL \spec_tag_rs_out1~13_combout\ : std_logic;
SIGNAL \spec_tag_reg_in~8_combout\ : std_logic;
SIGNAL \spec_tag_reg_in~9_combout\ : std_logic;
SIGNAL \SPEC_TAG_REG|dout[1]~0_combout\ : std_logic;
SIGNAL \spec_tag_rs_out1~3_combout\ : std_logic;
SIGNAL \spec_tag_rs_out1~5_combout\ : std_logic;
SIGNAL \spec_tag_rs_out1~6_combout\ : std_logic;
SIGNAL \spec_tag_rs_out1~8_combout\ : std_logic;
SIGNAL \spec_tag_rs_out2~3_combout\ : std_logic;
SIGNAL \x1_val~4_combout\ : std_logic;
SIGNAL \spec_tag_rs_out2~2_combout\ : std_logic;
SIGNAL \spec_tag_rs_out2~4_combout\ : std_logic;
SIGNAL \spec_tag_rs_out1~4_combout\ : std_logic;
SIGNAL \spec_tag_rs_out2~5_combout\ : std_logic;
SIGNAL \spec_tag_rs_out2~6_combout\ : std_logic;
SIGNAL \spec_tag_rs_out2~8_combout\ : std_logic;
SIGNAL \spec_tag_rs_out2~9_combout\ : std_logic;
SIGNAL \Equal0~9_combout\ : std_logic;
SIGNAL \STORE_TAG_REG|dout[1]~17_combout\ : std_logic;
SIGNAL \Equal14~7_combout\ : std_logic;
SIGNAL \store_tag_reg_en~2_combout\ : std_logic;
SIGNAL \store_tag_reg_en~3_combout\ : std_logic;
SIGNAL \store_tag_reg_in~5_combout\ : std_logic;
SIGNAL \store_tag_reg_in~4_combout\ : std_logic;
SIGNAL \STORE_TAG_REG|dout[0]~10_combout\ : std_logic;
SIGNAL \STORE_TAG_REG|dout[0]~11_combout\ : std_logic;
SIGNAL \STORE_TAG_REG|dout[0]~12_combout\ : std_logic;
SIGNAL \STORE_TAG_REG|dout[0]~14_combout\ : std_logic;
SIGNAL \store_tag_reg_in~6_combout\ : std_logic;
SIGNAL \store_tag_reg_in~7_combout\ : std_logic;
SIGNAL \store_tag_reg_in~9_combout\ : std_logic;
SIGNAL \store_tag_reg_in~11_combout\ : std_logic;
SIGNAL \store_tag_reg_in~12_combout\ : std_logic;
SIGNAL \store_tag_reg_in~13_combout\ : std_logic;
SIGNAL \STORE_TAG_REG|dout[1]~19_combout\ : std_logic;
SIGNAL \store_tag_reg_in~25_combout\ : std_logic;
SIGNAL \store_tag_reg_in~26_combout\ : std_logic;
SIGNAL \store_tag_reg_in~24_combout\ : std_logic;
SIGNAL \STORE_TAG_REG|dout[1]~15_combout\ : std_logic;
SIGNAL \STORE_TAG_REG|dout[0]~13_combout\ : std_logic;
SIGNAL \STORE_TAG_REG|dout[1]~16_combout\ : std_logic;
SIGNAL \store_tag_reg_in~8_combout\ : std_logic;
SIGNAL \STORE_TAG_REG|dout[1]~0_combout\ : std_logic;
SIGNAL \STORE_TAG_INC|ist_add:2:F1|s0~combout\ : std_logic;
SIGNAL \STORE_TAG_DEC2|ist_add:2:F1|s0~combout\ : std_logic;
SIGNAL \store_tag_reg_in~27_combout\ : std_logic;
SIGNAL \store_tag_reg_in~28_combout\ : std_logic;
SIGNAL \store_tag_reg_in~16_combout\ : std_logic;
SIGNAL \store_tag_reg_in~33_combout\ : std_logic;
SIGNAL \STORE_TAG_DEC|ist_add:2:F1|s0~combout\ : std_logic;
SIGNAL \store_tag_reg_in~14_combout\ : std_logic;
SIGNAL \store_tag_reg_in~17_combout\ : std_logic;
SIGNAL \STORE_TAG_REG|dout[2]~1_combout\ : std_logic;
SIGNAL \store_tag_reg_in~19_combout\ : std_logic;
SIGNAL \store_tag_reg_in~34_combout\ : std_logic;
SIGNAL \STORE_TAG_INC|ist_add:3:F1|s0~combout\ : std_logic;
SIGNAL \STORE_TAG_INC2|ist_add:3:F1|s0~combout\ : std_logic;
SIGNAL \store_tag_reg_in~29_combout\ : std_logic;
SIGNAL \store_tag_reg_in~30_combout\ : std_logic;
SIGNAL \STORE_TAG_INC|ist_add:2:F1|cout~0_combout\ : std_logic;
SIGNAL \store_tag_reg_in~18_combout\ : std_logic;
SIGNAL \store_tag_reg_in~20_combout\ : std_logic;
SIGNAL \STORE_TAG_REG|dout[3]~2_combout\ : std_logic;
SIGNAL \STORE_TAG_INC2|ist_add:4:F1|s0~combout\ : std_logic;
SIGNAL \store_tag_reg_in~31_combout\ : std_logic;
SIGNAL \store_tag_reg_in~10_combout\ : std_logic;
SIGNAL \STORE_TAG_INC|ist_add:4:F1|s0~combout\ : std_logic;
SIGNAL \STORE_TAG_DEC|ist_add:3:F1|cout~combout\ : std_logic;
SIGNAL \STORE_TAG_DEC|ist_add:4:F1|s0~combout\ : std_logic;
SIGNAL \store_tag_reg_in~21_combout\ : std_logic;
SIGNAL \store_tag_reg_in~23_combout\ : std_logic;
SIGNAL \store_tag_reg_in~32_combout\ : std_logic;
SIGNAL \store_tag_reg_in~22_combout\ : std_logic;
SIGNAL \STORE_TAG_REG|dout[4]~3_combout\ : std_logic;
SIGNAL \C_busybit_out~2_combout\ : std_logic;
SIGNAL \C_busybit_out~3_combout\ : std_logic;
SIGNAL \Z_busybit_out~0_combout\ : std_logic;
SIGNAL \Z_busybit_out~1_combout\ : std_logic;
SIGNAL \Z_busybit_out~2_combout\ : std_logic;
SIGNAL \Z_busybit_out~3_combout\ : std_logic;
SIGNAL \C_2_busybit_out~0_combout\ : std_logic;
SIGNAL \C_2_busybit_out~1_combout\ : std_logic;
SIGNAL \Z_2_busybit_out~1_combout\ : std_logic;
SIGNAL \Z_2_busybit_out~2_combout\ : std_logic;
SIGNAL \Z_2_busybit_out~0_combout\ : std_logic;
SIGNAL \Z_2_busybit_out~3_combout\ : std_logic;
SIGNAL \PE|pen1|penout~27_combout\ : std_logic;
SIGNAL \PE|pen1|penout[0]~28_combout\ : std_logic;
SIGNAL \PE|pen1|penout[0]~29_combout\ : std_logic;
SIGNAL \C_tag_out_arf~0_combout\ : std_logic;
SIGNAL \PE|pen1|penout~31_combout\ : std_logic;
SIGNAL \PE|pen1|penout~32_combout\ : std_logic;
SIGNAL \PE|pen1|penout~33_combout\ : std_logic;
SIGNAL \PE|pen1|penout~34_combout\ : std_logic;
SIGNAL \PE|pen1|penout~35_combout\ : std_logic;
SIGNAL \PE|pen1|penout[1]~45_combout\ : std_logic;
SIGNAL \PE|pen1|penout[1]~36_combout\ : std_logic;
SIGNAL \C_tag_out_arf~1_combout\ : std_logic;
SIGNAL \PE|pen1|penout[2]~37_combout\ : std_logic;
SIGNAL \PE|pen1|penout~39_combout\ : std_logic;
SIGNAL \PE|pen1|penout~38_combout\ : std_logic;
SIGNAL \PE|pen1|penout~40_combout\ : std_logic;
SIGNAL \PE|pen1|penout[2]~41_combout\ : std_logic;
SIGNAL \C_tag_out_arf~2_combout\ : std_logic;
SIGNAL \PE|pen1|penout~10_combout\ : std_logic;
SIGNAL \PE|pen1|penout~42_combout\ : std_logic;
SIGNAL \PE|pen1|penout[3]~43_combout\ : std_logic;
SIGNAL \C_tag_out_arf~3_combout\ : std_logic;
SIGNAL \C_tag_out_arf~4_combout\ : std_logic;
SIGNAL \Z_tag_out_arf~2_combout\ : std_logic;
SIGNAL \Z_tag_out_arf~3_combout\ : std_logic;
SIGNAL \Z_tag_out_arf~4_combout\ : std_logic;
SIGNAL \Z_tag_out_arf~5_combout\ : std_logic;
SIGNAL \Z_tag_out_arf~6_combout\ : std_logic;
SIGNAL \Z_tag_out_arf~7_combout\ : std_logic;
SIGNAL \PE|pen2|penout~60_combout\ : std_logic;
SIGNAL \C_2_tag_out_arf~0_combout\ : std_logic;
SIGNAL \PE|pen2|penout~45_combout\ : std_logic;
SIGNAL \PE|pen2|penout~49_combout\ : std_logic;
SIGNAL \PE|pen2|penout~50_combout\ : std_logic;
SIGNAL \PE|pen2|penout~51_combout\ : std_logic;
SIGNAL \C_2_tag_out_arf~1_combout\ : std_logic;
SIGNAL \PE|pen2|penout~52_combout\ : std_logic;
SIGNAL \PE|pen2|penout~58_combout\ : std_logic;
SIGNAL \PE|pen2|penout~21_combout\ : std_logic;
SIGNAL \PE|pen2|penout~53_combout\ : std_logic;
SIGNAL \PE|pen2|penout~55_combout\ : std_logic;
SIGNAL \C_2_tag_out_arf~2_combout\ : std_logic;
SIGNAL \C_2_tag_out_arf~3_combout\ : std_logic;
SIGNAL \PE|pen2|penout~54_combout\ : std_logic;
SIGNAL \PE|pen2|penout~56_combout\ : std_logic;
SIGNAL \C_2_tag_out_arf~4_combout\ : std_logic;
SIGNAL \C_2_tag_out_arf~5_combout\ : std_logic;
SIGNAL \Z_2_tag_out_arf~1_combout\ : std_logic;
SIGNAL \Z_2_tag_out_arf~2_combout\ : std_logic;
SIGNAL \Z_2_tag_out_arf~3_combout\ : std_logic;
SIGNAL \Z_2_tag_out_arf~4_combout\ : std_logic;
SIGNAL \Z_2_tag_out_arf~5_combout\ : std_logic;
SIGNAL \Z_2_tag_out_arf~6_combout\ : std_logic;
SIGNAL \Z_2_tag_out_arf~7_combout\ : std_logic;
SIGNAL \busy_dest1_out~0_combout\ : std_logic;
SIGNAL \busy_dest1_in~combout\ : std_logic;
SIGNAL \busy_dest1_out~1_combout\ : std_logic;
SIGNAL \busy_dest2_in~combout\ : std_logic;
SIGNAL \busy_dest2_out~0_combout\ : std_logic;
SIGNAL \busy_dest2_out~1_combout\ : std_logic;
SIGNAL \dest_AR_tag_out~10_combout\ : std_logic;
SIGNAL \dest_AR_tag_out~11_combout\ : std_logic;
SIGNAL \dest_AR_tag_out~12_combout\ : std_logic;
SIGNAL \dest_AR_tag_out~13_combout\ : std_logic;
SIGNAL \dest_AR_tag_out~14_combout\ : std_logic;
SIGNAL \dest_AR_tag_out~15_combout\ : std_logic;
SIGNAL \dest_AR_tag_2_out~10_combout\ : std_logic;
SIGNAL \dest_AR_tag_2_out~11_combout\ : std_logic;
SIGNAL \dest_AR_tag_2_out~12_combout\ : std_logic;
SIGNAL \dest_AR_tag_2_out~13_combout\ : std_logic;
SIGNAL \dest_AR_tag_2_out~14_combout\ : std_logic;
SIGNAL \dest_AR_tag_2_out~15_combout\ : std_logic;
SIGNAL \C_tag_out_rs~1_combout\ : std_logic;
SIGNAL \C_tag_out_rs~2_combout\ : std_logic;
SIGNAL \C_tag_out_rs~3_combout\ : std_logic;
SIGNAL \C_tag_out_rs~4_combout\ : std_logic;
SIGNAL \C_tag_out_rs~5_combout\ : std_logic;
SIGNAL \Z_tag_out_rs~0_combout\ : std_logic;
SIGNAL \Z_tag_out_rs~1_combout\ : std_logic;
SIGNAL \Z_tag_out_rs~2_combout\ : std_logic;
SIGNAL \Z_tag_out_rs~3_combout\ : std_logic;
SIGNAL \Z_tag_out_rs~4_combout\ : std_logic;
SIGNAL \C_2_tag_out_rs~1_combout\ : std_logic;
SIGNAL \C_2_tag_out_rs~2_combout\ : std_logic;
SIGNAL \C_2_tag_out_rs~3_combout\ : std_logic;
SIGNAL \C_2_tag_out_rs~4_combout\ : std_logic;
SIGNAL \C_2_tag_out_rs~5_combout\ : std_logic;
SIGNAL \Z_2_tag_out_rs~0_combout\ : std_logic;
SIGNAL \Z_2_tag_out_rs~1_combout\ : std_logic;
SIGNAL \Z_2_tag_out_rs~2_combout\ : std_logic;
SIGNAL \Z_2_tag_out_rs~3_combout\ : std_logic;
SIGNAL \Z_2_tag_out_rs~4_combout\ : std_logic;
SIGNAL \jlr_resolved~combout\ : std_logic;
SIGNAL \lw_r7_resolved~combout\ : std_logic;
SIGNAL \process_0~8_combout\ : std_logic;
SIGNAL \ra1_invalidate_out~4_combout\ : std_logic;
SIGNAL \ra1_invalidate_out~6_combout\ : std_logic;
SIGNAL \process_0~9_combout\ : std_logic;
SIGNAL \ra1_invalidate_out~3_combout\ : std_logic;
SIGNAL \ra1_invalidate_out~7_combout\ : std_logic;
SIGNAL \ra1_invalidate_out~9_combout\ : std_logic;
SIGNAL \ra1_invalidate_out~10_combout\ : std_logic;
SIGNAL \lm_stall_in~combout\ : std_logic;
SIGNAL \rs_full_in~combout\ : std_logic;
SIGNAL \pc_en_out~2_combout\ : std_logic;
SIGNAL \pc_en_out~3_combout\ : std_logic;
SIGNAL \ADDER2|F0|s0~0_combout\ : std_logic;
SIGNAL \ADDER2|ist_add:1:F1|s0~0_combout\ : std_logic;
SIGNAL \ADDER2|ist_add:1:F1|cout~0_combout\ : std_logic;
SIGNAL \ADDER2|ist_add:2:F1|s0~0_combout\ : std_logic;
SIGNAL \ADDER2|ist_add:2:F1|cout~0_combout\ : std_logic;
SIGNAL \ADDER2|ist_add:3:F1|s0~combout\ : std_logic;
SIGNAL \ADDER2|ist_add:3:F1|cout~0_combout\ : std_logic;
SIGNAL \ADDER2|ist_add:4:F1|s0~combout\ : std_logic;
SIGNAL \ADDER2|ist_add:4:F1|cout~0_combout\ : std_logic;
SIGNAL \ADDER2|ist_add:5:F1|s0~combout\ : std_logic;
SIGNAL \ADDER2|ist_add:5:F1|cout~0_combout\ : std_logic;
SIGNAL \ADDER2|ist_add:6:F1|s0~combout\ : std_logic;
SIGNAL \ADDER2|ist_add:6:F1|cout~0_combout\ : std_logic;
SIGNAL \ADDER2|ist_add:7:F1|s0~combout\ : std_logic;
SIGNAL \ADDER2|ist_add:7:F1|cout~0_combout\ : std_logic;
SIGNAL \ADDER2|ist_add:8:F1|s0~combout\ : std_logic;
SIGNAL \ADDER2|ist_add:9:F1|s0~combout\ : std_logic;
SIGNAL \ADDER2|ist_add:9:F1|cout~0_combout\ : std_logic;
SIGNAL \ADDER2|ist_add:10:F1|s0~0_combout\ : std_logic;
SIGNAL \ADDER2|ist_add:8:F1|cout~0_combout\ : std_logic;
SIGNAL \ADDER2|ist_add:10:F1|cout~0_combout\ : std_logic;
SIGNAL \ADDER2|ist_add:11:F1|s0~0_combout\ : std_logic;
SIGNAL \ADDER2|ist_add:11:F1|cout~0_combout\ : std_logic;
SIGNAL \ADDER2|ist_add:12:F1|s0~0_combout\ : std_logic;
SIGNAL \ADDER2|ist_add:12:F1|cout~0_combout\ : std_logic;
SIGNAL \ADDER2|ist_add:13:F1|s0~0_combout\ : std_logic;
SIGNAL \ADDER2|ist_add:13:F1|cout~0_combout\ : std_logic;
SIGNAL \ADDER2|ist_add:14:F1|s0~0_combout\ : std_logic;
SIGNAL \ADDER2|ist_add:14:F1|cout~0_combout\ : std_logic;
SIGNAL \ADDER2|ist_add:15:F1|s0~0_combout\ : std_logic;
SIGNAL \ADDER3|F0|s0~0_combout\ : std_logic;
SIGNAL \ADDER3|ist_add:1:F1|s0~0_combout\ : std_logic;
SIGNAL \ADDER3|ist_add:1:F1|cout~0_combout\ : std_logic;
SIGNAL \ADDER3|ist_add:2:F1|s0~0_combout\ : std_logic;
SIGNAL \ADDER3|ist_add:2:F1|cout~0_combout\ : std_logic;
SIGNAL \ADDER3|ist_add:3:F1|s0~combout\ : std_logic;
SIGNAL \ADDER3|ist_add:3:F1|cout~0_combout\ : std_logic;
SIGNAL \ADDER3|ist_add:4:F1|s0~combout\ : std_logic;
SIGNAL \ADDER3|ist_add:4:F1|cout~0_combout\ : std_logic;
SIGNAL \ADDER3|ist_add:5:F1|s0~combout\ : std_logic;
SIGNAL \ADDER3|ist_add:5:F1|cout~0_combout\ : std_logic;
SIGNAL \ADDER3|ist_add:6:F1|s0~combout\ : std_logic;
SIGNAL \ADDER3|ist_add:6:F1|cout~0_combout\ : std_logic;
SIGNAL \ADDER3|ist_add:7:F1|s0~combout\ : std_logic;
SIGNAL \ADDER3|ist_add:7:F1|cout~0_combout\ : std_logic;
SIGNAL \ADDER3|ist_add:8:F1|s0~combout\ : std_logic;
SIGNAL \ADDER3|ist_add:9:F1|s0~combout\ : std_logic;
SIGNAL \ADDER3|ist_add:9:F1|cout~0_combout\ : std_logic;
SIGNAL \ADDER3|ist_add:10:F1|s0~0_combout\ : std_logic;
SIGNAL \ADDER3|ist_add:8:F1|cout~0_combout\ : std_logic;
SIGNAL \ADDER3|ist_add:10:F1|cout~0_combout\ : std_logic;
SIGNAL \ADDER3|ist_add:11:F1|s0~0_combout\ : std_logic;
SIGNAL \ADDER3|ist_add:11:F1|cout~0_combout\ : std_logic;
SIGNAL \ADDER3|ist_add:12:F1|s0~0_combout\ : std_logic;
SIGNAL \ADDER3|ist_add:12:F1|cout~0_combout\ : std_logic;
SIGNAL \ADDER3|ist_add:13:F1|s0~0_combout\ : std_logic;
SIGNAL \ADDER3|ist_add:13:F1|cout~0_combout\ : std_logic;
SIGNAL \ADDER3|ist_add:14:F1|s0~0_combout\ : std_logic;
SIGNAL \ADDER3|ist_add:14:F1|cout~0_combout\ : std_logic;
SIGNAL \ADDER3|ist_add:15:F1|s0~0_combout\ : std_logic;
SIGNAL \S0~1_combout\ : std_logic;
SIGNAL \alu_r7_resolved~combout\ : std_logic;
SIGNAL \S0~2_combout\ : std_logic;
SIGNAL \S0~0_combout\ : std_logic;
SIGNAL \S0~3_combout\ : std_logic;
SIGNAL \Equal14~6_combout\ : std_logic;
SIGNAL \S2~0_combout\ : std_logic;
SIGNAL \S1~0_combout\ : std_logic;
SIGNAL \S1~1_combout\ : std_logic;
SIGNAL \S2~1_combout\ : std_logic;
SIGNAL \S2~2_combout\ : std_logic;
SIGNAL \S3~0_combout\ : std_logic;
SIGNAL \SPEC_TAG_REG|dout\ : std_logic_vector(1 DOWNTO 0);
SIGNAL \STORE_TAG_REG|dout\ : std_logic_vector(4 DOWNTO 0);
SIGNAL \tag_dest2_in~combout\ : std_logic_vector(4 DOWNTO 0);
SIGNAL \tag_dest1_in~combout\ : std_logic_vector(4 DOWNTO 0);
SIGNAL \tag4~combout\ : std_logic_vector(4 DOWNTO 0);
SIGNAL \tag3~combout\ : std_logic_vector(4 DOWNTO 0);
SIGNAL \tag2~combout\ : std_logic_vector(4 DOWNTO 0);
SIGNAL \tag1~combout\ : std_logic_vector(4 DOWNTO 0);
SIGNAL \store_retirement_count~combout\ : std_logic_vector(1 DOWNTO 0);
SIGNAL \spec_tag_rb_in~combout\ : std_logic_vector(1 DOWNTO 0);
SIGNAL \ra2_pc_out~combout\ : std_logic_vector(15 DOWNTO 0);
SIGNAL \ra2_ir_out~combout\ : std_logic_vector(15 DOWNTO 0);
SIGNAL \ra1_pc_out~combout\ : std_logic_vector(15 DOWNTO 0);
SIGNAL \ra1_ir_out~combout\ : std_logic_vector(15 DOWNTO 0);
SIGNAL \free_rrf_vec~combout\ : std_logic_vector(31 DOWNTO 0);
SIGNAL \data4~combout\ : std_logic_vector(15 DOWNTO 0);
SIGNAL \data3~combout\ : std_logic_vector(15 DOWNTO 0);
SIGNAL \data2~combout\ : std_logic_vector(15 DOWNTO 0);
SIGNAL \data1~combout\ : std_logic_vector(15 DOWNTO 0);
SIGNAL \Z_tag_in~combout\ : std_logic_vector(4 DOWNTO 0);
SIGNAL \C_tag_in~combout\ : std_logic_vector(4 DOWNTO 0);

BEGIN

ww_clk <= clk;
ww_reset <= reset;
ww_ra1_val_out <= ra1_val_out;
ww_ra2_val_out <= ra2_val_out;
ww_ra1_pc_out <= ra1_pc_out;
ww_ra1_ir_out <= ra1_ir_out;
ww_ra2_pc_out <= ra2_pc_out;
ww_ra2_ir_out <= ra2_ir_out;
ww_free_rrf_vec <= free_rrf_vec;
ww_data1 <= data1;
ww_data2 <= data2;
ww_data3 <= data3;
ww_data4 <= data4;
ww_busy1 <= busy1;
ww_busy2 <= busy2;
ww_busy3 <= busy3;
ww_busy4 <= busy4;
ww_tag1 <= tag1;
ww_tag2 <= tag2;
ww_tag3 <= tag3;
ww_tag4 <= tag4;
ww_C_in <= C_in;
ww_Z_in <= Z_in;
ww_C_busybit_in <= C_busybit_in;
ww_Z_busybit_in <= Z_busybit_in;
ww_busy_dest1_in <= busy_dest1_in;
ww_busy_dest2_in <= busy_dest2_in;
ww_C_tag_in <= C_tag_in;
ww_Z_tag_in <= Z_tag_in;
ww_tag_dest1_in <= tag_dest1_in;
ww_tag_dest2_in <= tag_dest2_in;
ww_taken_branch_detected <= taken_branch_detected;
ww_not_taken_branch_detected <= not_taken_branch_detected;
ww_spec_tag_rb_in <= spec_tag_rb_in;
ww_rs_full_in <= rs_full_in;
ww_lm_stall_in <= lm_stall_in;
ww_lw_r7_resolved <= lw_r7_resolved;
ww_alu_r7_resolved <= alu_r7_resolved;
ww_jlr_resolved <= jlr_resolved;
ww_store_retirement_count <= store_retirement_count;
free_rrf_vec_out <= ww_free_rrf_vec_out;
Ard1a <= ww_Ard1a;
Ard1b <= ww_Ard1b;
Ard2a <= ww_Ard2a;
Ard2b <= ww_Ard2b;
Ard1c <= ww_Ard1c;
Ard2c <= ww_Ard2c;
Awr1 <= ww_Awr1;
Awr2 <= ww_Awr2;
pc1 <= ww_pc1;
pc2 <= ww_pc2;
ir1 <= ww_ir1;
ir2 <= ww_ir2;
x1_op1 <= ww_x1_op1;
x1_op2 <= ww_x1_op2;
x2_op1 <= ww_x2_op1;
x2_op2 <= ww_x2_op2;
x1_op1_ready <= ww_x1_op1_ready;
x1_op2_ready <= ww_x1_op2_ready;
x2_op1_ready <= ww_x2_op1_ready;
x2_op2_ready <= ww_x2_op2_ready;
x1_val <= ww_x1_val;
x2_val <= ww_x2_val;
C_out <= ww_C_out;
Z_out <= ww_Z_out;
C_ready <= ww_C_ready;
Z_ready <= ww_Z_ready;
C_wr <= ww_C_wr;
Z_wr <= ww_Z_wr;
C_2_out <= ww_C_2_out;
C_2_ready <= ww_C_2_ready;
C_2_wr <= ww_C_2_wr;
Z_2_out <= ww_Z_2_out;
Z_2_ready <= ww_Z_2_ready;
Z_2_wr <= ww_Z_2_wr;
spec_tag_rs_out1 <= ww_spec_tag_rs_out1;
spec_tag_rs_out2 <= ww_spec_tag_rs_out2;
store_tag_rs_out1 <= ww_store_tag_rs_out1;
store_tag_rs_out2 <= ww_store_tag_rs_out2;
C_busybit_out <= ww_C_busybit_out;
Z_busybit_out <= ww_Z_busybit_out;
C_2_busybit_out <= ww_C_2_busybit_out;
Z_2_busybit_out <= ww_Z_2_busybit_out;
C_tag_out_arf <= ww_C_tag_out_arf;
Z_tag_out_arf <= ww_Z_tag_out_arf;
C_2_tag_out_arf <= ww_C_2_tag_out_arf;
Z_2_tag_out_arf <= ww_Z_2_tag_out_arf;
busy_dest1_out <= ww_busy_dest1_out;
busy_dest2_out <= ww_busy_dest2_out;
dest_AR_tag_out <= ww_dest_AR_tag_out;
dest_AR_tag_2_out <= ww_dest_AR_tag_2_out;
C_tag_out_rs <= ww_C_tag_out_rs;
Z_tag_out_rs <= ww_Z_tag_out_rs;
C_2_tag_out_rs <= ww_C_2_tag_out_rs;
Z_2_tag_out_rs <= ww_Z_2_tag_out_rs;
ra1_invalidate_out <= ww_ra1_invalidate_out;
ra2_invalidate_out <= ww_ra2_invalidate_out;
pc_en_out <= ww_pc_en_out;
ra_en_out <= ww_ra_en_out;
arf_busy_wr_en1 <= ww_arf_busy_wr_en1;
arf_busy_wr_en2 <= ww_arf_busy_wr_en2;
arf_tag_wr_en1 <= ww_arf_tag_wr_en1;
arf_tag_wr_en2 <= ww_arf_tag_wr_en2;
adder2_out <= ww_adder2_out;
adder3_out <= ww_adder3_out;
ZA7_1_out <= ww_ZA7_1_out;
ZA7_2_out <= ww_ZA7_2_out;
S0 <= ww_S0;
S1 <= ww_S1;
S2 <= ww_S2;
S3 <= ww_S3;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\clk~clkctrl_INCLK_bus\ <= (gnd & gnd & gnd & \clk~combout\);

\reset~clkctrl_INCLK_bus\ <= (gnd & gnd & gnd & \reset~combout\);

-- Location: LCCOMB_X93_Y42_N20
\PE|pen2|next_var~33\ : cycloneii_lcell_comb
-- Equation(s):
-- \PE|pen2|next_var~33_combout\ = (!\PE|pen1|pennext[3]~12_combout\ & (\PE|pen2|penout~19_combout\ & (!\PE|pen1|pennext[7]~4_combout\ & \PE|pen2|penout~14_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000010000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \PE|pen1|pennext[3]~12_combout\,
	datab => \PE|pen2|penout~19_combout\,
	datac => \PE|pen1|pennext[7]~4_combout\,
	datad => \PE|pen2|penout~14_combout\,
	combout => \PE|pen2|next_var~33_combout\);

-- Location: LCCOMB_X94_Y42_N22
\PE|pen1|penout[2]~16\ : cycloneii_lcell_comb
-- Equation(s):
-- \PE|pen1|penout[2]~16_combout\ = (!\free_rrf_vec~combout\(11) & (!\free_rrf_vec~combout\(10) & (!\free_rrf_vec~combout\(8) & !\free_rrf_vec~combout\(9))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \free_rrf_vec~combout\(11),
	datab => \free_rrf_vec~combout\(10),
	datac => \free_rrf_vec~combout\(8),
	datad => \free_rrf_vec~combout\(9),
	combout => \PE|pen1|penout[2]~16_combout\);

-- Location: LCCOMB_X94_Y44_N24
\PE|pen1|pennext[26]~27\ : cycloneii_lcell_comb
-- Equation(s):
-- \PE|pen1|pennext[26]~27_combout\ = (\free_rrf_vec~combout\(26) & ((\free_rrf_vec~combout\(0)) # (\free_rrf_vec~combout\(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \free_rrf_vec~combout\(0),
	datac => \free_rrf_vec~combout\(26),
	datad => \free_rrf_vec~combout\(1),
	combout => \PE|pen1|pennext[26]~27_combout\);

-- Location: LCCOMB_X93_Y44_N30
\PE|pen1|penout[1]~18\ : cycloneii_lcell_comb
-- Equation(s):
-- \PE|pen1|penout[1]~18_combout\ = (!\free_rrf_vec~combout\(2) & !\free_rrf_vec~combout\(3))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \free_rrf_vec~combout\(2),
	datad => \free_rrf_vec~combout\(3),
	combout => \PE|pen1|penout[1]~18_combout\);

-- Location: LCCOMB_X94_Y44_N12
\PE|pen1|pennext[27]~31\ : cycloneii_lcell_comb
-- Equation(s):
-- \PE|pen1|pennext[27]~31_combout\ = (\PE|pen1|Equal0~3_combout\ & (\PE|pen1|Equal0~2_combout\ & (\PE|pen1|penout[1]~8_combout\ & \PE|pen1|pennext[26]~25_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \PE|pen1|Equal0~3_combout\,
	datab => \PE|pen1|Equal0~2_combout\,
	datac => \PE|pen1|penout[1]~8_combout\,
	datad => \PE|pen1|pennext[26]~25_combout\,
	combout => \PE|pen1|pennext[27]~31_combout\);

-- Location: LCCOMB_X94_Y47_N12
\PE|pen1|pennext[29]~35\ : cycloneii_lcell_comb
-- Equation(s):
-- \PE|pen1|pennext[29]~35_combout\ = (\free_rrf_vec~combout\(29) & ((\PE|pen1|pennext[29]~34_combout\) # (!\PE|pen1|Equal0~5_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \PE|pen1|Equal0~5_combout\,
	datac => \free_rrf_vec~combout\(29),
	datad => \PE|pen1|pennext[29]~34_combout\,
	combout => \PE|pen1|pennext[29]~35_combout\);

-- Location: LCCOMB_X20_Y1_N0
\Ard1a~9\ : cycloneii_lcell_comb
-- Equation(s):
-- \Ard1a~9_combout\ = (\Z_tag_out_arf~0_combout\ & (((!\x1_op2~4_combout\)))) # (!\Z_tag_out_arf~0_combout\ & ((\x1_op2~4_combout\ & (\Ard1a~8_combout\)) # (!\x1_op2~4_combout\ & ((\Ard1a~7_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100111101001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Z_tag_out_arf~0_combout\,
	datab => \Ard1a~8_combout\,
	datac => \x1_op2~4_combout\,
	datad => \Ard1a~7_combout\,
	combout => \Ard1a~9_combout\);

-- Location: LCCOMB_X20_Y1_N10
\Ard1a~10\ : cycloneii_lcell_comb
-- Equation(s):
-- \Ard1a~10_combout\ = (\Z_tag_out_arf~0_combout\ & (\ra1_ir_out~combout\(6) & (\Ard1a~9_combout\ $ (!\ra1_ir_out~combout\(15))))) # (!\Z_tag_out_arf~0_combout\ & (((\Ard1a~9_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000110000101100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ra1_ir_out~combout\(6),
	datab => \Ard1a~9_combout\,
	datac => \Z_tag_out_arf~0_combout\,
	datad => \ra1_ir_out~combout\(15),
	combout => \Ard1a~10_combout\);

-- Location: LCCOMB_X19_Y1_N6
\Ard1a~23\ : cycloneii_lcell_comb
-- Equation(s):
-- \Ard1a~23_combout\ = (\ra1_ir_out~combout\(15) & (\ra1_ir_out~combout\(11))) # (!\ra1_ir_out~combout\(15) & ((\ra1_ir_out~combout\(8))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \ra1_ir_out~combout\(15),
	datac => \ra1_ir_out~combout\(11),
	datad => \ra1_ir_out~combout\(8),
	combout => \Ard1a~23_combout\);

-- Location: LCCOMB_X16_Y1_N8
\Ard1a~27\ : cycloneii_lcell_comb
-- Equation(s):
-- \Ard1a~27_combout\ = (!\ra1_ir_out~combout\(2) & (!\ra1_ir_out~combout\(12) & ((!\ra1_ir_out~combout\(0)) # (!\ra1_ir_out~combout\(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000100000011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ra1_ir_out~combout\(1),
	datab => \ra1_ir_out~combout\(2),
	datac => \ra1_ir_out~combout\(12),
	datad => \ra1_ir_out~combout\(0),
	combout => \Ard1a~27_combout\);

-- Location: LCCOMB_X24_Y50_N12
\Ard2a~7\ : cycloneii_lcell_comb
-- Equation(s):
-- \Ard2a~7_combout\ = (\ra2_ir_out~combout\(15) & ((\ra2_ir_out~combout\(9)))) # (!\ra2_ir_out~combout\(15) & (\ra2_ir_out~combout\(6)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \ra2_ir_out~combout\(6),
	datac => \ra2_ir_out~combout\(15),
	datad => \ra2_ir_out~combout\(9),
	combout => \Ard2a~7_combout\);

-- Location: LCCOMB_X24_Y50_N24
\Ard2a~9\ : cycloneii_lcell_comb
-- Equation(s):
-- \Ard2a~9_combout\ = (\Z_2_tag_out_arf~0_combout\ & (((!\x2_op2~6_combout\)))) # (!\Z_2_tag_out_arf~0_combout\ & ((\x2_op2~6_combout\ & (\Ard2a~8_combout\)) # (!\x2_op2~6_combout\ & ((\Ard2a~7_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010111100101100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Ard2a~8_combout\,
	datab => \Z_2_tag_out_arf~0_combout\,
	datac => \x2_op2~6_combout\,
	datad => \Ard2a~7_combout\,
	combout => \Ard2a~9_combout\);

-- Location: LCCOMB_X19_Y50_N18
\x2_op2~7\ : cycloneii_lcell_comb
-- Equation(s):
-- \x2_op2~7_combout\ = (!\ra2_ir_out~combout\(15) & (!\ra2_ir_out~combout\(2) & ((!\ra2_ir_out~combout\(0)) # (!\ra2_ir_out~combout\(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000010101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ra2_ir_out~combout\(15),
	datab => \ra2_ir_out~combout\(1),
	datac => \ra2_ir_out~combout\(0),
	datad => \ra2_ir_out~combout\(2),
	combout => \x2_op2~7_combout\);

-- Location: LCCOMB_X25_Y50_N20
\Awr2~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \Awr2~1_combout\ = (!\ra2_ir_out~combout\(14) & ((\ra2_ir_out~combout\(12) & ((\ra2_ir_out~combout\(13)))) # (!\ra2_ir_out~combout\(12) & (!\x2_op2~7_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011000101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \x2_op2~7_combout\,
	datab => \ra2_ir_out~combout\(13),
	datac => \ra2_ir_out~combout\(12),
	datad => \ra2_ir_out~combout\(14),
	combout => \Awr2~1_combout\);

-- Location: LCCOMB_X21_Y1_N22
\x1_op2~8\ : cycloneii_lcell_comb
-- Equation(s):
-- \x1_op2~8_combout\ = (!\ra1_ir_out~combout\(2) & !\ra1_ir_out~combout\(1))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \ra1_ir_out~combout\(2),
	datad => \ra1_ir_out~combout\(1),
	combout => \x1_op2~8_combout\);

-- Location: LCCOMB_X16_Y1_N24
\x1_op2~25\ : cycloneii_lcell_comb
-- Equation(s):
-- \x1_op2~25_combout\ = (\ra1_ir_out~combout\(12) & (\ra1_ir_out~combout\(14) & ((!\ra1_ir_out~combout\(15))))) # (!\ra1_ir_out~combout\(12) & (\ra1_ir_out~combout\(15) $ (((\ra1_ir_out~combout\(13)) # (!\ra1_ir_out~combout\(14))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000010011011001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ra1_ir_out~combout\(12),
	datab => \ra1_ir_out~combout\(14),
	datac => \ra1_ir_out~combout\(13),
	datad => \ra1_ir_out~combout\(15),
	combout => \x1_op2~25_combout\);

-- Location: LCCOMB_X12_Y1_N6
\x1_op2~29\ : cycloneii_lcell_comb
-- Equation(s):
-- \x1_op2~29_combout\ = (\x1_op2~26_combout\ & ((!\x1_op2~28_combout\) # (!\busy2~combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010101000101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \x1_op2~26_combout\,
	datab => \busy2~combout\,
	datac => \x1_op2~28_combout\,
	combout => \x1_op2~29_combout\);

-- Location: LCCOMB_X12_Y1_N14
\x1_op2~33\ : cycloneii_lcell_comb
-- Equation(s):
-- \x1_op2~33_combout\ = (\x1_op2~29_combout\ & ((\x1_op2~28_combout\ & (\data2~combout\(6))) # (!\x1_op2~28_combout\ & ((\x1_op2~24_combout\))))) # (!\x1_op2~29_combout\ & (!\x1_op2~28_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011001110010001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \x1_op2~29_combout\,
	datab => \x1_op2~28_combout\,
	datac => \data2~combout\(6),
	datad => \x1_op2~24_combout\,
	combout => \x1_op2~33_combout\);

-- Location: LCCOMB_X19_Y50_N12
\x2_op2~10\ : cycloneii_lcell_comb
-- Equation(s):
-- \x2_op2~10_combout\ = (!\ra2_ir_out~combout\(2) & !\ra2_ir_out~combout\(1))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000001100000011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \ra2_ir_out~combout\(2),
	datac => \ra2_ir_out~combout\(1),
	combout => \x2_op2~10_combout\);

-- Location: LCCOMB_X25_Y50_N12
\x2_op2~28\ : cycloneii_lcell_comb
-- Equation(s):
-- \x2_op2~28_combout\ = (\ra2_ir_out~combout\(14) & (\ra2_ir_out~combout\(15) $ (((\ra2_ir_out~combout\(12)) # (\ra2_ir_out~combout\(13)))))) # (!\ra2_ir_out~combout\(14) & (!\ra2_ir_out~combout\(12) & (!\ra2_ir_out~combout\(15))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000101100101001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ra2_ir_out~combout\(14),
	datab => \ra2_ir_out~combout\(12),
	datac => \ra2_ir_out~combout\(15),
	datad => \ra2_ir_out~combout\(13),
	combout => \x2_op2~28_combout\);

-- Location: LCCOMB_X32_Y50_N14
\x2_op2~41\ : cycloneii_lcell_comb
-- Equation(s):
-- \x2_op2~41_combout\ = (\x2_op2~31_combout\ & ((\x2_op2~30_combout\ & ((\data4~combout\(8)))) # (!\x2_op2~30_combout\ & (\x2_op2~27_combout\)))) # (!\x2_op2~31_combout\ & (!\x2_op2~30_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011100100110001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \x2_op2~31_combout\,
	datab => \x2_op2~30_combout\,
	datac => \x2_op2~27_combout\,
	datad => \data4~combout\(8),
	combout => \x2_op2~41_combout\);

-- Location: LCCOMB_X32_Y50_N30
\x2_op2~50\ : cycloneii_lcell_comb
-- Equation(s):
-- \x2_op2~50_combout\ = (\x2_op2~31_combout\ & ((\x2_op2~30_combout\ & ((\data4~combout\(11)))) # (!\x2_op2~30_combout\ & (\x2_op2~27_combout\)))) # (!\x2_op2~31_combout\ & (!\x2_op2~30_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011100100110001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \x2_op2~31_combout\,
	datab => \x2_op2~30_combout\,
	datac => \x2_op2~27_combout\,
	datad => \data4~combout\(11),
	combout => \x2_op2~50_combout\);

-- Location: LCCOMB_X32_Y50_N0
\x2_op2~53\ : cycloneii_lcell_comb
-- Equation(s):
-- \x2_op2~53_combout\ = (\x2_op2~30_combout\ & (((\data4~combout\(12) & \x2_op2~31_combout\)))) # (!\x2_op2~30_combout\ & ((\x2_op2~27_combout\) # ((!\x2_op2~31_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110001000110011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \x2_op2~27_combout\,
	datab => \x2_op2~30_combout\,
	datac => \data4~combout\(12),
	datad => \x2_op2~31_combout\,
	combout => \x2_op2~53_combout\);

-- Location: LCCOMB_X93_Y49_N20
\PE|pen1|Equal0~7\ : cycloneii_lcell_comb
-- Equation(s):
-- \PE|pen1|Equal0~7_combout\ = (\PE|pen1|Equal0~6_combout\ & !\free_rrf_vec~combout\(31))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000110000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \PE|pen1|Equal0~6_combout\,
	datac => \free_rrf_vec~combout\(31),
	combout => \PE|pen1|Equal0~7_combout\);

-- Location: LCCOMB_X21_Y1_N12
\process_0~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \process_0~3_combout\ = (\Equal0~1_combout\ & (\ra1_val_out~combout\ & (\ra1_ir_out~combout\(6) & \ra1_ir_out~combout\(8))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Equal0~1_combout\,
	datab => \ra1_val_out~combout\,
	datac => \ra1_ir_out~combout\(6),
	datad => \ra1_ir_out~combout\(8),
	combout => \process_0~3_combout\);

-- Location: LCCOMB_X21_Y1_N20
\spec_tag_rs_out2~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \spec_tag_rs_out2~0_combout\ = (\ra1_ir_out~combout\(7) & (!\process_0~3_combout\ & ((!\Equal0~2_combout\) # (!\process_0~4_combout\)))) # (!\ra1_ir_out~combout\(7) & (((!\Equal0~2_combout\)) # (!\process_0~4_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001010100111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ra1_ir_out~combout\(7),
	datab => \process_0~4_combout\,
	datac => \Equal0~2_combout\,
	datad => \process_0~3_combout\,
	combout => \spec_tag_rs_out2~0_combout\);

-- Location: LCCOMB_X22_Y1_N12
\Equal0~5\ : cycloneii_lcell_comb
-- Equation(s):
-- \Equal0~5_combout\ = (!\ra1_ir_out~combout\(12) & (!\ra1_ir_out~combout\(15) & (\ra1_ir_out~combout\(13) & \ra1_ir_out~combout\(14))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ra1_ir_out~combout\(12),
	datab => \ra1_ir_out~combout\(15),
	datac => \ra1_ir_out~combout\(13),
	datad => \ra1_ir_out~combout\(14),
	combout => \Equal0~5_combout\);

-- Location: LCCOMB_X66_Y49_N20
\pc_en_out~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \pc_en_out~0_combout\ = (\SPEC_TAG_REG|dout\(1) & ((\taken_branch_detected~combout\) # ((\x1_val~4_combout\ & !\PE|twoRRnotFree~combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000011100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \x1_val~4_combout\,
	datab => \taken_branch_detected~combout\,
	datac => \SPEC_TAG_REG|dout\(1),
	datad => \PE|twoRRnotFree~combout\,
	combout => \pc_en_out~0_combout\);

-- Location: LCCOMB_X66_Y49_N10
\spec_tag_rs_out2~7\ : cycloneii_lcell_comb
-- Equation(s):
-- \spec_tag_rs_out2~7_combout\ = (\SPEC_TAG_REG|dout\(1)) # ((!\not_taken_branch_detected~combout\ & \SPEC_TAG_REG|dout\(0)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111101000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \not_taken_branch_detected~combout\,
	datab => \SPEC_TAG_REG|dout\(0),
	datad => \SPEC_TAG_REG|dout\(1),
	combout => \spec_tag_rs_out2~7_combout\);

-- Location: LCCOMB_X59_Y49_N30
\store_tag_reg_in~15\ : cycloneii_lcell_comb
-- Equation(s):
-- \store_tag_reg_in~15_combout\ = \store_retirement_count~combout\(0) $ (\store_retirement_count~combout\(1))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010110101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \store_retirement_count~combout\(0),
	datad => \store_retirement_count~combout\(1),
	combout => \store_tag_reg_in~15_combout\);

-- Location: LCCOMB_X61_Y49_N6
\STORE_TAG_DEC|ist_add:3:F1|s0\ : cycloneii_lcell_comb
-- Equation(s):
-- \STORE_TAG_DEC|ist_add:3:F1|s0~combout\ = \STORE_TAG_REG|dout\(3) $ (((\STORE_TAG_REG|dout\(0)) # ((\STORE_TAG_REG|dout\(2)) # (\STORE_TAG_REG|dout\(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001100110110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \STORE_TAG_REG|dout\(0),
	datab => \STORE_TAG_REG|dout\(3),
	datac => \STORE_TAG_REG|dout\(2),
	datad => \STORE_TAG_REG|dout\(1),
	combout => \STORE_TAG_DEC|ist_add:3:F1|s0~combout\);

-- Location: LCCOMB_X94_Y47_N20
\PE|pen1|penout~19\ : cycloneii_lcell_comb
-- Equation(s):
-- \PE|pen1|penout~19_combout\ = (\free_rrf_vec~combout\(27)) # ((!\free_rrf_vec~combout\(28) & ((\free_rrf_vec~combout\(29)) # (!\free_rrf_vec~combout\(30)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100100011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \free_rrf_vec~combout\(29),
	datab => \free_rrf_vec~combout\(28),
	datac => \free_rrf_vec~combout\(30),
	datad => \free_rrf_vec~combout\(27),
	combout => \PE|pen1|penout~19_combout\);

-- Location: LCCOMB_X94_Y44_N0
\PE|pen1|penout~20\ : cycloneii_lcell_comb
-- Equation(s):
-- \PE|pen1|penout~20_combout\ = (!\free_rrf_vec~combout\(24) & ((\free_rrf_vec~combout\(25)) # ((\PE|pen1|penout~19_combout\ & !\free_rrf_vec~combout\(26)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011001110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \PE|pen1|penout~19_combout\,
	datab => \free_rrf_vec~combout\(25),
	datac => \free_rrf_vec~combout\(26),
	datad => \free_rrf_vec~combout\(24),
	combout => \PE|pen1|penout~20_combout\);

-- Location: LCCOMB_X94_Y45_N20
\PE|pen1|penout~21\ : cycloneii_lcell_comb
-- Equation(s):
-- \PE|pen1|penout~21_combout\ = (!\free_rrf_vec~combout\(20) & (!\free_rrf_vec~combout\(22) & ((\free_rrf_vec~combout\(23)) # (\PE|pen1|penout~20_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000110010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \free_rrf_vec~combout\(23),
	datab => \free_rrf_vec~combout\(20),
	datac => \PE|pen1|penout~20_combout\,
	datad => \free_rrf_vec~combout\(22),
	combout => \PE|pen1|penout~21_combout\);

-- Location: LCCOMB_X94_Y45_N26
\PE|pen1|penout~22\ : cycloneii_lcell_comb
-- Equation(s):
-- \PE|pen1|penout~22_combout\ = (\PE|pen1|penout~21_combout\) # ((\free_rrf_vec~combout\(19)) # ((\free_rrf_vec~combout\(21) & !\free_rrf_vec~combout\(20))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101011111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \PE|pen1|penout~21_combout\,
	datab => \free_rrf_vec~combout\(21),
	datac => \free_rrf_vec~combout\(19),
	datad => \free_rrf_vec~combout\(20),
	combout => \PE|pen1|penout~22_combout\);

-- Location: LCCOMB_X93_Y41_N30
\PE|pen1|penout~23\ : cycloneii_lcell_comb
-- Equation(s):
-- \PE|pen1|penout~23_combout\ = (!\free_rrf_vec~combout\(16) & ((\free_rrf_vec~combout\(17)) # ((\PE|pen1|penout~22_combout\ & !\free_rrf_vec~combout\(18)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010101110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \free_rrf_vec~combout\(17),
	datab => \PE|pen1|penout~22_combout\,
	datac => \free_rrf_vec~combout\(18),
	datad => \free_rrf_vec~combout\(16),
	combout => \PE|pen1|penout~23_combout\);

-- Location: LCCOMB_X94_Y41_N14
\PE|pen1|penout~24\ : cycloneii_lcell_comb
-- Equation(s):
-- \PE|pen1|penout~24_combout\ = (\free_rrf_vec~combout\(13)) # ((!\free_rrf_vec~combout\(14) & ((\free_rrf_vec~combout\(15)) # (\PE|pen1|penout~23_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111101010100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \free_rrf_vec~combout\(14),
	datab => \free_rrf_vec~combout\(15),
	datac => \PE|pen1|penout~23_combout\,
	datad => \free_rrf_vec~combout\(13),
	combout => \PE|pen1|penout~24_combout\);

-- Location: LCCOMB_X94_Y42_N24
\PE|pen1|penout~25\ : cycloneii_lcell_comb
-- Equation(s):
-- \PE|pen1|penout~25_combout\ = (\free_rrf_vec~combout\(11)) # ((!\free_rrf_vec~combout\(12) & \PE|pen1|penout~24_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \free_rrf_vec~combout\(12),
	datac => \PE|pen1|penout~24_combout\,
	datad => \free_rrf_vec~combout\(11),
	combout => \PE|pen1|penout~25_combout\);

-- Location: LCCOMB_X94_Y42_N2
\PE|pen1|penout~26\ : cycloneii_lcell_comb
-- Equation(s):
-- \PE|pen1|penout~26_combout\ = (!\free_rrf_vec~combout\(8) & ((\free_rrf_vec~combout\(9)) # ((\PE|pen1|penout~25_combout\ & !\free_rrf_vec~combout\(10)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001100000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \PE|pen1|penout~25_combout\,
	datab => \free_rrf_vec~combout\(8),
	datac => \free_rrf_vec~combout\(10),
	datad => \free_rrf_vec~combout\(9),
	combout => \PE|pen1|penout~26_combout\);

-- Location: LCCOMB_X94_Y47_N30
\PE|pen1|penout~30\ : cycloneii_lcell_comb
-- Equation(s):
-- \PE|pen1|penout~30_combout\ = (\free_rrf_vec~combout\(26)) # ((\free_rrf_vec~combout\(27)) # ((!\free_rrf_vec~combout\(28) & !\free_rrf_vec~combout\(29))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111110101011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \free_rrf_vec~combout\(26),
	datab => \free_rrf_vec~combout\(28),
	datac => \free_rrf_vec~combout\(29),
	datad => \free_rrf_vec~combout\(27),
	combout => \PE|pen1|penout~30_combout\);

-- Location: LCCOMB_X22_Y1_N10
\Z_tag_out_arf~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \Z_tag_out_arf~1_combout\ = (\ra1_ir_out~combout\(12) & (((\ra1_ir_out~combout\(13)) # (\ra1_ir_out~combout\(14))))) # (!\ra1_ir_out~combout\(12) & ((\ra1_ir_out~combout\(14) & ((\ra1_ir_out~combout\(13)))) # (!\ra1_ir_out~combout\(14) & 
-- (!\Ard1a~6_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101010110001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ra1_ir_out~combout\(12),
	datab => \Ard1a~6_combout\,
	datac => \ra1_ir_out~combout\(13),
	datad => \ra1_ir_out~combout\(14),
	combout => \Z_tag_out_arf~1_combout\);

-- Location: LCCOMB_X93_Y43_N26
\PE|pen2|penout~28\ : cycloneii_lcell_comb
-- Equation(s):
-- \PE|pen2|penout~28_combout\ = (\PE|pen2|penout~59_combout\ & (\free_rrf_vec~combout\(7) & ((\free_rrf_vec~combout\(6)) # (!\PE|pen1|Equal0~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \free_rrf_vec~combout\(6),
	datab => \PE|pen2|penout~59_combout\,
	datac => \PE|pen1|Equal0~0_combout\,
	datad => \free_rrf_vec~combout\(7),
	combout => \PE|pen2|penout~28_combout\);

-- Location: LCCOMB_X93_Y43_N28
\PE|pen2|penout~29\ : cycloneii_lcell_comb
-- Equation(s):
-- \PE|pen2|penout~29_combout\ = (\PE|pen1|pennext[3]~12_combout\) # ((\free_rrf_vec~combout\(5) & (\free_rrf_vec~combout\(4) $ (!\PE|pen1|pennext[5]~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101110101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \PE|pen1|pennext[3]~12_combout\,
	datab => \free_rrf_vec~combout\(4),
	datac => \PE|pen1|pennext[5]~2_combout\,
	datad => \free_rrf_vec~combout\(5),
	combout => \PE|pen2|penout~29_combout\);

-- Location: LCCOMB_X94_Y41_N4
\PE|pen2|penout~30\ : cycloneii_lcell_comb
-- Equation(s):
-- \PE|pen2|penout~30_combout\ = (!\PE|pen1|pennext[10]~6_combout\ & (\free_rrf_vec~combout\(13) & (\PE|pen1|pennext[12]~8_combout\ $ (!\free_rrf_vec~combout\(12)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100000100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \PE|pen1|pennext[10]~6_combout\,
	datab => \PE|pen1|pennext[12]~8_combout\,
	datac => \free_rrf_vec~combout\(12),
	datad => \free_rrf_vec~combout\(13),
	combout => \PE|pen2|penout~30_combout\);

-- Location: LCCOMB_X94_Y42_N12
\PE|pen2|penout~31\ : cycloneii_lcell_comb
-- Equation(s):
-- \PE|pen2|penout~31_combout\ = (\PE|pen1|pennext[9]~3_combout\) # ((\free_rrf_vec~combout\(11) & (\PE|pen1|pennext[10]~5_combout\ $ (!\free_rrf_vec~combout\(10)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110110111001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \PE|pen1|pennext[10]~5_combout\,
	datab => \PE|pen1|pennext[9]~3_combout\,
	datac => \free_rrf_vec~combout\(10),
	datad => \free_rrf_vec~combout\(11),
	combout => \PE|pen2|penout~31_combout\);

-- Location: LCCOMB_X94_Y41_N22
\PE|pen2|penout~32\ : cycloneii_lcell_comb
-- Equation(s):
-- \PE|pen2|penout~32_combout\ = (!\PE|pen1|pennext[10]~6_combout\ & (!\PE|pen1|pennext[14]~9_combout\ & ((\PE|pen1|pennext[12]~8_combout\) # (!\free_rrf_vec~combout\(12)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000100000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \PE|pen1|pennext[10]~6_combout\,
	datab => \PE|pen1|pennext[14]~9_combout\,
	datac => \free_rrf_vec~combout\(12),
	datad => \PE|pen1|pennext[12]~8_combout\,
	combout => \PE|pen2|penout~32_combout\);

-- Location: LCCOMB_X94_Y41_N24
\PE|pen2|penout~33\ : cycloneii_lcell_comb
-- Equation(s):
-- \PE|pen2|penout~33_combout\ = (\PE|pen2|penout~30_combout\) # ((\PE|pen2|penout~31_combout\) # ((\PE|pen2|penout~32_combout\ & \PE|pen1|pennext[15]~10_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111101100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \PE|pen2|penout~32_combout\,
	datab => \PE|pen2|penout~30_combout\,
	datac => \PE|pen1|pennext[15]~10_combout\,
	datad => \PE|pen2|penout~31_combout\,
	combout => \PE|pen2|penout~33_combout\);

-- Location: LCCOMB_X93_Y41_N8
\PE|pen2|penout~34\ : cycloneii_lcell_comb
-- Equation(s):
-- \PE|pen2|penout~34_combout\ = (\PE|pen2|penout~32_combout\ & ((\PE|pen1|penout[4]~14_combout\) # (!\free_rrf_vec~combout\(16))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \PE|pen2|penout~32_combout\,
	datac => \PE|pen1|penout[4]~14_combout\,
	datad => \free_rrf_vec~combout\(16),
	combout => \PE|pen2|penout~34_combout\);

-- Location: LCCOMB_X93_Y45_N24
\PE|pen2|penout~35\ : cycloneii_lcell_comb
-- Equation(s):
-- \PE|pen2|penout~35_combout\ = (!\PE|pen1|pennext[18]~11_combout\ & (((\PE|pen1|pennext[20]~16_combout\ & \PE|pen1|pennext[17]~14_combout\)) # (!\free_rrf_vec~combout\(20))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101000100010001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \PE|pen1|pennext[18]~11_combout\,
	datab => \free_rrf_vec~combout\(20),
	datac => \PE|pen1|pennext[20]~16_combout\,
	datad => \PE|pen1|pennext[17]~14_combout\,
	combout => \PE|pen2|penout~35_combout\);

-- Location: LCCOMB_X94_Y45_N2
\PE|pen2|penout~36\ : cycloneii_lcell_comb
-- Equation(s):
-- \PE|pen2|penout~36_combout\ = (\PE|pen1|pennext[27]~32_combout\) # ((!\PE|pen1|pennext[28]~33_combout\ & ((\PE|pen1|pennext[29]~35_combout\) # (!\PE|pen1|pennext[30]~36_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111111001101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \PE|pen1|pennext[30]~36_combout\,
	datab => \PE|pen1|pennext[27]~32_combout\,
	datac => \PE|pen1|pennext[28]~33_combout\,
	datad => \PE|pen1|pennext[29]~35_combout\,
	combout => \PE|pen2|penout~36_combout\);

-- Location: LCCOMB_X94_Y45_N12
\PE|pen2|penout~37\ : cycloneii_lcell_comb
-- Equation(s):
-- \PE|pen2|penout~37_combout\ = (!\PE|pen1|pennext[24]~22_combout\ & ((\PE|pen1|pennext[25]~26_combout\) # ((!\PE|pen1|pennext[26]~29_combout\ & \PE|pen2|penout~36_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \PE|pen1|pennext[26]~29_combout\,
	datab => \PE|pen2|penout~36_combout\,
	datac => \PE|pen1|pennext[24]~22_combout\,
	datad => \PE|pen1|pennext[25]~26_combout\,
	combout => \PE|pen2|penout~37_combout\);

-- Location: LCCOMB_X93_Y45_N18
\PE|pen2|penout~38\ : cycloneii_lcell_comb
-- Equation(s):
-- \PE|pen2|penout~38_combout\ = (!\PE|pen1|pennext[22]~19_combout\ & (\PE|pen2|penout~35_combout\ & ((\PE|pen2|penout~37_combout\) # (\PE|pen1|pennext[23]~20_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101000001000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \PE|pen1|pennext[22]~19_combout\,
	datab => \PE|pen2|penout~37_combout\,
	datac => \PE|pen2|penout~35_combout\,
	datad => \PE|pen1|pennext[23]~20_combout\,
	combout => \PE|pen2|penout~38_combout\);

-- Location: LCCOMB_X93_Y41_N26
\PE|pen2|penout~39\ : cycloneii_lcell_comb
-- Equation(s):
-- \PE|pen2|penout~39_combout\ = (\free_rrf_vec~combout\(17) & (((!\free_rrf_vec~combout\(18) & \free_rrf_vec~combout\(19))) # (!\PE|pen1|pennext[17]~14_combout\))) # (!\free_rrf_vec~combout\(17) & (\free_rrf_vec~combout\(19) & (\free_rrf_vec~combout\(18) $ 
-- (!\PE|pen1|pennext[17]~14_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110101100001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \free_rrf_vec~combout\(17),
	datab => \free_rrf_vec~combout\(18),
	datac => \PE|pen1|pennext[17]~14_combout\,
	datad => \free_rrf_vec~combout\(19),
	combout => \PE|pen2|penout~39_combout\);

-- Location: LCCOMB_X93_Y41_N20
\PE|pen2|penout~40\ : cycloneii_lcell_comb
-- Equation(s):
-- \PE|pen2|penout~40_combout\ = (\PE|pen2|penout~39_combout\) # ((!\PE|pen1|pennext[20]~17_combout\ & (!\PE|pen1|pennext[18]~11_combout\ & \PE|pen1|pennext[21]~18_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110111001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \PE|pen1|pennext[20]~17_combout\,
	datab => \PE|pen2|penout~39_combout\,
	datac => \PE|pen1|pennext[18]~11_combout\,
	datad => \PE|pen1|pennext[21]~18_combout\,
	combout => \PE|pen2|penout~40_combout\);

-- Location: LCCOMB_X93_Y41_N22
\PE|pen2|penout~41\ : cycloneii_lcell_comb
-- Equation(s):
-- \PE|pen2|penout~41_combout\ = (\PE|pen2|penout~33_combout\) # ((\PE|pen2|penout~34_combout\ & ((\PE|pen2|penout~38_combout\) # (\PE|pen2|penout~40_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \PE|pen2|penout~38_combout\,
	datab => \PE|pen2|penout~34_combout\,
	datac => \PE|pen2|penout~40_combout\,
	datad => \PE|pen2|penout~33_combout\,
	combout => \PE|pen2|penout~41_combout\);

-- Location: LCCOMB_X94_Y43_N6
\PE|pen2|penout~42\ : cycloneii_lcell_comb
-- Equation(s):
-- \PE|pen2|penout~42_combout\ = (\PE|pen2|penout~59_combout\ & (((\PE|pen1|penout~9_combout\ & \PE|pen1|Equal0~0_combout\)) # (!\free_rrf_vec~combout\(8))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \PE|pen1|penout~9_combout\,
	datab => \PE|pen1|Equal0~0_combout\,
	datac => \free_rrf_vec~combout\(8),
	datad => \PE|pen2|penout~59_combout\,
	combout => \PE|pen2|penout~42_combout\);

-- Location: LCCOMB_X93_Y43_N10
\PE|pen2|penout~43\ : cycloneii_lcell_comb
-- Equation(s):
-- \PE|pen2|penout~43_combout\ = (\PE|pen2|penout~29_combout\) # ((\PE|pen2|penout~28_combout\) # ((\PE|pen2|penout~42_combout\ & \PE|pen2|penout~41_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111101100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \PE|pen2|penout~42_combout\,
	datab => \PE|pen2|penout~29_combout\,
	datac => \PE|pen2|penout~41_combout\,
	datad => \PE|pen2|penout~28_combout\,
	combout => \PE|pen2|penout~43_combout\);

-- Location: LCCOMB_X93_Y44_N10
\PE|pen2|penout~44\ : cycloneii_lcell_comb
-- Equation(s):
-- \PE|pen2|penout~44_combout\ = (\free_rrf_vec~combout\(3) & ((\free_rrf_vec~combout\(2)) # ((\free_rrf_vec~combout\(0)) # (\free_rrf_vec~combout\(1))))) # (!\free_rrf_vec~combout\(3) & (\free_rrf_vec~combout\(2) & ((\free_rrf_vec~combout\(0)) # 
-- (\free_rrf_vec~combout\(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111011101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \free_rrf_vec~combout\(3),
	datab => \free_rrf_vec~combout\(2),
	datac => \free_rrf_vec~combout\(0),
	datad => \free_rrf_vec~combout\(1),
	combout => \PE|pen2|penout~44_combout\);

-- Location: LCCOMB_X94_Y45_N18
\PE|pen2|penout~46\ : cycloneii_lcell_comb
-- Equation(s):
-- \PE|pen2|penout~46_combout\ = (\PE|pen1|pennext[26]~29_combout\) # ((\PE|pen1|pennext[27]~32_combout\) # ((!\PE|pen1|pennext[29]~35_combout\ & !\PE|pen1|pennext[28]~33_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111110101011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \PE|pen1|pennext[26]~29_combout\,
	datab => \PE|pen1|pennext[29]~35_combout\,
	datac => \PE|pen1|pennext[28]~33_combout\,
	datad => \PE|pen1|pennext[27]~32_combout\,
	combout => \PE|pen2|penout~46_combout\);

-- Location: LCCOMB_X93_Y45_N16
\PE|pen2|penout~47\ : cycloneii_lcell_comb
-- Equation(s):
-- \PE|pen2|penout~47_combout\ = (\PE|pen2|penout~23_combout\ & (((\PE|pen2|penout~25_combout\ & \PE|pen2|penout~46_combout\)) # (!\PE|pen2|penout~24_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \PE|pen2|penout~25_combout\,
	datab => \PE|pen2|penout~46_combout\,
	datac => \PE|pen2|penout~23_combout\,
	datad => \PE|pen2|penout~24_combout\,
	combout => \PE|pen2|penout~47_combout\);

-- Location: LCCOMB_X93_Y42_N6
\PE|pen2|penout~48\ : cycloneii_lcell_comb
-- Equation(s):
-- \PE|pen2|penout~48_combout\ = ((\PE|pen2|penout~21_combout\ & ((\PE|pen2|penout~47_combout\) # (!\PE|pen2|penout~22_combout\)))) # (!\PE|pen2|penout~20_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000101011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \PE|pen2|penout~21_combout\,
	datab => \PE|pen2|penout~47_combout\,
	datac => \PE|pen2|penout~22_combout\,
	datad => \PE|pen2|penout~20_combout\,
	combout => \PE|pen2|penout~48_combout\);

-- Location: LCCOMB_X21_Y1_N28
\ra1_invalidate_out~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \ra1_invalidate_out~0_combout\ = (\Equal0~4_combout\) # ((\ra1_ir_out~combout\(7) & ((\Equal0~5_combout\) # (\process_0~3_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101011101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Equal0~4_combout\,
	datab => \Equal0~5_combout\,
	datac => \ra1_ir_out~combout\(7),
	datad => \process_0~3_combout\,
	combout => \ra1_invalidate_out~0_combout\);

-- Location: LCCOMB_X19_Y50_N0
\ra1_invalidate_out~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \ra1_invalidate_out~1_combout\ = (!\ra2_ir_out~combout\(0) & (\ra2_ir_out~combout\(4) & (\ra2_ir_out~combout\(3) & \ra2_ir_out~combout\(5))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ra2_ir_out~combout\(0),
	datab => \ra2_ir_out~combout\(4),
	datac => \ra2_ir_out~combout\(3),
	datad => \ra2_ir_out~combout\(5),
	combout => \ra1_invalidate_out~1_combout\);

-- Location: LCCOMB_X19_Y50_N14
\ra1_invalidate_out~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \ra1_invalidate_out~2_combout\ = (\x2_op2~6_combout\ & (\ra1_invalidate_out~1_combout\ & (!\ra2_ir_out~combout\(15) & \x2_op2~10_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \x2_op2~6_combout\,
	datab => \ra1_invalidate_out~1_combout\,
	datac => \ra2_ir_out~combout\(15),
	datad => \x2_op2~10_combout\,
	combout => \ra1_invalidate_out~2_combout\);

-- Location: LCCOMB_X20_Y50_N12
\ra1_invalidate_out~5\ : cycloneii_lcell_comb
-- Equation(s):
-- \ra1_invalidate_out~5_combout\ = (\ra2_ir_out~combout\(12) & (!\ra2_ir_out~combout\(14) & (!\ra2_ir_out~combout\(13) & \ra2_ir_out~combout\(15)))) # (!\ra2_ir_out~combout\(12) & (\ra2_ir_out~combout\(14) & (\ra2_ir_out~combout\(13) & 
-- !\ra2_ir_out~combout\(15))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000001001000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ra2_ir_out~combout\(12),
	datab => \ra2_ir_out~combout\(14),
	datac => \ra2_ir_out~combout\(13),
	datad => \ra2_ir_out~combout\(15),
	combout => \ra1_invalidate_out~5_combout\);

-- Location: LCCOMB_X21_Y1_N10
\ra1_invalidate_out~8\ : cycloneii_lcell_comb
-- Equation(s):
-- \ra1_invalidate_out~8_combout\ = (!\ra1_ir_out~combout\(0) & (\x1_op2~8_combout\ & (!\ra1_ir_out~combout\(15) & \x2_val_var~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000010000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ra1_ir_out~combout\(0),
	datab => \x1_op2~8_combout\,
	datac => \ra1_ir_out~combout\(15),
	datad => \x2_val_var~1_combout\,
	combout => \ra1_invalidate_out~8_combout\);

-- Location: LCCOMB_X63_Y49_N2
\spec_tag_reg_in~10\ : cycloneii_lcell_comb
-- Equation(s):
-- \spec_tag_reg_in~10_combout\ = (\x1_val~0_combout\ & ((\process_0~7_combout\) # ((!\x1_val~1_combout\ & !\taken_branch_detected~combout\)))) # (!\x1_val~0_combout\ & (((\x1_val~1_combout\ & !\taken_branch_detected~combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100010111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \process_0~7_combout\,
	datab => \x1_val~0_combout\,
	datac => \x1_val~1_combout\,
	datad => \taken_branch_detected~combout\,
	combout => \spec_tag_reg_in~10_combout\);

-- Location: LCCOMB_X63_Y49_N20
\spec_tag_reg_in~11\ : cycloneii_lcell_comb
-- Equation(s):
-- \spec_tag_reg_in~11_combout\ = (\not_taken_branch_detected~combout\ & (((\spec_tag_reg_in~14_combout\)) # (!\spec_tag_reg_in~10_combout\))) # (!\not_taken_branch_detected~combout\ & (\spec_tag_reg_in~14_combout\ & ((!\process_0~2_combout\) # 
-- (!\spec_tag_reg_in~10_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011111100100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \not_taken_branch_detected~combout\,
	datab => \spec_tag_reg_in~10_combout\,
	datac => \process_0~2_combout\,
	datad => \spec_tag_reg_in~14_combout\,
	combout => \spec_tag_reg_in~11_combout\);

-- Location: LCCOMB_X63_Y49_N18
\spec_tag_reg_in~12\ : cycloneii_lcell_comb
-- Equation(s):
-- \spec_tag_reg_in~12_combout\ = (!\not_taken_branch_detected~combout\ & ((\spec_tag_reg_in~10_combout\ & ((!\spec_tag_reg_in~14_combout\) # (!\process_0~2_combout\))) # (!\spec_tag_reg_in~10_combout\ & ((\spec_tag_reg_in~14_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001010101000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \not_taken_branch_detected~combout\,
	datab => \spec_tag_reg_in~10_combout\,
	datac => \process_0~2_combout\,
	datad => \spec_tag_reg_in~14_combout\,
	combout => \spec_tag_reg_in~12_combout\);

-- Location: LCCOMB_X66_Y49_N14
\spec_tag_reg_in~13\ : cycloneii_lcell_comb
-- Equation(s):
-- \spec_tag_reg_in~13_combout\ = (\SPEC_TAG_REG|dout\(1) & (\spec_tag_reg_in~11_combout\ $ (((\spec_tag_reg_in~12_combout\) # (\SPEC_TAG_REG|dout\(0)))))) # (!\SPEC_TAG_REG|dout\(1) & (!\spec_tag_reg_in~11_combout\ & (\spec_tag_reg_in~12_combout\ $ 
-- (\SPEC_TAG_REG|dout\(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000011100110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \spec_tag_reg_in~12_combout\,
	datab => \SPEC_TAG_REG|dout\(0),
	datac => \SPEC_TAG_REG|dout\(1),
	datad => \spec_tag_reg_in~11_combout\,
	combout => \spec_tag_reg_in~13_combout\);

-- Location: LCCOMB_X94_Y43_N30
\PE|pen2|penout~59\ : cycloneii_lcell_comb
-- Equation(s):
-- \PE|pen2|penout~59_combout\ = (\free_rrf_vec~combout\(6) & (!\free_rrf_vec~combout\(4) & (\PE|pen1|pennext[5]~2_combout\ & !\free_rrf_vec~combout\(5)))) # (!\free_rrf_vec~combout\(6) & (((\PE|pen1|pennext[5]~2_combout\)) # (!\free_rrf_vec~combout\(4))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101000101110001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \free_rrf_vec~combout\(6),
	datab => \free_rrf_vec~combout\(4),
	datac => \PE|pen1|pennext[5]~2_combout\,
	datad => \free_rrf_vec~combout\(5),
	combout => \PE|pen2|penout~59_combout\);

-- Location: LCCOMB_X66_Y49_N30
\spec_tag_rs_out1~14\ : cycloneii_lcell_comb
-- Equation(s):
-- \spec_tag_rs_out1~14_combout\ = (\not_taken_branch_detected~combout\ & ((\SPEC_TAG_REG|dout\(0)) # ((\SPEC_TAG_REG|dout\(1))))) # (!\not_taken_branch_detected~combout\ & (((\process_0~10_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101011011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \not_taken_branch_detected~combout\,
	datab => \SPEC_TAG_REG|dout\(0),
	datac => \process_0~10_combout\,
	datad => \SPEC_TAG_REG|dout\(1),
	combout => \spec_tag_rs_out1~14_combout\);

-- Location: LCCOMB_X63_Y49_N10
\spec_tag_reg_in~14\ : cycloneii_lcell_comb
-- Equation(s):
-- \spec_tag_reg_in~14_combout\ = (\taken_branch_detected~combout\) # ((\x1_val~0_combout\ & (\spec_tag_rs_out2~1_combout\ & \Equal14~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111110000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \x1_val~0_combout\,
	datab => \spec_tag_rs_out2~1_combout\,
	datac => \Equal14~0_combout\,
	datad => \taken_branch_detected~combout\,
	combout => \spec_tag_reg_in~14_combout\);

-- Location: LCCOMB_X63_Y49_N16
\STORE_TAG_REG|dout[0]~18\ : cycloneii_lcell_comb
-- Equation(s):
-- \STORE_TAG_REG|dout[0]~18_combout\ = (\ra1_val_out~combout\ & ((\Equal0~9_combout\) # ((\Equal14~7_combout\ & \spec_tag_rs_out2~1_combout\)))) # (!\ra1_val_out~combout\ & (\Equal14~7_combout\ & ((\spec_tag_rs_out2~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110110010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ra1_val_out~combout\,
	datab => \Equal14~7_combout\,
	datac => \Equal0~9_combout\,
	datad => \spec_tag_rs_out2~1_combout\,
	combout => \STORE_TAG_REG|dout[0]~18_combout\);

-- Location: PIN_C29,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\free_rrf_vec[23]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_free_rrf_vec(23),
	combout => \free_rrf_vec~combout\(23));

-- Location: PIN_AD7,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\tag2[0]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_tag2(0),
	combout => \tag2~combout\(0));

-- Location: PIN_AF7,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\data2[3]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_data2(3),
	combout => \data2~combout\(3));

-- Location: PIN_AJ4,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\data2[4]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_data2(4),
	combout => \data2~combout\(4));

-- Location: PIN_AF3,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\data2[6]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_data2(6),
	combout => \data2~combout\(6));

-- Location: PIN_G5,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\data4[1]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_data4(1),
	combout => \data4~combout\(1));

-- Location: PIN_E13,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\data4[8]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_data4(8),
	combout => \data4~combout\(8));

-- Location: PIN_B14,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\data4[11]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_data4(11),
	combout => \data4~combout\(11));

-- Location: PIN_E14,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\data4[12]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_data4(12),
	combout => \data4~combout\(12));

-- Location: PIN_R3,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\data4[14]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_data4(14),
	combout => \data4~combout\(14));

-- Location: PIN_T2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\clk~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_clk,
	combout => \clk~combout\);

-- Location: CLKCTRL_G3
\clk~clkctrl\ : cycloneii_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \clk~clkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \clk~clkctrl_outclk\);

-- Location: PIN_G15,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\free_rrf_vec[2]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_free_rrf_vec(2),
	combout => \free_rrf_vec~combout\(2));

-- Location: PIN_H15,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\free_rrf_vec[0]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_free_rrf_vec(0),
	combout => \free_rrf_vec~combout\(0));

-- Location: PIN_H23,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\free_rrf_vec[1]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_free_rrf_vec(1),
	combout => \free_rrf_vec~combout\(1));

-- Location: LCCOMB_X93_Y44_N20
\PE|pen2|next_var~8\ : cycloneii_lcell_comb
-- Equation(s):
-- \PE|pen2|next_var~8_combout\ = (\free_rrf_vec~combout\(2) & (\free_rrf_vec~combout\(0) & \free_rrf_vec~combout\(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \free_rrf_vec~combout\(2),
	datac => \free_rrf_vec~combout\(0),
	datad => \free_rrf_vec~combout\(1),
	combout => \PE|pen2|next_var~8_combout\);

-- Location: PIN_H28,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\free_rrf_vec[3]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_free_rrf_vec(3),
	combout => \free_rrf_vec~combout\(3));

-- Location: LCCOMB_X93_Y44_N22
\PE|pen2|next_var~9\ : cycloneii_lcell_comb
-- Equation(s):
-- \PE|pen2|next_var~9_combout\ = (\free_rrf_vec~combout\(3) & ((\free_rrf_vec~combout\(2) & ((\free_rrf_vec~combout\(0)) # (\free_rrf_vec~combout\(1)))) # (!\free_rrf_vec~combout\(2) & (\free_rrf_vec~combout\(0) & \free_rrf_vec~combout\(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010100010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \free_rrf_vec~combout\(3),
	datab => \free_rrf_vec~combout\(2),
	datac => \free_rrf_vec~combout\(0),
	datad => \free_rrf_vec~combout\(1),
	combout => \PE|pen2|next_var~9_combout\);

-- Location: LCCOMB_X93_Y44_N14
\PE|pen2|next_var~10\ : cycloneii_lcell_comb
-- Equation(s):
-- \PE|pen2|next_var~10_combout\ = (\free_rrf_vec~combout\(3) & (!\free_rrf_vec~combout\(2) & (!\free_rrf_vec~combout\(0) & !\free_rrf_vec~combout\(1)))) # (!\free_rrf_vec~combout\(3) & ((\free_rrf_vec~combout\(2) & (!\free_rrf_vec~combout\(0) & 
-- !\free_rrf_vec~combout\(1))) # (!\free_rrf_vec~combout\(2) & ((!\free_rrf_vec~combout\(1)) # (!\free_rrf_vec~combout\(0))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000100010111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \free_rrf_vec~combout\(3),
	datab => \free_rrf_vec~combout\(2),
	datac => \free_rrf_vec~combout\(0),
	datad => \free_rrf_vec~combout\(1),
	combout => \PE|pen2|next_var~10_combout\);

-- Location: LCCOMB_X93_Y44_N28
\PE|pen1|pennext[5]~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \PE|pen1|pennext[5]~2_combout\ = (!\free_rrf_vec~combout\(3) & (!\free_rrf_vec~combout\(2) & (!\free_rrf_vec~combout\(0) & !\free_rrf_vec~combout\(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \free_rrf_vec~combout\(3),
	datab => \free_rrf_vec~combout\(2),
	datac => \free_rrf_vec~combout\(0),
	datad => \free_rrf_vec~combout\(1),
	combout => \PE|pen1|pennext[5]~2_combout\);

-- Location: PIN_F30,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\free_rrf_vec[4]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_free_rrf_vec(4),
	combout => \free_rrf_vec~combout\(4));

-- Location: LCCOMB_X94_Y44_N4
\PE|pen2|next_var~11\ : cycloneii_lcell_comb
-- Equation(s):
-- \PE|pen2|next_var~11_combout\ = (!\PE|pen2|next_var~10_combout\ & (!\PE|pen1|pennext[5]~2_combout\ & \free_rrf_vec~combout\(4)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \PE|pen2|next_var~10_combout\,
	datab => \PE|pen1|pennext[5]~2_combout\,
	datad => \free_rrf_vec~combout\(4),
	combout => \PE|pen2|next_var~11_combout\);

-- Location: PIN_K25,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\free_rrf_vec[5]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_free_rrf_vec(5),
	combout => \free_rrf_vec~combout\(5));

-- Location: LCCOMB_X94_Y43_N4
\PE|pen2|next_var~12\ : cycloneii_lcell_comb
-- Equation(s):
-- \PE|pen2|next_var~12_combout\ = (\free_rrf_vec~combout\(5) & ((\PE|pen2|next_var~10_combout\ & (\free_rrf_vec~combout\(4) & !\PE|pen1|pennext[5]~2_combout\)) # (!\PE|pen2|next_var~10_combout\ & ((\free_rrf_vec~combout\(4)) # 
-- (!\PE|pen1|pennext[5]~2_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100110100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \PE|pen2|next_var~10_combout\,
	datab => \free_rrf_vec~combout\(4),
	datac => \PE|pen1|pennext[5]~2_combout\,
	datad => \free_rrf_vec~combout\(5),
	combout => \PE|pen2|next_var~12_combout\);

-- Location: LCCOMB_X94_Y43_N14
\PE|pen1|Equal0~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \PE|pen1|Equal0~0_combout\ = (!\free_rrf_vec~combout\(4) & (\PE|pen1|pennext[5]~2_combout\ & !\free_rrf_vec~combout\(5)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \free_rrf_vec~combout\(4),
	datac => \PE|pen1|pennext[5]~2_combout\,
	datad => \free_rrf_vec~combout\(5),
	combout => \PE|pen1|Equal0~0_combout\);

-- Location: LCCOMB_X94_Y43_N24
\PE|pen2|next_var~13\ : cycloneii_lcell_comb
-- Equation(s):
-- \PE|pen2|next_var~13_combout\ = (\PE|pen2|next_var~10_combout\ & ((\free_rrf_vec~combout\(4) & (\PE|pen1|pennext[5]~2_combout\ & !\free_rrf_vec~combout\(5))) # (!\free_rrf_vec~combout\(4) & ((\PE|pen1|pennext[5]~2_combout\) # 
-- (!\free_rrf_vec~combout\(5))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010000010100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \PE|pen2|next_var~10_combout\,
	datab => \free_rrf_vec~combout\(4),
	datac => \PE|pen1|pennext[5]~2_combout\,
	datad => \free_rrf_vec~combout\(5),
	combout => \PE|pen2|next_var~13_combout\);

-- Location: PIN_H26,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\free_rrf_vec[6]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_free_rrf_vec(6),
	combout => \free_rrf_vec~combout\(6));

-- Location: LCCOMB_X94_Y43_N22
\PE|pen2|next_var~14\ : cycloneii_lcell_comb
-- Equation(s):
-- \PE|pen2|next_var~14_combout\ = (!\PE|pen1|Equal0~0_combout\ & (!\PE|pen2|next_var~13_combout\ & \free_rrf_vec~combout\(6)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000001100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \PE|pen1|Equal0~0_combout\,
	datac => \PE|pen2|next_var~13_combout\,
	datad => \free_rrf_vec~combout\(6),
	combout => \PE|pen2|next_var~14_combout\);

-- Location: PIN_F29,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\free_rrf_vec[7]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_free_rrf_vec(7),
	combout => \free_rrf_vec~combout\(7));

-- Location: LCCOMB_X94_Y43_N12
\PE|pen2|next_var~15\ : cycloneii_lcell_comb
-- Equation(s):
-- \PE|pen2|next_var~15_combout\ = (\free_rrf_vec~combout\(7) & ((\free_rrf_vec~combout\(6) & ((!\PE|pen2|next_var~13_combout\) # (!\PE|pen1|Equal0~0_combout\))) # (!\free_rrf_vec~combout\(6) & (!\PE|pen1|Equal0~0_combout\ & 
-- !\PE|pen2|next_var~13_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010101100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \free_rrf_vec~combout\(6),
	datab => \PE|pen1|Equal0~0_combout\,
	datac => \PE|pen2|next_var~13_combout\,
	datad => \free_rrf_vec~combout\(7),
	combout => \PE|pen2|next_var~15_combout\);

-- Location: LCCOMB_X94_Y43_N16
\PE|pen1|penout[3]~44\ : cycloneii_lcell_comb
-- Equation(s):
-- \PE|pen1|penout[3]~44_combout\ = (\PE|pen1|penout~9_combout\ & (!\free_rrf_vec~combout\(4) & (\PE|pen1|pennext[5]~2_combout\ & !\free_rrf_vec~combout\(5))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \PE|pen1|penout~9_combout\,
	datab => \free_rrf_vec~combout\(4),
	datac => \PE|pen1|pennext[5]~2_combout\,
	datad => \free_rrf_vec~combout\(5),
	combout => \PE|pen1|penout[3]~44_combout\);

-- Location: PIN_M27,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\free_rrf_vec[8]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_free_rrf_vec(8),
	combout => \free_rrf_vec~combout\(8));

-- Location: LCCOMB_X94_Y43_N18
\PE|pen2|penout~14\ : cycloneii_lcell_comb
-- Equation(s):
-- \PE|pen2|penout~14_combout\ = (\free_rrf_vec~combout\(6) & (!\free_rrf_vec~combout\(4) & (\PE|pen1|pennext[5]~2_combout\ & !\free_rrf_vec~combout\(5)))) # (!\free_rrf_vec~combout\(6) & ((\free_rrf_vec~combout\(4) & (\PE|pen1|pennext[5]~2_combout\ & 
-- !\free_rrf_vec~combout\(5))) # (!\free_rrf_vec~combout\(4) & ((\PE|pen1|pennext[5]~2_combout\) # (!\free_rrf_vec~combout\(5))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000001110001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \free_rrf_vec~combout\(6),
	datab => \free_rrf_vec~combout\(4),
	datac => \PE|pen1|pennext[5]~2_combout\,
	datad => \free_rrf_vec~combout\(5),
	combout => \PE|pen2|penout~14_combout\);

-- Location: LCCOMB_X94_Y43_N8
\PE|pen2|penout~15\ : cycloneii_lcell_comb
-- Equation(s):
-- \PE|pen2|penout~15_combout\ = (\PE|pen2|penout~14_combout\ & (((!\free_rrf_vec~combout\(6) & \PE|pen1|Equal0~0_combout\)) # (!\free_rrf_vec~combout\(7))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \free_rrf_vec~combout\(6),
	datab => \PE|pen2|penout~14_combout\,
	datac => \PE|pen1|Equal0~0_combout\,
	datad => \free_rrf_vec~combout\(7),
	combout => \PE|pen2|penout~15_combout\);

-- Location: LCCOMB_X94_Y42_N4
\PE|pen2|next_var~16\ : cycloneii_lcell_comb
-- Equation(s):
-- \PE|pen2|next_var~16_combout\ = (!\PE|pen1|penout[3]~44_combout\ & (\free_rrf_vec~combout\(8) & ((!\PE|pen2|penout~15_combout\) # (!\PE|pen2|next_var~10_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \PE|pen1|penout[3]~44_combout\,
	datab => \PE|pen2|next_var~10_combout\,
	datac => \free_rrf_vec~combout\(8),
	datad => \PE|pen2|penout~15_combout\,
	combout => \PE|pen2|next_var~16_combout\);

-- Location: LCCOMB_X93_Y43_N0
\PE|pen1|penout[1]~8\ : cycloneii_lcell_comb
-- Equation(s):
-- \PE|pen1|penout[1]~8_combout\ = (!\free_rrf_vec~combout\(4) & !\free_rrf_vec~combout\(5))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \free_rrf_vec~combout\(4),
	datad => \free_rrf_vec~combout\(5),
	combout => \PE|pen1|penout[1]~8_combout\);

-- Location: LCCOMB_X93_Y43_N16
\PE|pen1|pennext[7]~4\ : cycloneii_lcell_comb
-- Equation(s):
-- \PE|pen1|pennext[7]~4_combout\ = (\free_rrf_vec~combout\(7) & ((\free_rrf_vec~combout\(6)) # ((!\PE|pen1|pennext[5]~2_combout\) # (!\PE|pen1|penout[1]~8_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \free_rrf_vec~combout\(6),
	datab => \PE|pen1|penout[1]~8_combout\,
	datac => \PE|pen1|pennext[5]~2_combout\,
	datad => \free_rrf_vec~combout\(7),
	combout => \PE|pen1|pennext[7]~4_combout\);

-- Location: LCCOMB_X93_Y42_N16
\PE|pen2|penout~16\ : cycloneii_lcell_comb
-- Equation(s):
-- \PE|pen2|penout~16_combout\ = (\PE|pen2|next_var~10_combout\ & (!\PE|pen1|pennext[7]~4_combout\ & \PE|pen2|penout~14_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \PE|pen2|next_var~10_combout\,
	datac => \PE|pen1|pennext[7]~4_combout\,
	datad => \PE|pen2|penout~14_combout\,
	combout => \PE|pen2|penout~16_combout\);

-- Location: PIN_G30,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\free_rrf_vec[9]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_free_rrf_vec(9),
	combout => \free_rrf_vec~combout\(9));

-- Location: LCCOMB_X94_Y42_N18
\PE|pen1|pennext[9]~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \PE|pen1|pennext[9]~3_combout\ = (\free_rrf_vec~combout\(9) & (((\free_rrf_vec~combout\(8)) # (!\PE|pen1|Equal0~0_combout\)) # (!\PE|pen1|penout~9_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111011100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \PE|pen1|penout~9_combout\,
	datab => \PE|pen1|Equal0~0_combout\,
	datac => \free_rrf_vec~combout\(8),
	datad => \free_rrf_vec~combout\(9),
	combout => \PE|pen1|pennext[9]~3_combout\);

-- Location: LCCOMB_X94_Y42_N8
\PE|pen2|next_var~17\ : cycloneii_lcell_comb
-- Equation(s):
-- \PE|pen2|next_var~17_combout\ = (\PE|pen1|pennext[9]~3_combout\ & (((!\PE|pen1|penout[3]~44_combout\ & \free_rrf_vec~combout\(8))) # (!\PE|pen2|penout~16_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111001100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \PE|pen1|penout[3]~44_combout\,
	datab => \PE|pen2|penout~16_combout\,
	datac => \free_rrf_vec~combout\(8),
	datad => \PE|pen1|pennext[9]~3_combout\,
	combout => \PE|pen2|next_var~17_combout\);

-- Location: PIN_L22,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\free_rrf_vec[10]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_free_rrf_vec(10),
	combout => \free_rrf_vec~combout\(10));

-- Location: LCCOMB_X94_Y42_N16
\PE|pen1|pennext[10]~6\ : cycloneii_lcell_comb
-- Equation(s):
-- \PE|pen1|pennext[10]~6_combout\ = (!\PE|pen1|pennext[10]~5_combout\ & \free_rrf_vec~combout\(10))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101000001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \PE|pen1|pennext[10]~5_combout\,
	datac => \free_rrf_vec~combout\(10),
	combout => \PE|pen1|pennext[10]~6_combout\);

-- Location: LCCOMB_X94_Y42_N30
\PE|pen2|penout~17\ : cycloneii_lcell_comb
-- Equation(s):
-- \PE|pen2|penout~17_combout\ = (\free_rrf_vec~combout\(8) & (\PE|pen1|penout~9_combout\ & (\PE|pen1|Equal0~0_combout\ & !\free_rrf_vec~combout\(9)))) # (!\free_rrf_vec~combout\(8) & (((\PE|pen1|penout~9_combout\ & \PE|pen1|Equal0~0_combout\)) # 
-- (!\free_rrf_vec~combout\(9))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000100010001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \PE|pen1|penout~9_combout\,
	datab => \PE|pen1|Equal0~0_combout\,
	datac => \free_rrf_vec~combout\(8),
	datad => \free_rrf_vec~combout\(9),
	combout => \PE|pen2|penout~17_combout\);

-- Location: LCCOMB_X94_Y42_N28
\PE|pen2|next_var~18\ : cycloneii_lcell_comb
-- Equation(s):
-- \PE|pen2|next_var~18_combout\ = (\PE|pen1|pennext[10]~6_combout\ & (((!\PE|pen2|next_var~10_combout\) # (!\PE|pen2|penout~15_combout\)) # (!\PE|pen2|penout~17_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010101010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \PE|pen1|pennext[10]~6_combout\,
	datab => \PE|pen2|penout~17_combout\,
	datac => \PE|pen2|penout~15_combout\,
	datad => \PE|pen2|next_var~10_combout\,
	combout => \PE|pen2|next_var~18_combout\);

-- Location: PIN_L21,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\free_rrf_vec[11]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_free_rrf_vec(11),
	combout => \free_rrf_vec~combout\(11));

-- Location: LCCOMB_X94_Y42_N10
\PE|pen1|pennext[11]~7\ : cycloneii_lcell_comb
-- Equation(s):
-- \PE|pen1|pennext[11]~7_combout\ = (\free_rrf_vec~combout\(11) & ((\free_rrf_vec~combout\(10)) # (!\PE|pen1|pennext[10]~5_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \PE|pen1|pennext[10]~5_combout\,
	datac => \free_rrf_vec~combout\(10),
	datad => \free_rrf_vec~combout\(11),
	combout => \PE|pen1|pennext[11]~7_combout\);

-- Location: LCCOMB_X94_Y42_N20
\PE|pen2|next_var~19\ : cycloneii_lcell_comb
-- Equation(s):
-- \PE|pen2|next_var~19_combout\ = (\PE|pen1|pennext[11]~7_combout\ & (((\PE|pen1|pennext[10]~6_combout\) # (!\PE|pen2|penout~17_combout\)) # (!\PE|pen2|penout~16_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010001010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \PE|pen1|pennext[11]~7_combout\,
	datab => \PE|pen2|penout~16_combout\,
	datac => \PE|pen1|pennext[10]~6_combout\,
	datad => \PE|pen2|penout~17_combout\,
	combout => \PE|pen2|next_var~19_combout\);

-- Location: PIN_L28,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\free_rrf_vec[12]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_free_rrf_vec(12),
	combout => \free_rrf_vec~combout\(12));

-- Location: LCCOMB_X94_Y42_N26
\PE|pen2|penout~57\ : cycloneii_lcell_comb
-- Equation(s):
-- \PE|pen2|penout~57_combout\ = (\PE|pen2|penout~17_combout\ & ((\PE|pen1|pennext[10]~5_combout\ & ((!\free_rrf_vec~combout\(11)) # (!\free_rrf_vec~combout\(10)))) # (!\PE|pen1|pennext[10]~5_combout\ & (!\free_rrf_vec~combout\(10) & 
-- !\free_rrf_vec~combout\(11)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000100010001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \PE|pen1|pennext[10]~5_combout\,
	datab => \PE|pen2|penout~17_combout\,
	datac => \free_rrf_vec~combout\(10),
	datad => \free_rrf_vec~combout\(11),
	combout => \PE|pen2|penout~57_combout\);

-- Location: LCCOMB_X93_Y43_N14
\PE|pen1|penout~9\ : cycloneii_lcell_comb
-- Equation(s):
-- \PE|pen1|penout~9_combout\ = (!\free_rrf_vec~combout\(6) & !\free_rrf_vec~combout\(7))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \free_rrf_vec~combout\(6),
	datad => \free_rrf_vec~combout\(7),
	combout => \PE|pen1|penout~9_combout\);

-- Location: LCCOMB_X94_Y42_N0
\PE|pen1|penout~11\ : cycloneii_lcell_comb
-- Equation(s):
-- \PE|pen1|penout~11_combout\ = (!\free_rrf_vec~combout\(11) & !\free_rrf_vec~combout\(10))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000010100000101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \free_rrf_vec~combout\(11),
	datac => \free_rrf_vec~combout\(10),
	combout => \PE|pen1|penout~11_combout\);

-- Location: LCCOMB_X93_Y43_N4
\PE|pen1|pennext[12]~8\ : cycloneii_lcell_comb
-- Equation(s):
-- \PE|pen1|pennext[12]~8_combout\ = (\PE|pen1|penout~10_combout\ & (\PE|pen1|penout~9_combout\ & (\PE|pen1|Equal0~0_combout\ & \PE|pen1|penout~11_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \PE|pen1|penout~10_combout\,
	datab => \PE|pen1|penout~9_combout\,
	datac => \PE|pen1|Equal0~0_combout\,
	datad => \PE|pen1|penout~11_combout\,
	combout => \PE|pen1|pennext[12]~8_combout\);

-- Location: LCCOMB_X94_Y41_N8
\PE|pen2|next_var~20\ : cycloneii_lcell_comb
-- Equation(s):
-- \PE|pen2|next_var~20_combout\ = (\free_rrf_vec~combout\(12) & (!\PE|pen1|pennext[12]~8_combout\ & ((!\PE|pen2|penout~57_combout\) # (!\PE|pen2|penout~16_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \PE|pen2|penout~16_combout\,
	datab => \free_rrf_vec~combout\(12),
	datac => \PE|pen2|penout~57_combout\,
	datad => \PE|pen1|pennext[12]~8_combout\,
	combout => \PE|pen2|next_var~20_combout\);

-- Location: LCCOMB_X94_Y41_N10
\PE|pen2|next_var~21\ : cycloneii_lcell_comb
-- Equation(s):
-- \PE|pen2|next_var~21_combout\ = (((\free_rrf_vec~combout\(12) & !\PE|pen1|pennext[12]~8_combout\)) # (!\PE|pen2|penout~57_combout\)) # (!\PE|pen2|penout~16_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101111111011111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \PE|pen2|penout~16_combout\,
	datab => \free_rrf_vec~combout\(12),
	datac => \PE|pen2|penout~57_combout\,
	datad => \PE|pen1|pennext[12]~8_combout\,
	combout => \PE|pen2|next_var~21_combout\);

-- Location: PIN_H30,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\free_rrf_vec[13]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_free_rrf_vec(13),
	combout => \free_rrf_vec~combout\(13));

-- Location: LCCOMB_X94_Y41_N12
\PE|pen2|next_var~22\ : cycloneii_lcell_comb
-- Equation(s):
-- \PE|pen2|next_var~22_combout\ = (\PE|pen2|next_var~21_combout\ & (\free_rrf_vec~combout\(13) & ((\free_rrf_vec~combout\(12)) # (!\PE|pen1|pennext[12]~8_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010001000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \PE|pen2|next_var~21_combout\,
	datab => \PE|pen1|pennext[12]~8_combout\,
	datac => \free_rrf_vec~combout\(12),
	datad => \free_rrf_vec~combout\(13),
	combout => \PE|pen2|next_var~22_combout\);

-- Location: LCCOMB_X94_Y41_N26
\PE|pen1|penout~12\ : cycloneii_lcell_comb
-- Equation(s):
-- \PE|pen1|penout~12_combout\ = (!\free_rrf_vec~combout\(12) & !\free_rrf_vec~combout\(13))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \free_rrf_vec~combout\(12),
	datad => \free_rrf_vec~combout\(13),
	combout => \PE|pen1|penout~12_combout\);

-- Location: LCCOMB_X93_Y43_N18
\PE|pen1|pennext[10]~5\ : cycloneii_lcell_comb
-- Equation(s):
-- \PE|pen1|pennext[10]~5_combout\ = (\PE|pen1|penout~10_combout\ & (\PE|pen1|penout~9_combout\ & (\PE|pen1|pennext[5]~2_combout\ & \PE|pen1|penout[1]~8_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \PE|pen1|penout~10_combout\,
	datab => \PE|pen1|penout~9_combout\,
	datac => \PE|pen1|pennext[5]~2_combout\,
	datad => \PE|pen1|penout[1]~8_combout\,
	combout => \PE|pen1|pennext[10]~5_combout\);

-- Location: PIN_L24,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\free_rrf_vec[14]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_free_rrf_vec(14),
	combout => \free_rrf_vec~combout\(14));

-- Location: LCCOMB_X94_Y41_N20
\PE|pen1|pennext[14]~9\ : cycloneii_lcell_comb
-- Equation(s):
-- \PE|pen1|pennext[14]~9_combout\ = (\free_rrf_vec~combout\(14) & (((!\PE|pen1|pennext[10]~5_combout\) # (!\PE|pen1|penout~12_combout\)) # (!\PE|pen1|penout~11_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \PE|pen1|penout~11_combout\,
	datab => \PE|pen1|penout~12_combout\,
	datac => \PE|pen1|pennext[10]~5_combout\,
	datad => \free_rrf_vec~combout\(14),
	combout => \PE|pen1|pennext[14]~9_combout\);

-- Location: LCCOMB_X94_Y41_N6
\PE|pen2|penout~19\ : cycloneii_lcell_comb
-- Equation(s):
-- \PE|pen2|penout~19_combout\ = (\free_rrf_vec~combout\(12) & (\PE|pen1|penout~11_combout\ & (\PE|pen1|pennext[10]~5_combout\ & !\free_rrf_vec~combout\(13)))) # (!\free_rrf_vec~combout\(12) & (((\PE|pen1|penout~11_combout\ & 
-- \PE|pen1|pennext[10]~5_combout\)) # (!\free_rrf_vec~combout\(13))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000100010001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \PE|pen1|penout~11_combout\,
	datab => \PE|pen1|pennext[10]~5_combout\,
	datac => \free_rrf_vec~combout\(12),
	datad => \free_rrf_vec~combout\(13),
	combout => \PE|pen2|penout~19_combout\);

-- Location: LCCOMB_X93_Y42_N10
\PE|pen2|next_var~23\ : cycloneii_lcell_comb
-- Equation(s):
-- \PE|pen2|next_var~23_combout\ = (\PE|pen1|pennext[14]~9_combout\ & (((!\PE|pen2|penout~19_combout\) # (!\PE|pen2|penout~16_combout\)) # (!\PE|pen2|penout~57_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100110011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \PE|pen2|penout~57_combout\,
	datab => \PE|pen1|pennext[14]~9_combout\,
	datac => \PE|pen2|penout~16_combout\,
	datad => \PE|pen2|penout~19_combout\,
	combout => \PE|pen2|next_var~23_combout\);

-- Location: PIN_M23,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\free_rrf_vec[15]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_free_rrf_vec(15),
	combout => \free_rrf_vec~combout\(15));

-- Location: LCCOMB_X94_Y41_N16
\PE|pen1|pennext[15]~10\ : cycloneii_lcell_comb
-- Equation(s):
-- \PE|pen1|pennext[15]~10_combout\ = (\free_rrf_vec~combout\(15) & ((\free_rrf_vec~combout\(14)) # ((!\PE|pen1|pennext[12]~8_combout\) # (!\PE|pen1|penout~12_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \free_rrf_vec~combout\(14),
	datab => \PE|pen1|penout~12_combout\,
	datac => \free_rrf_vec~combout\(15),
	datad => \PE|pen1|pennext[12]~8_combout\,
	combout => \PE|pen1|pennext[15]~10_combout\);

-- Location: LCCOMB_X94_Y42_N14
\PE|pen2|penout~18\ : cycloneii_lcell_comb
-- Equation(s):
-- \PE|pen2|penout~18_combout\ = (\PE|pen1|pennext[10]~5_combout\ & ((!\free_rrf_vec~combout\(11)) # (!\free_rrf_vec~combout\(10)))) # (!\PE|pen1|pennext[10]~5_combout\ & (!\free_rrf_vec~combout\(10) & !\free_rrf_vec~combout\(11)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000101010101111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \PE|pen1|pennext[10]~5_combout\,
	datac => \free_rrf_vec~combout\(10),
	datad => \free_rrf_vec~combout\(11),
	combout => \PE|pen2|penout~18_combout\);

-- Location: LCCOMB_X93_Y42_N8
\PE|pen2|next_var~24\ : cycloneii_lcell_comb
-- Equation(s):
-- \PE|pen2|next_var~24_combout\ = (\PE|pen2|penout~16_combout\ & (\PE|pen2|penout~19_combout\ & (\PE|pen2|penout~18_combout\ & \PE|pen2|penout~17_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \PE|pen2|penout~16_combout\,
	datab => \PE|pen2|penout~19_combout\,
	datac => \PE|pen2|penout~18_combout\,
	datad => \PE|pen2|penout~17_combout\,
	combout => \PE|pen2|next_var~24_combout\);

-- Location: LCCOMB_X94_Y40_N4
\PE|pen2|next_var~25\ : cycloneii_lcell_comb
-- Equation(s):
-- \PE|pen2|next_var~25_combout\ = (\PE|pen1|pennext[15]~10_combout\ & ((\PE|pen1|pennext[14]~9_combout\) # (!\PE|pen2|next_var~24_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \PE|pen1|pennext[15]~10_combout\,
	datac => \PE|pen1|pennext[14]~9_combout\,
	datad => \PE|pen2|next_var~24_combout\,
	combout => \PE|pen2|next_var~25_combout\);

-- Location: LCCOMB_X94_Y41_N2
\PE|pen2|penout~20\ : cycloneii_lcell_comb
-- Equation(s):
-- \PE|pen2|penout~20_combout\ = (\free_rrf_vec~combout\(14) & (\PE|pen1|penout~12_combout\ & (!\free_rrf_vec~combout\(15) & \PE|pen1|pennext[12]~8_combout\))) # (!\free_rrf_vec~combout\(14) & (((\PE|pen1|penout~12_combout\ & 
-- \PE|pen1|pennext[12]~8_combout\)) # (!\free_rrf_vec~combout\(15))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100110100000101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \free_rrf_vec~combout\(14),
	datab => \PE|pen1|penout~12_combout\,
	datac => \free_rrf_vec~combout\(15),
	datad => \PE|pen1|pennext[12]~8_combout\,
	combout => \PE|pen2|penout~20_combout\);

-- Location: LCCOMB_X93_Y42_N18
\PE|pen2|next_var~26\ : cycloneii_lcell_comb
-- Equation(s):
-- \PE|pen2|next_var~26_combout\ = (\PE|pen2|penout~57_combout\ & (\PE|pen2|penout~19_combout\ & (\PE|pen2|penout~16_combout\ & \PE|pen2|penout~20_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \PE|pen2|penout~57_combout\,
	datab => \PE|pen2|penout~19_combout\,
	datac => \PE|pen2|penout~16_combout\,
	datad => \PE|pen2|penout~20_combout\,
	combout => \PE|pen2|next_var~26_combout\);

-- Location: LCCOMB_X94_Y41_N30
\PE|pen1|penout~13\ : cycloneii_lcell_comb
-- Equation(s):
-- \PE|pen1|penout~13_combout\ = (!\free_rrf_vec~combout\(15) & !\free_rrf_vec~combout\(14))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \free_rrf_vec~combout\(15),
	datad => \free_rrf_vec~combout\(14),
	combout => \PE|pen1|penout~13_combout\);

-- Location: LCCOMB_X94_Y41_N28
\PE|pen1|penout[4]~14\ : cycloneii_lcell_comb
-- Equation(s):
-- \PE|pen1|penout[4]~14_combout\ = (\PE|pen1|penout~11_combout\ & (\PE|pen1|penout~12_combout\ & (\PE|pen1|pennext[10]~5_combout\ & \PE|pen1|penout~13_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \PE|pen1|penout~11_combout\,
	datab => \PE|pen1|penout~12_combout\,
	datac => \PE|pen1|pennext[10]~5_combout\,
	datad => \PE|pen1|penout~13_combout\,
	combout => \PE|pen1|penout[4]~14_combout\);

-- Location: PIN_M24,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\free_rrf_vec[16]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_free_rrf_vec(16),
	combout => \free_rrf_vec~combout\(16));

-- Location: LCCOMB_X93_Y41_N16
\PE|pen2|next_var~27\ : cycloneii_lcell_comb
-- Equation(s):
-- \PE|pen2|next_var~27_combout\ = (!\PE|pen2|next_var~26_combout\ & (!\PE|pen1|penout[4]~14_combout\ & \free_rrf_vec~combout\(16)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000010100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \PE|pen2|next_var~26_combout\,
	datac => \PE|pen1|penout[4]~14_combout\,
	datad => \free_rrf_vec~combout\(16),
	combout => \PE|pen2|next_var~27_combout\);

-- Location: PIN_M21,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\free_rrf_vec[17]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_free_rrf_vec(17),
	combout => \free_rrf_vec~combout\(17));

-- Location: LCCOMB_X93_Y41_N2
\PE|pen2|next_var~28\ : cycloneii_lcell_comb
-- Equation(s):
-- \PE|pen2|next_var~28_combout\ = (\free_rrf_vec~combout\(17) & ((\PE|pen2|next_var~26_combout\ & (!\PE|pen1|penout[4]~14_combout\ & \free_rrf_vec~combout\(16))) # (!\PE|pen2|next_var~26_combout\ & ((\free_rrf_vec~combout\(16)) # 
-- (!\PE|pen1|penout[4]~14_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010101000000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \free_rrf_vec~combout\(17),
	datab => \PE|pen2|next_var~26_combout\,
	datac => \PE|pen1|penout[4]~14_combout\,
	datad => \free_rrf_vec~combout\(16),
	combout => \PE|pen2|next_var~28_combout\);

-- Location: LCCOMB_X93_Y42_N28
\PE|pen2|next_var~30\ : cycloneii_lcell_comb
-- Equation(s):
-- \PE|pen2|next_var~30_combout\ = (\PE|pen2|penout~20_combout\ & (\PE|pen2|penout~19_combout\ & (\PE|pen2|penout~18_combout\ & \PE|pen2|penout~17_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \PE|pen2|penout~20_combout\,
	datab => \PE|pen2|penout~19_combout\,
	datac => \PE|pen2|penout~18_combout\,
	datad => \PE|pen2|penout~17_combout\,
	combout => \PE|pen2|next_var~30_combout\);

-- Location: LCCOMB_X93_Y44_N2
\PE|pen1|pennext[3]~12\ : cycloneii_lcell_comb
-- Equation(s):
-- \PE|pen1|pennext[3]~12_combout\ = (\free_rrf_vec~combout\(3) & ((\free_rrf_vec~combout\(2)) # ((\free_rrf_vec~combout\(0)) # (\free_rrf_vec~combout\(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101010101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \free_rrf_vec~combout\(3),
	datab => \free_rrf_vec~combout\(2),
	datac => \free_rrf_vec~combout\(0),
	datad => \free_rrf_vec~combout\(1),
	combout => \PE|pen1|pennext[3]~12_combout\);

-- Location: LCCOMB_X93_Y42_N2
\PE|pen2|Equal0~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \PE|pen2|Equal0~0_combout\ = (\PE|pen2|penout~21_combout\ & (\PE|pen2|next_var~30_combout\ & (!\PE|pen1|pennext[3]~12_combout\ & \PE|pen2|penout~15_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \PE|pen2|penout~21_combout\,
	datab => \PE|pen2|next_var~30_combout\,
	datac => \PE|pen1|pennext[3]~12_combout\,
	datad => \PE|pen2|penout~15_combout\,
	combout => \PE|pen2|Equal0~0_combout\);

-- Location: PIN_N23,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\free_rrf_vec[18]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_free_rrf_vec(18),
	combout => \free_rrf_vec~combout\(18));

-- Location: LCCOMB_X93_Y41_N0
\PE|pen1|pennext[18]~11\ : cycloneii_lcell_comb
-- Equation(s):
-- \PE|pen1|pennext[18]~11_combout\ = (\free_rrf_vec~combout\(18) & ((\free_rrf_vec~combout\(17)) # ((\free_rrf_vec~combout\(16)) # (!\PE|pen1|penout[4]~14_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110010001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \free_rrf_vec~combout\(17),
	datab => \free_rrf_vec~combout\(18),
	datac => \PE|pen1|penout[4]~14_combout\,
	datad => \free_rrf_vec~combout\(16),
	combout => \PE|pen1|pennext[18]~11_combout\);

-- Location: LCCOMB_X93_Y44_N8
\PE|pen2|next_var~29\ : cycloneii_lcell_comb
-- Equation(s):
-- \PE|pen2|next_var~29_combout\ = (\free_rrf_vec~combout\(2) & (!\free_rrf_vec~combout\(0) & !\free_rrf_vec~combout\(1))) # (!\free_rrf_vec~combout\(2) & ((!\free_rrf_vec~combout\(1)) # (!\free_rrf_vec~combout\(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000001100111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \free_rrf_vec~combout\(2),
	datac => \free_rrf_vec~combout\(0),
	datad => \free_rrf_vec~combout\(1),
	combout => \PE|pen2|next_var~29_combout\);

-- Location: LCCOMB_X93_Y45_N0
\PE|pen2|next_var~31\ : cycloneii_lcell_comb
-- Equation(s):
-- \PE|pen2|next_var~31_combout\ = (\PE|pen1|pennext[18]~11_combout\ & ((!\PE|pen2|next_var~29_combout\) # (!\PE|pen2|Equal0~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \PE|pen2|Equal0~0_combout\,
	datac => \PE|pen1|pennext[18]~11_combout\,
	datad => \PE|pen2|next_var~29_combout\,
	combout => \PE|pen2|next_var~31_combout\);

-- Location: LCCOMB_X93_Y43_N22
\PE|pen1|pennext[17]~13\ : cycloneii_lcell_comb
-- Equation(s):
-- \PE|pen1|pennext[17]~13_combout\ = (\PE|pen1|penout~10_combout\ & (\PE|pen1|penout~11_combout\ & (\PE|pen1|penout~9_combout\ & !\free_rrf_vec~combout\(16))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \PE|pen1|penout~10_combout\,
	datab => \PE|pen1|penout~11_combout\,
	datac => \PE|pen1|penout~9_combout\,
	datad => \free_rrf_vec~combout\(16),
	combout => \PE|pen1|pennext[17]~13_combout\);

-- Location: LCCOMB_X93_Y43_N8
\PE|pen1|pennext[17]~14\ : cycloneii_lcell_comb
-- Equation(s):
-- \PE|pen1|pennext[17]~14_combout\ = (\PE|pen1|penout~13_combout\ & (\PE|pen1|penout~12_combout\ & (\PE|pen1|Equal0~0_combout\ & \PE|pen1|pennext[17]~13_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \PE|pen1|penout~13_combout\,
	datab => \PE|pen1|penout~12_combout\,
	datac => \PE|pen1|Equal0~0_combout\,
	datad => \PE|pen1|pennext[17]~13_combout\,
	combout => \PE|pen1|pennext[17]~14_combout\);

-- Location: PIN_K26,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\free_rrf_vec[19]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_free_rrf_vec(19),
	combout => \free_rrf_vec~combout\(19));

-- Location: LCCOMB_X93_Y41_N24
\PE|pen1|pennext[19]~15\ : cycloneii_lcell_comb
-- Equation(s):
-- \PE|pen1|pennext[19]~15_combout\ = (\free_rrf_vec~combout\(19) & ((\free_rrf_vec~combout\(17)) # ((\free_rrf_vec~combout\(18)) # (!\PE|pen1|pennext[17]~14_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \free_rrf_vec~combout\(17),
	datab => \free_rrf_vec~combout\(18),
	datac => \PE|pen1|pennext[17]~14_combout\,
	datad => \free_rrf_vec~combout\(19),
	combout => \PE|pen1|pennext[19]~15_combout\);

-- Location: LCCOMB_X93_Y45_N14
\PE|pen2|next_var~32\ : cycloneii_lcell_comb
-- Equation(s):
-- \PE|pen2|next_var~32_combout\ = (\PE|pen1|pennext[19]~15_combout\ & ((\PE|pen1|pennext[18]~11_combout\) # ((!\PE|pen2|next_var~29_combout\) # (!\PE|pen2|Equal0~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \PE|pen1|pennext[18]~11_combout\,
	datab => \PE|pen2|Equal0~0_combout\,
	datac => \PE|pen1|pennext[19]~15_combout\,
	datad => \PE|pen2|next_var~29_combout\,
	combout => \PE|pen2|next_var~32_combout\);

-- Location: PIN_H29,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\free_rrf_vec[20]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_free_rrf_vec(20),
	combout => \free_rrf_vec~combout\(20));

-- Location: LCCOMB_X93_Y41_N12
\PE|pen1|pennext[20]~17\ : cycloneii_lcell_comb
-- Equation(s):
-- \PE|pen1|pennext[20]~17_combout\ = (\free_rrf_vec~combout\(20) & (((\free_rrf_vec~combout\(16)) # (!\PE|pen1|penout[4]~14_combout\)) # (!\PE|pen1|pennext[20]~16_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110001001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \PE|pen1|pennext[20]~16_combout\,
	datab => \free_rrf_vec~combout\(20),
	datac => \PE|pen1|penout[4]~14_combout\,
	datad => \free_rrf_vec~combout\(16),
	combout => \PE|pen1|pennext[20]~17_combout\);

-- Location: LCCOMB_X93_Y42_N30
\PE|pen2|next_var~34\ : cycloneii_lcell_comb
-- Equation(s):
-- \PE|pen2|next_var~34_combout\ = (\PE|pen2|penout~21_combout\ & (\PE|pen2|penout~18_combout\ & \PE|pen2|penout~17_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \PE|pen2|penout~21_combout\,
	datac => \PE|pen2|penout~18_combout\,
	datad => \PE|pen2|penout~17_combout\,
	combout => \PE|pen2|next_var~34_combout\);

-- Location: LCCOMB_X93_Y41_N18
\PE|pen2|penout~22\ : cycloneii_lcell_comb
-- Equation(s):
-- \PE|pen2|penout~22_combout\ = (\free_rrf_vec~combout\(18) & (!\free_rrf_vec~combout\(17) & (\PE|pen1|pennext[17]~14_combout\ & !\free_rrf_vec~combout\(19)))) # (!\free_rrf_vec~combout\(18) & (((!\free_rrf_vec~combout\(17) & 
-- \PE|pen1|pennext[17]~14_combout\)) # (!\free_rrf_vec~combout\(19))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000001110011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \free_rrf_vec~combout\(17),
	datab => \free_rrf_vec~combout\(18),
	datac => \PE|pen1|pennext[17]~14_combout\,
	datad => \free_rrf_vec~combout\(19),
	combout => \PE|pen2|penout~22_combout\);

-- Location: LCCOMB_X93_Y42_N24
\PE|pen2|next_var~35\ : cycloneii_lcell_comb
-- Equation(s):
-- \PE|pen2|next_var~35_combout\ = (\PE|pen2|next_var~33_combout\ & (\PE|pen2|next_var~34_combout\ & (\PE|pen2|penout~22_combout\ & \PE|pen2|penout~20_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \PE|pen2|next_var~33_combout\,
	datab => \PE|pen2|next_var~34_combout\,
	datac => \PE|pen2|penout~22_combout\,
	datad => \PE|pen2|penout~20_combout\,
	combout => \PE|pen2|next_var~35_combout\);

-- Location: LCCOMB_X93_Y45_N4
\PE|pen2|next_var~36\ : cycloneii_lcell_comb
-- Equation(s):
-- \PE|pen2|next_var~36_combout\ = (\PE|pen1|pennext[20]~17_combout\ & ((!\PE|pen2|next_var~29_combout\) # (!\PE|pen2|next_var~35_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010001010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \PE|pen1|pennext[20]~17_combout\,
	datab => \PE|pen2|next_var~35_combout\,
	datad => \PE|pen2|next_var~29_combout\,
	combout => \PE|pen2|next_var~36_combout\);

-- Location: PIN_K27,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\free_rrf_vec[21]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_free_rrf_vec(21),
	combout => \free_rrf_vec~combout\(21));

-- Location: LCCOMB_X94_Y43_N20
\PE|pen1|pennext[21]~18\ : cycloneii_lcell_comb
-- Equation(s):
-- \PE|pen1|pennext[21]~18_combout\ = (\free_rrf_vec~combout\(21) & ((!\PE|pen1|Equal0~0_combout\) # (!\PE|pen1|Equal0~2_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100110001001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \PE|pen1|Equal0~2_combout\,
	datab => \free_rrf_vec~combout\(21),
	datac => \PE|pen1|Equal0~0_combout\,
	combout => \PE|pen1|pennext[21]~18_combout\);

-- Location: LCCOMB_X93_Y45_N30
\PE|pen2|next_var~37\ : cycloneii_lcell_comb
-- Equation(s):
-- \PE|pen2|next_var~37_combout\ = (\PE|pen1|pennext[21]~18_combout\ & (((\PE|pen1|pennext[20]~17_combout\) # (!\PE|pen2|next_var~35_combout\)) # (!\PE|pen2|next_var~29_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000001110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \PE|pen2|next_var~29_combout\,
	datab => \PE|pen2|next_var~35_combout\,
	datac => \PE|pen1|pennext[21]~18_combout\,
	datad => \PE|pen1|pennext[20]~17_combout\,
	combout => \PE|pen2|next_var~37_combout\);

-- Location: LCCOMB_X93_Y41_N6
\PE|pen1|pennext[20]~16\ : cycloneii_lcell_comb
-- Equation(s):
-- \PE|pen1|pennext[20]~16_combout\ = (!\free_rrf_vec~combout\(17) & (!\free_rrf_vec~combout\(18) & !\free_rrf_vec~combout\(19)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \free_rrf_vec~combout\(17),
	datac => \free_rrf_vec~combout\(18),
	datad => \free_rrf_vec~combout\(19),
	combout => \PE|pen1|pennext[20]~16_combout\);

-- Location: LCCOMB_X93_Y45_N8
\PE|pen2|penout~23\ : cycloneii_lcell_comb
-- Equation(s):
-- \PE|pen2|penout~23_combout\ = (!\PE|pen1|pennext[21]~18_combout\ & (((\PE|pen1|pennext[17]~14_combout\ & \PE|pen1|pennext[20]~16_combout\)) # (!\free_rrf_vec~combout\(20))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000100000001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \PE|pen1|pennext[17]~14_combout\,
	datab => \PE|pen1|pennext[20]~16_combout\,
	datac => \PE|pen1|pennext[21]~18_combout\,
	datad => \free_rrf_vec~combout\(20),
	combout => \PE|pen2|penout~23_combout\);

-- Location: LCCOMB_X94_Y41_N0
\PE|pen1|penout~15\ : cycloneii_lcell_comb
-- Equation(s):
-- \PE|pen1|penout~15_combout\ = (!\free_rrf_vec~combout\(14) & (!\free_rrf_vec~combout\(15) & (!\free_rrf_vec~combout\(12) & !\free_rrf_vec~combout\(13))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \free_rrf_vec~combout\(14),
	datab => \free_rrf_vec~combout\(15),
	datac => \free_rrf_vec~combout\(12),
	datad => \free_rrf_vec~combout\(13),
	combout => \PE|pen1|penout~15_combout\);

-- Location: LCCOMB_X93_Y41_N28
\PE|pen1|penout~17\ : cycloneii_lcell_comb
-- Equation(s):
-- \PE|pen1|penout~17_combout\ = (!\free_rrf_vec~combout\(17) & (!\free_rrf_vec~combout\(16) & (!\free_rrf_vec~combout\(18) & !\free_rrf_vec~combout\(19))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \free_rrf_vec~combout\(17),
	datab => \free_rrf_vec~combout\(16),
	datac => \free_rrf_vec~combout\(18),
	datad => \free_rrf_vec~combout\(19),
	combout => \PE|pen1|penout~17_combout\);

-- Location: LCCOMB_X94_Y43_N10
\PE|pen1|Equal0~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \PE|pen1|Equal0~1_combout\ = (!\free_rrf_vec~combout\(20) & (!\free_rrf_vec~combout\(7) & !\free_rrf_vec~combout\(6)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000010001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \free_rrf_vec~combout\(20),
	datab => \free_rrf_vec~combout\(7),
	datad => \free_rrf_vec~combout\(6),
	combout => \PE|pen1|Equal0~1_combout\);

-- Location: LCCOMB_X94_Y44_N22
\PE|pen1|Equal0~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \PE|pen1|Equal0~2_combout\ = (\PE|pen1|penout[2]~16_combout\ & (\PE|pen1|penout~15_combout\ & (\PE|pen1|penout~17_combout\ & \PE|pen1|Equal0~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \PE|pen1|penout[2]~16_combout\,
	datab => \PE|pen1|penout~15_combout\,
	datac => \PE|pen1|penout~17_combout\,
	datad => \PE|pen1|Equal0~1_combout\,
	combout => \PE|pen1|Equal0~2_combout\);

-- Location: PIN_E30,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\free_rrf_vec[22]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_free_rrf_vec(22),
	combout => \free_rrf_vec~combout\(22));

-- Location: LCCOMB_X94_Y45_N4
\PE|pen1|pennext[22]~19\ : cycloneii_lcell_comb
-- Equation(s):
-- \PE|pen1|pennext[22]~19_combout\ = (\free_rrf_vec~combout\(22) & (((\free_rrf_vec~combout\(21)) # (!\PE|pen1|Equal0~2_combout\)) # (!\PE|pen1|Equal0~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \PE|pen1|Equal0~0_combout\,
	datab => \free_rrf_vec~combout\(21),
	datac => \PE|pen1|Equal0~2_combout\,
	datad => \free_rrf_vec~combout\(22),
	combout => \PE|pen1|pennext[22]~19_combout\);

-- Location: LCCOMB_X93_Y45_N26
\PE|pen2|next_var~38\ : cycloneii_lcell_comb
-- Equation(s):
-- \PE|pen2|next_var~38_combout\ = (\PE|pen1|pennext[22]~19_combout\ & (((!\PE|pen2|penout~23_combout\) # (!\PE|pen2|next_var~35_combout\)) # (!\PE|pen2|next_var~29_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \PE|pen2|next_var~29_combout\,
	datab => \PE|pen2|next_var~35_combout\,
	datac => \PE|pen2|penout~23_combout\,
	datad => \PE|pen1|pennext[22]~19_combout\,
	combout => \PE|pen2|next_var~38_combout\);

-- Location: LCCOMB_X94_Y43_N2
\PE|pen1|pennext[21]~37\ : cycloneii_lcell_comb
-- Equation(s):
-- \PE|pen1|pennext[21]~37_combout\ = (\PE|pen1|Equal0~2_combout\ & (!\free_rrf_vec~combout\(4) & (\PE|pen1|pennext[5]~2_combout\ & !\free_rrf_vec~combout\(5))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \PE|pen1|Equal0~2_combout\,
	datab => \free_rrf_vec~combout\(4),
	datac => \PE|pen1|pennext[5]~2_combout\,
	datad => \free_rrf_vec~combout\(5),
	combout => \PE|pen1|pennext[21]~37_combout\);

-- Location: LCCOMB_X94_Y45_N30
\PE|pen1|pennext[23]~20\ : cycloneii_lcell_comb
-- Equation(s):
-- \PE|pen1|pennext[23]~20_combout\ = (\free_rrf_vec~combout\(23) & (((\free_rrf_vec~combout\(21)) # (\free_rrf_vec~combout\(22))) # (!\PE|pen1|pennext[21]~37_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101010100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \free_rrf_vec~combout\(23),
	datab => \PE|pen1|pennext[21]~37_combout\,
	datac => \free_rrf_vec~combout\(21),
	datad => \free_rrf_vec~combout\(22),
	combout => \PE|pen1|pennext[23]~20_combout\);

-- Location: LCCOMB_X93_Y45_N20
\PE|pen2|next_var~39\ : cycloneii_lcell_comb
-- Equation(s):
-- \PE|pen2|next_var~39_combout\ = (\PE|pen2|next_var~35_combout\ & \PE|pen2|penout~23_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \PE|pen2|next_var~35_combout\,
	datac => \PE|pen2|penout~23_combout\,
	combout => \PE|pen2|next_var~39_combout\);

-- Location: LCCOMB_X93_Y45_N6
\PE|pen2|next_var~40\ : cycloneii_lcell_comb
-- Equation(s):
-- \PE|pen2|next_var~40_combout\ = (\PE|pen1|pennext[23]~20_combout\ & (((\PE|pen1|pennext[22]~19_combout\) # (!\PE|pen2|next_var~39_combout\)) # (!\PE|pen2|next_var~29_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110001001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \PE|pen2|next_var~29_combout\,
	datab => \PE|pen1|pennext[23]~20_combout\,
	datac => \PE|pen2|next_var~39_combout\,
	datad => \PE|pen1|pennext[22]~19_combout\,
	combout => \PE|pen2|next_var~40_combout\);

-- Location: LCCOMB_X93_Y44_N0
\PE|pen1|pennext[2]~24\ : cycloneii_lcell_comb
-- Equation(s):
-- \PE|pen1|pennext[2]~24_combout\ = (\free_rrf_vec~combout\(2) & ((\free_rrf_vec~combout\(0)) # (\free_rrf_vec~combout\(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \free_rrf_vec~combout\(2),
	datac => \free_rrf_vec~combout\(0),
	datad => \free_rrf_vec~combout\(1),
	combout => \PE|pen1|pennext[2]~24_combout\);

-- Location: LCCOMB_X94_Y45_N28
\PE|pen2|penout~24\ : cycloneii_lcell_comb
-- Equation(s):
-- \PE|pen2|penout~24_combout\ = (\free_rrf_vec~combout\(23) & (\PE|pen1|pennext[21]~37_combout\ & (!\free_rrf_vec~combout\(21) & !\free_rrf_vec~combout\(22)))) # (!\free_rrf_vec~combout\(23) & (((\PE|pen1|pennext[21]~37_combout\ & 
-- !\free_rrf_vec~combout\(21))) # (!\free_rrf_vec~combout\(22))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000010001011101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \free_rrf_vec~combout\(23),
	datab => \PE|pen1|pennext[21]~37_combout\,
	datac => \free_rrf_vec~combout\(21),
	datad => \free_rrf_vec~combout\(22),
	combout => \PE|pen2|penout~24_combout\);

-- Location: LCCOMB_X93_Y45_N12
\PE|pen2|Equal0~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \PE|pen2|Equal0~1_combout\ = (\PE|pen2|next_var~35_combout\ & (!\PE|pen1|pennext[2]~24_combout\ & (\PE|pen2|penout~23_combout\ & \PE|pen2|penout~24_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \PE|pen2|next_var~35_combout\,
	datab => \PE|pen1|pennext[2]~24_combout\,
	datac => \PE|pen2|penout~23_combout\,
	datad => \PE|pen2|penout~24_combout\,
	combout => \PE|pen2|Equal0~1_combout\);

-- Location: PIN_D29,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\free_rrf_vec[24]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_free_rrf_vec(24),
	combout => \free_rrf_vec~combout\(24));

-- Location: LCCOMB_X94_Y45_N0
\PE|pen1|pennext[24]~21\ : cycloneii_lcell_comb
-- Equation(s):
-- \PE|pen1|pennext[24]~21_combout\ = (!\free_rrf_vec~combout\(23) & (!\free_rrf_vec~combout\(21) & !\free_rrf_vec~combout\(22)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \free_rrf_vec~combout\(23),
	datac => \free_rrf_vec~combout\(21),
	datad => \free_rrf_vec~combout\(22),
	combout => \PE|pen1|pennext[24]~21_combout\);

-- Location: LCCOMB_X94_Y45_N10
\PE|pen1|pennext[24]~22\ : cycloneii_lcell_comb
-- Equation(s):
-- \PE|pen1|pennext[24]~22_combout\ = (\free_rrf_vec~combout\(24) & (((!\PE|pen1|pennext[24]~21_combout\) # (!\PE|pen1|Equal0~2_combout\)) # (!\PE|pen1|Equal0~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \PE|pen1|Equal0~0_combout\,
	datab => \PE|pen1|Equal0~2_combout\,
	datac => \free_rrf_vec~combout\(24),
	datad => \PE|pen1|pennext[24]~21_combout\,
	combout => \PE|pen1|pennext[24]~22_combout\);

-- Location: LCCOMB_X93_Y49_N16
\PE|pen2|next_var~49\ : cycloneii_lcell_comb
-- Equation(s):
-- \PE|pen2|next_var~49_combout\ = (\PE|pen1|pennext[24]~22_combout\ & (((\free_rrf_vec~combout\(0) & \free_rrf_vec~combout\(1))) # (!\PE|pen2|Equal0~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100010001000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \PE|pen2|Equal0~1_combout\,
	datab => \PE|pen1|pennext[24]~22_combout\,
	datac => \free_rrf_vec~combout\(0),
	datad => \free_rrf_vec~combout\(1),
	combout => \PE|pen2|next_var~49_combout\);

-- Location: LCCOMB_X94_Y47_N0
\PE|pen1|pennext[1]~23\ : cycloneii_lcell_comb
-- Equation(s):
-- \PE|pen1|pennext[1]~23_combout\ = (\free_rrf_vec~combout\(1) & \free_rrf_vec~combout\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \free_rrf_vec~combout\(1),
	datac => \free_rrf_vec~combout\(0),
	combout => \PE|pen1|pennext[1]~23_combout\);

-- Location: LCCOMB_X94_Y45_N22
\PE|pen1|pennext[26]~25\ : cycloneii_lcell_comb
-- Equation(s):
-- \PE|pen1|pennext[26]~25_combout\ = (!\free_rrf_vec~combout\(23) & (!\free_rrf_vec~combout\(21) & (!\free_rrf_vec~combout\(24) & !\free_rrf_vec~combout\(22))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \free_rrf_vec~combout\(23),
	datab => \free_rrf_vec~combout\(21),
	datac => \free_rrf_vec~combout\(24),
	datad => \free_rrf_vec~combout\(22),
	combout => \PE|pen1|pennext[26]~25_combout\);

-- Location: PIN_D28,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\free_rrf_vec[25]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_free_rrf_vec(25),
	combout => \free_rrf_vec~combout\(25));

-- Location: LCCOMB_X94_Y45_N8
\PE|pen1|pennext[25]~26\ : cycloneii_lcell_comb
-- Equation(s):
-- \PE|pen1|pennext[25]~26_combout\ = (\free_rrf_vec~combout\(25) & (((!\PE|pen1|Equal0~2_combout\) # (!\PE|pen1|pennext[26]~25_combout\)) # (!\PE|pen1|Equal0~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \PE|pen1|Equal0~0_combout\,
	datab => \PE|pen1|pennext[26]~25_combout\,
	datac => \PE|pen1|Equal0~2_combout\,
	datad => \free_rrf_vec~combout\(25),
	combout => \PE|pen1|pennext[25]~26_combout\);

-- Location: LCCOMB_X93_Y49_N4
\PE|pen2|next_var~41\ : cycloneii_lcell_comb
-- Equation(s):
-- \PE|pen2|next_var~41_combout\ = (\PE|pen1|pennext[25]~26_combout\ & (((\PE|pen1|pennext[1]~23_combout\) # (\PE|pen1|pennext[24]~22_combout\)) # (!\PE|pen2|Equal0~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \PE|pen2|Equal0~1_combout\,
	datab => \PE|pen1|pennext[1]~23_combout\,
	datac => \PE|pen1|pennext[24]~22_combout\,
	datad => \PE|pen1|pennext[25]~26_combout\,
	combout => \PE|pen2|next_var~41_combout\);

-- Location: LCCOMB_X94_Y44_N14
\PE|pen1|pennext[26]~28\ : cycloneii_lcell_comb
-- Equation(s):
-- \PE|pen1|pennext[26]~28_combout\ = (\PE|pen1|penout[1]~18_combout\ & (\PE|pen1|Equal0~2_combout\ & (\PE|pen1|penout[1]~8_combout\ & \PE|pen1|pennext[26]~25_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \PE|pen1|penout[1]~18_combout\,
	datab => \PE|pen1|Equal0~2_combout\,
	datac => \PE|pen1|penout[1]~8_combout\,
	datad => \PE|pen1|pennext[26]~25_combout\,
	combout => \PE|pen1|pennext[26]~28_combout\);

-- Location: PIN_G25,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\free_rrf_vec[26]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_free_rrf_vec(26),
	combout => \free_rrf_vec~combout\(26));

-- Location: LCCOMB_X94_Y44_N20
\PE|pen1|pennext[26]~29\ : cycloneii_lcell_comb
-- Equation(s):
-- \PE|pen1|pennext[26]~29_combout\ = (\PE|pen1|pennext[26]~27_combout\) # ((\free_rrf_vec~combout\(26) & ((\free_rrf_vec~combout\(25)) # (!\PE|pen1|pennext[26]~28_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101010111010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \PE|pen1|pennext[26]~27_combout\,
	datab => \PE|pen1|pennext[26]~28_combout\,
	datac => \free_rrf_vec~combout\(26),
	datad => \free_rrf_vec~combout\(25),
	combout => \PE|pen1|pennext[26]~29_combout\);

-- Location: LCCOMB_X94_Y45_N6
\PE|pen2|penout~25\ : cycloneii_lcell_comb
-- Equation(s):
-- \PE|pen2|penout~25_combout\ = (!\PE|pen1|pennext[25]~26_combout\ & (((\PE|pen1|pennext[24]~21_combout\ & \PE|pen1|pennext[21]~37_combout\)) # (!\free_rrf_vec~combout\(24))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100010100000101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \PE|pen1|pennext[25]~26_combout\,
	datab => \PE|pen1|pennext[24]~21_combout\,
	datac => \free_rrf_vec~combout\(24),
	datad => \PE|pen1|pennext[21]~37_combout\,
	combout => \PE|pen2|penout~25_combout\);

-- Location: LCCOMB_X93_Y45_N10
\PE|pen2|next_var~42\ : cycloneii_lcell_comb
-- Equation(s):
-- \PE|pen2|next_var~42_combout\ = (\PE|pen1|pennext[26]~29_combout\ & (!\PE|pen1|pennext[1]~23_combout\ & ((!\PE|pen2|penout~25_combout\) # (!\PE|pen2|Equal0~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000010000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \PE|pen2|Equal0~1_combout\,
	datab => \PE|pen1|pennext[26]~29_combout\,
	datac => \PE|pen1|pennext[1]~23_combout\,
	datad => \PE|pen2|penout~25_combout\,
	combout => \PE|pen2|next_var~42_combout\);

-- Location: LCCOMB_X94_Y44_N6
\PE|pen2|next_var~50\ : cycloneii_lcell_comb
-- Equation(s):
-- \PE|pen2|next_var~50_combout\ = (\PE|pen2|next_var~42_combout\) # ((\free_rrf_vec~combout\(0) & (\free_rrf_vec~combout\(26) & \free_rrf_vec~combout\(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \PE|pen2|next_var~42_combout\,
	datab => \free_rrf_vec~combout\(0),
	datac => \free_rrf_vec~combout\(26),
	datad => \free_rrf_vec~combout\(1),
	combout => \PE|pen2|next_var~50_combout\);

-- Location: LCCOMB_X93_Y44_N16
\PE|pen1|pennext[27]~30\ : cycloneii_lcell_comb
-- Equation(s):
-- \PE|pen1|pennext[27]~30_combout\ = (\free_rrf_vec~combout\(3)) # ((\free_rrf_vec~combout\(2)) # ((\free_rrf_vec~combout\(0)) # (\free_rrf_vec~combout\(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \free_rrf_vec~combout\(3),
	datab => \free_rrf_vec~combout\(2),
	datac => \free_rrf_vec~combout\(0),
	datad => \free_rrf_vec~combout\(1),
	combout => \PE|pen1|pennext[27]~30_combout\);

-- Location: PIN_F28,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\free_rrf_vec[27]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_free_rrf_vec(27),
	combout => \free_rrf_vec~combout\(27));

-- Location: LCCOMB_X94_Y47_N6
\PE|pen1|pennext[27]~32\ : cycloneii_lcell_comb
-- Equation(s):
-- \PE|pen1|pennext[27]~32_combout\ = (\free_rrf_vec~combout\(27) & ((\PE|pen1|pennext[27]~30_combout\) # (!\PE|pen1|pennext[27]~31_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \PE|pen1|pennext[27]~31_combout\,
	datab => \PE|pen1|pennext[27]~30_combout\,
	datad => \free_rrf_vec~combout\(27),
	combout => \PE|pen1|pennext[27]~32_combout\);

-- Location: LCCOMB_X93_Y45_N28
\PE|pen2|next_var~43\ : cycloneii_lcell_comb
-- Equation(s):
-- \PE|pen2|next_var~43_combout\ = ((\PE|pen1|pennext[26]~29_combout\) # ((!\PE|pen2|penout~24_combout\) # (!\PE|pen2|next_var~39_combout\))) # (!\PE|pen2|penout~25_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101111111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \PE|pen2|penout~25_combout\,
	datab => \PE|pen1|pennext[26]~29_combout\,
	datac => \PE|pen2|next_var~39_combout\,
	datad => \PE|pen2|penout~24_combout\,
	combout => \PE|pen2|next_var~43_combout\);

-- Location: LCCOMB_X94_Y47_N16
\PE|pen2|next_var~44\ : cycloneii_lcell_comb
-- Equation(s):
-- \PE|pen2|next_var~44_combout\ = (\PE|pen2|next_var~29_combout\ & (\PE|pen1|pennext[27]~32_combout\ & (\PE|pen2|next_var~43_combout\))) # (!\PE|pen2|next_var~29_combout\ & (((\free_rrf_vec~combout\(27)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101010110000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \PE|pen2|next_var~29_combout\,
	datab => \PE|pen1|pennext[27]~32_combout\,
	datac => \PE|pen2|next_var~43_combout\,
	datad => \free_rrf_vec~combout\(27),
	combout => \PE|pen2|next_var~44_combout\);

-- Location: LCCOMB_X93_Y49_N22
\PE|pen2|penout~26\ : cycloneii_lcell_comb
-- Equation(s):
-- \PE|pen2|penout~26_combout\ = (!\PE|pen1|pennext[25]~26_combout\ & (!\PE|pen1|pennext[24]~22_combout\ & (!\PE|pen1|pennext[26]~29_combout\ & !\PE|pen1|pennext[27]~32_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \PE|pen1|pennext[25]~26_combout\,
	datab => \PE|pen1|pennext[24]~22_combout\,
	datac => \PE|pen1|pennext[26]~29_combout\,
	datad => \PE|pen1|pennext[27]~32_combout\,
	combout => \PE|pen2|penout~26_combout\);

-- Location: LCCOMB_X93_Y49_N8
\PE|pen2|Equal0~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \PE|pen2|Equal0~2_combout\ = (\PE|pen2|Equal0~1_combout\ & \PE|pen2|penout~26_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \PE|pen2|Equal0~1_combout\,
	datad => \PE|pen2|penout~26_combout\,
	combout => \PE|pen2|Equal0~2_combout\);

-- Location: PIN_G26,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\free_rrf_vec[28]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_free_rrf_vec(28),
	combout => \free_rrf_vec~combout\(28));

-- Location: LCCOMB_X94_Y47_N14
\PE|pen1|pennext[28]~33\ : cycloneii_lcell_comb
-- Equation(s):
-- \PE|pen1|pennext[28]~33_combout\ = (\free_rrf_vec~combout\(28) & (((\free_rrf_vec~combout\(27)) # (!\PE|pen1|pennext[5]~2_combout\)) # (!\PE|pen1|pennext[27]~31_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110001001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \PE|pen1|pennext[27]~31_combout\,
	datab => \free_rrf_vec~combout\(28),
	datac => \PE|pen1|pennext[5]~2_combout\,
	datad => \free_rrf_vec~combout\(27),
	combout => \PE|pen1|pennext[28]~33_combout\);

-- Location: LCCOMB_X94_Y47_N28
\PE|pen2|next_var~45\ : cycloneii_lcell_comb
-- Equation(s):
-- \PE|pen2|next_var~45_combout\ = (\PE|pen1|pennext[1]~23_combout\ & (((\free_rrf_vec~combout\(28))))) # (!\PE|pen1|pennext[1]~23_combout\ & (!\PE|pen2|Equal0~2_combout\ & (\PE|pen1|pennext[28]~33_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110000010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \PE|pen2|Equal0~2_combout\,
	datab => \PE|pen1|pennext[1]~23_combout\,
	datac => \PE|pen1|pennext[28]~33_combout\,
	datad => \free_rrf_vec~combout\(28),
	combout => \PE|pen2|next_var~45_combout\);

-- Location: LCCOMB_X94_Y47_N22
\PE|pen2|next_var~46\ : cycloneii_lcell_comb
-- Equation(s):
-- \PE|pen2|next_var~46_combout\ = (\PE|pen1|pennext[29]~35_combout\ & (!\PE|pen1|pennext[1]~23_combout\ & ((\PE|pen1|pennext[28]~33_combout\) # (!\PE|pen2|Equal0~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \PE|pen1|pennext[29]~35_combout\,
	datab => \PE|pen1|pennext[28]~33_combout\,
	datac => \PE|pen2|Equal0~2_combout\,
	datad => \PE|pen1|pennext[1]~23_combout\,
	combout => \PE|pen2|next_var~46_combout\);

-- Location: PIN_E27,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\free_rrf_vec[29]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_free_rrf_vec(29),
	combout => \free_rrf_vec~combout\(29));

-- Location: LCCOMB_X94_Y47_N24
\PE|pen2|next_var~51\ : cycloneii_lcell_comb
-- Equation(s):
-- \PE|pen2|next_var~51_combout\ = (\PE|pen2|next_var~46_combout\) # ((\free_rrf_vec~combout\(1) & (\free_rrf_vec~combout\(29) & \free_rrf_vec~combout\(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110110011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \free_rrf_vec~combout\(1),
	datab => \PE|pen2|next_var~46_combout\,
	datac => \free_rrf_vec~combout\(29),
	datad => \free_rrf_vec~combout\(0),
	combout => \PE|pen2|next_var~51_combout\);

-- Location: LCCOMB_X94_Y47_N18
\PE|pen1|Equal0~4\ : cycloneii_lcell_comb
-- Equation(s):
-- \PE|pen1|Equal0~4_combout\ = (!\free_rrf_vec~combout\(28) & !\free_rrf_vec~combout\(27))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000110011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \free_rrf_vec~combout\(28),
	datad => \free_rrf_vec~combout\(27),
	combout => \PE|pen1|Equal0~4_combout\);

-- Location: LCCOMB_X94_Y44_N10
\PE|pen1|Equal0~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \PE|pen1|Equal0~3_combout\ = (!\free_rrf_vec~combout\(26) & !\free_rrf_vec~combout\(25))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \free_rrf_vec~combout\(26),
	datad => \free_rrf_vec~combout\(25),
	combout => \PE|pen1|Equal0~3_combout\);

-- Location: LCCOMB_X94_Y44_N2
\PE|pen1|Equal0~5\ : cycloneii_lcell_comb
-- Equation(s):
-- \PE|pen1|Equal0~5_combout\ = (\PE|pen1|pennext[26]~25_combout\ & (\PE|pen1|Equal0~4_combout\ & (\PE|pen1|Equal0~2_combout\ & \PE|pen1|Equal0~3_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \PE|pen1|pennext[26]~25_combout\,
	datab => \PE|pen1|Equal0~4_combout\,
	datac => \PE|pen1|Equal0~2_combout\,
	datad => \PE|pen1|Equal0~3_combout\,
	combout => \PE|pen1|Equal0~5_combout\);

-- Location: LCCOMB_X94_Y43_N26
\PE|pen1|pennext[29]~34\ : cycloneii_lcell_comb
-- Equation(s):
-- \PE|pen1|pennext[29]~34_combout\ = (\free_rrf_vec~combout\(4)) # ((\free_rrf_vec~combout\(5)) # (!\PE|pen1|pennext[5]~2_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \free_rrf_vec~combout\(4),
	datac => \PE|pen1|pennext[5]~2_combout\,
	datad => \free_rrf_vec~combout\(5),
	combout => \PE|pen1|pennext[29]~34_combout\);

-- Location: LCCOMB_X94_Y47_N2
\PE|pen2|penout~27\ : cycloneii_lcell_comb
-- Equation(s):
-- \PE|pen2|penout~27_combout\ = (!\PE|pen1|pennext[28]~33_combout\ & (((\PE|pen1|Equal0~5_combout\ & !\PE|pen1|pennext[29]~34_combout\)) # (!\free_rrf_vec~combout\(29))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000010100001101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \free_rrf_vec~combout\(29),
	datab => \PE|pen1|Equal0~5_combout\,
	datac => \PE|pen1|pennext[28]~33_combout\,
	datad => \PE|pen1|pennext[29]~34_combout\,
	combout => \PE|pen2|penout~27_combout\);

-- Location: PIN_J24,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\free_rrf_vec[30]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_free_rrf_vec(30),
	combout => \free_rrf_vec~combout\(30));

-- Location: LCCOMB_X94_Y47_N4
\PE|pen1|pennext[30]~36\ : cycloneii_lcell_comb
-- Equation(s):
-- \PE|pen1|pennext[30]~36_combout\ = (\free_rrf_vec~combout\(30) & (((\free_rrf_vec~combout\(29)) # (!\PE|pen1|Equal0~5_combout\)) # (!\PE|pen1|Equal0~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110001001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \PE|pen1|Equal0~0_combout\,
	datab => \free_rrf_vec~combout\(30),
	datac => \PE|pen1|Equal0~5_combout\,
	datad => \free_rrf_vec~combout\(29),
	combout => \PE|pen1|pennext[30]~36_combout\);

-- Location: LCCOMB_X94_Y47_N8
\PE|pen2|next_var~47\ : cycloneii_lcell_comb
-- Equation(s):
-- \PE|pen2|next_var~47_combout\ = (\PE|pen1|pennext[30]~36_combout\ & (!\PE|pen1|pennext[1]~23_combout\ & ((!\PE|pen2|penout~27_combout\) # (!\PE|pen2|Equal0~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \PE|pen2|Equal0~2_combout\,
	datab => \PE|pen2|penout~27_combout\,
	datac => \PE|pen1|pennext[30]~36_combout\,
	datad => \PE|pen1|pennext[1]~23_combout\,
	combout => \PE|pen2|next_var~47_combout\);

-- Location: LCCOMB_X94_Y47_N26
\PE|pen2|next_var~52\ : cycloneii_lcell_comb
-- Equation(s):
-- \PE|pen2|next_var~52_combout\ = (\PE|pen2|next_var~47_combout\) # ((\free_rrf_vec~combout\(1) & (\free_rrf_vec~combout\(30) & \free_rrf_vec~combout\(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110110011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \free_rrf_vec~combout\(1),
	datab => \PE|pen2|next_var~47_combout\,
	datac => \free_rrf_vec~combout\(30),
	datad => \free_rrf_vec~combout\(0),
	combout => \PE|pen2|next_var~52_combout\);

-- Location: PIN_C27,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\free_rrf_vec[31]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_free_rrf_vec(31),
	combout => \free_rrf_vec~combout\(31));

-- Location: LCCOMB_X93_Y45_N2
\PE|pen2|Equal0~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \PE|pen2|Equal0~3_combout\ = (!\PE|pen1|pennext[30]~36_combout\ & (!\PE|pen1|pennext[2]~24_combout\ & (\PE|pen2|penout~23_combout\ & \PE|pen2|penout~24_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \PE|pen1|pennext[30]~36_combout\,
	datab => \PE|pen1|pennext[2]~24_combout\,
	datac => \PE|pen2|penout~23_combout\,
	datad => \PE|pen2|penout~24_combout\,
	combout => \PE|pen2|Equal0~3_combout\);

-- Location: LCCOMB_X93_Y49_N26
\PE|pen2|Equal0~4\ : cycloneii_lcell_comb
-- Equation(s):
-- \PE|pen2|Equal0~4_combout\ = (\PE|pen2|next_var~35_combout\ & (\PE|pen2|Equal0~3_combout\ & (\PE|pen2|penout~27_combout\ & \PE|pen2|penout~26_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \PE|pen2|next_var~35_combout\,
	datab => \PE|pen2|Equal0~3_combout\,
	datac => \PE|pen2|penout~27_combout\,
	datad => \PE|pen2|penout~26_combout\,
	combout => \PE|pen2|Equal0~4_combout\);

-- Location: LCCOMB_X94_Y47_N10
\PE|pen1|Equal0~6\ : cycloneii_lcell_comb
-- Equation(s):
-- \PE|pen1|Equal0~6_combout\ = (\PE|pen1|Equal0~0_combout\ & (!\free_rrf_vec~combout\(30) & (\PE|pen1|Equal0~5_combout\ & !\free_rrf_vec~combout\(29))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \PE|pen1|Equal0~0_combout\,
	datab => \free_rrf_vec~combout\(30),
	datac => \PE|pen1|Equal0~5_combout\,
	datad => \free_rrf_vec~combout\(29),
	combout => \PE|pen1|Equal0~6_combout\);

-- Location: LCCOMB_X93_Y49_N24
\PE|pen2|next_var~48\ : cycloneii_lcell_comb
-- Equation(s):
-- \PE|pen2|next_var~48_combout\ = (\free_rrf_vec~combout\(31) & ((\PE|pen1|pennext[1]~23_combout\) # ((!\PE|pen2|Equal0~4_combout\ & !\PE|pen1|Equal0~6_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101000000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \free_rrf_vec~combout\(31),
	datab => \PE|pen2|Equal0~4_combout\,
	datac => \PE|pen1|Equal0~6_combout\,
	datad => \PE|pen1|pennext[1]~23_combout\,
	combout => \PE|pen2|next_var~48_combout\);

-- Location: PIN_AF1,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\ra1_ir_out[2]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_ra1_ir_out(2),
	combout => \ra1_ir_out~combout\(2));

-- Location: PIN_AC13,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\ra1_ir_out[1]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_ra1_ir_out(1),
	combout => \ra1_ir_out~combout\(1));

-- Location: PIN_AJ16,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\ra1_ir_out[0]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_ra1_ir_out(0),
	combout => \ra1_ir_out~combout\(0));

-- Location: LCCOMB_X23_Y1_N0
\Ard1a~6\ : cycloneii_lcell_comb
-- Equation(s):
-- \Ard1a~6_combout\ = (!\ra1_ir_out~combout\(2) & ((!\ra1_ir_out~combout\(0)) # (!\ra1_ir_out~combout\(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000001100110011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \ra1_ir_out~combout\(2),
	datac => \ra1_ir_out~combout\(1),
	datad => \ra1_ir_out~combout\(0),
	combout => \Ard1a~6_combout\);

-- Location: PIN_AF12,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\ra1_ir_out[13]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_ra1_ir_out(13),
	combout => \ra1_ir_out~combout\(13));

-- Location: PIN_AD26,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\ra1_ir_out[14]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_ra1_ir_out(14),
	combout => \ra1_ir_out~combout\(14));

-- Location: LCCOMB_X22_Y1_N20
\Ard1a~12\ : cycloneii_lcell_comb
-- Equation(s):
-- \Ard1a~12_combout\ = (!\ra1_ir_out~combout\(12) & (!\Ard1a~6_combout\ & (\ra1_ir_out~combout\(13) & !\ra1_ir_out~combout\(14))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ra1_ir_out~combout\(12),
	datab => \Ard1a~6_combout\,
	datac => \ra1_ir_out~combout\(13),
	datad => \ra1_ir_out~combout\(14),
	combout => \Ard1a~12_combout\);

-- Location: LCCOMB_X19_Y1_N14
\Ard1a~11\ : cycloneii_lcell_comb
-- Equation(s):
-- \Ard1a~11_combout\ = (\ra1_ir_out~combout\(13) & ((\ra1_ir_out~combout\(14)) # ((!\ra1_ir_out~combout\(12) & \Ard1a~6_combout\)))) # (!\ra1_ir_out~combout\(13) & (\ra1_ir_out~combout\(12)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111001100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ra1_ir_out~combout\(12),
	datab => \ra1_ir_out~combout\(13),
	datac => \Ard1a~6_combout\,
	datad => \ra1_ir_out~combout\(14),
	combout => \Ard1a~11_combout\);

-- Location: PIN_C17,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\ra1_val_out~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_ra1_val_out,
	combout => \ra1_val_out~combout\);

-- Location: LCCOMB_X21_Y1_N16
\Ard1a~13\ : cycloneii_lcell_comb
-- Equation(s):
-- \Ard1a~13_combout\ = (\Ard1a~12_combout\) # (((\ra1_ir_out~combout\(15) & \Ard1a~11_combout\)) # (!\ra1_val_out~combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110110011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ra1_ir_out~combout\(15),
	datab => \Ard1a~12_combout\,
	datac => \Ard1a~11_combout\,
	datad => \ra1_val_out~combout\,
	combout => \Ard1a~13_combout\);

-- Location: PIN_AG10,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\ra1_ir_out[9]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_ra1_ir_out(9),
	combout => \ra1_ir_out~combout\(9));

-- Location: LCCOMB_X20_Y1_N4
\Ard1a~14\ : cycloneii_lcell_comb
-- Equation(s):
-- \Ard1a~14_combout\ = (!\Ard1a~13_combout\ & ((\Ard1a~11_combout\ & ((\ra1_ir_out~combout\(9)))) # (!\Ard1a~11_combout\ & (\Ard1a~10_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Ard1a~10_combout\,
	datab => \Ard1a~11_combout\,
	datac => \ra1_ir_out~combout\(9),
	datad => \Ard1a~13_combout\,
	combout => \Ard1a~14_combout\);

-- Location: PIN_AK24,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\ra1_ir_out[6]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_ra1_ir_out(6),
	combout => \ra1_ir_out~combout\(6));

-- Location: LCCOMB_X21_Y1_N2
\Ard1a~15\ : cycloneii_lcell_comb
-- Equation(s):
-- \Ard1a~15_combout\ = (\Ard1a~14_combout\) # ((\Ard1a~13_combout\ & \ra1_ir_out~combout\(6)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110110011101100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Ard1a~13_combout\,
	datab => \Ard1a~14_combout\,
	datac => \ra1_ir_out~combout\(6),
	combout => \Ard1a~15_combout\);

-- Location: PIN_AC23,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\ra1_ir_out[15]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_ra1_ir_out(15),
	combout => \ra1_ir_out~combout\(15));

-- Location: LCCOMB_X20_Y1_N28
\Ard1a~17\ : cycloneii_lcell_comb
-- Equation(s):
-- \Ard1a~17_combout\ = (\ra1_ir_out~combout\(10) & !\ra1_ir_out~combout\(15))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ra1_ir_out~combout\(10),
	datad => \ra1_ir_out~combout\(15),
	combout => \Ard1a~17_combout\);

-- Location: PIN_AG17,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\ra1_ir_out[12]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_ra1_ir_out(12),
	combout => \ra1_ir_out~combout\(12));

-- Location: LCCOMB_X11_Y1_N24
\x1_op2~4\ : cycloneii_lcell_comb
-- Equation(s):
-- \x1_op2~4_combout\ = (!\ra1_ir_out~combout\(12) & !\ra1_ir_out~combout\(14))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000110011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \ra1_ir_out~combout\(12),
	datad => \ra1_ir_out~combout\(14),
	combout => \x1_op2~4_combout\);

-- Location: PIN_AH22,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\ra1_ir_out[7]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_ra1_ir_out(7),
	combout => \ra1_ir_out~combout\(7));

-- Location: LCCOMB_X20_Y1_N26
\Ard1a~16\ : cycloneii_lcell_comb
-- Equation(s):
-- \Ard1a~16_combout\ = (\ra1_ir_out~combout\(15) & (\ra1_ir_out~combout\(10))) # (!\ra1_ir_out~combout\(15) & ((\ra1_ir_out~combout\(7))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ra1_ir_out~combout\(10),
	datab => \ra1_ir_out~combout\(7),
	datad => \ra1_ir_out~combout\(15),
	combout => \Ard1a~16_combout\);

-- Location: LCCOMB_X20_Y1_N30
\Ard1a~18\ : cycloneii_lcell_comb
-- Equation(s):
-- \Ard1a~18_combout\ = (\Z_tag_out_arf~0_combout\ & (((!\x1_op2~4_combout\)))) # (!\Z_tag_out_arf~0_combout\ & ((\x1_op2~4_combout\ & (\Ard1a~17_combout\)) # (!\x1_op2~4_combout\ & ((\Ard1a~16_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100111101001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Z_tag_out_arf~0_combout\,
	datab => \Ard1a~17_combout\,
	datac => \x1_op2~4_combout\,
	datad => \Ard1a~16_combout\,
	combout => \Ard1a~18_combout\);

-- Location: LCCOMB_X19_Y1_N20
\Z_tag_out_arf~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Z_tag_out_arf~0_combout\ = (!\ra1_ir_out~combout\(14) & ((\ra1_ir_out~combout\(12)) # (!\Ard1a~6_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010101111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ra1_ir_out~combout\(12),
	datac => \Ard1a~6_combout\,
	datad => \ra1_ir_out~combout\(14),
	combout => \Z_tag_out_arf~0_combout\);

-- Location: LCCOMB_X20_Y1_N20
\Ard1a~19\ : cycloneii_lcell_comb
-- Equation(s):
-- \Ard1a~19_combout\ = (\Z_tag_out_arf~0_combout\ & (\ra1_ir_out~combout\(7) & (\ra1_ir_out~combout\(15) $ (!\Ard1a~18_combout\)))) # (!\Z_tag_out_arf~0_combout\ & (((\Ard1a~18_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001110000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ra1_ir_out~combout\(15),
	datab => \Ard1a~18_combout\,
	datac => \Z_tag_out_arf~0_combout\,
	datad => \ra1_ir_out~combout\(7),
	combout => \Ard1a~19_combout\);

-- Location: LCCOMB_X20_Y1_N14
\Ard1a~20\ : cycloneii_lcell_comb
-- Equation(s):
-- \Ard1a~20_combout\ = (!\Ard1a~13_combout\ & ((\Ard1a~11_combout\ & (\ra1_ir_out~combout\(10))) # (!\Ard1a~11_combout\ & ((\Ard1a~19_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010001000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ra1_ir_out~combout\(10),
	datab => \Ard1a~13_combout\,
	datac => \Ard1a~19_combout\,
	datad => \Ard1a~11_combout\,
	combout => \Ard1a~20_combout\);

-- Location: LCCOMB_X20_Y1_N16
\Ard1a~21\ : cycloneii_lcell_comb
-- Equation(s):
-- \Ard1a~21_combout\ = (\Ard1a~20_combout\) # ((\Ard1a~13_combout\ & \ra1_ir_out~combout\(7)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Ard1a~13_combout\,
	datac => \Ard1a~20_combout\,
	datad => \ra1_ir_out~combout\(7),
	combout => \Ard1a~21_combout\);

-- Location: PIN_AC6,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\ra1_ir_out[11]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_ra1_ir_out(11),
	combout => \ra1_ir_out~combout\(11));

-- Location: LCCOMB_X19_Y1_N24
\Ard1a~22\ : cycloneii_lcell_comb
-- Equation(s):
-- \Ard1a~22_combout\ = (!\ra1_ir_out~combout\(15) & \ra1_ir_out~combout\(11))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011000000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \ra1_ir_out~combout\(15),
	datac => \ra1_ir_out~combout\(11),
	combout => \Ard1a~22_combout\);

-- Location: LCCOMB_X19_Y1_N2
\Ard1a~28\ : cycloneii_lcell_comb
-- Equation(s):
-- \Ard1a~28_combout\ = (\ra1_ir_out~combout\(12) & (\Ard1a~23_combout\)) # (!\ra1_ir_out~combout\(12) & ((\ra1_ir_out~combout\(14) & (\Ard1a~23_combout\)) # (!\ra1_ir_out~combout\(14) & ((\Ard1a~22_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101010111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Ard1a~23_combout\,
	datab => \ra1_ir_out~combout\(12),
	datac => \Ard1a~22_combout\,
	datad => \ra1_ir_out~combout\(14),
	combout => \Ard1a~28_combout\);

-- Location: LCCOMB_X19_Y1_N8
\Ard1a~24\ : cycloneii_lcell_comb
-- Equation(s):
-- \Ard1a~24_combout\ = (\Z_tag_out_arf~0_combout\ & (\ra1_ir_out~combout\(15) $ ((\x1_op2~4_combout\)))) # (!\Z_tag_out_arf~0_combout\ & (((\Ard1a~28_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111110100101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Z_tag_out_arf~0_combout\,
	datab => \ra1_ir_out~combout\(15),
	datac => \x1_op2~4_combout\,
	datad => \Ard1a~28_combout\,
	combout => \Ard1a~24_combout\);

-- Location: PIN_AH29,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\ra1_ir_out[8]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_ra1_ir_out(8),
	combout => \ra1_ir_out~combout\(8));

-- Location: LCCOMB_X19_Y1_N30
\Ard1a~25\ : cycloneii_lcell_comb
-- Equation(s):
-- \Ard1a~25_combout\ = (\Ard1a~13_combout\ & (((\ra1_ir_out~combout\(8))))) # (!\Ard1a~13_combout\ & (\Ard1a~24_combout\ & ((\ra1_ir_out~combout\(8)) # (!\Z_tag_out_arf~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Z_tag_out_arf~0_combout\,
	datab => \Ard1a~13_combout\,
	datac => \Ard1a~24_combout\,
	datad => \ra1_ir_out~combout\(8),
	combout => \Ard1a~25_combout\);

-- Location: LCCOMB_X19_Y1_N16
\Ard1a~26\ : cycloneii_lcell_comb
-- Equation(s):
-- \Ard1a~26_combout\ = (\Ard1a~11_combout\ & ((\Ard1a~13_combout\ & (\Ard1a~25_combout\)) # (!\Ard1a~13_combout\ & ((\ra1_ir_out~combout\(11)))))) # (!\Ard1a~11_combout\ & (\Ard1a~25_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011100100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Ard1a~11_combout\,
	datab => \Ard1a~25_combout\,
	datac => \ra1_ir_out~combout\(11),
	datad => \Ard1a~13_combout\,
	combout => \Ard1a~26_combout\);

-- Location: LCCOMB_X16_Y1_N6
\Awr1~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Awr1~0_combout\ = (\ra1_ir_out~combout\(14) & ((\ra1_ir_out~combout\(12)) # (\ra1_ir_out~combout\(13))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100100011001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ra1_ir_out~combout\(12),
	datab => \ra1_ir_out~combout\(14),
	datac => \ra1_ir_out~combout\(13),
	combout => \Awr1~0_combout\);

-- Location: LCCOMB_X19_Y1_N22
\Ard1b~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Ard1b~0_combout\ = (\Awr1~0_combout\ & (((!\ra1_ir_out~combout\(15))))) # (!\Awr1~0_combout\ & ((\ra1_ir_out~combout\(15) & ((\ra1_ir_out~combout\(14)))) # (!\ra1_ir_out~combout\(15) & (\Ard1a~27_combout\ & !\ra1_ir_out~combout\(14)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000001110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Ard1a~27_combout\,
	datab => \Awr1~0_combout\,
	datac => \ra1_ir_out~combout\(15),
	datad => \ra1_ir_out~combout\(14),
	combout => \Ard1b~0_combout\);

-- Location: LCCOMB_X21_Y1_N0
\Ard1b~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \Ard1b~1_combout\ = (\ra1_ir_out~combout\(6) & (\ra1_val_out~combout\ & \Ard1b~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ra1_ir_out~combout\(6),
	datab => \ra1_val_out~combout\,
	datac => \Ard1b~0_combout\,
	combout => \Ard1b~1_combout\);

-- Location: LCCOMB_X21_Y1_N26
\Ard1b~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \Ard1b~2_combout\ = (\ra1_ir_out~combout\(7) & (\ra1_val_out~combout\ & \Ard1b~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ra1_ir_out~combout\(7),
	datab => \ra1_val_out~combout\,
	datac => \Ard1b~0_combout\,
	combout => \Ard1b~2_combout\);

-- Location: LCCOMB_X21_Y1_N24
\Ard1b~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \Ard1b~3_combout\ = (\ra1_val_out~combout\ & (\Ard1b~0_combout\ & \ra1_ir_out~combout\(8)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \ra1_val_out~combout\,
	datac => \Ard1b~0_combout\,
	datad => \ra1_ir_out~combout\(8),
	combout => \Ard1b~3_combout\);

-- Location: PIN_H16,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\ra2_ir_out[15]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_ra2_ir_out(15),
	combout => \ra2_ir_out~combout\(15));

-- Location: PIN_H7,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\ra2_ir_out[13]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_ra2_ir_out(13),
	combout => \ra2_ir_out~combout\(13));

-- Location: PIN_B22,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\ra2_ir_out[14]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_ra2_ir_out(14),
	combout => \ra2_ir_out~combout\(14));

-- Location: PIN_H1,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\ra2_ir_out[12]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_ra2_ir_out(12),
	combout => \ra2_ir_out~combout\(12));

-- Location: LCCOMB_X23_Y50_N4
\Ard2a~12\ : cycloneii_lcell_comb
-- Equation(s):
-- \Ard2a~12_combout\ = (!\Ard2a~6_combout\ & (\ra2_ir_out~combout\(13) & (!\ra2_ir_out~combout\(14) & !\ra2_ir_out~combout\(12))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Ard2a~6_combout\,
	datab => \ra2_ir_out~combout\(13),
	datac => \ra2_ir_out~combout\(14),
	datad => \ra2_ir_out~combout\(12),
	combout => \Ard2a~12_combout\);

-- Location: PIN_H17,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\ra2_val_out~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_ra2_val_out,
	combout => \ra2_val_out~combout\);

-- Location: LCCOMB_X24_Y50_N20
\Ard2a~13\ : cycloneii_lcell_comb
-- Equation(s):
-- \Ard2a~13_combout\ = (\Ard2a~12_combout\) # (((\Ard2a~11_combout\ & \ra2_ir_out~combout\(15))) # (!\ra2_val_out~combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111100011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Ard2a~11_combout\,
	datab => \ra2_ir_out~combout\(15),
	datac => \Ard2a~12_combout\,
	datad => \ra2_val_out~combout\,
	combout => \Ard2a~13_combout\);

-- Location: PIN_E9,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\ra2_ir_out[9]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_ra2_ir_out(9),
	combout => \ra2_ir_out~combout\(9));

-- Location: PIN_T5,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\ra2_ir_out[6]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_ra2_ir_out(6),
	combout => \ra2_ir_out~combout\(6));

-- Location: LCCOMB_X23_Y50_N16
\Z_2_tag_out_arf~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Z_2_tag_out_arf~0_combout\ = (!\ra2_ir_out~combout\(14) & ((\ra2_ir_out~combout\(12)) # (!\Ard2a~6_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Ard2a~6_combout\,
	datac => \ra2_ir_out~combout\(14),
	datad => \ra2_ir_out~combout\(12),
	combout => \Z_2_tag_out_arf~0_combout\);

-- Location: LCCOMB_X24_Y50_N6
\Ard2a~10\ : cycloneii_lcell_comb
-- Equation(s):
-- \Ard2a~10_combout\ = (\Z_2_tag_out_arf~0_combout\ & (\ra2_ir_out~combout\(6) & (\Ard2a~9_combout\ $ (!\ra2_ir_out~combout\(15))))) # (!\Z_2_tag_out_arf~0_combout\ & (\Ard2a~9_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Ard2a~9_combout\,
	datab => \ra2_ir_out~combout\(15),
	datac => \ra2_ir_out~combout\(6),
	datad => \Z_2_tag_out_arf~0_combout\,
	combout => \Ard2a~10_combout\);

-- Location: LCCOMB_X24_Y50_N26
\Ard2a~14\ : cycloneii_lcell_comb
-- Equation(s):
-- \Ard2a~14_combout\ = (!\Ard2a~13_combout\ & ((\Ard2a~11_combout\ & (\ra2_ir_out~combout\(9))) # (!\Ard2a~11_combout\ & ((\Ard2a~10_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000110100001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Ard2a~11_combout\,
	datab => \ra2_ir_out~combout\(9),
	datac => \Ard2a~13_combout\,
	datad => \Ard2a~10_combout\,
	combout => \Ard2a~14_combout\);

-- Location: LCCOMB_X24_Y50_N0
\Ard2a~15\ : cycloneii_lcell_comb
-- Equation(s):
-- \Ard2a~15_combout\ = (\Ard2a~14_combout\) # ((\Ard2a~13_combout\ & \ra2_ir_out~combout\(6)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110110011101100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Ard2a~13_combout\,
	datab => \Ard2a~14_combout\,
	datac => \ra2_ir_out~combout\(6),
	combout => \Ard2a~15_combout\);

-- Location: PIN_P6,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\ra2_ir_out[7]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_ra2_ir_out(7),
	combout => \ra2_ir_out~combout\(7));

-- Location: LCCOMB_X25_Y50_N8
\x2_op2~6\ : cycloneii_lcell_comb
-- Equation(s):
-- \x2_op2~6_combout\ = (!\ra2_ir_out~combout\(12) & !\ra2_ir_out~combout\(14))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \ra2_ir_out~combout\(12),
	datad => \ra2_ir_out~combout\(14),
	combout => \x2_op2~6_combout\);

-- Location: PIN_C16,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\ra2_ir_out[10]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_ra2_ir_out(10),
	combout => \ra2_ir_out~combout\(10));

-- Location: LCCOMB_X23_Y50_N6
\Ard2a~16\ : cycloneii_lcell_comb
-- Equation(s):
-- \Ard2a~16_combout\ = (\ra2_ir_out~combout\(15) & ((\ra2_ir_out~combout\(10)))) # (!\ra2_ir_out~combout\(15) & (\ra2_ir_out~combout\(7)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \ra2_ir_out~combout\(15),
	datac => \ra2_ir_out~combout\(7),
	datad => \ra2_ir_out~combout\(10),
	combout => \Ard2a~16_combout\);

-- Location: LCCOMB_X23_Y50_N26
\Ard2a~18\ : cycloneii_lcell_comb
-- Equation(s):
-- \Ard2a~18_combout\ = (\x2_op2~6_combout\ & (\Ard2a~17_combout\ & (!\Z_2_tag_out_arf~0_combout\))) # (!\x2_op2~6_combout\ & (((\Z_2_tag_out_arf~0_combout\) # (\Ard2a~16_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011101100111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Ard2a~17_combout\,
	datab => \x2_op2~6_combout\,
	datac => \Z_2_tag_out_arf~0_combout\,
	datad => \Ard2a~16_combout\,
	combout => \Ard2a~18_combout\);

-- Location: LCCOMB_X23_Y50_N28
\Ard2a~19\ : cycloneii_lcell_comb
-- Equation(s):
-- \Ard2a~19_combout\ = (\Z_2_tag_out_arf~0_combout\ & (\ra2_ir_out~combout\(7) & (\ra2_ir_out~combout\(15) $ (!\Ard2a~18_combout\)))) # (!\Z_2_tag_out_arf~0_combout\ & (((\Ard2a~18_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101010100001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Z_2_tag_out_arf~0_combout\,
	datab => \ra2_ir_out~combout\(7),
	datac => \ra2_ir_out~combout\(15),
	datad => \Ard2a~18_combout\,
	combout => \Ard2a~19_combout\);

-- Location: LCCOMB_X23_Y50_N14
\Ard2a~11\ : cycloneii_lcell_comb
-- Equation(s):
-- \Ard2a~11_combout\ = (\ra2_ir_out~combout\(13) & ((\ra2_ir_out~combout\(14)) # ((\Ard2a~6_combout\ & !\ra2_ir_out~combout\(12))))) # (!\ra2_ir_out~combout\(13) & (((\ra2_ir_out~combout\(12)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001111001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Ard2a~6_combout\,
	datab => \ra2_ir_out~combout\(13),
	datac => \ra2_ir_out~combout\(14),
	datad => \ra2_ir_out~combout\(12),
	combout => \Ard2a~11_combout\);

-- Location: LCCOMB_X23_Y50_N22
\Ard2a~20\ : cycloneii_lcell_comb
-- Equation(s):
-- \Ard2a~20_combout\ = (!\Ard2a~13_combout\ & ((\Ard2a~11_combout\ & (\ra2_ir_out~combout\(10))) # (!\Ard2a~11_combout\ & ((\Ard2a~19_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010101100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ra2_ir_out~combout\(10),
	datab => \Ard2a~19_combout\,
	datac => \Ard2a~11_combout\,
	datad => \Ard2a~13_combout\,
	combout => \Ard2a~20_combout\);

-- Location: LCCOMB_X23_Y50_N0
\Ard2a~21\ : cycloneii_lcell_comb
-- Equation(s):
-- \Ard2a~21_combout\ = (\Ard2a~20_combout\) # ((\ra2_ir_out~combout\(7) & \Ard2a~13_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Ard2a~20_combout\,
	datac => \ra2_ir_out~combout\(7),
	datad => \Ard2a~13_combout\,
	combout => \Ard2a~21_combout\);

-- Location: PIN_P4,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\ra2_ir_out[8]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_ra2_ir_out(8),
	combout => \ra2_ir_out~combout\(8));

-- Location: PIN_E12,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\ra2_ir_out[11]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_ra2_ir_out(11),
	combout => \ra2_ir_out~combout\(11));

-- Location: LCCOMB_X23_Y50_N18
\Ard2a~23\ : cycloneii_lcell_comb
-- Equation(s):
-- \Ard2a~23_combout\ = (\ra2_ir_out~combout\(15) & ((\ra2_ir_out~combout\(11)))) # (!\ra2_ir_out~combout\(15) & (\ra2_ir_out~combout\(8)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \ra2_ir_out~combout\(8),
	datac => \ra2_ir_out~combout\(15),
	datad => \ra2_ir_out~combout\(11),
	combout => \Ard2a~23_combout\);

-- Location: LCCOMB_X24_Y50_N22
\Ard2a~22\ : cycloneii_lcell_comb
-- Equation(s):
-- \Ard2a~22_combout\ = (\ra2_ir_out~combout\(11) & !\ra2_ir_out~combout\(15))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000110000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \ra2_ir_out~combout\(11),
	datac => \ra2_ir_out~combout\(15),
	combout => \Ard2a~22_combout\);

-- Location: LCCOMB_X24_Y50_N18
\Ard2a~27\ : cycloneii_lcell_comb
-- Equation(s):
-- \Ard2a~27_combout\ = (\ra2_ir_out~combout\(12) & (\Ard2a~23_combout\)) # (!\ra2_ir_out~combout\(12) & ((\ra2_ir_out~combout\(14) & (\Ard2a~23_combout\)) # (!\ra2_ir_out~combout\(14) & ((\Ard2a~22_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110111001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ra2_ir_out~combout\(12),
	datab => \Ard2a~23_combout\,
	datac => \ra2_ir_out~combout\(14),
	datad => \Ard2a~22_combout\,
	combout => \Ard2a~27_combout\);

-- Location: LCCOMB_X23_Y50_N8
\Ard2a~24\ : cycloneii_lcell_comb
-- Equation(s):
-- \Ard2a~24_combout\ = (\Z_2_tag_out_arf~0_combout\ & ((\ra2_ir_out~combout\(15) $ (\x2_op2~6_combout\)))) # (!\Z_2_tag_out_arf~0_combout\ & (\Ard2a~27_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100111011100100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Z_2_tag_out_arf~0_combout\,
	datab => \Ard2a~27_combout\,
	datac => \ra2_ir_out~combout\(15),
	datad => \x2_op2~6_combout\,
	combout => \Ard2a~24_combout\);

-- Location: LCCOMB_X23_Y50_N30
\Ard2a~25\ : cycloneii_lcell_comb
-- Equation(s):
-- \Ard2a~25_combout\ = (\Ard2a~13_combout\ & (((\ra2_ir_out~combout\(8))))) # (!\Ard2a~13_combout\ & (\Ard2a~24_combout\ & ((\ra2_ir_out~combout\(8)) # (!\Z_2_tag_out_arf~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Z_2_tag_out_arf~0_combout\,
	datab => \Ard2a~24_combout\,
	datac => \ra2_ir_out~combout\(8),
	datad => \Ard2a~13_combout\,
	combout => \Ard2a~25_combout\);

-- Location: LCCOMB_X24_Y50_N4
\Ard2a~26\ : cycloneii_lcell_comb
-- Equation(s):
-- \Ard2a~26_combout\ = (\Ard2a~13_combout\ & (\Ard2a~25_combout\)) # (!\Ard2a~13_combout\ & ((\Ard2a~11_combout\ & ((\ra2_ir_out~combout\(11)))) # (!\Ard2a~11_combout\ & (\Ard2a~25_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010110010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Ard2a~25_combout\,
	datab => \ra2_ir_out~combout\(11),
	datac => \Ard2a~13_combout\,
	datad => \Ard2a~11_combout\,
	combout => \Ard2a~26_combout\);

-- Location: LCCOMB_X21_Y50_N24
\Ard2b~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Ard2b~0_combout\ = (\ra2_ir_out~combout\(14) & (\ra2_ir_out~combout\(15) $ (((\ra2_ir_out~combout\(13)) # (\ra2_ir_out~combout\(12)))))) # (!\ra2_ir_out~combout\(14) & (((\ra2_ir_out~combout\(12)) # (\ra2_ir_out~combout\(15)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011011111111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ra2_ir_out~combout\(13),
	datab => \ra2_ir_out~combout\(14),
	datac => \ra2_ir_out~combout\(12),
	datad => \ra2_ir_out~combout\(15),
	combout => \Ard2b~0_combout\);

-- Location: LCCOMB_X20_Y50_N16
\Ard2b~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \Ard2b~1_combout\ = (\ra2_val_out~combout\ & ((\Ard2b~0_combout\ & ((\ra2_ir_out~combout\(14)))) # (!\Ard2b~0_combout\ & (\Ard2a~6_combout\ & !\ra2_ir_out~combout\(14)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000000100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Ard2a~6_combout\,
	datab => \Ard2b~0_combout\,
	datac => \ra2_val_out~combout\,
	datad => \ra2_ir_out~combout\(14),
	combout => \Ard2b~1_combout\);

-- Location: LCCOMB_X1_Y23_N28
\Ard2b~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \Ard2b~2_combout\ = (\Ard2b~1_combout\ & \ra2_ir_out~combout\(6))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Ard2b~1_combout\,
	datac => \ra2_ir_out~combout\(6),
	combout => \Ard2b~2_combout\);

-- Location: LCCOMB_X1_Y23_N10
\Ard2b~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \Ard2b~3_combout\ = (\Ard2b~1_combout\ & \ra2_ir_out~combout\(7))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Ard2b~1_combout\,
	datac => \ra2_ir_out~combout\(7),
	combout => \Ard2b~3_combout\);

-- Location: LCCOMB_X1_Y23_N0
\Ard2b~4\ : cycloneii_lcell_comb
-- Equation(s):
-- \Ard2b~4_combout\ = (\Ard2b~1_combout\ & \ra2_ir_out~combout\(8))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Ard2b~1_combout\,
	datac => \ra2_ir_out~combout\(8),
	combout => \Ard2b~4_combout\);

-- Location: PIN_AK25,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\ra1_ir_out[3]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_ra1_ir_out(3),
	combout => \ra1_ir_out~combout\(3));

-- Location: LCCOMB_X20_Y1_N2
\Ard1a~8\ : cycloneii_lcell_comb
-- Equation(s):
-- \Ard1a~8_combout\ = (\ra1_ir_out~combout\(9) & !\ra1_ir_out~combout\(15))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \ra1_ir_out~combout\(9),
	datad => \ra1_ir_out~combout\(15),
	combout => \Ard1a~8_combout\);

-- Location: LCCOMB_X16_Y1_N0
\Awr1~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \Awr1~1_combout\ = (\ra1_ir_out~combout\(2)) # ((\ra1_ir_out~combout\(15)) # ((\ra1_ir_out~combout\(0) & \ra1_ir_out~combout\(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111101100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ra1_ir_out~combout\(0),
	datab => \ra1_ir_out~combout\(2),
	datac => \ra1_ir_out~combout\(1),
	datad => \ra1_ir_out~combout\(15),
	combout => \Awr1~1_combout\);

-- Location: LCCOMB_X16_Y1_N14
\Awr1~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \Awr1~2_combout\ = (!\ra1_ir_out~combout\(14) & ((\ra1_ir_out~combout\(12) & (\ra1_ir_out~combout\(13))) # (!\ra1_ir_out~combout\(12) & ((\Awr1~1_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011000100100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ra1_ir_out~combout\(12),
	datab => \ra1_ir_out~combout\(14),
	datac => \ra1_ir_out~combout\(13),
	datad => \Awr1~1_combout\,
	combout => \Awr1~2_combout\);

-- Location: LCCOMB_X16_Y1_N20
\Awr1~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \Awr1~3_combout\ = (\ra1_val_out~combout\ & (!\Awr1~2_combout\ & ((!\ra1_ir_out~combout\(15)) # (!\Awr1~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000010000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Awr1~0_combout\,
	datab => \ra1_val_out~combout\,
	datac => \Awr1~2_combout\,
	datad => \ra1_ir_out~combout\(15),
	combout => \Awr1~3_combout\);

-- Location: LCCOMB_X19_Y1_N28
\Awr1~4\ : cycloneii_lcell_comb
-- Equation(s):
-- \Awr1~4_combout\ = (\ra1_ir_out~combout\(12)) # (((\ra1_ir_out~combout\(13) & \ra1_ir_out~combout\(14))) # (!\Awr1~3_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111110101111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ra1_ir_out~combout\(12),
	datab => \ra1_ir_out~combout\(13),
	datac => \Awr1~3_combout\,
	datad => \ra1_ir_out~combout\(14),
	combout => \Awr1~4_combout\);

-- Location: LCCOMB_X19_Y1_N18
\Awr1~5\ : cycloneii_lcell_comb
-- Equation(s):
-- \Awr1~5_combout\ = ((\ra1_ir_out~combout\(12) & !\ra1_ir_out~combout\(14))) # (!\Awr1~3_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111110101111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ra1_ir_out~combout\(12),
	datac => \Awr1~3_combout\,
	datad => \ra1_ir_out~combout\(14),
	combout => \Awr1~5_combout\);

-- Location: LCCOMB_X20_Y1_N12
\Ard1a~7\ : cycloneii_lcell_comb
-- Equation(s):
-- \Ard1a~7_combout\ = (\ra1_ir_out~combout\(15) & ((\ra1_ir_out~combout\(9)))) # (!\ra1_ir_out~combout\(15) & (\ra1_ir_out~combout\(6)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ra1_ir_out~combout\(6),
	datac => \ra1_ir_out~combout\(9),
	datad => \ra1_ir_out~combout\(15),
	combout => \Ard1a~7_combout\);

-- Location: LCCOMB_X20_Y1_N22
\Awr1~7\ : cycloneii_lcell_comb
-- Equation(s):
-- \Awr1~7_combout\ = (\Awr1~6_combout\ & (((\ra1_ir_out~combout\(9))) # (!\Awr1~5_combout\))) # (!\Awr1~6_combout\ & (\Awr1~5_combout\ & ((\Ard1a~7_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110011010100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Awr1~6_combout\,
	datab => \Awr1~5_combout\,
	datac => \ra1_ir_out~combout\(9),
	datad => \Ard1a~7_combout\,
	combout => \Awr1~7_combout\);

-- Location: LCCOMB_X20_Y1_N8
\Awr1~8\ : cycloneii_lcell_comb
-- Equation(s):
-- \Awr1~8_combout\ = (\Awr1~4_combout\ & (((\Awr1~7_combout\)))) # (!\Awr1~4_combout\ & ((\Awr1~7_combout\ & ((\Ard1a~8_combout\))) # (!\Awr1~7_combout\ & (\ra1_ir_out~combout\(3)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ra1_ir_out~combout\(3),
	datab => \Ard1a~8_combout\,
	datac => \Awr1~4_combout\,
	datad => \Awr1~7_combout\,
	combout => \Awr1~8_combout\);

-- Location: LCCOMB_X19_Y1_N0
\Awr1~6\ : cycloneii_lcell_comb
-- Equation(s):
-- \Awr1~6_combout\ = ((!\ra1_ir_out~combout\(12) & (!\ra1_ir_out~combout\(13) & \ra1_ir_out~combout\(14)))) # (!\Awr1~3_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001111100001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ra1_ir_out~combout\(12),
	datab => \ra1_ir_out~combout\(13),
	datac => \Awr1~3_combout\,
	datad => \ra1_ir_out~combout\(14),
	combout => \Awr1~6_combout\);

-- Location: LCCOMB_X20_Y1_N6
\Awr1~9\ : cycloneii_lcell_comb
-- Equation(s):
-- \Awr1~9_combout\ = (\Awr1~5_combout\ & ((\Awr1~6_combout\ & (\ra1_ir_out~combout\(10))) # (!\Awr1~6_combout\ & ((\Ard1a~16_combout\))))) # (!\Awr1~5_combout\ & (((\Awr1~6_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011110010110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ra1_ir_out~combout\(10),
	datab => \Awr1~5_combout\,
	datac => \Awr1~6_combout\,
	datad => \Ard1a~16_combout\,
	combout => \Awr1~9_combout\);

-- Location: PIN_AJ23,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\ra1_ir_out[4]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_ra1_ir_out(4),
	combout => \ra1_ir_out~combout\(4));

-- Location: LCCOMB_X20_Y1_N24
\Awr1~10\ : cycloneii_lcell_comb
-- Equation(s):
-- \Awr1~10_combout\ = (\Awr1~9_combout\ & ((\Awr1~4_combout\) # ((\Ard1a~17_combout\)))) # (!\Awr1~9_combout\ & (!\Awr1~4_combout\ & (\ra1_ir_out~combout\(4))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101010011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Awr1~9_combout\,
	datab => \Awr1~4_combout\,
	datac => \ra1_ir_out~combout\(4),
	datad => \Ard1a~17_combout\,
	combout => \Awr1~10_combout\);

-- Location: LCCOMB_X19_Y1_N26
\Awr1~11\ : cycloneii_lcell_comb
-- Equation(s):
-- \Awr1~11_combout\ = (\Awr1~6_combout\ & (((\ra1_ir_out~combout\(11)) # (!\Awr1~5_combout\)))) # (!\Awr1~6_combout\ & (\Ard1a~23_combout\ & ((\Awr1~5_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110001011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Ard1a~23_combout\,
	datab => \Awr1~6_combout\,
	datac => \ra1_ir_out~combout\(11),
	datad => \Awr1~5_combout\,
	combout => \Awr1~11_combout\);

-- Location: PIN_AJ25,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\ra1_ir_out[5]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_ra1_ir_out(5),
	combout => \ra1_ir_out~combout\(5));

-- Location: LCCOMB_X19_Y1_N4
\Awr1~12\ : cycloneii_lcell_comb
-- Equation(s):
-- \Awr1~12_combout\ = (\Awr1~4_combout\ & (\Awr1~11_combout\)) # (!\Awr1~4_combout\ & ((\Awr1~11_combout\ & (\Ard1a~22_combout\)) # (!\Awr1~11_combout\ & ((\ra1_ir_out~combout\(5))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101100111001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Awr1~4_combout\,
	datab => \Awr1~11_combout\,
	datac => \Ard1a~22_combout\,
	datad => \ra1_ir_out~combout\(5),
	combout => \Awr1~12_combout\);

-- Location: LCCOMB_X24_Y50_N10
\Ard2a~8\ : cycloneii_lcell_comb
-- Equation(s):
-- \Ard2a~8_combout\ = (\ra2_ir_out~combout\(9) & !\ra2_ir_out~combout\(15))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000110000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \ra2_ir_out~combout\(9),
	datac => \ra2_ir_out~combout\(15),
	combout => \Ard2a~8_combout\);

-- Location: PIN_AA4,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\ra2_ir_out[3]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_ra2_ir_out(3),
	combout => \ra2_ir_out~combout\(3));

-- Location: LCCOMB_X25_Y50_N26
\Awr2~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Awr2~0_combout\ = (\ra2_ir_out~combout\(14) & ((\ra2_ir_out~combout\(13)) # (\ra2_ir_out~combout\(12))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \ra2_ir_out~combout\(13),
	datac => \ra2_ir_out~combout\(12),
	datad => \ra2_ir_out~combout\(14),
	combout => \Awr2~0_combout\);

-- Location: LCCOMB_X25_Y50_N6
\Awr2~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \Awr2~2_combout\ = (!\Awr2~1_combout\ & (\ra2_val_out~combout\ & ((!\ra2_ir_out~combout\(15)) # (!\Awr2~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001010100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Awr2~1_combout\,
	datab => \Awr2~0_combout\,
	datac => \ra2_ir_out~combout\(15),
	datad => \ra2_val_out~combout\,
	combout => \Awr2~2_combout\);

-- Location: LCCOMB_X24_Y50_N14
\Awr2~5\ : cycloneii_lcell_comb
-- Equation(s):
-- \Awr2~5_combout\ = ((!\ra2_ir_out~combout\(12) & (!\ra2_ir_out~combout\(13) & \ra2_ir_out~combout\(14)))) # (!\Awr2~2_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ra2_ir_out~combout\(12),
	datab => \ra2_ir_out~combout\(13),
	datac => \ra2_ir_out~combout\(14),
	datad => \Awr2~2_combout\,
	combout => \Awr2~5_combout\);

-- Location: LCCOMB_X24_Y50_N28
\Awr2~4\ : cycloneii_lcell_comb
-- Equation(s):
-- \Awr2~4_combout\ = ((\ra2_ir_out~combout\(12) & !\ra2_ir_out~combout\(14))) # (!\Awr2~2_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000101011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ra2_ir_out~combout\(12),
	datac => \ra2_ir_out~combout\(14),
	datad => \Awr2~2_combout\,
	combout => \Awr2~4_combout\);

-- Location: LCCOMB_X24_Y50_N8
\Awr2~6\ : cycloneii_lcell_comb
-- Equation(s):
-- \Awr2~6_combout\ = (\Awr2~5_combout\ & (((\ra2_ir_out~combout\(9)) # (!\Awr2~4_combout\)))) # (!\Awr2~5_combout\ & (\Ard2a~7_combout\ & ((\Awr2~4_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Ard2a~7_combout\,
	datab => \ra2_ir_out~combout\(9),
	datac => \Awr2~5_combout\,
	datad => \Awr2~4_combout\,
	combout => \Awr2~6_combout\);

-- Location: LCCOMB_X24_Y50_N30
\Awr2~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \Awr2~3_combout\ = (\ra2_ir_out~combout\(12)) # (((\ra2_ir_out~combout\(13) & \ra2_ir_out~combout\(14))) # (!\Awr2~2_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ra2_ir_out~combout\(12),
	datab => \ra2_ir_out~combout\(13),
	datac => \ra2_ir_out~combout\(14),
	datad => \Awr2~2_combout\,
	combout => \Awr2~3_combout\);

-- Location: LCCOMB_X24_Y50_N2
\Awr2~7\ : cycloneii_lcell_comb
-- Equation(s):
-- \Awr2~7_combout\ = (\Awr2~6_combout\ & ((\Ard2a~8_combout\) # ((\Awr2~3_combout\)))) # (!\Awr2~6_combout\ & (((\ra2_ir_out~combout\(3) & !\Awr2~3_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000010101100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Ard2a~8_combout\,
	datab => \ra2_ir_out~combout\(3),
	datac => \Awr2~6_combout\,
	datad => \Awr2~3_combout\,
	combout => \Awr2~7_combout\);

-- Location: LCCOMB_X23_Y50_N24
\Awr2~8\ : cycloneii_lcell_comb
-- Equation(s):
-- \Awr2~8_combout\ = (\Awr2~4_combout\ & ((\Awr2~5_combout\ & (\ra2_ir_out~combout\(10))) # (!\Awr2~5_combout\ & ((\Ard2a~16_combout\))))) # (!\Awr2~4_combout\ & (((\Awr2~5_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011110010110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ra2_ir_out~combout\(10),
	datab => \Awr2~4_combout\,
	datac => \Awr2~5_combout\,
	datad => \Ard2a~16_combout\,
	combout => \Awr2~8_combout\);

-- Location: PIN_M1,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\ra2_ir_out[4]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_ra2_ir_out(4),
	combout => \ra2_ir_out~combout\(4));

-- Location: LCCOMB_X23_Y50_N12
\Ard2a~17\ : cycloneii_lcell_comb
-- Equation(s):
-- \Ard2a~17_combout\ = (!\ra2_ir_out~combout\(15) & \ra2_ir_out~combout\(10))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \ra2_ir_out~combout\(15),
	datad => \ra2_ir_out~combout\(10),
	combout => \Ard2a~17_combout\);

-- Location: LCCOMB_X23_Y50_N10
\Awr2~9\ : cycloneii_lcell_comb
-- Equation(s):
-- \Awr2~9_combout\ = (\Awr2~8_combout\ & ((\Awr2~3_combout\) # ((\Ard2a~17_combout\)))) # (!\Awr2~8_combout\ & (!\Awr2~3_combout\ & (\ra2_ir_out~combout\(4))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101010011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Awr2~8_combout\,
	datab => \Awr2~3_combout\,
	datac => \ra2_ir_out~combout\(4),
	datad => \Ard2a~17_combout\,
	combout => \Awr2~9_combout\);

-- Location: LCCOMB_X24_Y50_N16
\Awr2~10\ : cycloneii_lcell_comb
-- Equation(s):
-- \Awr2~10_combout\ = (\Awr2~4_combout\ & ((\Awr2~5_combout\ & ((\ra2_ir_out~combout\(11)))) # (!\Awr2~5_combout\ & (\Ard2a~23_combout\)))) # (!\Awr2~4_combout\ & (((\Awr2~5_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111100000111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Ard2a~23_combout\,
	datab => \Awr2~4_combout\,
	datac => \Awr2~5_combout\,
	datad => \ra2_ir_out~combout\(11),
	combout => \Awr2~10_combout\);

-- Location: PIN_N3,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\ra2_ir_out[5]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_ra2_ir_out(5),
	combout => \ra2_ir_out~combout\(5));

-- Location: LCCOMB_X25_Y50_N28
\Awr2~11\ : cycloneii_lcell_comb
-- Equation(s):
-- \Awr2~11_combout\ = (\Awr2~3_combout\ & (\Awr2~10_combout\)) # (!\Awr2~3_combout\ & ((\Awr2~10_combout\ & (\Ard2a~22_combout\)) # (!\Awr2~10_combout\ & ((\ra2_ir_out~combout\(5))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101100111001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Awr2~3_combout\,
	datab => \Awr2~10_combout\,
	datac => \Ard2a~22_combout\,
	datad => \ra2_ir_out~combout\(5),
	combout => \Awr2~11_combout\);

-- Location: PIN_AJ10,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\ra1_pc_out[0]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_ra1_pc_out(0),
	combout => \ra1_pc_out~combout\(0));

-- Location: PIN_AJ11,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\ra1_pc_out[1]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_ra1_pc_out(1),
	combout => \ra1_pc_out~combout\(1));

-- Location: PIN_AC19,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\ra1_pc_out[2]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_ra1_pc_out(2),
	combout => \ra1_pc_out~combout\(2));

-- Location: PIN_AH20,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\ra1_pc_out[3]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_ra1_pc_out(3),
	combout => \ra1_pc_out~combout\(3));

-- Location: PIN_AC26,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\ra1_pc_out[4]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_ra1_pc_out(4),
	combout => \ra1_pc_out~combout\(4));

-- Location: PIN_AF27,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\ra1_pc_out[5]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_ra1_pc_out(5),
	combout => \ra1_pc_out~combout\(5));

-- Location: PIN_AF28,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\ra1_pc_out[6]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_ra1_pc_out(6),
	combout => \ra1_pc_out~combout\(6));

-- Location: PIN_AG27,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\ra1_pc_out[7]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_ra1_pc_out(7),
	combout => \ra1_pc_out~combout\(7));

-- Location: PIN_Y24,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\ra1_pc_out[8]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_ra1_pc_out(8),
	combout => \ra1_pc_out~combout\(8));

-- Location: PIN_AD28,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\ra1_pc_out[9]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_ra1_pc_out(9),
	combout => \ra1_pc_out~combout\(9));

-- Location: PIN_AC27,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\ra1_pc_out[10]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_ra1_pc_out(10),
	combout => \ra1_pc_out~combout\(10));

-- Location: PIN_AE27,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\ra1_pc_out[11]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_ra1_pc_out(11),
	combout => \ra1_pc_out~combout\(11));

-- Location: PIN_AH28,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\ra1_pc_out[12]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_ra1_pc_out(12),
	combout => \ra1_pc_out~combout\(12));

-- Location: PIN_AA26,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\ra1_pc_out[13]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_ra1_pc_out(13),
	combout => \ra1_pc_out~combout\(13));

-- Location: PIN_Y22,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\ra1_pc_out[14]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_ra1_pc_out(14),
	combout => \ra1_pc_out~combout\(14));

-- Location: PIN_AD30,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\ra1_pc_out[15]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_ra1_pc_out(15),
	combout => \ra1_pc_out~combout\(15));

-- Location: PIN_AC1,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\ra2_pc_out[0]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_ra2_pc_out(0),
	combout => \ra2_pc_out~combout\(0));

-- Location: PIN_AB1,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\ra2_pc_out[1]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_ra2_pc_out(1),
	combout => \ra2_pc_out~combout\(1));

-- Location: PIN_AC4,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\ra2_pc_out[2]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_ra2_pc_out(2),
	combout => \ra2_pc_out~combout\(2));

-- Location: PIN_AC2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\ra2_pc_out[3]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_ra2_pc_out(3),
	combout => \ra2_pc_out~combout\(3));

-- Location: PIN_Y2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\ra2_pc_out[4]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_ra2_pc_out(4),
	combout => \ra2_pc_out~combout\(4));

-- Location: PIN_V7,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\ra2_pc_out[5]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_ra2_pc_out(5),
	combout => \ra2_pc_out~combout\(5));

-- Location: PIN_Y4,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\ra2_pc_out[6]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_ra2_pc_out(6),
	combout => \ra2_pc_out~combout\(6));

-- Location: PIN_M8,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\ra2_pc_out[7]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_ra2_pc_out(7),
	combout => \ra2_pc_out~combout\(7));

-- Location: PIN_C2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\ra2_pc_out[8]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_ra2_pc_out(8),
	combout => \ra2_pc_out~combout\(8));

-- Location: PIN_E1,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\ra2_pc_out[9]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_ra2_pc_out(9),
	combout => \ra2_pc_out~combout\(9));

-- Location: PIN_L6,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\ra2_pc_out[10]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_ra2_pc_out(10),
	combout => \ra2_pc_out~combout\(10));

-- Location: PIN_H4,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\ra2_pc_out[11]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_ra2_pc_out(11),
	combout => \ra2_pc_out~combout\(11));

-- Location: PIN_H3,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\ra2_pc_out[12]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_ra2_pc_out(12),
	combout => \ra2_pc_out~combout\(12));

-- Location: PIN_C3,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\ra2_pc_out[13]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_ra2_pc_out(13),
	combout => \ra2_pc_out~combout\(13));

-- Location: PIN_L10,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\ra2_pc_out[14]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_ra2_pc_out(14),
	combout => \ra2_pc_out~combout\(14));

-- Location: PIN_D3,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\ra2_pc_out[15]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_ra2_pc_out(15),
	combout => \ra2_pc_out~combout\(15));

-- Location: PIN_AA8,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\ra1_ir_out[10]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_ra1_ir_out(10),
	combout => \ra1_ir_out~combout\(10));

-- Location: PIN_AA2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\ra2_ir_out[0]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_ra2_ir_out(0),
	combout => \ra2_ir_out~combout\(0));

-- Location: PIN_Y7,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\ra2_ir_out[1]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_ra2_ir_out(1),
	combout => \ra2_ir_out~combout\(1));

-- Location: PIN_AD1,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\ra2_ir_out[2]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_ra2_ir_out(2),
	combout => \ra2_ir_out~combout\(2));

-- Location: PIN_AF20,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\tag1[0]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_tag1(0),
	combout => \tag1~combout\(0));

-- Location: PIN_AJ17,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\busy1~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_busy1,
	combout => \busy1~combout\);

-- Location: LCCOMB_X22_Y1_N18
\x1_op1~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \x1_op1~0_combout\ = (!\ra1_ir_out~combout\(14) & (\ra1_val_out~combout\ & (\ra1_ir_out~combout\(13) $ (\ra1_ir_out~combout\(15)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000010001000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ra1_ir_out~combout\(14),
	datab => \ra1_val_out~combout\,
	datac => \ra1_ir_out~combout\(13),
	datad => \ra1_ir_out~combout\(15),
	combout => \x1_op1~0_combout\);

-- Location: LCCOMB_X53_Y1_N12
\x1_op1~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \x1_op1~1_combout\ = (\ra1_ir_out~combout\(15) $ (!\ra1_ir_out~combout\(12))) # (!\x1_op1~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001100111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \x1_op1~0_combout\,
	datac => \ra1_ir_out~combout\(15),
	datad => \ra1_ir_out~combout\(12),
	combout => \x1_op1~1_combout\);

-- Location: PIN_AB19,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\data1[0]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_data1(0),
	combout => \data1~combout\(0));

-- Location: LCCOMB_X61_Y1_N8
\x1_op1~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \x1_op1~2_combout\ = (\x1_op1~1_combout\ & ((\busy1~combout\ & (\tag1~combout\(0))) # (!\busy1~combout\ & ((\data1~combout\(0))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011000010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \tag1~combout\(0),
	datab => \busy1~combout\,
	datac => \x1_op1~1_combout\,
	datad => \data1~combout\(0),
	combout => \x1_op1~2_combout\);

-- Location: PIN_AD18,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\tag1[1]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_tag1(1),
	combout => \tag1~combout\(1));

-- Location: PIN_AG20,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\data1[1]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_data1(1),
	combout => \data1~combout\(1));

-- Location: LCCOMB_X61_Y1_N2
\x1_op1~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \x1_op1~3_combout\ = (\x1_op1~1_combout\ & ((\busy1~combout\ & (\tag1~combout\(1))) # (!\busy1~combout\ & ((\data1~combout\(1))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011000010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \tag1~combout\(1),
	datab => \busy1~combout\,
	datac => \x1_op1~1_combout\,
	datad => \data1~combout\(1),
	combout => \x1_op1~3_combout\);

-- Location: PIN_AJ21,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\data1[2]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_data1(2),
	combout => \data1~combout\(2));

-- Location: PIN_AF17,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\tag1[2]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_tag1(2),
	combout => \tag1~combout\(2));

-- Location: LCCOMB_X61_Y1_N0
\x1_op1~4\ : cycloneii_lcell_comb
-- Equation(s):
-- \x1_op1~4_combout\ = (\x1_op1~1_combout\ & ((\busy1~combout\ & ((\tag1~combout\(2)))) # (!\busy1~combout\ & (\data1~combout\(2)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \data1~combout\(2),
	datab => \x1_op1~1_combout\,
	datac => \tag1~combout\(2),
	datad => \busy1~combout\,
	combout => \x1_op1~4_combout\);

-- Location: PIN_AJ22,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\data1[3]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_data1(3),
	combout => \data1~combout\(3));

-- Location: PIN_AG19,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\tag1[3]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_tag1(3),
	combout => \tag1~combout\(3));

-- Location: LCCOMB_X61_Y1_N22
\x1_op1~5\ : cycloneii_lcell_comb
-- Equation(s):
-- \x1_op1~5_combout\ = (\x1_op1~1_combout\ & ((\busy1~combout\ & ((\tag1~combout\(3)))) # (!\busy1~combout\ & (\data1~combout\(3)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \data1~combout\(3),
	datab => \x1_op1~1_combout\,
	datac => \tag1~combout\(3),
	datad => \busy1~combout\,
	combout => \x1_op1~5_combout\);

-- Location: PIN_AJ19,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\data1[4]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_data1(4),
	combout => \data1~combout\(4));

-- Location: PIN_AC18,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\tag1[4]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_tag1(4),
	combout => \tag1~combout\(4));

-- Location: LCCOMB_X61_Y1_N20
\x1_op1~6\ : cycloneii_lcell_comb
-- Equation(s):
-- \x1_op1~6_combout\ = (\x1_op1~1_combout\ & ((\busy1~combout\ & ((\tag1~combout\(4)))) # (!\busy1~combout\ & (\data1~combout\(4)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110000000100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \data1~combout\(4),
	datab => \busy1~combout\,
	datac => \x1_op1~1_combout\,
	datad => \tag1~combout\(4),
	combout => \x1_op1~6_combout\);

-- Location: PIN_AE17,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\data1[5]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_data1(5),
	combout => \data1~combout\(5));

-- Location: LCCOMB_X59_Y1_N16
\x1_op1~7\ : cycloneii_lcell_comb
-- Equation(s):
-- \x1_op1~7_combout\ = (!\busy1~combout\ & (\x1_op1~1_combout\ & \data1~combout\(5)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \busy1~combout\,
	datac => \x1_op1~1_combout\,
	datad => \data1~combout\(5),
	combout => \x1_op1~7_combout\);

-- Location: PIN_AH19,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\data1[6]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_data1(6),
	combout => \data1~combout\(6));

-- Location: LCCOMB_X61_Y1_N10
\x1_op1~8\ : cycloneii_lcell_comb
-- Equation(s):
-- \x1_op1~8_combout\ = (\data1~combout\(6) & (!\busy1~combout\ & \x1_op1~1_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010000000100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \data1~combout\(6),
	datab => \busy1~combout\,
	datac => \x1_op1~1_combout\,
	combout => \x1_op1~8_combout\);

-- Location: LCCOMB_X53_Y1_N6
\x1_op1~9\ : cycloneii_lcell_comb
-- Equation(s):
-- \x1_op1~9_combout\ = (\ra1_val_out~combout\ & (!\ra1_ir_out~combout\(14) & (\ra1_ir_out~combout\(12) $ (\ra1_ir_out~combout\(15)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ra1_ir_out~combout\(12),
	datab => \ra1_val_out~combout\,
	datac => \ra1_ir_out~combout\(15),
	datad => \ra1_ir_out~combout\(14),
	combout => \x1_op1~9_combout\);

-- Location: LCCOMB_X53_Y1_N14
\x1_op1~11\ : cycloneii_lcell_comb
-- Equation(s):
-- \x1_op1~11_combout\ = (\ra1_ir_out~combout\(13) $ (!\ra1_ir_out~combout\(15))) # (!\x1_op1~9_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \ra1_ir_out~combout\(13),
	datac => \ra1_ir_out~combout\(15),
	datad => \x1_op1~9_combout\,
	combout => \x1_op1~11_combout\);

-- Location: PIN_AH17,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\data1[7]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_data1(7),
	combout => \data1~combout\(7));

-- Location: LCCOMB_X53_Y1_N20
\x1_op1~10\ : cycloneii_lcell_comb
-- Equation(s):
-- \x1_op1~10_combout\ = (\ra1_ir_out~combout\(0) & (\ra1_ir_out~combout\(13) & (!\ra1_ir_out~combout\(15) & \x1_op1~9_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ra1_ir_out~combout\(0),
	datab => \ra1_ir_out~combout\(13),
	datac => \ra1_ir_out~combout\(15),
	datad => \x1_op1~9_combout\,
	combout => \x1_op1~10_combout\);

-- Location: LCCOMB_X54_Y1_N16
\x1_op1~12\ : cycloneii_lcell_comb
-- Equation(s):
-- \x1_op1~12_combout\ = (\x1_op1~10_combout\) # ((\x1_op1~11_combout\ & (\data1~combout\(7) & !\busy1~combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \x1_op1~11_combout\,
	datab => \data1~combout\(7),
	datac => \x1_op1~10_combout\,
	datad => \busy1~combout\,
	combout => \x1_op1~12_combout\);

-- Location: LCCOMB_X22_Y1_N4
\x1_op1~13\ : cycloneii_lcell_comb
-- Equation(s):
-- \x1_op1~13_combout\ = (\ra1_ir_out~combout\(1) & (\x1_op1~0_combout\ & (\ra1_ir_out~combout\(12) & !\ra1_ir_out~combout\(15))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ra1_ir_out~combout\(1),
	datab => \x1_op1~0_combout\,
	datac => \ra1_ir_out~combout\(12),
	datad => \ra1_ir_out~combout\(15),
	combout => \x1_op1~13_combout\);

-- Location: PIN_AD16,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\data1[8]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_data1(8),
	combout => \data1~combout\(8));

-- Location: LCCOMB_X53_Y1_N16
\x1_op1~14\ : cycloneii_lcell_comb
-- Equation(s):
-- \x1_op1~14_combout\ = (\x1_op1~13_combout\) # ((\x1_op1~1_combout\ & (\data1~combout\(8) & !\busy1~combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \x1_op1~13_combout\,
	datab => \x1_op1~1_combout\,
	datac => \data1~combout\(8),
	datad => \busy1~combout\,
	combout => \x1_op1~14_combout\);

-- Location: PIN_AC16,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\data1[9]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_data1(9),
	combout => \data1~combout\(9));

-- Location: LCCOMB_X53_Y1_N10
\x1_op1~15\ : cycloneii_lcell_comb
-- Equation(s):
-- \x1_op1~15_combout\ = (\data1~combout\(9) & !\busy1~combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \data1~combout\(9),
	datad => \busy1~combout\,
	combout => \x1_op1~15_combout\);

-- Location: LCCOMB_X53_Y1_N26
\x1_op1~17\ : cycloneii_lcell_comb
-- Equation(s):
-- \x1_op1~17_combout\ = (\ra1_val_out~combout\ & ((\ra1_ir_out~combout\(13) & (!\ra1_ir_out~combout\(15) & \ra1_ir_out~combout\(12))) # (!\ra1_ir_out~combout\(13) & (\ra1_ir_out~combout\(15) & !\ra1_ir_out~combout\(12)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000100000100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ra1_val_out~combout\,
	datab => \ra1_ir_out~combout\(13),
	datac => \ra1_ir_out~combout\(15),
	datad => \ra1_ir_out~combout\(12),
	combout => \x1_op1~17_combout\);

-- Location: LCCOMB_X53_Y1_N8
\x1_op1~16\ : cycloneii_lcell_comb
-- Equation(s):
-- \x1_op1~16_combout\ = (!\ra1_ir_out~combout\(15) & \ra1_ir_out~combout\(2))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \ra1_ir_out~combout\(15),
	datad => \ra1_ir_out~combout\(2),
	combout => \x1_op1~16_combout\);

-- Location: LCCOMB_X53_Y1_N24
\x1_op1~18\ : cycloneii_lcell_comb
-- Equation(s):
-- \x1_op1~18_combout\ = (\x1_op1~17_combout\ & ((\ra1_ir_out~combout\(14) & (\x1_op1~15_combout\)) # (!\ra1_ir_out~combout\(14) & ((\x1_op1~16_combout\))))) # (!\x1_op1~17_combout\ & (\x1_op1~15_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \x1_op1~15_combout\,
	datab => \x1_op1~17_combout\,
	datac => \x1_op1~16_combout\,
	datad => \ra1_ir_out~combout\(14),
	combout => \x1_op1~18_combout\);

-- Location: LCCOMB_X53_Y1_N18
\x1_op1~19\ : cycloneii_lcell_comb
-- Equation(s):
-- \x1_op1~19_combout\ = (\ra1_ir_out~combout\(12) & (((\x1_op1~0_combout\ & \ra1_ir_out~combout\(13))) # (!\busy1~combout\))) # (!\ra1_ir_out~combout\(12) & (!\busy1~combout\ & ((\ra1_ir_out~combout\(13)) # (!\x1_op1~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000011111011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ra1_ir_out~combout\(12),
	datab => \x1_op1~0_combout\,
	datac => \ra1_ir_out~combout\(13),
	datad => \busy1~combout\,
	combout => \x1_op1~19_combout\);

-- Location: LCCOMB_X53_Y1_N28
\x1_op1~20\ : cycloneii_lcell_comb
-- Equation(s):
-- \x1_op1~20_combout\ = (\ra1_ir_out~combout\(12) $ (\ra1_ir_out~combout\(13))) # (!\x1_op1~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110011011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ra1_ir_out~combout\(12),
	datab => \ra1_ir_out~combout\(13),
	datad => \x1_op1~0_combout\,
	combout => \x1_op1~20_combout\);

-- Location: PIN_AE23,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\data1[10]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_data1(10),
	combout => \data1~combout\(10));

-- Location: LCCOMB_X86_Y1_N28
\x1_op1~21\ : cycloneii_lcell_comb
-- Equation(s):
-- \x1_op1~21_combout\ = (\x1_op1~19_combout\ & ((\x1_op1~20_combout\ & ((\data1~combout\(10)))) # (!\x1_op1~20_combout\ & (\ra1_ir_out~combout\(3)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100100000001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ra1_ir_out~combout\(3),
	datab => \x1_op1~19_combout\,
	datac => \x1_op1~20_combout\,
	datad => \data1~combout\(10),
	combout => \x1_op1~21_combout\);

-- Location: PIN_AH26,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\data1[11]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_data1(11),
	combout => \data1~combout\(11));

-- Location: LCCOMB_X86_Y1_N6
\x1_op1~22\ : cycloneii_lcell_comb
-- Equation(s):
-- \x1_op1~22_combout\ = (\x1_op1~19_combout\ & ((\x1_op1~20_combout\ & (\data1~combout\(11))) # (!\x1_op1~20_combout\ & ((\ra1_ir_out~combout\(4))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000110010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \data1~combout\(11),
	datab => \x1_op1~19_combout\,
	datac => \x1_op1~20_combout\,
	datad => \ra1_ir_out~combout\(4),
	combout => \x1_op1~22_combout\);

-- Location: PIN_AJ27,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\data1[12]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_data1(12),
	combout => \data1~combout\(12));

-- Location: LCCOMB_X86_Y1_N24
\x1_op1~23\ : cycloneii_lcell_comb
-- Equation(s):
-- \x1_op1~23_combout\ = (\x1_op1~19_combout\ & ((\x1_op1~20_combout\ & ((\data1~combout\(12)))) # (!\x1_op1~20_combout\ & (\ra1_ir_out~combout\(5)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100100000001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ra1_ir_out~combout\(5),
	datab => \x1_op1~19_combout\,
	datac => \x1_op1~20_combout\,
	datad => \data1~combout\(12),
	combout => \x1_op1~23_combout\);

-- Location: PIN_AG25,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\data1[13]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_data1(13),
	combout => \data1~combout\(13));

-- Location: LCCOMB_X86_Y1_N2
\x1_op1~24\ : cycloneii_lcell_comb
-- Equation(s):
-- \x1_op1~24_combout\ = (\x1_op1~19_combout\ & ((\x1_op1~20_combout\ & ((\data1~combout\(13)))) # (!\x1_op1~20_combout\ & (\ra1_ir_out~combout\(6)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100100000001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ra1_ir_out~combout\(6),
	datab => \x1_op1~19_combout\,
	datac => \x1_op1~20_combout\,
	datad => \data1~combout\(13),
	combout => \x1_op1~24_combout\);

-- Location: PIN_AH27,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\data1[14]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_data1(14),
	combout => \data1~combout\(14));

-- Location: LCCOMB_X86_Y1_N4
\x1_op1~25\ : cycloneii_lcell_comb
-- Equation(s):
-- \x1_op1~25_combout\ = (\x1_op1~19_combout\ & ((\x1_op1~20_combout\ & ((\data1~combout\(14)))) # (!\x1_op1~20_combout\ & (\ra1_ir_out~combout\(7)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100100000001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ra1_ir_out~combout\(7),
	datab => \x1_op1~19_combout\,
	datac => \x1_op1~20_combout\,
	datad => \data1~combout\(14),
	combout => \x1_op1~25_combout\);

-- Location: PIN_AJ28,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\data1[15]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_data1(15),
	combout => \data1~combout\(15));

-- Location: LCCOMB_X86_Y1_N22
\x1_op1~26\ : cycloneii_lcell_comb
-- Equation(s):
-- \x1_op1~26_combout\ = (\x1_op1~19_combout\ & ((\x1_op1~20_combout\ & (\data1~combout\(15))) # (!\x1_op1~20_combout\ & ((\ra1_ir_out~combout\(8))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000110010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \data1~combout\(15),
	datab => \x1_op1~19_combout\,
	datac => \x1_op1~20_combout\,
	datad => \ra1_ir_out~combout\(8),
	combout => \x1_op1~26_combout\);

-- Location: LCCOMB_X11_Y1_N30
\Awr1~13\ : cycloneii_lcell_comb
-- Equation(s):
-- \Awr1~13_combout\ = (\ra1_ir_out~combout\(14) & (!\ra1_ir_out~combout\(12) & !\ra1_ir_out~combout\(13)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ra1_ir_out~combout\(14),
	datab => \ra1_ir_out~combout\(12),
	datad => \ra1_ir_out~combout\(13),
	combout => \Awr1~13_combout\);

-- Location: LCCOMB_X11_Y1_N26
\x1_op2~6\ : cycloneii_lcell_comb
-- Equation(s):
-- \x1_op2~6_combout\ = (\ra1_val_out~combout\ & ((\ra1_ir_out~combout\(15) & ((\Awr1~13_combout\))) # (!\ra1_ir_out~combout\(15) & (\x1_op2~5_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \x1_op2~5_combout\,
	datab => \Awr1~13_combout\,
	datac => \ra1_val_out~combout\,
	datad => \ra1_ir_out~combout\(15),
	combout => \x1_op2~6_combout\);

-- Location: LCCOMB_X11_Y1_N0
\x1_op2~7\ : cycloneii_lcell_comb
-- Equation(s):
-- \x1_op2~7_combout\ = (!\ra1_ir_out~combout\(15) & (!\x1_op2~6_combout\ & (\ra1_val_out~combout\ & !\ra1_ir_out~combout\(13))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ra1_ir_out~combout\(15),
	datab => \x1_op2~6_combout\,
	datac => \ra1_val_out~combout\,
	datad => \ra1_ir_out~combout\(13),
	combout => \x1_op2~7_combout\);

-- Location: PIN_AB7,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\data2[0]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_data2(0),
	combout => \data2~combout\(0));

-- Location: PIN_AE7,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\busy2~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_busy2,
	combout => \busy2~combout\);

-- Location: LCCOMB_X1_Y1_N4
\x1_op2~9\ : cycloneii_lcell_comb
-- Equation(s):
-- \x1_op2~9_combout\ = (\busy2~combout\ & (\tag2~combout\(0))) # (!\busy2~combout\ & ((\data2~combout\(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \tag2~combout\(0),
	datac => \data2~combout\(0),
	datad => \busy2~combout\,
	combout => \x1_op2~9_combout\);

-- Location: LCCOMB_X21_Y1_N6
\x1_op2~63\ : cycloneii_lcell_comb
-- Equation(s):
-- \x1_op2~63_combout\ = (\ra1_ir_out~combout\(0) & (((!\ra1_ir_out~combout\(1) & !\ra1_ir_out~combout\(2))) # (!\x1_op2~4_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011011100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ra1_ir_out~combout\(1),
	datab => \x1_op2~4_combout\,
	datac => \ra1_ir_out~combout\(2),
	datad => \ra1_ir_out~combout\(0),
	combout => \x1_op2~63_combout\);

-- Location: LCCOMB_X9_Y1_N16
\x1_op2~10\ : cycloneii_lcell_comb
-- Equation(s):
-- \x1_op2~10_combout\ = (\x1_op2~7_combout\ & ((\x1_op2~63_combout\) # ((\x1_op2~6_combout\ & \x1_op2~9_combout\)))) # (!\x1_op2~7_combout\ & (\x1_op2~6_combout\ & (\x1_op2~9_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \x1_op2~7_combout\,
	datab => \x1_op2~6_combout\,
	datac => \x1_op2~9_combout\,
	datad => \x1_op2~63_combout\,
	combout => \x1_op2~10_combout\);

-- Location: LCCOMB_X11_Y1_N10
\x1_op2~12\ : cycloneii_lcell_comb
-- Equation(s):
-- \x1_op2~12_combout\ = (!\ra1_ir_out~combout\(13) & (!\ra1_ir_out~combout\(15) & (\ra1_ir_out~combout\(14) $ (\ra1_ir_out~combout\(12)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000010010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ra1_ir_out~combout\(14),
	datab => \ra1_ir_out~combout\(13),
	datac => \ra1_ir_out~combout\(12),
	datad => \ra1_ir_out~combout\(15),
	combout => \x1_op2~12_combout\);

-- Location: PIN_AF4,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\tag2[1]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_tag2(1),
	combout => \tag2~combout\(1));

-- Location: PIN_AD6,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\data2[1]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_data2(1),
	combout => \data2~combout\(1));

-- Location: LCCOMB_X1_Y1_N2
\x1_op2~11\ : cycloneii_lcell_comb
-- Equation(s):
-- \x1_op2~11_combout\ = (\x1_op2~6_combout\ & ((\busy2~combout\ & (\tag2~combout\(1))) # (!\busy2~combout\ & ((\data2~combout\(1))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \busy2~combout\,
	datab => \tag2~combout\(1),
	datac => \data2~combout\(1),
	datad => \x1_op2~6_combout\,
	combout => \x1_op2~11_combout\);

-- Location: LCCOMB_X11_Y1_N16
\x1_op2~13\ : cycloneii_lcell_comb
-- Equation(s):
-- \x1_op2~13_combout\ = (\x1_op2~11_combout\) # ((\x1_op2~12_combout\ & (\ra1_val_out~combout\ & \ra1_ir_out~combout\(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111110000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \x1_op2~12_combout\,
	datab => \ra1_val_out~combout\,
	datac => \ra1_ir_out~combout\(1),
	datad => \x1_op2~11_combout\,
	combout => \x1_op2~13_combout\);

-- Location: PIN_AA10,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\tag2[2]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_tag2(2),
	combout => \tag2~combout\(2));

-- Location: PIN_AA9,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\data2[2]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_data2(2),
	combout => \data2~combout\(2));

-- Location: LCCOMB_X1_Y1_N24
\x1_op2~14\ : cycloneii_lcell_comb
-- Equation(s):
-- \x1_op2~14_combout\ = (\x1_op2~6_combout\ & ((\busy2~combout\ & (\tag2~combout\(2))) # (!\busy2~combout\ & ((\data2~combout\(2))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \busy2~combout\,
	datab => \tag2~combout\(2),
	datac => \data2~combout\(2),
	datad => \x1_op2~6_combout\,
	combout => \x1_op2~14_combout\);

-- Location: LCCOMB_X11_Y1_N6
\x1_op2~15\ : cycloneii_lcell_comb
-- Equation(s):
-- \x1_op2~15_combout\ = (\x1_op2~14_combout\) # ((!\x1_op2~4_combout\ & (\ra1_ir_out~combout\(2) & \x1_op2~7_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \x1_op2~4_combout\,
	datab => \x1_op2~14_combout\,
	datac => \ra1_ir_out~combout\(2),
	datad => \x1_op2~7_combout\,
	combout => \x1_op2~15_combout\);

-- Location: LCCOMB_X11_Y1_N4
\x1_op2~16\ : cycloneii_lcell_comb
-- Equation(s):
-- \x1_op2~16_combout\ = (\ra1_ir_out~combout\(14) & (\ra1_ir_out~combout\(15) $ (((\ra1_ir_out~combout\(13)) # (\ra1_ir_out~combout\(12))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000001010101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ra1_ir_out~combout\(14),
	datab => \ra1_ir_out~combout\(13),
	datac => \ra1_ir_out~combout\(12),
	datad => \ra1_ir_out~combout\(15),
	combout => \x1_op2~16_combout\);

-- Location: LCCOMB_X11_Y1_N14
\x1_op2~17\ : cycloneii_lcell_comb
-- Equation(s):
-- \x1_op2~17_combout\ = (\x1_op2~16_combout\) # ((\x1_op2~4_combout\ & (\Ard1a~6_combout\ & !\ra1_ir_out~combout\(15))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011101100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \x1_op2~4_combout\,
	datab => \x1_op2~16_combout\,
	datac => \Ard1a~6_combout\,
	datad => \ra1_ir_out~combout\(15),
	combout => \x1_op2~17_combout\);

-- Location: PIN_AC7,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\tag2[3]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_tag2(3),
	combout => \tag2~combout\(3));

-- Location: LCCOMB_X11_Y1_N12
\x1_op2~18\ : cycloneii_lcell_comb
-- Equation(s):
-- \x1_op2~18_combout\ = (\x1_op2~17_combout\ & ((\busy2~combout\ & ((\tag2~combout\(3)))) # (!\busy2~combout\ & (\data2~combout\(3)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110000000100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \data2~combout\(3),
	datab => \busy2~combout\,
	datac => \x1_op2~17_combout\,
	datad => \tag2~combout\(3),
	combout => \x1_op2~18_combout\);

-- Location: LCCOMB_X16_Y1_N10
\x1_op2~19\ : cycloneii_lcell_comb
-- Equation(s):
-- \x1_op2~19_combout\ = (!\ra1_ir_out~combout\(13) & ((\ra1_ir_out~combout\(12) & (!\ra1_ir_out~combout\(14) & !\ra1_ir_out~combout\(15))) # (!\ra1_ir_out~combout\(12) & (\ra1_ir_out~combout\(14)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000010000000110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ra1_ir_out~combout\(12),
	datab => \ra1_ir_out~combout\(14),
	datac => \ra1_ir_out~combout\(13),
	datad => \ra1_ir_out~combout\(15),
	combout => \x1_op2~19_combout\);

-- Location: LCCOMB_X12_Y1_N28
\x1_op2~20\ : cycloneii_lcell_comb
-- Equation(s):
-- \x1_op2~20_combout\ = (!\x1_op2~17_combout\ & \x1_op2~19_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \x1_op2~17_combout\,
	datad => \x1_op2~19_combout\,
	combout => \x1_op2~20_combout\);

-- Location: LCCOMB_X11_Y1_N2
\x1_op2~21\ : cycloneii_lcell_comb
-- Equation(s):
-- \x1_op2~21_combout\ = (\ra1_val_out~combout\ & ((\x1_op2~18_combout\) # ((\ra1_ir_out~combout\(3) & \x1_op2~20_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100100010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \x1_op2~18_combout\,
	datab => \ra1_val_out~combout\,
	datac => \ra1_ir_out~combout\(3),
	datad => \x1_op2~20_combout\,
	combout => \x1_op2~21_combout\);

-- Location: PIN_AJ2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\tag2[4]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_tag2(4),
	combout => \tag2~combout\(4));

-- Location: LCCOMB_X11_Y1_N20
\x1_op2~22\ : cycloneii_lcell_comb
-- Equation(s):
-- \x1_op2~22_combout\ = (\x1_op2~17_combout\ & ((\busy2~combout\ & ((\tag2~combout\(4)))) # (!\busy2~combout\ & (\data2~combout\(4)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110000000100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \data2~combout\(4),
	datab => \busy2~combout\,
	datac => \x1_op2~17_combout\,
	datad => \tag2~combout\(4),
	combout => \x1_op2~22_combout\);

-- Location: LCCOMB_X11_Y1_N22
\x1_op2~23\ : cycloneii_lcell_comb
-- Equation(s):
-- \x1_op2~23_combout\ = (\ra1_val_out~combout\ & ((\x1_op2~22_combout\) # ((\x1_op2~20_combout\ & \ra1_ir_out~combout\(4)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110000010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \x1_op2~22_combout\,
	datab => \x1_op2~20_combout\,
	datac => \ra1_val_out~combout\,
	datad => \ra1_ir_out~combout\(4),
	combout => \x1_op2~23_combout\);

-- Location: LCCOMB_X16_Y1_N26
\x1_op2~27\ : cycloneii_lcell_comb
-- Equation(s):
-- \x1_op2~27_combout\ = (\ra1_ir_out~combout\(15) $ (((\ra1_ir_out~combout\(12)) # (\ra1_ir_out~combout\(13))))) # (!\ra1_ir_out~combout\(14))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011011111111011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ra1_ir_out~combout\(12),
	datab => \ra1_ir_out~combout\(14),
	datac => \ra1_ir_out~combout\(13),
	datad => \ra1_ir_out~combout\(15),
	combout => \x1_op2~27_combout\);

-- Location: LCCOMB_X12_Y1_N4
\x1_op2~28\ : cycloneii_lcell_comb
-- Equation(s):
-- \x1_op2~28_combout\ = (\Ard1a~6_combout\ & (\x1_op2~25_combout\)) # (!\Ard1a~6_combout\ & ((\x1_op2~27_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010110010101100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \x1_op2~25_combout\,
	datab => \x1_op2~27_combout\,
	datac => \Ard1a~6_combout\,
	combout => \x1_op2~28_combout\);

-- Location: PIN_AE8,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\data2[5]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_data2(5),
	combout => \data2~combout\(5));

-- Location: LCCOMB_X19_Y1_N10
\x1_op2~24\ : cycloneii_lcell_comb
-- Equation(s):
-- \x1_op2~24_combout\ = (!\Awr1~0_combout\ & (\ra1_ir_out~combout\(5) & ((!\x1_op2~4_combout\) # (!\Ard1a~6_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001001100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Ard1a~6_combout\,
	datab => \Awr1~0_combout\,
	datac => \x1_op2~4_combout\,
	datad => \ra1_ir_out~combout\(5),
	combout => \x1_op2~24_combout\);

-- Location: LCCOMB_X12_Y1_N12
\x1_op2~30\ : cycloneii_lcell_comb
-- Equation(s):
-- \x1_op2~30_combout\ = (\x1_op2~29_combout\ & ((\x1_op2~28_combout\ & (\data2~combout\(5))) # (!\x1_op2~28_combout\ & ((\x1_op2~24_combout\))))) # (!\x1_op2~29_combout\ & (!\x1_op2~28_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011001110010001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \x1_op2~29_combout\,
	datab => \x1_op2~28_combout\,
	datac => \data2~combout\(5),
	datad => \x1_op2~24_combout\,
	combout => \x1_op2~30_combout\);

-- Location: LCCOMB_X11_Y1_N28
\x1_op2~5\ : cycloneii_lcell_comb
-- Equation(s):
-- \x1_op2~5_combout\ = (\ra1_ir_out~combout\(14) & ((\ra1_ir_out~combout\(13)) # ((\ra1_ir_out~combout\(12))))) # (!\ra1_ir_out~combout\(14) & (((\Ard1a~6_combout\ & !\ra1_ir_out~combout\(12)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ra1_ir_out~combout\(14),
	datab => \ra1_ir_out~combout\(13),
	datac => \Ard1a~6_combout\,
	datad => \ra1_ir_out~combout\(12),
	combout => \x1_op2~5_combout\);

-- Location: LCCOMB_X12_Y1_N10
\x1_op2~26\ : cycloneii_lcell_comb
-- Equation(s):
-- \x1_op2~26_combout\ = (\ra1_ir_out~combout\(14)) # ((\x1_op2~5_combout\) # ((\x1_op2~25_combout\ & \Ard1a~6_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111101100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \x1_op2~25_combout\,
	datab => \ra1_ir_out~combout\(14),
	datac => \Ard1a~6_combout\,
	datad => \x1_op2~5_combout\,
	combout => \x1_op2~26_combout\);

-- Location: LCCOMB_X61_Y1_N12
\x1_op2~31\ : cycloneii_lcell_comb
-- Equation(s):
-- \x1_op2~31_combout\ = (\x1_op2~26_combout\ & (((\x1_op2~30_combout\)))) # (!\x1_op2~26_combout\ & (\x1_op1~27_combout\ & ((\x1_op2~30_combout\) # (\ra1_ir_out~combout\(12)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100101011001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \x1_op1~27_combout\,
	datab => \x1_op2~30_combout\,
	datac => \x1_op2~26_combout\,
	datad => \ra1_ir_out~combout\(12),
	combout => \x1_op2~31_combout\);

-- Location: LCCOMB_X61_Y1_N6
\x1_op2~32\ : cycloneii_lcell_comb
-- Equation(s):
-- \x1_op2~32_combout\ = (\ra1_val_out~combout\ & \x1_op2~31_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \ra1_val_out~combout\,
	datad => \x1_op2~31_combout\,
	combout => \x1_op2~32_combout\);

-- Location: LCCOMB_X53_Y1_N22
\x1_op1~27\ : cycloneii_lcell_comb
-- Equation(s):
-- \x1_op1~27_combout\ = (\ra1_ir_out~combout\(5) & (!\ra1_ir_out~combout\(13) & !\ra1_ir_out~combout\(15)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000001000000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ra1_ir_out~combout\(5),
	datab => \ra1_ir_out~combout\(13),
	datac => \ra1_ir_out~combout\(15),
	combout => \x1_op1~27_combout\);

-- Location: LCCOMB_X13_Y1_N8
\x1_op2~34\ : cycloneii_lcell_comb
-- Equation(s):
-- \x1_op2~34_combout\ = (\x1_op2~26_combout\ & (\x1_op2~33_combout\)) # (!\x1_op2~26_combout\ & (\x1_op1~27_combout\ & ((\x1_op2~33_combout\) # (\ra1_ir_out~combout\(12)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \x1_op2~33_combout\,
	datab => \ra1_ir_out~combout\(12),
	datac => \x1_op1~27_combout\,
	datad => \x1_op2~26_combout\,
	combout => \x1_op2~34_combout\);

-- Location: LCCOMB_X13_Y1_N18
\x1_op2~35\ : cycloneii_lcell_comb
-- Equation(s):
-- \x1_op2~35_combout\ = (\x1_op2~34_combout\ & \ra1_val_out~combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \x1_op2~34_combout\,
	datad => \ra1_val_out~combout\,
	combout => \x1_op2~35_combout\);

-- Location: PIN_AH7,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\data2[7]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_data2(7),
	combout => \data2~combout\(7));

-- Location: LCCOMB_X12_Y1_N20
\x1_op2~36\ : cycloneii_lcell_comb
-- Equation(s):
-- \x1_op2~36_combout\ = (\x1_op2~29_combout\ & ((\x1_op2~28_combout\ & (\data2~combout\(7))) # (!\x1_op2~28_combout\ & ((\x1_op2~24_combout\))))) # (!\x1_op2~29_combout\ & (!\x1_op2~28_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011001110010001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \x1_op2~29_combout\,
	datab => \x1_op2~28_combout\,
	datac => \data2~combout\(7),
	datad => \x1_op2~24_combout\,
	combout => \x1_op2~36_combout\);

-- Location: LCCOMB_X13_Y1_N20
\x1_op2~37\ : cycloneii_lcell_comb
-- Equation(s):
-- \x1_op2~37_combout\ = (\x1_op2~26_combout\ & (((\x1_op2~36_combout\)))) # (!\x1_op2~26_combout\ & (\x1_op1~27_combout\ & ((\x1_op2~36_combout\) # (\ra1_ir_out~combout\(12)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110010011100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \x1_op2~26_combout\,
	datab => \x1_op1~27_combout\,
	datac => \x1_op2~36_combout\,
	datad => \ra1_ir_out~combout\(12),
	combout => \x1_op2~37_combout\);

-- Location: LCCOMB_X13_Y1_N10
\x1_op2~38\ : cycloneii_lcell_comb
-- Equation(s):
-- \x1_op2~38_combout\ = (\x1_op2~37_combout\ & \ra1_val_out~combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \x1_op2~37_combout\,
	datad => \ra1_val_out~combout\,
	combout => \x1_op2~38_combout\);

-- Location: PIN_AD5,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\data2[8]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_data2(8),
	combout => \data2~combout\(8));

-- Location: LCCOMB_X12_Y1_N26
\x1_op2~39\ : cycloneii_lcell_comb
-- Equation(s):
-- \x1_op2~39_combout\ = (\x1_op2~29_combout\ & ((\x1_op2~28_combout\ & (\data2~combout\(8))) # (!\x1_op2~28_combout\ & ((\x1_op2~24_combout\))))) # (!\x1_op2~29_combout\ & (!\x1_op2~28_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011001110010001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \x1_op2~29_combout\,
	datab => \x1_op2~28_combout\,
	datac => \data2~combout\(8),
	datad => \x1_op2~24_combout\,
	combout => \x1_op2~39_combout\);

-- Location: LCCOMB_X13_Y1_N12
\x1_op2~40\ : cycloneii_lcell_comb
-- Equation(s):
-- \x1_op2~40_combout\ = (\x1_op2~26_combout\ & (\x1_op2~39_combout\)) # (!\x1_op2~26_combout\ & (\x1_op1~27_combout\ & ((\x1_op2~39_combout\) # (\ra1_ir_out~combout\(12)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101100011001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \x1_op2~26_combout\,
	datab => \x1_op2~39_combout\,
	datac => \x1_op1~27_combout\,
	datad => \ra1_ir_out~combout\(12),
	combout => \x1_op2~40_combout\);

-- Location: LCCOMB_X16_Y1_N16
\x1_op2~41\ : cycloneii_lcell_comb
-- Equation(s):
-- \x1_op2~41_combout\ = (\x1_op2~40_combout\ & \ra1_val_out~combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \x1_op2~40_combout\,
	datad => \ra1_val_out~combout\,
	combout => \x1_op2~41_combout\);

-- Location: PIN_AF8,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\data2[9]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_data2(9),
	combout => \data2~combout\(9));

-- Location: LCCOMB_X12_Y1_N16
\x1_op2~42\ : cycloneii_lcell_comb
-- Equation(s):
-- \x1_op2~42_combout\ = (\x1_op2~29_combout\ & ((\x1_op2~28_combout\ & (\data2~combout\(9))) # (!\x1_op2~28_combout\ & ((\x1_op2~24_combout\))))) # (!\x1_op2~29_combout\ & (!\x1_op2~28_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011001110010001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \x1_op2~29_combout\,
	datab => \x1_op2~28_combout\,
	datac => \data2~combout\(9),
	datad => \x1_op2~24_combout\,
	combout => \x1_op2~42_combout\);

-- Location: LCCOMB_X13_Y1_N2
\x1_op2~43\ : cycloneii_lcell_comb
-- Equation(s):
-- \x1_op2~43_combout\ = (\x1_op2~26_combout\ & (\x1_op2~42_combout\)) # (!\x1_op2~26_combout\ & (\x1_op1~27_combout\ & ((\x1_op2~42_combout\) # (\ra1_ir_out~combout\(12)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101100011001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \x1_op2~26_combout\,
	datab => \x1_op2~42_combout\,
	datac => \x1_op1~27_combout\,
	datad => \ra1_ir_out~combout\(12),
	combout => \x1_op2~43_combout\);

-- Location: LCCOMB_X13_Y1_N16
\x1_op2~44\ : cycloneii_lcell_comb
-- Equation(s):
-- \x1_op2~44_combout\ = (\x1_op2~43_combout\ & \ra1_val_out~combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \x1_op2~43_combout\,
	datad => \ra1_val_out~combout\,
	combout => \x1_op2~44_combout\);

-- Location: PIN_AK5,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\data2[10]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_data2(10),
	combout => \data2~combout\(10));

-- Location: LCCOMB_X12_Y1_N30
\x1_op2~45\ : cycloneii_lcell_comb
-- Equation(s):
-- \x1_op2~45_combout\ = (\x1_op2~29_combout\ & ((\x1_op2~28_combout\ & (\data2~combout\(10))) # (!\x1_op2~28_combout\ & ((\x1_op2~24_combout\))))) # (!\x1_op2~29_combout\ & (!\x1_op2~28_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011001110010001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \x1_op2~29_combout\,
	datab => \x1_op2~28_combout\,
	datac => \data2~combout\(10),
	datad => \x1_op2~24_combout\,
	combout => \x1_op2~45_combout\);

-- Location: LCCOMB_X13_Y1_N26
\x1_op2~46\ : cycloneii_lcell_comb
-- Equation(s):
-- \x1_op2~46_combout\ = (\x1_op2~26_combout\ & (((\x1_op2~45_combout\)))) # (!\x1_op2~26_combout\ & (\x1_op1~27_combout\ & ((\x1_op2~45_combout\) # (\ra1_ir_out~combout\(12)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110010011100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \x1_op2~26_combout\,
	datab => \x1_op1~27_combout\,
	datac => \x1_op2~45_combout\,
	datad => \ra1_ir_out~combout\(12),
	combout => \x1_op2~46_combout\);

-- Location: LCCOMB_X13_Y1_N28
\x1_op2~47\ : cycloneii_lcell_comb
-- Equation(s):
-- \x1_op2~47_combout\ = (\x1_op2~46_combout\ & \ra1_val_out~combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \x1_op2~46_combout\,
	datad => \ra1_val_out~combout\,
	combout => \x1_op2~47_combout\);

-- Location: PIN_AH2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\data2[11]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_data2(11),
	combout => \data2~combout\(11));

-- Location: LCCOMB_X12_Y1_N8
\x1_op2~48\ : cycloneii_lcell_comb
-- Equation(s):
-- \x1_op2~48_combout\ = (\x1_op2~29_combout\ & ((\x1_op2~28_combout\ & (\data2~combout\(11))) # (!\x1_op2~28_combout\ & ((\x1_op2~24_combout\))))) # (!\x1_op2~29_combout\ & (!\x1_op2~28_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011001110010001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \x1_op2~29_combout\,
	datab => \x1_op2~28_combout\,
	datac => \data2~combout\(11),
	datad => \x1_op2~24_combout\,
	combout => \x1_op2~48_combout\);

-- Location: LCCOMB_X61_Y1_N28
\x1_op2~49\ : cycloneii_lcell_comb
-- Equation(s):
-- \x1_op2~49_combout\ = (\x1_op2~26_combout\ & (((\x1_op2~48_combout\)))) # (!\x1_op2~26_combout\ & (\x1_op1~27_combout\ & ((\x1_op2~48_combout\) # (\ra1_ir_out~combout\(12)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100101011001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \x1_op1~27_combout\,
	datab => \x1_op2~48_combout\,
	datac => \x1_op2~26_combout\,
	datad => \ra1_ir_out~combout\(12),
	combout => \x1_op2~49_combout\);

-- Location: LCCOMB_X61_Y1_N30
\x1_op2~50\ : cycloneii_lcell_comb
-- Equation(s):
-- \x1_op2~50_combout\ = (\ra1_val_out~combout\ & \x1_op2~49_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \ra1_val_out~combout\,
	datad => \x1_op2~49_combout\,
	combout => \x1_op2~50_combout\);

-- Location: PIN_AE4,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\data2[12]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_data2(12),
	combout => \data2~combout\(12));

-- Location: LCCOMB_X12_Y1_N22
\x1_op2~51\ : cycloneii_lcell_comb
-- Equation(s):
-- \x1_op2~51_combout\ = (\x1_op2~29_combout\ & ((\x1_op2~28_combout\ & (\data2~combout\(12))) # (!\x1_op2~28_combout\ & ((\x1_op2~24_combout\))))) # (!\x1_op2~29_combout\ & (!\x1_op2~28_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011001110010001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \x1_op2~29_combout\,
	datab => \x1_op2~28_combout\,
	datac => \data2~combout\(12),
	datad => \x1_op2~24_combout\,
	combout => \x1_op2~51_combout\);

-- Location: LCCOMB_X13_Y1_N30
\x1_op2~52\ : cycloneii_lcell_comb
-- Equation(s):
-- \x1_op2~52_combout\ = (\x1_op2~26_combout\ & (\x1_op2~51_combout\)) # (!\x1_op2~26_combout\ & (\x1_op1~27_combout\ & ((\x1_op2~51_combout\) # (\ra1_ir_out~combout\(12)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101100011001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \x1_op2~26_combout\,
	datab => \x1_op2~51_combout\,
	datac => \x1_op1~27_combout\,
	datad => \ra1_ir_out~combout\(12),
	combout => \x1_op2~52_combout\);

-- Location: LCCOMB_X13_Y1_N24
\x1_op2~53\ : cycloneii_lcell_comb
-- Equation(s):
-- \x1_op2~53_combout\ = (\x1_op2~52_combout\ & \ra1_val_out~combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \x1_op2~52_combout\,
	datad => \ra1_val_out~combout\,
	combout => \x1_op2~53_combout\);

-- Location: PIN_AG2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\data2[13]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_data2(13),
	combout => \data2~combout\(13));

-- Location: LCCOMB_X12_Y1_N24
\x1_op2~54\ : cycloneii_lcell_comb
-- Equation(s):
-- \x1_op2~54_combout\ = (\x1_op2~29_combout\ & ((\x1_op2~28_combout\ & (\data2~combout\(13))) # (!\x1_op2~28_combout\ & ((\x1_op2~24_combout\))))) # (!\x1_op2~29_combout\ & (!\x1_op2~28_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011001110010001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \x1_op2~29_combout\,
	datab => \x1_op2~28_combout\,
	datac => \data2~combout\(13),
	datad => \x1_op2~24_combout\,
	combout => \x1_op2~54_combout\);

-- Location: LCCOMB_X13_Y1_N14
\x1_op2~55\ : cycloneii_lcell_comb
-- Equation(s):
-- \x1_op2~55_combout\ = (\x1_op2~26_combout\ & (\x1_op2~54_combout\)) # (!\x1_op2~26_combout\ & (\x1_op1~27_combout\ & ((\x1_op2~54_combout\) # (\ra1_ir_out~combout\(12)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101100011001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \x1_op2~26_combout\,
	datab => \x1_op2~54_combout\,
	datac => \x1_op1~27_combout\,
	datad => \ra1_ir_out~combout\(12),
	combout => \x1_op2~55_combout\);

-- Location: LCCOMB_X13_Y1_N4
\x1_op2~56\ : cycloneii_lcell_comb
-- Equation(s):
-- \x1_op2~56_combout\ = (\x1_op2~55_combout\ & \ra1_val_out~combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \x1_op2~55_combout\,
	datad => \ra1_val_out~combout\,
	combout => \x1_op2~56_combout\);

-- Location: PIN_AJ3,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\data2[14]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_data2(14),
	combout => \data2~combout\(14));

-- Location: LCCOMB_X12_Y1_N18
\x1_op2~57\ : cycloneii_lcell_comb
-- Equation(s):
-- \x1_op2~57_combout\ = (\x1_op2~29_combout\ & ((\x1_op2~28_combout\ & (\data2~combout\(14))) # (!\x1_op2~28_combout\ & ((\x1_op2~24_combout\))))) # (!\x1_op2~29_combout\ & (!\x1_op2~28_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011001110010001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \x1_op2~29_combout\,
	datab => \x1_op2~28_combout\,
	datac => \data2~combout\(14),
	datad => \x1_op2~24_combout\,
	combout => \x1_op2~57_combout\);

-- Location: LCCOMB_X13_Y1_N22
\x1_op2~58\ : cycloneii_lcell_comb
-- Equation(s):
-- \x1_op2~58_combout\ = (\x1_op2~26_combout\ & (\x1_op2~57_combout\)) # (!\x1_op2~26_combout\ & (\x1_op1~27_combout\ & ((\x1_op2~57_combout\) # (\ra1_ir_out~combout\(12)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101100011001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \x1_op2~26_combout\,
	datab => \x1_op2~57_combout\,
	datac => \x1_op1~27_combout\,
	datad => \ra1_ir_out~combout\(12),
	combout => \x1_op2~58_combout\);

-- Location: LCCOMB_X13_Y1_N0
\x1_op2~59\ : cycloneii_lcell_comb
-- Equation(s):
-- \x1_op2~59_combout\ = (\x1_op2~58_combout\ & \ra1_val_out~combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \x1_op2~58_combout\,
	datad => \ra1_val_out~combout\,
	combout => \x1_op2~59_combout\);

-- Location: PIN_AG3,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\data2[15]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_data2(15),
	combout => \data2~combout\(15));

-- Location: LCCOMB_X12_Y1_N0
\x1_op2~60\ : cycloneii_lcell_comb
-- Equation(s):
-- \x1_op2~60_combout\ = (\x1_op2~29_combout\ & ((\x1_op2~28_combout\ & (\data2~combout\(15))) # (!\x1_op2~28_combout\ & ((\x1_op2~24_combout\))))) # (!\x1_op2~29_combout\ & (!\x1_op2~28_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011001110010001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \x1_op2~29_combout\,
	datab => \x1_op2~28_combout\,
	datac => \data2~combout\(15),
	datad => \x1_op2~24_combout\,
	combout => \x1_op2~60_combout\);

-- Location: LCCOMB_X13_Y1_N6
\x1_op2~61\ : cycloneii_lcell_comb
-- Equation(s):
-- \x1_op2~61_combout\ = (\x1_op2~26_combout\ & (((\x1_op2~60_combout\)))) # (!\x1_op2~26_combout\ & (\x1_op1~27_combout\ & ((\x1_op2~60_combout\) # (\ra1_ir_out~combout\(12)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110010011100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \x1_op2~26_combout\,
	datab => \x1_op1~27_combout\,
	datac => \x1_op2~60_combout\,
	datad => \ra1_ir_out~combout\(12),
	combout => \x1_op2~61_combout\);

-- Location: LCCOMB_X23_Y1_N26
\x1_op2~62\ : cycloneii_lcell_comb
-- Equation(s):
-- \x1_op2~62_combout\ = (\x1_op2~61_combout\ & \ra1_val_out~combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \x1_op2~61_combout\,
	datad => \ra1_val_out~combout\,
	combout => \x1_op2~62_combout\);

-- Location: PIN_G2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\busy3~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_busy3,
	combout => \busy3~combout\);

-- Location: PIN_N9,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\tag3[0]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_tag3(0),
	combout => \tag3~combout\(0));

-- Location: PIN_L1,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\data3[0]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_data3(0),
	combout => \data3~combout\(0));

-- Location: LCCOMB_X1_Y48_N20
\x2_op1~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \x2_op1~0_combout\ = (\ra2_val_out~combout\ & (!\ra2_ir_out~combout\(14) & (\ra2_ir_out~combout\(13) $ (\ra2_ir_out~combout\(15)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ra2_ir_out~combout\(13),
	datab => \ra2_val_out~combout\,
	datac => \ra2_ir_out~combout\(15),
	datad => \ra2_ir_out~combout\(14),
	combout => \x2_op1~0_combout\);

-- Location: LCCOMB_X1_Y37_N16
\x2_op1~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \x2_op1~1_combout\ = (\ra2_ir_out~combout\(12) $ (!\ra2_ir_out~combout\(15))) # (!\x2_op1~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001100111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \x2_op1~0_combout\,
	datac => \ra2_ir_out~combout\(12),
	datad => \ra2_ir_out~combout\(15),
	combout => \x2_op1~1_combout\);

-- Location: LCCOMB_X1_Y34_N28
\x2_op1~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \x2_op1~2_combout\ = (\x2_op1~1_combout\ & ((\busy3~combout\ & (\tag3~combout\(0))) # (!\busy3~combout\ & ((\data3~combout\(0))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \busy3~combout\,
	datab => \tag3~combout\(0),
	datac => \data3~combout\(0),
	datad => \x2_op1~1_combout\,
	combout => \x2_op1~2_combout\);

-- Location: PIN_M10,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\data3[1]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_data3(1),
	combout => \data3~combout\(1));

-- Location: PIN_M2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\tag3[1]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_tag3(1),
	combout => \tag3~combout\(1));

-- Location: LCCOMB_X1_Y37_N2
\x2_op1~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \x2_op1~3_combout\ = (\x2_op1~1_combout\ & ((\busy3~combout\ & ((\tag3~combout\(1)))) # (!\busy3~combout\ & (\data3~combout\(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \data3~combout\(1),
	datab => \tag3~combout\(1),
	datac => \busy3~combout\,
	datad => \x2_op1~1_combout\,
	combout => \x2_op1~3_combout\);

-- Location: PIN_L3,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\tag3[2]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_tag3(2),
	combout => \tag3~combout\(2));

-- Location: PIN_L4,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\data3[2]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_data3(2),
	combout => \data3~combout\(2));

-- Location: LCCOMB_X1_Y36_N20
\x2_op1~4\ : cycloneii_lcell_comb
-- Equation(s):
-- \x2_op1~4_combout\ = (\x2_op1~1_combout\ & ((\busy3~combout\ & (\tag3~combout\(2))) # (!\busy3~combout\ & ((\data3~combout\(2))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101000010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \busy3~combout\,
	datab => \tag3~combout\(2),
	datac => \x2_op1~1_combout\,
	datad => \data3~combout\(2),
	combout => \x2_op1~4_combout\);

-- Location: PIN_K1,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\data3[3]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_data3(3),
	combout => \data3~combout\(3));

-- Location: PIN_L2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\tag3[3]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_tag3(3),
	combout => \tag3~combout\(3));

-- Location: LCCOMB_X1_Y35_N28
\x2_op1~5\ : cycloneii_lcell_comb
-- Equation(s):
-- \x2_op1~5_combout\ = (\x2_op1~1_combout\ & ((\busy3~combout\ & ((\tag3~combout\(3)))) # (!\busy3~combout\ & (\data3~combout\(3)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110010000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \busy3~combout\,
	datab => \data3~combout\(3),
	datac => \tag3~combout\(3),
	datad => \x2_op1~1_combout\,
	combout => \x2_op1~5_combout\);

-- Location: PIN_M4,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\data3[4]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_data3(4),
	combout => \data3~combout\(4));

-- Location: PIN_J1,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\tag3[4]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_tag3(4),
	combout => \tag3~combout\(4));

-- Location: LCCOMB_X1_Y36_N6
\x2_op1~6\ : cycloneii_lcell_comb
-- Equation(s):
-- \x2_op1~6_combout\ = (\x2_op1~1_combout\ & ((\busy3~combout\ & ((\tag3~combout\(4)))) # (!\busy3~combout\ & (\data3~combout\(4)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110000001000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \busy3~combout\,
	datab => \data3~combout\(4),
	datac => \x2_op1~1_combout\,
	datad => \tag3~combout\(4),
	combout => \x2_op1~6_combout\);

-- Location: PIN_K3,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\data3[5]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_data3(5),
	combout => \data3~combout\(5));

-- Location: LCCOMB_X1_Y38_N12
\x2_op1~7\ : cycloneii_lcell_comb
-- Equation(s):
-- \x2_op1~7_combout\ = (!\busy3~combout\ & (\data3~combout\(5) & \x2_op1~1_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \busy3~combout\,
	datac => \data3~combout\(5),
	datad => \x2_op1~1_combout\,
	combout => \x2_op1~7_combout\);

-- Location: PIN_N7,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\data3[6]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_data3(6),
	combout => \data3~combout\(6));

-- Location: LCCOMB_X1_Y35_N6
\x2_op1~8\ : cycloneii_lcell_comb
-- Equation(s):
-- \x2_op1~8_combout\ = (!\busy3~combout\ & (\data3~combout\(6) & \x2_op1~1_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \busy3~combout\,
	datac => \data3~combout\(6),
	datad => \x2_op1~1_combout\,
	combout => \x2_op1~8_combout\);

-- Location: LCCOMB_X1_Y48_N10
\x2_op1~9\ : cycloneii_lcell_comb
-- Equation(s):
-- \x2_op1~9_combout\ = (\ra2_val_out~combout\ & (!\ra2_ir_out~combout\(14) & (\ra2_ir_out~combout\(15) $ (\ra2_ir_out~combout\(12)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ra2_ir_out~combout\(15),
	datab => \ra2_val_out~combout\,
	datac => \ra2_ir_out~combout\(12),
	datad => \ra2_ir_out~combout\(14),
	combout => \x2_op1~9_combout\);

-- Location: LCCOMB_X1_Y37_N22
\x2_op1~11\ : cycloneii_lcell_comb
-- Equation(s):
-- \x2_op1~11_combout\ = (\ra2_ir_out~combout\(13) $ (!\ra2_ir_out~combout\(15))) # (!\x2_op1~9_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111100111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \ra2_ir_out~combout\(13),
	datac => \x2_op1~9_combout\,
	datad => \ra2_ir_out~combout\(15),
	combout => \x2_op1~11_combout\);

-- Location: PIN_G1,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\data3[7]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_data3(7),
	combout => \data3~combout\(7));

-- Location: LCCOMB_X1_Y37_N12
\x2_op1~10\ : cycloneii_lcell_comb
-- Equation(s):
-- \x2_op1~10_combout\ = (\ra2_ir_out~combout\(0) & (\ra2_ir_out~combout\(13) & (\x2_op1~9_combout\ & !\ra2_ir_out~combout\(15))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ra2_ir_out~combout\(0),
	datab => \ra2_ir_out~combout\(13),
	datac => \x2_op1~9_combout\,
	datad => \ra2_ir_out~combout\(15),
	combout => \x2_op1~10_combout\);

-- Location: LCCOMB_X1_Y37_N28
\x2_op1~12\ : cycloneii_lcell_comb
-- Equation(s):
-- \x2_op1~12_combout\ = (\x2_op1~10_combout\) # ((!\busy3~combout\ & (\x2_op1~11_combout\ & \data3~combout\(7))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111101000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \busy3~combout\,
	datab => \x2_op1~11_combout\,
	datac => \data3~combout\(7),
	datad => \x2_op1~10_combout\,
	combout => \x2_op1~12_combout\);

-- Location: LCCOMB_X1_Y37_N18
\x2_op1~13\ : cycloneii_lcell_comb
-- Equation(s):
-- \x2_op1~13_combout\ = (\ra2_ir_out~combout\(12) & (\x2_op1~0_combout\ & (\ra2_ir_out~combout\(1) & !\ra2_ir_out~combout\(15))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ra2_ir_out~combout\(12),
	datab => \x2_op1~0_combout\,
	datac => \ra2_ir_out~combout\(1),
	datad => \ra2_ir_out~combout\(15),
	combout => \x2_op1~13_combout\);

-- Location: PIN_K4,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\data3[8]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_data3(8),
	combout => \data3~combout\(8));

-- Location: LCCOMB_X1_Y37_N20
\x2_op1~14\ : cycloneii_lcell_comb
-- Equation(s):
-- \x2_op1~14_combout\ = (\x2_op1~13_combout\) # ((!\busy3~combout\ & (\data3~combout\(8) & \x2_op1~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \busy3~combout\,
	datab => \x2_op1~13_combout\,
	datac => \data3~combout\(8),
	datad => \x2_op1~1_combout\,
	combout => \x2_op1~14_combout\);

-- Location: PIN_G6,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\data3[9]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_data3(9),
	combout => \data3~combout\(9));

-- Location: LCCOMB_X1_Y48_N12
\x2_op1~15\ : cycloneii_lcell_comb
-- Equation(s):
-- \x2_op1~15_combout\ = (!\busy3~combout\ & \data3~combout\(9))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \busy3~combout\,
	datad => \data3~combout\(9),
	combout => \x2_op1~15_combout\);

-- Location: LCCOMB_X1_Y48_N0
\x2_op1~17\ : cycloneii_lcell_comb
-- Equation(s):
-- \x2_op1~17_combout\ = (\ra2_val_out~combout\ & ((\ra2_ir_out~combout\(12) & (!\ra2_ir_out~combout\(15) & \ra2_ir_out~combout\(13))) # (!\ra2_ir_out~combout\(12) & (\ra2_ir_out~combout\(15) & !\ra2_ir_out~combout\(13)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000100001000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ra2_ir_out~combout\(12),
	datab => \ra2_val_out~combout\,
	datac => \ra2_ir_out~combout\(15),
	datad => \ra2_ir_out~combout\(13),
	combout => \x2_op1~17_combout\);

-- Location: LCCOMB_X1_Y48_N14
\x2_op1~16\ : cycloneii_lcell_comb
-- Equation(s):
-- \x2_op1~16_combout\ = (!\ra2_ir_out~combout\(15) & \ra2_ir_out~combout\(2))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101000001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ra2_ir_out~combout\(15),
	datac => \ra2_ir_out~combout\(2),
	combout => \x2_op1~16_combout\);

-- Location: LCCOMB_X1_Y48_N26
\x2_op1~18\ : cycloneii_lcell_comb
-- Equation(s):
-- \x2_op1~18_combout\ = (\x2_op1~17_combout\ & ((\ra2_ir_out~combout\(14) & (\x2_op1~15_combout\)) # (!\ra2_ir_out~combout\(14) & ((\x2_op1~16_combout\))))) # (!\x2_op1~17_combout\ & (\x2_op1~15_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \x2_op1~15_combout\,
	datab => \x2_op1~17_combout\,
	datac => \x2_op1~16_combout\,
	datad => \ra2_ir_out~combout\(14),
	combout => \x2_op1~18_combout\);

-- Location: LCCOMB_X1_Y37_N6
\x2_op1~19\ : cycloneii_lcell_comb
-- Equation(s):
-- \x2_op1~19_combout\ = (\ra2_ir_out~combout\(12) & (((\ra2_ir_out~combout\(13) & \x2_op1~0_combout\)) # (!\busy3~combout\))) # (!\ra2_ir_out~combout\(12) & (!\busy3~combout\ & ((\ra2_ir_out~combout\(13)) # (!\x2_op1~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000111000001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ra2_ir_out~combout\(12),
	datab => \ra2_ir_out~combout\(13),
	datac => \busy3~combout\,
	datad => \x2_op1~0_combout\,
	combout => \x2_op1~19_combout\);

-- Location: PIN_T8,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\data3[10]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_data3(10),
	combout => \data3~combout\(10));

-- Location: LCCOMB_X1_Y37_N4
\x2_op1~20\ : cycloneii_lcell_comb
-- Equation(s):
-- \x2_op1~20_combout\ = (\ra2_ir_out~combout\(13) $ (\ra2_ir_out~combout\(12))) # (!\x2_op1~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \ra2_ir_out~combout\(13),
	datac => \ra2_ir_out~combout\(12),
	datad => \x2_op1~0_combout\,
	combout => \x2_op1~20_combout\);

-- Location: LCCOMB_X1_Y23_N26
\x2_op1~21\ : cycloneii_lcell_comb
-- Equation(s):
-- \x2_op1~21_combout\ = (\x2_op1~19_combout\ & ((\x2_op1~20_combout\ & ((\data3~combout\(10)))) # (!\x2_op1~20_combout\ & (\ra2_ir_out~combout\(3)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ra2_ir_out~combout\(3),
	datab => \x2_op1~19_combout\,
	datac => \data3~combout\(10),
	datad => \x2_op1~20_combout\,
	combout => \x2_op1~21_combout\);

-- Location: PIN_W2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\data3[11]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_data3(11),
	combout => \data3~combout\(11));

-- Location: LCCOMB_X1_Y23_N24
\x2_op1~22\ : cycloneii_lcell_comb
-- Equation(s):
-- \x2_op1~22_combout\ = (\x2_op1~19_combout\ & ((\x2_op1~20_combout\ & ((\data3~combout\(11)))) # (!\x2_op1~20_combout\ & (\ra2_ir_out~combout\(4)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110010000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \x2_op1~20_combout\,
	datab => \ra2_ir_out~combout\(4),
	datac => \data3~combout\(11),
	datad => \x2_op1~19_combout\,
	combout => \x2_op1~22_combout\);

-- Location: PIN_V2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\data3[12]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_data3(12),
	combout => \data3~combout\(12));

-- Location: LCCOMB_X1_Y23_N2
\x2_op1~23\ : cycloneii_lcell_comb
-- Equation(s):
-- \x2_op1~23_combout\ = (\x2_op1~19_combout\ & ((\x2_op1~20_combout\ & (\data3~combout\(12))) # (!\x2_op1~20_combout\ & ((\ra2_ir_out~combout\(5))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \data3~combout\(12),
	datab => \x2_op1~19_combout\,
	datac => \ra2_ir_out~combout\(5),
	datad => \x2_op1~20_combout\,
	combout => \x2_op1~23_combout\);

-- Location: PIN_U8,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\data3[13]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_data3(13),
	combout => \data3~combout\(13));

-- Location: LCCOMB_X1_Y23_N16
\x2_op1~24\ : cycloneii_lcell_comb
-- Equation(s):
-- \x2_op1~24_combout\ = (\x2_op1~19_combout\ & ((\x2_op1~20_combout\ & (\data3~combout\(13))) # (!\x2_op1~20_combout\ & ((\ra2_ir_out~combout\(6))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \data3~combout\(13),
	datab => \x2_op1~19_combout\,
	datac => \ra2_ir_out~combout\(6),
	datad => \x2_op1~20_combout\,
	combout => \x2_op1~24_combout\);

-- Location: PIN_U2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\data3[14]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_data3(14),
	combout => \data3~combout\(14));

-- Location: LCCOMB_X1_Y23_N22
\x2_op1~25\ : cycloneii_lcell_comb
-- Equation(s):
-- \x2_op1~25_combout\ = (\x2_op1~19_combout\ & ((\x2_op1~20_combout\ & (\data3~combout\(14))) # (!\x2_op1~20_combout\ & ((\ra2_ir_out~combout\(7))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \data3~combout\(14),
	datab => \x2_op1~19_combout\,
	datac => \ra2_ir_out~combout\(7),
	datad => \x2_op1~20_combout\,
	combout => \x2_op1~25_combout\);

-- Location: PIN_W3,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\data3[15]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_data3(15),
	combout => \data3~combout\(15));

-- Location: LCCOMB_X1_Y23_N8
\x2_op1~26\ : cycloneii_lcell_comb
-- Equation(s):
-- \x2_op1~26_combout\ = (\x2_op1~19_combout\ & ((\x2_op1~20_combout\ & (\data3~combout\(15))) # (!\x2_op1~20_combout\ & ((\ra2_ir_out~combout\(8))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \x2_op1~20_combout\,
	datab => \data3~combout\(15),
	datac => \ra2_ir_out~combout\(8),
	datad => \x2_op1~19_combout\,
	combout => \x2_op1~26_combout\);

-- Location: LCCOMB_X19_Y50_N28
\x2_op2~65\ : cycloneii_lcell_comb
-- Equation(s):
-- \x2_op2~65_combout\ = (\ra2_ir_out~combout\(0) & (((!\ra2_ir_out~combout\(2) & !\ra2_ir_out~combout\(1))) # (!\x2_op2~6_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000001010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ra2_ir_out~combout\(0),
	datab => \ra2_ir_out~combout\(2),
	datac => \ra2_ir_out~combout\(1),
	datad => \x2_op2~6_combout\,
	combout => \x2_op2~65_combout\);

-- Location: LCCOMB_X1_Y48_N2
\x2_op2~9\ : cycloneii_lcell_comb
-- Equation(s):
-- \x2_op2~9_combout\ = (!\ra2_ir_out~combout\(13) & (!\ra2_ir_out~combout\(15) & \ra2_val_out~combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000010100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ra2_ir_out~combout\(13),
	datac => \ra2_ir_out~combout\(15),
	datad => \ra2_val_out~combout\,
	combout => \x2_op2~9_combout\);

-- Location: PIN_E7,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\busy4~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_busy4,
	combout => \busy4~combout\);

-- Location: PIN_G3,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\data4[0]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_data4(0),
	combout => \data4~combout\(0));

-- Location: PIN_D4,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\tag4[0]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_tag4(0),
	combout => \tag4~combout\(0));

-- Location: LCCOMB_X1_Y48_N4
\x2_op2~8\ : cycloneii_lcell_comb
-- Equation(s):
-- \x2_op2~8_combout\ = (\busy4~combout\ & ((\tag4~combout\(0)))) # (!\busy4~combout\ & (\data4~combout\(0)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \busy4~combout\,
	datac => \data4~combout\(0),
	datad => \tag4~combout\(0),
	combout => \x2_op2~8_combout\);

-- Location: LCCOMB_X25_Y50_N2
\x2_op2~11\ : cycloneii_lcell_comb
-- Equation(s):
-- \x2_op2~11_combout\ = (\ra2_ir_out~combout\(14) & (\ra2_ir_out~combout\(15) $ (((\ra2_ir_out~combout\(12)) # (\ra2_ir_out~combout\(13))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000101000101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ra2_ir_out~combout\(14),
	datab => \ra2_ir_out~combout\(12),
	datac => \ra2_ir_out~combout\(15),
	datad => \ra2_ir_out~combout\(13),
	combout => \x2_op2~11_combout\);

-- Location: LCCOMB_X25_Y50_N24
\x2_op2~12\ : cycloneii_lcell_comb
-- Equation(s):
-- \x2_op2~12_combout\ = (\ra2_val_out~combout\ & ((\x2_op2~11_combout\) # ((\x2_op2~7_combout\ & \x2_op2~6_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \x2_op2~7_combout\,
	datab => \x2_op2~11_combout\,
	datac => \x2_op2~6_combout\,
	datad => \ra2_val_out~combout\,
	combout => \x2_op2~12_combout\);

-- Location: LCCOMB_X1_Y48_N28
\x2_op2~13\ : cycloneii_lcell_comb
-- Equation(s):
-- \x2_op2~13_combout\ = (\x2_op2~12_combout\ & (((\x2_op2~8_combout\)))) # (!\x2_op2~12_combout\ & (\x2_op2~65_combout\ & (\x2_op2~9_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \x2_op2~65_combout\,
	datab => \x2_op2~9_combout\,
	datac => \x2_op2~8_combout\,
	datad => \x2_op2~12_combout\,
	combout => \x2_op2~13_combout\);

-- Location: PIN_F4,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\tag4[1]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_tag4(1),
	combout => \tag4~combout\(1));

-- Location: LCCOMB_X1_Y48_N22
\x2_op2~14\ : cycloneii_lcell_comb
-- Equation(s):
-- \x2_op2~14_combout\ = (\x2_op2~12_combout\ & ((\busy4~combout\ & ((\tag4~combout\(1)))) # (!\busy4~combout\ & (\data4~combout\(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \data4~combout\(1),
	datab => \tag4~combout\(1),
	datac => \busy4~combout\,
	datad => \x2_op2~12_combout\,
	combout => \x2_op2~14_combout\);

-- Location: LCCOMB_X1_Y49_N0
\x2_op2~15\ : cycloneii_lcell_comb
-- Equation(s):
-- \x2_op2~15_combout\ = \ra2_ir_out~combout\(12) $ (\ra2_ir_out~combout\(14))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \ra2_ir_out~combout\(12),
	datad => \ra2_ir_out~combout\(14),
	combout => \x2_op2~15_combout\);

-- Location: LCCOMB_X1_Y49_N6
\x2_op2~16\ : cycloneii_lcell_comb
-- Equation(s):
-- \x2_op2~16_combout\ = (\x2_op2~14_combout\) # ((\x2_op2~9_combout\ & (\ra2_ir_out~combout\(1) & \x2_op2~15_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111100011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \x2_op2~9_combout\,
	datab => \ra2_ir_out~combout\(1),
	datac => \x2_op2~14_combout\,
	datad => \x2_op2~15_combout\,
	combout => \x2_op2~16_combout\);

-- Location: LCCOMB_X1_Y48_N6
\x2_op2~18\ : cycloneii_lcell_comb
-- Equation(s):
-- \x2_op2~18_combout\ = (\ra2_ir_out~combout\(2) & ((\ra2_ir_out~combout\(12)) # (\ra2_ir_out~combout\(14))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ra2_ir_out~combout\(12),
	datac => \ra2_ir_out~combout\(2),
	datad => \ra2_ir_out~combout\(14),
	combout => \x2_op2~18_combout\);

-- Location: PIN_F3,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\tag4[2]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_tag4(2),
	combout => \tag4~combout\(2));

-- Location: PIN_F7,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\data4[2]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_data4(2),
	combout => \data4~combout\(2));

-- Location: LCCOMB_X1_Y48_N16
\x2_op2~17\ : cycloneii_lcell_comb
-- Equation(s):
-- \x2_op2~17_combout\ = (\busy4~combout\ & (\tag4~combout\(2))) # (!\busy4~combout\ & ((\data4~combout\(2))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \tag4~combout\(2),
	datac => \busy4~combout\,
	datad => \data4~combout\(2),
	combout => \x2_op2~17_combout\);

-- Location: LCCOMB_X1_Y48_N24
\x2_op2~19\ : cycloneii_lcell_comb
-- Equation(s):
-- \x2_op2~19_combout\ = (\x2_op2~12_combout\ & (((\x2_op2~17_combout\)))) # (!\x2_op2~12_combout\ & (\x2_op2~18_combout\ & (\x2_op2~9_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \x2_op2~18_combout\,
	datab => \x2_op2~9_combout\,
	datac => \x2_op2~17_combout\,
	datad => \x2_op2~12_combout\,
	combout => \x2_op2~19_combout\);

-- Location: PIN_B11,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\tag4[3]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_tag4(3),
	combout => \tag4~combout\(3));

-- Location: PIN_D12,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\data4[3]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_data4(3),
	combout => \data4~combout\(3));

-- Location: LCCOMB_X29_Y50_N22
\x2_op2~21\ : cycloneii_lcell_comb
-- Equation(s):
-- \x2_op2~21_combout\ = (\x2_op2~66_combout\ & ((\busy4~combout\ & (\tag4~combout\(3))) # (!\busy4~combout\ & ((\data4~combout\(3))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000101010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \x2_op2~66_combout\,
	datab => \tag4~combout\(3),
	datac => \busy4~combout\,
	datad => \data4~combout\(3),
	combout => \x2_op2~21_combout\);

-- Location: LCCOMB_X29_Y50_N24
\x2_op2~20\ : cycloneii_lcell_comb
-- Equation(s):
-- \x2_op2~20_combout\ = \ra2_ir_out~combout\(15) $ (((!\ra2_ir_out~combout\(12) & !\ra2_ir_out~combout\(13))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111000010001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ra2_ir_out~combout\(12),
	datab => \ra2_ir_out~combout\(13),
	datad => \ra2_ir_out~combout\(15),
	combout => \x2_op2~20_combout\);

-- Location: LCCOMB_X25_Y50_N18
\x2_op2~66\ : cycloneii_lcell_comb
-- Equation(s):
-- \x2_op2~66_combout\ = (\ra2_ir_out~combout\(14) & (((!\x2_op2~20_combout\)))) # (!\ra2_ir_out~combout\(14) & (\x2_op2~7_combout\ & ((!\ra2_ir_out~combout\(12)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001100001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \x2_op2~7_combout\,
	datab => \x2_op2~20_combout\,
	datac => \ra2_ir_out~combout\(12),
	datad => \ra2_ir_out~combout\(14),
	combout => \x2_op2~66_combout\);

-- Location: LCCOMB_X29_Y50_N12
\x2_op2~22\ : cycloneii_lcell_comb
-- Equation(s):
-- \x2_op2~22_combout\ = (!\ra2_ir_out~combout\(13) & ((\ra2_ir_out~combout\(12) & (!\ra2_ir_out~combout\(15) & !\ra2_ir_out~combout\(14))) # (!\ra2_ir_out~combout\(12) & ((\ra2_ir_out~combout\(14))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001010010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ra2_ir_out~combout\(12),
	datab => \ra2_ir_out~combout\(15),
	datac => \ra2_ir_out~combout\(14),
	datad => \ra2_ir_out~combout\(13),
	combout => \x2_op2~22_combout\);

-- Location: LCCOMB_X29_Y50_N26
\x2_op2~23\ : cycloneii_lcell_comb
-- Equation(s):
-- \x2_op2~23_combout\ = (!\x2_op2~66_combout\ & \x2_op2~22_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \x2_op2~66_combout\,
	datad => \x2_op2~22_combout\,
	combout => \x2_op2~23_combout\);

-- Location: LCCOMB_X29_Y50_N0
\x2_op2~24\ : cycloneii_lcell_comb
-- Equation(s):
-- \x2_op2~24_combout\ = (\ra2_val_out~combout\ & ((\x2_op2~21_combout\) # ((\ra2_ir_out~combout\(3) & \x2_op2~23_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110000011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ra2_ir_out~combout\(3),
	datab => \x2_op2~21_combout\,
	datac => \ra2_val_out~combout\,
	datad => \x2_op2~23_combout\,
	combout => \x2_op2~24_combout\);

-- Location: PIN_A11,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\data4[4]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_data4(4),
	combout => \data4~combout\(4));

-- Location: PIN_G13,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\tag4[4]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_tag4(4),
	combout => \tag4~combout\(4));

-- Location: LCCOMB_X29_Y50_N30
\x2_op2~25\ : cycloneii_lcell_comb
-- Equation(s):
-- \x2_op2~25_combout\ = (\x2_op2~66_combout\ & ((\busy4~combout\ & ((\tag4~combout\(4)))) # (!\busy4~combout\ & (\data4~combout\(4)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010100000001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \x2_op2~66_combout\,
	datab => \data4~combout\(4),
	datac => \busy4~combout\,
	datad => \tag4~combout\(4),
	combout => \x2_op2~25_combout\);

-- Location: LCCOMB_X29_Y50_N20
\x2_op2~26\ : cycloneii_lcell_comb
-- Equation(s):
-- \x2_op2~26_combout\ = (\ra2_val_out~combout\ & ((\x2_op2~25_combout\) # ((\ra2_ir_out~combout\(4) & \x2_op2~23_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110000011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ra2_ir_out~combout\(4),
	datab => \x2_op2~25_combout\,
	datac => \ra2_val_out~combout\,
	datad => \x2_op2~23_combout\,
	combout => \x2_op2~26_combout\);

-- Location: LCCOMB_X19_Y50_N24
\Ard2a~6\ : cycloneii_lcell_comb
-- Equation(s):
-- \Ard2a~6_combout\ = (!\ra2_ir_out~combout\(2) & ((!\ra2_ir_out~combout\(1)) # (!\ra2_ir_out~combout\(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001001100010011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ra2_ir_out~combout\(0),
	datab => \ra2_ir_out~combout\(2),
	datac => \ra2_ir_out~combout\(1),
	combout => \Ard2a~6_combout\);

-- Location: LCCOMB_X25_Y50_N16
\x2_op2~30\ : cycloneii_lcell_comb
-- Equation(s):
-- \x2_op2~30_combout\ = (\Ard2a~6_combout\ & (\x2_op2~28_combout\)) # (!\Ard2a~6_combout\ & (((!\ra2_ir_out~combout\(14)) # (!\x2_op2~20_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010001110101111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \x2_op2~28_combout\,
	datab => \x2_op2~20_combout\,
	datac => \Ard2a~6_combout\,
	datad => \ra2_ir_out~combout\(14),
	combout => \x2_op2~30_combout\);

-- Location: LCCOMB_X25_Y50_N30
\x2_op2~27\ : cycloneii_lcell_comb
-- Equation(s):
-- \x2_op2~27_combout\ = (!\Awr2~0_combout\ & (\ra2_ir_out~combout\(5) & ((!\x2_op2~6_combout\) # (!\Ard2a~6_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001001100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Ard2a~6_combout\,
	datab => \Awr2~0_combout\,
	datac => \x2_op2~6_combout\,
	datad => \ra2_ir_out~combout\(5),
	combout => \x2_op2~27_combout\);

-- Location: PIN_F13,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\data4[5]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_data4(5),
	combout => \data4~combout\(5));

-- Location: LCCOMB_X32_Y50_N4
\x2_op2~32\ : cycloneii_lcell_comb
-- Equation(s):
-- \x2_op2~32_combout\ = (\x2_op2~31_combout\ & ((\x2_op2~30_combout\ & ((\data4~combout\(5)))) # (!\x2_op2~30_combout\ & (\x2_op2~27_combout\)))) # (!\x2_op2~31_combout\ & (!\x2_op2~30_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011100100110001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \x2_op2~31_combout\,
	datab => \x2_op2~30_combout\,
	datac => \x2_op2~27_combout\,
	datad => \data4~combout\(5),
	combout => \x2_op2~32_combout\);

-- Location: LCCOMB_X25_Y50_N10
\x2_op1~27\ : cycloneii_lcell_comb
-- Equation(s):
-- \x2_op1~27_combout\ = (!\ra2_ir_out~combout\(13) & (!\ra2_ir_out~combout\(15) & \ra2_ir_out~combout\(5)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000001100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \ra2_ir_out~combout\(13),
	datac => \ra2_ir_out~combout\(15),
	datad => \ra2_ir_out~combout\(5),
	combout => \x2_op1~27_combout\);

-- Location: LCCOMB_X32_Y50_N2
\x2_op2~33\ : cycloneii_lcell_comb
-- Equation(s):
-- \x2_op2~33_combout\ = (\x2_op2~29_combout\ & (((\x2_op2~32_combout\)))) # (!\x2_op2~29_combout\ & (\x2_op1~27_combout\ & ((\ra2_ir_out~combout\(12)) # (\x2_op2~32_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \x2_op2~29_combout\,
	datab => \ra2_ir_out~combout\(12),
	datac => \x2_op2~32_combout\,
	datad => \x2_op1~27_combout\,
	combout => \x2_op2~33_combout\);

-- Location: LCCOMB_X33_Y50_N0
\x2_op2~34\ : cycloneii_lcell_comb
-- Equation(s):
-- \x2_op2~34_combout\ = (\ra2_val_out~combout\ & \x2_op2~33_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \ra2_val_out~combout\,
	datad => \x2_op2~33_combout\,
	combout => \x2_op2~34_combout\);

-- Location: LCCOMB_X25_Y50_N22
\x2_op2~29\ : cycloneii_lcell_comb
-- Equation(s):
-- \x2_op2~29_combout\ = (\ra2_ir_out~combout\(14)) # ((\Ard2a~6_combout\ & ((\x2_op2~28_combout\) # (!\ra2_ir_out~combout\(12)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111110110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \x2_op2~28_combout\,
	datab => \ra2_ir_out~combout\(12),
	datac => \Ard2a~6_combout\,
	datad => \ra2_ir_out~combout\(14),
	combout => \x2_op2~29_combout\);

-- Location: PIN_B15,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\data4[6]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_data4(6),
	combout => \data4~combout\(6));

-- Location: LCCOMB_X32_Y50_N24
\x2_op2~35\ : cycloneii_lcell_comb
-- Equation(s):
-- \x2_op2~35_combout\ = (\x2_op2~31_combout\ & ((\x2_op2~30_combout\ & ((\data4~combout\(6)))) # (!\x2_op2~30_combout\ & (\x2_op2~27_combout\)))) # (!\x2_op2~31_combout\ & (!\x2_op2~30_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011100100110001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \x2_op2~31_combout\,
	datab => \x2_op2~30_combout\,
	datac => \x2_op2~27_combout\,
	datad => \data4~combout\(6),
	combout => \x2_op2~35_combout\);

-- Location: LCCOMB_X29_Y50_N28
\x2_op2~36\ : cycloneii_lcell_comb
-- Equation(s):
-- \x2_op2~36_combout\ = (\x2_op2~29_combout\ & (((\x2_op2~35_combout\)))) # (!\x2_op2~29_combout\ & (\x2_op1~27_combout\ & ((\x2_op2~35_combout\) # (\ra2_ir_out~combout\(12)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110001011100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \x2_op1~27_combout\,
	datab => \x2_op2~29_combout\,
	datac => \x2_op2~35_combout\,
	datad => \ra2_ir_out~combout\(12),
	combout => \x2_op2~36_combout\);

-- Location: LCCOMB_X19_Y50_N22
\x2_op2~37\ : cycloneii_lcell_comb
-- Equation(s):
-- \x2_op2~37_combout\ = (\x2_op2~36_combout\ & \ra2_val_out~combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \x2_op2~36_combout\,
	datad => \ra2_val_out~combout\,
	combout => \x2_op2~37_combout\);

-- Location: PIN_B12,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\data4[7]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_data4(7),
	combout => \data4~combout\(7));

-- Location: LCCOMB_X32_Y50_N18
\x2_op2~38\ : cycloneii_lcell_comb
-- Equation(s):
-- \x2_op2~38_combout\ = (\x2_op2~31_combout\ & ((\x2_op2~30_combout\ & ((\data4~combout\(7)))) # (!\x2_op2~30_combout\ & (\x2_op2~27_combout\)))) # (!\x2_op2~31_combout\ & (!\x2_op2~30_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011100100110001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \x2_op2~31_combout\,
	datab => \x2_op2~30_combout\,
	datac => \x2_op2~27_combout\,
	datad => \data4~combout\(7),
	combout => \x2_op2~38_combout\);

-- Location: LCCOMB_X32_Y50_N8
\x2_op2~39\ : cycloneii_lcell_comb
-- Equation(s):
-- \x2_op2~39_combout\ = (\x2_op2~29_combout\ & (((\x2_op2~38_combout\)))) # (!\x2_op2~29_combout\ & (\x2_op1~27_combout\ & ((\ra2_ir_out~combout\(12)) # (\x2_op2~38_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111001000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \x2_op2~29_combout\,
	datab => \x2_op1~27_combout\,
	datac => \ra2_ir_out~combout\(12),
	datad => \x2_op2~38_combout\,
	combout => \x2_op2~39_combout\);

-- Location: LCCOMB_X29_Y50_N18
\x2_op2~40\ : cycloneii_lcell_comb
-- Equation(s):
-- \x2_op2~40_combout\ = (\ra2_val_out~combout\ & \x2_op2~39_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \ra2_val_out~combout\,
	datad => \x2_op2~39_combout\,
	combout => \x2_op2~40_combout\);

-- Location: LCCOMB_X33_Y50_N6
\x2_op2~42\ : cycloneii_lcell_comb
-- Equation(s):
-- \x2_op2~42_combout\ = (\x2_op2~29_combout\ & (\x2_op2~41_combout\)) # (!\x2_op2~29_combout\ & (\x2_op1~27_combout\ & ((\x2_op2~41_combout\) # (\ra2_ir_out~combout\(12)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \x2_op2~41_combout\,
	datab => \x2_op1~27_combout\,
	datac => \ra2_ir_out~combout\(12),
	datad => \x2_op2~29_combout\,
	combout => \x2_op2~42_combout\);

-- Location: LCCOMB_X33_Y50_N4
\x2_op2~43\ : cycloneii_lcell_comb
-- Equation(s):
-- \x2_op2~43_combout\ = (\ra2_val_out~combout\ & \x2_op2~42_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \ra2_val_out~combout\,
	datad => \x2_op2~42_combout\,
	combout => \x2_op2~43_combout\);

-- Location: PIN_D14,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\data4[9]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_data4(9),
	combout => \data4~combout\(9));

-- Location: LCCOMB_X32_Y50_N12
\x2_op2~44\ : cycloneii_lcell_comb
-- Equation(s):
-- \x2_op2~44_combout\ = (\x2_op2~31_combout\ & ((\x2_op2~30_combout\ & ((\data4~combout\(9)))) # (!\x2_op2~30_combout\ & (\x2_op2~27_combout\)))) # (!\x2_op2~31_combout\ & (!\x2_op2~30_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011100100110001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \x2_op2~31_combout\,
	datab => \x2_op2~30_combout\,
	datac => \x2_op2~27_combout\,
	datad => \data4~combout\(9),
	combout => \x2_op2~44_combout\);

-- Location: LCCOMB_X32_Y50_N22
\x2_op2~45\ : cycloneii_lcell_comb
-- Equation(s):
-- \x2_op2~45_combout\ = (\x2_op2~29_combout\ & (((\x2_op2~44_combout\)))) # (!\x2_op2~29_combout\ & (\x2_op1~27_combout\ & ((\ra2_ir_out~combout\(12)) # (\x2_op2~44_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111001000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \x2_op2~29_combout\,
	datab => \x2_op1~27_combout\,
	datac => \ra2_ir_out~combout\(12),
	datad => \x2_op2~44_combout\,
	combout => \x2_op2~45_combout\);

-- Location: LCCOMB_X12_Y50_N0
\x2_op2~46\ : cycloneii_lcell_comb
-- Equation(s):
-- \x2_op2~46_combout\ = (\x2_op2~45_combout\ & \ra2_val_out~combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \x2_op2~45_combout\,
	datad => \ra2_val_out~combout\,
	combout => \x2_op2~46_combout\);

-- Location: PIN_D15,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\data4[10]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_data4(10),
	combout => \data4~combout\(10));

-- Location: LCCOMB_X32_Y50_N16
\x2_op2~47\ : cycloneii_lcell_comb
-- Equation(s):
-- \x2_op2~47_combout\ = (\x2_op2~31_combout\ & ((\x2_op2~30_combout\ & ((\data4~combout\(10)))) # (!\x2_op2~30_combout\ & (\x2_op2~27_combout\)))) # (!\x2_op2~31_combout\ & (!\x2_op2~30_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011100100110001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \x2_op2~31_combout\,
	datab => \x2_op2~30_combout\,
	datac => \x2_op2~27_combout\,
	datad => \data4~combout\(10),
	combout => \x2_op2~47_combout\);

-- Location: LCCOMB_X33_Y50_N10
\x2_op2~48\ : cycloneii_lcell_comb
-- Equation(s):
-- \x2_op2~48_combout\ = (\x2_op2~29_combout\ & (((\x2_op2~47_combout\)))) # (!\x2_op2~29_combout\ & (\x2_op1~27_combout\ & ((\ra2_ir_out~combout\(12)) # (\x2_op2~47_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ra2_ir_out~combout\(12),
	datab => \x2_op2~29_combout\,
	datac => \x2_op1~27_combout\,
	datad => \x2_op2~47_combout\,
	combout => \x2_op2~48_combout\);

-- Location: LCCOMB_X33_Y50_N16
\x2_op2~49\ : cycloneii_lcell_comb
-- Equation(s):
-- \x2_op2~49_combout\ = (\ra2_val_out~combout\ & \x2_op2~48_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \ra2_val_out~combout\,
	datad => \x2_op2~48_combout\,
	combout => \x2_op2~49_combout\);

-- Location: LCCOMB_X33_Y50_N2
\x2_op2~51\ : cycloneii_lcell_comb
-- Equation(s):
-- \x2_op2~51_combout\ = (\x2_op2~29_combout\ & (\x2_op2~50_combout\)) # (!\x2_op2~29_combout\ & (\x2_op1~27_combout\ & ((\x2_op2~50_combout\) # (\ra2_ir_out~combout\(12)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \x2_op2~50_combout\,
	datab => \x2_op1~27_combout\,
	datac => \ra2_ir_out~combout\(12),
	datad => \x2_op2~29_combout\,
	combout => \x2_op2~51_combout\);

-- Location: LCCOMB_X33_Y50_N24
\x2_op2~52\ : cycloneii_lcell_comb
-- Equation(s):
-- \x2_op2~52_combout\ = (\ra2_val_out~combout\ & \x2_op2~51_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \ra2_val_out~combout\,
	datad => \x2_op2~51_combout\,
	combout => \x2_op2~52_combout\);

-- Location: LCCOMB_X33_Y50_N30
\x2_op2~54\ : cycloneii_lcell_comb
-- Equation(s):
-- \x2_op2~54_combout\ = (\x2_op2~29_combout\ & (\x2_op2~53_combout\)) # (!\x2_op2~29_combout\ & (\x2_op1~27_combout\ & ((\x2_op2~53_combout\) # (\ra2_ir_out~combout\(12)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \x2_op2~53_combout\,
	datab => \x2_op1~27_combout\,
	datac => \ra2_ir_out~combout\(12),
	datad => \x2_op2~29_combout\,
	combout => \x2_op2~54_combout\);

-- Location: LCCOMB_X33_Y50_N28
\x2_op2~55\ : cycloneii_lcell_comb
-- Equation(s):
-- \x2_op2~55_combout\ = (\ra2_val_out~combout\ & \x2_op2~54_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \ra2_val_out~combout\,
	datad => \x2_op2~54_combout\,
	combout => \x2_op2~55_combout\);

-- Location: PIN_R2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\data4[13]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_data4(13),
	combout => \data4~combout\(13));

-- Location: LCCOMB_X29_Y50_N6
\x2_op2~31\ : cycloneii_lcell_comb
-- Equation(s):
-- \x2_op2~31_combout\ = (\x2_op2~29_combout\ & ((!\x2_op2~30_combout\) # (!\busy4~combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000110011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \x2_op2~29_combout\,
	datac => \busy4~combout\,
	datad => \x2_op2~30_combout\,
	combout => \x2_op2~31_combout\);

-- Location: LCCOMB_X32_Y50_N10
\x2_op2~56\ : cycloneii_lcell_comb
-- Equation(s):
-- \x2_op2~56_combout\ = (\x2_op2~30_combout\ & (((\data4~combout\(13) & \x2_op2~31_combout\)))) # (!\x2_op2~30_combout\ & ((\x2_op2~27_combout\) # ((!\x2_op2~31_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110001000110011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \x2_op2~27_combout\,
	datab => \x2_op2~30_combout\,
	datac => \data4~combout\(13),
	datad => \x2_op2~31_combout\,
	combout => \x2_op2~56_combout\);

-- Location: LCCOMB_X32_Y50_N20
\x2_op2~57\ : cycloneii_lcell_comb
-- Equation(s):
-- \x2_op2~57_combout\ = (\x2_op2~29_combout\ & (((\x2_op2~56_combout\)))) # (!\x2_op2~29_combout\ & (\x2_op1~27_combout\ & ((\ra2_ir_out~combout\(12)) # (\x2_op2~56_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111001000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \x2_op2~29_combout\,
	datab => \x2_op1~27_combout\,
	datac => \ra2_ir_out~combout\(12),
	datad => \x2_op2~56_combout\,
	combout => \x2_op2~57_combout\);

-- Location: LCCOMB_X33_Y50_N18
\x2_op2~58\ : cycloneii_lcell_comb
-- Equation(s):
-- \x2_op2~58_combout\ = (\x2_op2~57_combout\ & \ra2_val_out~combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \x2_op2~57_combout\,
	datac => \ra2_val_out~combout\,
	combout => \x2_op2~58_combout\);

-- Location: LCCOMB_X32_Y50_N6
\x2_op2~59\ : cycloneii_lcell_comb
-- Equation(s):
-- \x2_op2~59_combout\ = (\x2_op2~30_combout\ & (\data4~combout\(14) & ((\x2_op2~31_combout\)))) # (!\x2_op2~30_combout\ & (((\x2_op2~27_combout\) # (!\x2_op2~31_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011100000110011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \data4~combout\(14),
	datab => \x2_op2~30_combout\,
	datac => \x2_op2~27_combout\,
	datad => \x2_op2~31_combout\,
	combout => \x2_op2~59_combout\);

-- Location: LCCOMB_X33_Y50_N12
\x2_op2~60\ : cycloneii_lcell_comb
-- Equation(s):
-- \x2_op2~60_combout\ = (\x2_op2~29_combout\ & (((\x2_op2~59_combout\)))) # (!\x2_op2~29_combout\ & (\x2_op1~27_combout\ & ((\ra2_ir_out~combout\(12)) # (\x2_op2~59_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ra2_ir_out~combout\(12),
	datab => \x2_op1~27_combout\,
	datac => \x2_op2~59_combout\,
	datad => \x2_op2~29_combout\,
	combout => \x2_op2~60_combout\);

-- Location: LCCOMB_X33_Y50_N22
\x2_op2~61\ : cycloneii_lcell_comb
-- Equation(s):
-- \x2_op2~61_combout\ = (\ra2_val_out~combout\ & \x2_op2~60_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \ra2_val_out~combout\,
	datad => \x2_op2~60_combout\,
	combout => \x2_op2~61_combout\);

-- Location: PIN_B13,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\data4[15]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_data4(15),
	combout => \data4~combout\(15));

-- Location: LCCOMB_X32_Y50_N28
\x2_op2~62\ : cycloneii_lcell_comb
-- Equation(s):
-- \x2_op2~62_combout\ = (\x2_op2~31_combout\ & ((\x2_op2~30_combout\ & ((\data4~combout\(15)))) # (!\x2_op2~30_combout\ & (\x2_op2~27_combout\)))) # (!\x2_op2~31_combout\ & (!\x2_op2~30_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011100100110001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \x2_op2~31_combout\,
	datab => \x2_op2~30_combout\,
	datac => \x2_op2~27_combout\,
	datad => \data4~combout\(15),
	combout => \x2_op2~62_combout\);

-- Location: LCCOMB_X32_Y50_N26
\x2_op2~63\ : cycloneii_lcell_comb
-- Equation(s):
-- \x2_op2~63_combout\ = (\x2_op2~29_combout\ & (((\x2_op2~62_combout\)))) # (!\x2_op2~29_combout\ & (\x2_op1~27_combout\ & ((\ra2_ir_out~combout\(12)) # (\x2_op2~62_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111001000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \x2_op2~29_combout\,
	datab => \x2_op1~27_combout\,
	datac => \ra2_ir_out~combout\(12),
	datad => \x2_op2~62_combout\,
	combout => \x2_op2~63_combout\);

-- Location: LCCOMB_X33_Y50_N20
\x2_op2~64\ : cycloneii_lcell_comb
-- Equation(s):
-- \x2_op2~64_combout\ = (\ra2_val_out~combout\ & \x2_op2~63_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \ra2_val_out~combout\,
	datad => \x2_op2~63_combout\,
	combout => \x2_op2~64_combout\);

-- Location: LCCOMB_X53_Y1_N4
\x1_op1_ready~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \x1_op1_ready~0_combout\ = (!\ra1_ir_out~combout\(14) & ((\ra1_ir_out~combout\(12) & (\ra1_ir_out~combout\(13) & !\ra1_ir_out~combout\(15))) # (!\ra1_ir_out~combout\(12) & (!\ra1_ir_out~combout\(13) & \ra1_ir_out~combout\(15)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ra1_ir_out~combout\(12),
	datab => \ra1_ir_out~combout\(13),
	datac => \ra1_ir_out~combout\(15),
	datad => \ra1_ir_out~combout\(14),
	combout => \x1_op1_ready~0_combout\);

-- Location: LCCOMB_X61_Y1_N16
\x1_op1_ready~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \x1_op1_ready~1_combout\ = ((\x1_op1_ready~0_combout\ & \ra1_val_out~combout\)) # (!\busy1~combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \x1_op1_ready~0_combout\,
	datac => \ra1_val_out~combout\,
	datad => \busy1~combout\,
	combout => \x1_op1_ready~1_combout\);

-- Location: LCCOMB_X16_Y1_N4
\x1_op2_ready~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \x1_op2_ready~1_combout\ = (\ra1_ir_out~combout\(2)) # ((\ra1_ir_out~combout\(12)) # ((\ra1_ir_out~combout\(1) & \ra1_ir_out~combout\(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111011111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ra1_ir_out~combout\(1),
	datab => \ra1_ir_out~combout\(2),
	datac => \ra1_ir_out~combout\(12),
	datad => \ra1_ir_out~combout\(0),
	combout => \x1_op2_ready~1_combout\);

-- Location: LCCOMB_X16_Y1_N18
\x1_op2_ready~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \x1_op2_ready~2_combout\ = ((!\ra1_ir_out~combout\(14) & ((\ra1_ir_out~combout\(15)) # (\x1_op2_ready~1_combout\)))) # (!\ra1_val_out~combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ra1_ir_out~combout\(15),
	datab => \x1_op2_ready~1_combout\,
	datac => \ra1_ir_out~combout\(14),
	datad => \ra1_val_out~combout\,
	combout => \x1_op2_ready~2_combout\);

-- Location: LCCOMB_X16_Y1_N30
\x1_op2_ready~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \x1_op2_ready~0_combout\ = (\ra1_ir_out~combout\(14) & (\ra1_ir_out~combout\(15) $ (((!\ra1_ir_out~combout\(12) & !\ra1_ir_out~combout\(13))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100100000000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ra1_ir_out~combout\(12),
	datab => \ra1_ir_out~combout\(14),
	datac => \ra1_ir_out~combout\(13),
	datad => \ra1_ir_out~combout\(15),
	combout => \x1_op2_ready~0_combout\);

-- Location: LCCOMB_X15_Y1_N16
\x1_op2_ready~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \x1_op2_ready~3_combout\ = (\x1_op2_ready~2_combout\) # ((\x1_op2_ready~0_combout\) # (!\busy2~combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \x1_op2_ready~2_combout\,
	datac => \busy2~combout\,
	datad => \x1_op2_ready~0_combout\,
	combout => \x1_op2_ready~3_combout\);

-- Location: LCCOMB_X1_Y48_N30
\x2_op1_ready~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \x2_op1_ready~0_combout\ = (!\ra2_ir_out~combout\(14) & ((\ra2_ir_out~combout\(12) & (!\ra2_ir_out~combout\(15) & \ra2_ir_out~combout\(13))) # (!\ra2_ir_out~combout\(12) & (\ra2_ir_out~combout\(15) & !\ra2_ir_out~combout\(13)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000001000010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ra2_ir_out~combout\(12),
	datab => \ra2_ir_out~combout\(14),
	datac => \ra2_ir_out~combout\(15),
	datad => \ra2_ir_out~combout\(13),
	combout => \x2_op1_ready~0_combout\);

-- Location: LCCOMB_X1_Y48_N8
\x2_op1_ready~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \x2_op1_ready~1_combout\ = ((\x2_op1_ready~0_combout\ & \ra2_val_out~combout\)) # (!\busy3~combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111100001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \x2_op1_ready~0_combout\,
	datac => \busy3~combout\,
	datad => \ra2_val_out~combout\,
	combout => \x2_op1_ready~1_combout\);

-- Location: LCCOMB_X19_Y50_N8
\x2_op2_ready~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \x2_op2_ready~1_combout\ = (\ra2_ir_out~combout\(2)) # ((\ra2_ir_out~combout\(12)) # ((\ra2_ir_out~combout\(0) & \ra2_ir_out~combout\(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111101100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ra2_ir_out~combout\(0),
	datab => \ra2_ir_out~combout\(2),
	datac => \ra2_ir_out~combout\(1),
	datad => \ra2_ir_out~combout\(12),
	combout => \x2_op2_ready~1_combout\);

-- Location: LCCOMB_X20_Y50_N6
\x2_op2_ready~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \x2_op2_ready~2_combout\ = ((!\ra2_ir_out~combout\(14) & ((\ra2_ir_out~combout\(15)) # (\x2_op2_ready~1_combout\)))) # (!\ra2_val_out~combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011111100101111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ra2_ir_out~combout\(15),
	datab => \ra2_ir_out~combout\(14),
	datac => \ra2_val_out~combout\,
	datad => \x2_op2_ready~1_combout\,
	combout => \x2_op2_ready~2_combout\);

-- Location: LCCOMB_X23_Y50_N20
\x2_op2_ready~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \x2_op2_ready~0_combout\ = (\ra2_ir_out~combout\(14) & (\ra2_ir_out~combout\(15) $ (((!\ra2_ir_out~combout\(13) & !\ra2_ir_out~combout\(12))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000010000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ra2_ir_out~combout\(14),
	datab => \ra2_ir_out~combout\(13),
	datac => \ra2_ir_out~combout\(15),
	datad => \ra2_ir_out~combout\(12),
	combout => \x2_op2_ready~0_combout\);

-- Location: LCCOMB_X22_Y50_N0
\x2_op2_ready~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \x2_op2_ready~3_combout\ = (\x2_op2_ready~2_combout\) # ((\x2_op2_ready~0_combout\) # (!\busy4~combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \x2_op2_ready~2_combout\,
	datac => \busy4~combout\,
	datad => \x2_op2_ready~0_combout\,
	combout => \x2_op2_ready~3_combout\);

-- Location: LCCOMB_X93_Y49_N2
\PE|pen2|Equal0~5\ : cycloneii_lcell_comb
-- Equation(s):
-- \PE|pen2|Equal0~5_combout\ = (\free_rrf_vec~combout\(31) & (\PE|pen1|Equal0~6_combout\ & ((!\free_rrf_vec~combout\(1)) # (!\free_rrf_vec~combout\(0))))) # (!\free_rrf_vec~combout\(31) & (((!\free_rrf_vec~combout\(1)) # (!\free_rrf_vec~combout\(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000110111011101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \free_rrf_vec~combout\(31),
	datab => \PE|pen1|Equal0~6_combout\,
	datac => \free_rrf_vec~combout\(0),
	datad => \free_rrf_vec~combout\(1),
	combout => \PE|pen2|Equal0~5_combout\);

-- Location: LCCOMB_X93_Y49_N6
\PE|twoRRnotFree\ : cycloneii_lcell_comb
-- Equation(s):
-- \PE|twoRRnotFree~combout\ = (\free_rrf_vec~combout\(31) & (\PE|pen2|Equal0~5_combout\ & ((\PE|pen2|Equal0~4_combout\)))) # (!\free_rrf_vec~combout\(31) & ((\PE|pen1|Equal0~6_combout\) # ((\PE|pen2|Equal0~5_combout\ & \PE|pen2|Equal0~4_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \free_rrf_vec~combout\(31),
	datab => \PE|pen2|Equal0~5_combout\,
	datac => \PE|pen1|Equal0~6_combout\,
	datad => \PE|pen2|Equal0~4_combout\,
	combout => \PE|twoRRnotFree~combout\);

-- Location: PIN_F19,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\not_taken_branch_detected~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_not_taken_branch_detected,
	combout => \not_taken_branch_detected~combout\);

-- Location: PIN_H21,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\taken_branch_detected~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_taken_branch_detected,
	combout => \taken_branch_detected~combout\);

-- Location: LCCOMB_X67_Y49_N24
\spec_tag_rs_out1~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \spec_tag_rs_out1~2_combout\ = (\SPEC_TAG_REG|dout\(0) & (((!\not_taken_branch_detected~combout\ & !\taken_branch_detected~combout\)))) # (!\SPEC_TAG_REG|dout\(0) & (\SPEC_TAG_REG|dout\(1) & (\not_taken_branch_detected~combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010000000101100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SPEC_TAG_REG|dout\(1),
	datab => \SPEC_TAG_REG|dout\(0),
	datac => \not_taken_branch_detected~combout\,
	datad => \taken_branch_detected~combout\,
	combout => \spec_tag_rs_out1~2_combout\);

-- Location: LCCOMB_X67_Y49_N18
\SPEC_TAG_REG|dout[0]~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \SPEC_TAG_REG|dout[0]~1_combout\ = (\PE|twoRRnotFree~combout\ & ((\spec_tag_rs_out1~2_combout\))) # (!\PE|twoRRnotFree~combout\ & (\spec_tag_reg_in~13_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111000100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \spec_tag_reg_in~13_combout\,
	datab => \PE|twoRRnotFree~combout\,
	datad => \spec_tag_rs_out1~2_combout\,
	combout => \SPEC_TAG_REG|dout[0]~1_combout\);

-- Location: PIN_A26,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\spec_tag_rb_in[0]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_spec_tag_rb_in(0),
	combout => \spec_tag_rb_in~combout\(0));

-- Location: PIN_T3,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\reset~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_reset,
	combout => \reset~combout\);

-- Location: CLKCTRL_G1
\reset~clkctrl\ : cycloneii_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \reset~clkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \reset~clkctrl_outclk\);

-- Location: LCCOMB_X29_Y50_N16
\Equal14~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Equal14~0_combout\ = (!\ra2_ir_out~combout\(12) & (\ra2_ir_out~combout\(15) & (\ra2_ir_out~combout\(14) & !\ra2_ir_out~combout\(13))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ra2_ir_out~combout\(12),
	datab => \ra2_ir_out~combout\(15),
	datac => \ra2_ir_out~combout\(14),
	datad => \ra2_ir_out~combout\(13),
	combout => \Equal14~0_combout\);

-- Location: LCCOMB_X21_Y1_N30
\process_0~4\ : cycloneii_lcell_comb
-- Equation(s):
-- \process_0~4_combout\ = (\ra1_ir_out~combout\(9) & (\ra1_ir_out~combout\(11) & (\ra1_ir_out~combout\(10) & \ra1_val_out~combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ra1_ir_out~combout\(9),
	datab => \ra1_ir_out~combout\(11),
	datac => \ra1_ir_out~combout\(10),
	datad => \ra1_val_out~combout\,
	combout => \process_0~4_combout\);

-- Location: LCCOMB_X22_Y1_N30
\Equal0~8\ : cycloneii_lcell_comb
-- Equation(s):
-- \Equal0~8_combout\ = (\ra1_ir_out~combout\(12) & (!\ra1_ir_out~combout\(15) & (\ra1_ir_out~combout\(13) & !\ra1_ir_out~combout\(14))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ra1_ir_out~combout\(12),
	datab => \ra1_ir_out~combout\(15),
	datac => \ra1_ir_out~combout\(13),
	datad => \ra1_ir_out~combout\(14),
	combout => \Equal0~8_combout\);

-- Location: LCCOMB_X21_Y1_N4
\process_0~6\ : cycloneii_lcell_comb
-- Equation(s):
-- \process_0~6_combout\ = (\process_0~4_combout\ & \Equal0~8_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \process_0~4_combout\,
	datad => \Equal0~8_combout\,
	combout => \process_0~6_combout\);

-- Location: LCCOMB_X20_Y1_N18
\x2_val_var~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \x2_val_var~1_combout\ = (\ra1_ir_out~combout\(3) & (\ra1_ir_out~combout\(4) & \ra1_ir_out~combout\(5)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ra1_ir_out~combout\(3),
	datac => \ra1_ir_out~combout\(4),
	datad => \ra1_ir_out~combout\(5),
	combout => \x2_val_var~1_combout\);

-- Location: LCCOMB_X22_Y1_N2
\Equal0~4\ : cycloneii_lcell_comb
-- Equation(s):
-- \Equal0~4_combout\ = (\ra1_ir_out~combout\(12) & (\ra1_ir_out~combout\(15) & (!\ra1_ir_out~combout\(13) & !\ra1_ir_out~combout\(14))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ra1_ir_out~combout\(12),
	datab => \ra1_ir_out~combout\(15),
	datac => \ra1_ir_out~combout\(13),
	datad => \ra1_ir_out~combout\(14),
	combout => \Equal0~4_combout\);

-- Location: LCCOMB_X22_Y1_N8
\Equal0~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \Equal0~3_combout\ = (!\ra1_ir_out~combout\(12) & (\ra1_ir_out~combout\(15) & (!\ra1_ir_out~combout\(13) & !\ra1_ir_out~combout\(14))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ra1_ir_out~combout\(12),
	datab => \ra1_ir_out~combout\(15),
	datac => \ra1_ir_out~combout\(13),
	datad => \ra1_ir_out~combout\(14),
	combout => \Equal0~3_combout\);

-- Location: LCCOMB_X22_Y1_N14
\x2_val_var~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \x2_val_var~0_combout\ = (\Equal0~4_combout\) # ((\Equal0~3_combout\) # ((\Equal0~5_combout\ & \ra1_ir_out~combout\(7))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111011111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Equal0~5_combout\,
	datab => \Equal0~4_combout\,
	datac => \Equal0~3_combout\,
	datad => \ra1_ir_out~combout\(7),
	combout => \x2_val_var~0_combout\);

-- Location: LCCOMB_X21_Y1_N18
\x2_val_var~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \x2_val_var~2_combout\ = (\ra1_val_out~combout\ & ((\x2_val_var~0_combout\) # ((\process_0~5_combout\ & \x2_val_var~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \process_0~5_combout\,
	datab => \x2_val_var~1_combout\,
	datac => \x2_val_var~0_combout\,
	datad => \ra1_val_out~combout\,
	combout => \x2_val_var~2_combout\);

-- Location: LCCOMB_X21_Y49_N24
\spec_tag_rs_out2~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \spec_tag_rs_out2~1_combout\ = (\spec_tag_rs_out2~0_combout\ & (!\process_0~6_combout\ & (!\x2_val_var~2_combout\ & \ra2_val_out~combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000001000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \spec_tag_rs_out2~0_combout\,
	datab => \process_0~6_combout\,
	datac => \x2_val_var~2_combout\,
	datad => \ra2_val_out~combout\,
	combout => \spec_tag_rs_out2~1_combout\);

-- Location: LCCOMB_X66_Y49_N2
\spec_tag_reg_en~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \spec_tag_reg_en~0_combout\ = (\Equal0~0_combout\ & ((\ra1_val_out~combout\) # ((\Equal14~0_combout\ & \spec_tag_rs_out2~1_combout\)))) # (!\Equal0~0_combout\ & (\Equal14~0_combout\ & ((\spec_tag_rs_out2~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110110010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Equal0~0_combout\,
	datab => \Equal14~0_combout\,
	datac => \ra1_val_out~combout\,
	datad => \spec_tag_rs_out2~1_combout\,
	combout => \spec_tag_reg_en~0_combout\);

-- Location: LCCOMB_X66_Y49_N0
\spec_tag_reg_en~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \spec_tag_reg_en~1_combout\ = (\not_taken_branch_detected~combout\) # ((\taken_branch_detected~combout\) # ((\spec_tag_reg_en~0_combout\ & !\PE|twoRRnotFree~combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101011111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \not_taken_branch_detected~combout\,
	datab => \spec_tag_reg_en~0_combout\,
	datac => \taken_branch_detected~combout\,
	datad => \PE|twoRRnotFree~combout\,
	combout => \spec_tag_reg_en~1_combout\);

-- Location: LCFF_X67_Y49_N19
\SPEC_TAG_REG|dout[0]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \SPEC_TAG_REG|dout[0]~1_combout\,
	sdata => \spec_tag_rb_in~combout\(0),
	aclr => \reset~clkctrl_outclk\,
	sload => \taken_branch_detected~combout\,
	ena => \spec_tag_reg_en~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \SPEC_TAG_REG|dout\(0));

-- Location: LCCOMB_X93_Y49_N10
\process_0~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \process_0~2_combout\ = (!\PE|pen1|Equal0~7_combout\ & (!\taken_branch_detected~combout\ & ((!\PE|pen2|Equal0~4_combout\) # (!\PE|pen2|Equal0~5_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000100000101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \PE|pen1|Equal0~7_combout\,
	datab => \PE|pen2|Equal0~5_combout\,
	datac => \taken_branch_detected~combout\,
	datad => \PE|pen2|Equal0~4_combout\,
	combout => \process_0~2_combout\);

-- Location: LCCOMB_X53_Y1_N30
\Equal0~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Equal0~0_combout\ = (!\ra1_ir_out~combout\(12) & (!\ra1_ir_out~combout\(13) & (\ra1_ir_out~combout\(15) & \ra1_ir_out~combout\(14))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ra1_ir_out~combout\(12),
	datab => \ra1_ir_out~combout\(13),
	datac => \ra1_ir_out~combout\(15),
	datad => \ra1_ir_out~combout\(14),
	combout => \Equal0~0_combout\);

-- Location: LCCOMB_X66_Y49_N12
\x1_val~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \x1_val~0_combout\ = (\ra1_val_out~combout\ & \Equal0~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \ra1_val_out~combout\,
	datad => \Equal0~0_combout\,
	combout => \x1_val~0_combout\);

-- Location: LCCOMB_X63_Y49_N26
\x1_val~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \x1_val~2_combout\ = (\x1_val~0_combout\ & (\not_taken_branch_detected~combout\ $ (((!\ra2_val_out~combout\) # (!\x1_val~1_combout\))))) # (!\x1_val~0_combout\ & (\x1_val~1_combout\ & (\ra2_val_out~combout\ & !\not_taken_branch_detected~combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000001101100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \x1_val~1_combout\,
	datab => \x1_val~0_combout\,
	datac => \ra2_val_out~combout\,
	datad => \not_taken_branch_detected~combout\,
	combout => \x1_val~2_combout\);

-- Location: LCCOMB_X66_Y49_N6
\x1_val~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \x1_val~3_combout\ = (\process_0~2_combout\ & (\x1_val~2_combout\ & ((!\SPEC_TAG_REG|dout\(0)) # (!\SPEC_TAG_REG|dout\(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SPEC_TAG_REG|dout\(1),
	datab => \SPEC_TAG_REG|dout\(0),
	datac => \process_0~2_combout\,
	datad => \x1_val~2_combout\,
	combout => \x1_val~3_combout\);

-- Location: LCCOMB_X63_Y49_N12
\process_0~7\ : cycloneii_lcell_comb
-- Equation(s):
-- \process_0~7_combout\ = (!\not_taken_branch_detected~combout\ & (\spec_tag_rs_out2~1_combout\ & (\Equal14~0_combout\ & !\taken_branch_detected~combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \not_taken_branch_detected~combout\,
	datab => \spec_tag_rs_out2~1_combout\,
	datac => \Equal14~0_combout\,
	datad => \taken_branch_detected~combout\,
	combout => \process_0~7_combout\);

-- Location: LCCOMB_X66_Y49_N8
\process_0~10\ : cycloneii_lcell_comb
-- Equation(s):
-- \process_0~10_combout\ = (\Equal0~0_combout\ & (\ra1_val_out~combout\ & (\process_0~2_combout\ & \process_0~7_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Equal0~0_combout\,
	datab => \ra1_val_out~combout\,
	datac => \process_0~2_combout\,
	datad => \process_0~7_combout\,
	combout => \process_0~10_combout\);

-- Location: LCCOMB_X66_Y49_N22
\pc_en_out~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \pc_en_out~1_combout\ = (\pc_en_out~0_combout\ & (!\process_0~10_combout\ & ((!\x1_val~2_combout\) # (!\process_0~2_combout\)))) # (!\pc_en_out~0_combout\ & (((!\x1_val~2_combout\) # (!\process_0~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000011101110111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \pc_en_out~0_combout\,
	datab => \process_0~10_combout\,
	datac => \process_0~2_combout\,
	datad => \x1_val~2_combout\,
	combout => \pc_en_out~1_combout\);

-- Location: LCCOMB_X66_Y49_N16
\x1_val~5\ : cycloneii_lcell_comb
-- Equation(s):
-- \x1_val~5_combout\ = (\ra1_val_out~combout\ & (\process_0~2_combout\ & ((\x1_val~3_combout\) # (\pc_en_out~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \x1_val~3_combout\,
	datab => \ra1_val_out~combout\,
	datac => \process_0~2_combout\,
	datad => \pc_en_out~1_combout\,
	combout => \x1_val~5_combout\);

-- Location: LCCOMB_X66_Y49_N18
\x2_val~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \x2_val~0_combout\ = (\process_0~2_combout\ & (\spec_tag_rs_out2~1_combout\ & ((\x1_val~3_combout\) # (\pc_en_out~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \x1_val~3_combout\,
	datab => \pc_en_out~1_combout\,
	datac => \process_0~2_combout\,
	datad => \spec_tag_rs_out2~1_combout\,
	combout => \x2_val~0_combout\);

-- Location: LCCOMB_X22_Y1_N0
\Equal0~6\ : cycloneii_lcell_comb
-- Equation(s):
-- \Equal0~6_combout\ = (!\ra1_ir_out~combout\(12) & (!\ra1_ir_out~combout\(15) & (!\ra1_ir_out~combout\(13) & !\ra1_ir_out~combout\(14))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ra1_ir_out~combout\(12),
	datab => \ra1_ir_out~combout\(15),
	datac => \ra1_ir_out~combout\(13),
	datad => \ra1_ir_out~combout\(14),
	combout => \Equal0~6_combout\);

-- Location: LCCOMB_X22_Y1_N26
\Equal0~7\ : cycloneii_lcell_comb
-- Equation(s):
-- \Equal0~7_combout\ = (!\ra1_ir_out~combout\(12) & (!\ra1_ir_out~combout\(15) & (\ra1_ir_out~combout\(13) & !\ra1_ir_out~combout\(14))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ra1_ir_out~combout\(12),
	datab => \ra1_ir_out~combout\(15),
	datac => \ra1_ir_out~combout\(13),
	datad => \ra1_ir_out~combout\(14),
	combout => \Equal0~7_combout\);

-- Location: LCCOMB_X23_Y1_N12
\C_tag_out_rs~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \C_tag_out_rs~0_combout\ = (\ra1_val_out~combout\ & (\ra1_ir_out~combout\(1) & ((\Equal0~6_combout\) # (\Equal0~7_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ra1_val_out~combout\,
	datab => \ra1_ir_out~combout\(1),
	datac => \Equal0~6_combout\,
	datad => \Equal0~7_combout\,
	combout => \C_tag_out_rs~0_combout\);

-- Location: PIN_AH12,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\C_busybit_in~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_C_busybit_in,
	combout => \C_busybit_in~combout\);

-- Location: PIN_AH13,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\C_in~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_C_in,
	combout => \C_in~combout\);

-- Location: LCCOMB_X43_Y4_N0
\C_out~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \C_out~0_combout\ = (!\C_busybit_in~combout\ & \C_in~combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \C_busybit_in~combout\,
	datad => \C_in~combout\,
	combout => \C_out~0_combout\);

-- Location: LCCOMB_X43_Y4_N6
\C_out~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \C_out~1_combout\ = (!\ra1_ir_out~combout\(0) & (\C_tag_out_rs~0_combout\ & (!\ra1_ir_out~combout\(2) & \C_out~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000010000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ra1_ir_out~combout\(0),
	datab => \C_tag_out_rs~0_combout\,
	datac => \ra1_ir_out~combout\(2),
	datad => \C_out~0_combout\,
	combout => \C_out~1_combout\);

-- Location: PIN_AD3,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\Z_busybit_in~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_Z_busybit_in,
	combout => \Z_busybit_in~combout\);

-- Location: LCCOMB_X22_Y1_N22
\Equal0~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \Equal0~1_combout\ = (\ra1_ir_out~combout\(12) & (!\ra1_ir_out~combout\(15) & (!\ra1_ir_out~combout\(13) & !\ra1_ir_out~combout\(14))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ra1_ir_out~combout\(12),
	datab => \ra1_ir_out~combout\(15),
	datac => \ra1_ir_out~combout\(13),
	datad => \ra1_ir_out~combout\(14),
	combout => \Equal0~1_combout\);

-- Location: LCCOMB_X23_Y1_N24
\Z_ready~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Z_ready~0_combout\ = (!\ra1_ir_out~combout\(2) & (\Equal0~7_combout\ & (\ra1_val_out~combout\ & !\Equal0~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ra1_ir_out~combout\(2),
	datab => \Equal0~7_combout\,
	datac => \ra1_val_out~combout\,
	datad => \Equal0~1_combout\,
	combout => \Z_ready~0_combout\);

-- Location: LCCOMB_X23_Y1_N18
\Z_ready~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \Z_ready~1_combout\ = (!\ra1_ir_out~combout\(1) & (\ra1_ir_out~combout\(0) & ((\x1_add~0_combout\) # (\Z_ready~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \x1_add~0_combout\,
	datab => \ra1_ir_out~combout\(1),
	datac => \Z_ready~0_combout\,
	datad => \ra1_ir_out~combout\(0),
	combout => \Z_ready~1_combout\);

-- Location: PIN_B6,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\Z_in~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_Z_in,
	combout => \Z_in~combout\);

-- Location: LCCOMB_X11_Y50_N16
\Z_out~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Z_out~0_combout\ = (!\Z_busybit_in~combout\ & (\Z_ready~1_combout\ & \Z_in~combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Z_busybit_in~combout\,
	datac => \Z_ready~1_combout\,
	datad => \Z_in~combout\,
	combout => \Z_out~0_combout\);

-- Location: LCCOMB_X43_Y4_N12
\C_ready~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \C_ready~0_combout\ = (((\ra1_ir_out~combout\(2)) # (\ra1_ir_out~combout\(0))) # (!\C_tag_out_rs~0_combout\)) # (!\C_busybit_in~combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111110111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \C_busybit_in~combout\,
	datab => \C_tag_out_rs~0_combout\,
	datac => \ra1_ir_out~combout\(2),
	datad => \ra1_ir_out~combout\(0),
	combout => \C_ready~0_combout\);

-- Location: LCCOMB_X11_Y50_N18
\Z_ready~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \Z_ready~2_combout\ = (!\Z_busybit_in~combout\) # (!\Z_ready~1_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Z_ready~1_combout\,
	datad => \Z_busybit_in~combout\,
	combout => \Z_ready~2_combout\);

-- Location: LCCOMB_X23_Y1_N10
\x1_add~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \x1_add~0_combout\ = (!\ra1_ir_out~combout\(2) & (\Equal0~6_combout\ & \ra1_val_out~combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \ra1_ir_out~combout\(2),
	datac => \Equal0~6_combout\,
	datad => \ra1_val_out~combout\,
	combout => \x1_add~0_combout\);

-- Location: LCCOMB_X23_Y1_N28
x1_adi : cycloneii_lcell_comb
-- Equation(s):
-- \x1_adi~combout\ = (!\ra1_val_out~combout\) # (!\Equal0~1_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Equal0~1_combout\,
	datad => \ra1_val_out~combout\,
	combout => \x1_adi~combout\);

-- Location: LCCOMB_X23_Y1_N22
\C_wr~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \C_wr~0_combout\ = ((\x1_add~0_combout\ & ((!\ra1_ir_out~combout\(0)) # (!\ra1_ir_out~combout\(1))))) # (!\x1_adi~combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011101110111011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \x1_add~0_combout\,
	datab => \x1_adi~combout\,
	datac => \ra1_ir_out~combout\(1),
	datad => \ra1_ir_out~combout\(0),
	combout => \C_wr~0_combout\);

-- Location: LCCOMB_X19_Y1_N12
\Equal0~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \Equal0~2_combout\ = (!\ra1_ir_out~combout\(12) & (!\ra1_ir_out~combout\(13) & (!\ra1_ir_out~combout\(15) & \ra1_ir_out~combout\(14))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ra1_ir_out~combout\(12),
	datab => \ra1_ir_out~combout\(13),
	datac => \ra1_ir_out~combout\(15),
	datad => \ra1_ir_out~combout\(14),
	combout => \Equal0~2_combout\);

-- Location: LCCOMB_X21_Y1_N14
\Z_wr~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Z_wr~0_combout\ = (\Equal0~1_combout\) # (\Equal0~2_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101011111010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Equal0~1_combout\,
	datac => \Equal0~2_combout\,
	combout => \Z_wr~0_combout\);

-- Location: LCCOMB_X22_Y1_N28
\process_0~5\ : cycloneii_lcell_comb
-- Equation(s):
-- \process_0~5_combout\ = (\Ard1a~6_combout\ & ((\Equal0~7_combout\) # (\Equal0~6_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Equal0~7_combout\,
	datac => \Ard1a~6_combout\,
	datad => \Equal0~6_combout\,
	combout => \process_0~5_combout\);

-- Location: LCCOMB_X22_Y1_N24
\Z_wr~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \Z_wr~1_combout\ = (!\Equal0~8_combout\ & (\ra1_val_out~combout\ & ((\Z_wr~0_combout\) # (\process_0~5_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Z_wr~0_combout\,
	datab => \process_0~5_combout\,
	datac => \Equal0~8_combout\,
	datad => \ra1_val_out~combout\,
	combout => \Z_wr~1_combout\);

-- Location: LCCOMB_X20_Y50_N26
\Equal14~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \Equal14~2_combout\ = (!\ra2_ir_out~combout\(12) & (!\ra2_ir_out~combout\(14) & (\ra2_ir_out~combout\(13) & !\ra2_ir_out~combout\(15))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ra2_ir_out~combout\(12),
	datab => \ra2_ir_out~combout\(14),
	datac => \ra2_ir_out~combout\(13),
	datad => \ra2_ir_out~combout\(15),
	combout => \Equal14~2_combout\);

-- Location: LCCOMB_X20_Y50_N28
\Equal14~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \Equal14~1_combout\ = (!\ra2_ir_out~combout\(12) & (!\ra2_ir_out~combout\(14) & (!\ra2_ir_out~combout\(13) & !\ra2_ir_out~combout\(15))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ra2_ir_out~combout\(12),
	datab => \ra2_ir_out~combout\(14),
	datac => \ra2_ir_out~combout\(13),
	datad => \ra2_ir_out~combout\(15),
	combout => \Equal14~1_combout\);

-- Location: LCCOMB_X20_Y50_N24
\C_2_tag_out_rs~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \C_2_tag_out_rs~0_combout\ = (\Equal14~2_combout\) # (\Equal14~1_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Equal14~2_combout\,
	datad => \Equal14~1_combout\,
	combout => \C_2_tag_out_rs~0_combout\);

-- Location: LCCOMB_X19_Y50_N26
\x2_adc~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \x2_adc~0_combout\ = (!\ra2_ir_out~combout\(0) & (!\ra2_ir_out~combout\(2) & \ra2_val_out~combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000010100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ra2_ir_out~combout\(0),
	datac => \ra2_ir_out~combout\(2),
	datad => \ra2_val_out~combout\,
	combout => \x2_adc~0_combout\);

-- Location: LCCOMB_X43_Y4_N22
\C_2_out~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \C_2_out~0_combout\ = (\C_2_tag_out_rs~0_combout\ & (\x2_adc~0_combout\ & (\ra2_ir_out~combout\(1) & \C_out~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \C_2_tag_out_rs~0_combout\,
	datab => \x2_adc~0_combout\,
	datac => \ra2_ir_out~combout\(1),
	datad => \C_out~0_combout\,
	combout => \C_2_out~0_combout\);

-- Location: LCCOMB_X43_Y4_N4
\C_2_ready~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \C_2_ready~0_combout\ = (((!\x2_adc~0_combout\) # (!\C_busybit_in~combout\)) # (!\ra2_ir_out~combout\(1))) # (!\C_2_tag_out_rs~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111111111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \C_2_tag_out_rs~0_combout\,
	datab => \ra2_ir_out~combout\(1),
	datac => \C_busybit_in~combout\,
	datad => \x2_adc~0_combout\,
	combout => \C_2_ready~0_combout\);

-- Location: LCCOMB_X19_Y50_N6
\C_2_wr~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \C_2_wr~3_combout\ = (\ra2_ir_out~combout\(0)) # (((\ra2_ir_out~combout\(2)) # (!\ra2_val_out~combout\)) # (!\Equal14~1_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ra2_ir_out~combout\(0),
	datab => \Equal14~1_combout\,
	datac => \ra2_ir_out~combout\(2),
	datad => \ra2_val_out~combout\,
	combout => \C_2_wr~3_combout\);

-- Location: LCCOMB_X19_Y50_N2
\x2_ndz~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \x2_ndz~0_combout\ = (\ra2_ir_out~combout\(0) & (!\ra2_ir_out~combout\(2) & (!\ra2_ir_out~combout\(1) & \ra2_val_out~combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000001000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ra2_ir_out~combout\(0),
	datab => \ra2_ir_out~combout\(2),
	datac => \ra2_ir_out~combout\(1),
	datad => \ra2_val_out~combout\,
	combout => \x2_ndz~0_combout\);

-- Location: LCCOMB_X20_Y50_N30
\Equal14~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \Equal14~3_combout\ = (\ra2_ir_out~combout\(12) & (!\ra2_ir_out~combout\(14) & (!\ra2_ir_out~combout\(13) & !\ra2_ir_out~combout\(15))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ra2_ir_out~combout\(12),
	datab => \ra2_ir_out~combout\(14),
	datac => \ra2_ir_out~combout\(13),
	datad => \ra2_ir_out~combout\(15),
	combout => \Equal14~3_combout\);

-- Location: LCCOMB_X19_Y50_N4
\x2_adi~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \x2_adi~0_combout\ = (\Equal14~3_combout\ & \ra2_val_out~combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Equal14~3_combout\,
	datad => \ra2_val_out~combout\,
	combout => \x2_adi~0_combout\);

-- Location: LCCOMB_X19_Y50_N20
\C_2_wr~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \C_2_wr~2_combout\ = ((\x2_adi~0_combout\) # ((\x2_ndz~0_combout\ & \Equal14~1_combout\))) # (!\C_2_wr~3_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110111110101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \C_2_wr~3_combout\,
	datab => \x2_ndz~0_combout\,
	datac => \x2_adi~0_combout\,
	datad => \Equal14~1_combout\,
	combout => \C_2_wr~2_combout\);

-- Location: LCCOMB_X19_Y50_N10
\Z_2_ready~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Z_2_ready~0_combout\ = (\C_2_wr~3_combout\ & (\x2_ndz~0_combout\ & ((\Equal14~2_combout\) # (\Equal14~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \C_2_wr~3_combout\,
	datab => \x2_ndz~0_combout\,
	datac => \Equal14~2_combout\,
	datad => \Equal14~1_combout\,
	combout => \Z_2_ready~0_combout\);

-- Location: LCCOMB_X11_Y50_N20
\Z_2_out~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Z_2_out~0_combout\ = (!\Z_busybit_in~combout\ & (\Z_in~combout\ & \Z_2_ready~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100000001000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Z_busybit_in~combout\,
	datab => \Z_in~combout\,
	datac => \Z_2_ready~0_combout\,
	combout => \Z_2_out~0_combout\);

-- Location: LCCOMB_X11_Y50_N26
\Z_2_ready~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \Z_2_ready~1_combout\ = (!\Z_2_ready~0_combout\) # (!\Z_busybit_in~combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101111101011111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Z_busybit_in~combout\,
	datac => \Z_2_ready~0_combout\,
	combout => \Z_2_ready~1_combout\);

-- Location: LCCOMB_X20_Y50_N4
\Equal14~4\ : cycloneii_lcell_comb
-- Equation(s):
-- \Equal14~4_combout\ = (!\ra2_ir_out~combout\(12) & (\ra2_ir_out~combout\(14) & (!\ra2_ir_out~combout\(13) & !\ra2_ir_out~combout\(15))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ra2_ir_out~combout\(12),
	datab => \ra2_ir_out~combout\(14),
	datac => \ra2_ir_out~combout\(13),
	datad => \ra2_ir_out~combout\(15),
	combout => \Equal14~4_combout\);

-- Location: LCCOMB_X20_Y50_N2
\Z_2_wr~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Z_2_wr~0_combout\ = (\Equal14~4_combout\) # ((\Equal14~3_combout\) # ((\C_2_tag_out_rs~0_combout\ & \Ard2a~6_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111101100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \C_2_tag_out_rs~0_combout\,
	datab => \Equal14~4_combout\,
	datac => \Ard2a~6_combout\,
	datad => \Equal14~3_combout\,
	combout => \Z_2_wr~0_combout\);

-- Location: LCCOMB_X21_Y50_N30
\Equal14~5\ : cycloneii_lcell_comb
-- Equation(s):
-- \Equal14~5_combout\ = (\ra2_ir_out~combout\(13) & (!\ra2_ir_out~combout\(14) & (\ra2_ir_out~combout\(12) & !\ra2_ir_out~combout\(15))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ra2_ir_out~combout\(13),
	datab => \ra2_ir_out~combout\(14),
	datac => \ra2_ir_out~combout\(12),
	datad => \ra2_ir_out~combout\(15),
	combout => \Equal14~5_combout\);

-- Location: LCCOMB_X20_Y50_N8
\Z_2_wr~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \Z_2_wr~1_combout\ = (\Z_2_wr~0_combout\ & (\ra2_val_out~combout\ & !\Equal14~5_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Z_2_wr~0_combout\,
	datac => \ra2_val_out~combout\,
	datad => \Equal14~5_combout\,
	combout => \Z_2_wr~1_combout\);

-- Location: LCCOMB_X63_Y49_N24
\x1_val~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \x1_val~1_combout\ = (\Equal14~0_combout\ & \spec_tag_rs_out2~1_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Equal14~0_combout\,
	datad => \spec_tag_rs_out2~1_combout\,
	combout => \x1_val~1_combout\);

-- Location: LCCOMB_X67_Y49_N14
\spec_tag_rs_out1~9\ : cycloneii_lcell_comb
-- Equation(s):
-- \spec_tag_rs_out1~9_combout\ = (\not_taken_branch_detected~combout\ & (\SPEC_TAG_REG|dout\(1) & ((\SPEC_TAG_REG|dout\(0)) # (!\taken_branch_detected~combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \not_taken_branch_detected~combout\,
	datab => \SPEC_TAG_REG|dout\(0),
	datac => \SPEC_TAG_REG|dout\(1),
	datad => \taken_branch_detected~combout\,
	combout => \spec_tag_rs_out1~9_combout\);

-- Location: LCCOMB_X67_Y49_N28
\spec_tag_reg_in~6\ : cycloneii_lcell_comb
-- Equation(s):
-- \spec_tag_reg_in~6_combout\ = (\SPEC_TAG_REG|dout\(1)) # (\SPEC_TAG_REG|dout\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \SPEC_TAG_REG|dout\(1),
	datad => \SPEC_TAG_REG|dout\(0),
	combout => \spec_tag_reg_in~6_combout\);

-- Location: LCCOMB_X67_Y49_N6
\spec_tag_reg_in~7\ : cycloneii_lcell_comb
-- Equation(s):
-- \spec_tag_reg_in~7_combout\ = (\process_0~2_combout\ & (\process_0~7_combout\ & ((\x1_val~0_combout\) # (\spec_tag_reg_in~6_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \x1_val~0_combout\,
	datab => \process_0~2_combout\,
	datac => \process_0~7_combout\,
	datad => \spec_tag_reg_in~6_combout\,
	combout => \spec_tag_reg_in~7_combout\);

-- Location: LCCOMB_X67_Y49_N16
\spec_tag_rs_out1~10\ : cycloneii_lcell_comb
-- Equation(s):
-- \spec_tag_rs_out1~10_combout\ = (\spec_tag_rs_out1~9_combout\) # ((!\not_taken_branch_detected~combout\ & \spec_tag_reg_in~7_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \not_taken_branch_detected~combout\,
	datac => \spec_tag_rs_out1~9_combout\,
	datad => \spec_tag_reg_in~7_combout\,
	combout => \spec_tag_rs_out1~10_combout\);

-- Location: LCCOMB_X67_Y49_N22
\spec_tag_rs_out1~11\ : cycloneii_lcell_comb
-- Equation(s):
-- \spec_tag_rs_out1~11_combout\ = (\SPEC_TAG_REG|dout\(0) & ((\not_taken_branch_detected~combout\ & ((\SPEC_TAG_REG|dout\(1)))) # (!\not_taken_branch_detected~combout\ & (!\taken_branch_detected~combout\)))) # (!\SPEC_TAG_REG|dout\(0) & 
-- (!\taken_branch_detected~combout\ & ((\SPEC_TAG_REG|dout\(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101000101010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \taken_branch_detected~combout\,
	datab => \not_taken_branch_detected~combout\,
	datac => \SPEC_TAG_REG|dout\(1),
	datad => \SPEC_TAG_REG|dout\(0),
	combout => \spec_tag_rs_out1~11_combout\);

-- Location: LCCOMB_X67_Y49_N20
\spec_tag_rs_out1~12\ : cycloneii_lcell_comb
-- Equation(s):
-- \spec_tag_rs_out1~12_combout\ = (\spec_tag_rs_out1~11_combout\) # ((\taken_branch_detected~combout\ & (!\not_taken_branch_detected~combout\ & \spec_tag_reg_in~7_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \taken_branch_detected~combout\,
	datab => \spec_tag_rs_out1~11_combout\,
	datac => \not_taken_branch_detected~combout\,
	datad => \spec_tag_reg_in~7_combout\,
	combout => \spec_tag_rs_out1~12_combout\);

-- Location: LCCOMB_X67_Y49_N0
\spec_tag_rs_out1~7\ : cycloneii_lcell_comb
-- Equation(s):
-- \spec_tag_rs_out1~7_combout\ = (\SPEC_TAG_REG|dout\(1) & ((\not_taken_branch_detected~combout\ & ((\SPEC_TAG_REG|dout\(0)))) # (!\not_taken_branch_detected~combout\ & (!\taken_branch_detected~combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101000000010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \taken_branch_detected~combout\,
	datab => \not_taken_branch_detected~combout\,
	datac => \SPEC_TAG_REG|dout\(1),
	datad => \SPEC_TAG_REG|dout\(0),
	combout => \spec_tag_rs_out1~7_combout\);

-- Location: LCCOMB_X67_Y49_N26
\spec_tag_rs_out1~13\ : cycloneii_lcell_comb
-- Equation(s):
-- \spec_tag_rs_out1~13_combout\ = (\spec_tag_rs_out1~7_combout\) # ((\taken_branch_detected~combout\ & (!\not_taken_branch_detected~combout\ & \spec_tag_reg_in~7_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \taken_branch_detected~combout\,
	datab => \spec_tag_rs_out1~7_combout\,
	datac => \not_taken_branch_detected~combout\,
	datad => \spec_tag_reg_in~7_combout\,
	combout => \spec_tag_rs_out1~13_combout\);

-- Location: LCCOMB_X67_Y49_N12
\spec_tag_reg_in~8\ : cycloneii_lcell_comb
-- Equation(s):
-- \spec_tag_reg_in~8_combout\ = (\x1_val~0_combout\ & ((\x1_val~1_combout\) # ((\spec_tag_rs_out1~12_combout\)))) # (!\x1_val~0_combout\ & (!\x1_val~1_combout\ & ((\spec_tag_rs_out1~13_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011100110101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \x1_val~0_combout\,
	datab => \x1_val~1_combout\,
	datac => \spec_tag_rs_out1~12_combout\,
	datad => \spec_tag_rs_out1~13_combout\,
	combout => \spec_tag_reg_in~8_combout\);

-- Location: LCCOMB_X67_Y49_N2
\spec_tag_reg_in~9\ : cycloneii_lcell_comb
-- Equation(s):
-- \spec_tag_reg_in~9_combout\ = (\x1_val~1_combout\ & ((\spec_tag_reg_in~8_combout\ & (\spec_tag_rs_out1~14_combout\)) # (!\spec_tag_reg_in~8_combout\ & ((\spec_tag_rs_out1~10_combout\))))) # (!\x1_val~1_combout\ & (((\spec_tag_reg_in~8_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \spec_tag_rs_out1~14_combout\,
	datab => \x1_val~1_combout\,
	datac => \spec_tag_rs_out1~10_combout\,
	datad => \spec_tag_reg_in~8_combout\,
	combout => \spec_tag_reg_in~9_combout\);

-- Location: LCCOMB_X67_Y49_N8
\SPEC_TAG_REG|dout[1]~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \SPEC_TAG_REG|dout[1]~0_combout\ = (\PE|twoRRnotFree~combout\ & (\spec_tag_rs_out1~13_combout\)) # (!\PE|twoRRnotFree~combout\ & ((\spec_tag_reg_in~9_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \spec_tag_rs_out1~13_combout\,
	datab => \PE|twoRRnotFree~combout\,
	datad => \spec_tag_reg_in~9_combout\,
	combout => \SPEC_TAG_REG|dout[1]~0_combout\);

-- Location: PIN_B27,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\spec_tag_rb_in[1]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_spec_tag_rb_in(1),
	combout => \spec_tag_rb_in~combout\(1));

-- Location: LCFF_X67_Y49_N9
\SPEC_TAG_REG|dout[1]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \SPEC_TAG_REG|dout[1]~0_combout\,
	sdata => \spec_tag_rb_in~combout\(1),
	aclr => \reset~clkctrl_outclk\,
	sload => \taken_branch_detected~combout\,
	ena => \spec_tag_reg_en~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \SPEC_TAG_REG|dout\(1));

-- Location: LCCOMB_X67_Y49_N10
\spec_tag_rs_out1~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \spec_tag_rs_out1~3_combout\ = (\not_taken_branch_detected~combout\ & (!\SPEC_TAG_REG|dout\(0) & ((\SPEC_TAG_REG|dout\(1))))) # (!\not_taken_branch_detected~combout\ & (\SPEC_TAG_REG|dout\(0) & ((\PE|twoRRnotFree~combout\) # (!\SPEC_TAG_REG|dout\(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110001001000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \not_taken_branch_detected~combout\,
	datab => \SPEC_TAG_REG|dout\(0),
	datac => \PE|twoRRnotFree~combout\,
	datad => \SPEC_TAG_REG|dout\(1),
	combout => \spec_tag_rs_out1~3_combout\);

-- Location: LCCOMB_X93_Y49_N12
\spec_tag_rs_out1~5\ : cycloneii_lcell_comb
-- Equation(s):
-- \spec_tag_rs_out1~5_combout\ = (!\taken_branch_detected~combout\ & ((\spec_tag_rs_out1~4_combout\ & ((\spec_tag_rs_out1~2_combout\))) # (!\spec_tag_rs_out1~4_combout\ & (\spec_tag_rs_out1~3_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111000000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \spec_tag_rs_out1~4_combout\,
	datab => \spec_tag_rs_out1~3_combout\,
	datac => \taken_branch_detected~combout\,
	datad => \spec_tag_rs_out1~2_combout\,
	combout => \spec_tag_rs_out1~5_combout\);

-- Location: LCCOMB_X93_Y49_N18
\spec_tag_rs_out1~6\ : cycloneii_lcell_comb
-- Equation(s):
-- \spec_tag_rs_out1~6_combout\ = (\spec_tag_rs_out1~5_combout\) # ((\taken_branch_detected~combout\ & \spec_tag_rb_in~combout\(0)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \taken_branch_detected~combout\,
	datac => \spec_tag_rb_in~combout\(0),
	datad => \spec_tag_rs_out1~5_combout\,
	combout => \spec_tag_rs_out1~6_combout\);

-- Location: LCCOMB_X93_Y49_N0
\spec_tag_rs_out1~8\ : cycloneii_lcell_comb
-- Equation(s):
-- \spec_tag_rs_out1~8_combout\ = (\taken_branch_detected~combout\ & ((\spec_tag_rb_in~combout\(1)))) # (!\taken_branch_detected~combout\ & (\spec_tag_rs_out1~7_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101000001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \spec_tag_rs_out1~7_combout\,
	datac => \taken_branch_detected~combout\,
	datad => \spec_tag_rb_in~combout\(1),
	combout => \spec_tag_rs_out1~8_combout\);

-- Location: LCCOMB_X66_Y49_N26
\spec_tag_rs_out2~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \spec_tag_rs_out2~3_combout\ = (\not_taken_branch_detected~combout\ & (!\SPEC_TAG_REG|dout\(0) & \SPEC_TAG_REG|dout\(1))) # (!\not_taken_branch_detected~combout\ & (\SPEC_TAG_REG|dout\(0)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110011001000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \not_taken_branch_detected~combout\,
	datab => \SPEC_TAG_REG|dout\(0),
	datad => \SPEC_TAG_REG|dout\(1),
	combout => \spec_tag_rs_out2~3_combout\);

-- Location: LCCOMB_X63_Y49_N22
\x1_val~4\ : cycloneii_lcell_comb
-- Equation(s):
-- \x1_val~4_combout\ = (\ra2_val_out~combout\ & (\Equal14~0_combout\ & \spec_tag_rs_out2~1_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ra2_val_out~combout\,
	datab => \Equal14~0_combout\,
	datad => \spec_tag_rs_out2~1_combout\,
	combout => \x1_val~4_combout\);

-- Location: LCCOMB_X66_Y49_N28
\spec_tag_rs_out2~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \spec_tag_rs_out2~2_combout\ = (\SPEC_TAG_REG|dout\(1) & (((!\x1_val~1_combout\ & \SPEC_TAG_REG|dout\(0))) # (!\not_taken_branch_detected~combout\))) # (!\SPEC_TAG_REG|dout\(1) & ((\not_taken_branch_detected~combout\ $ (!\SPEC_TAG_REG|dout\(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111110000001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \x1_val~1_combout\,
	datab => \SPEC_TAG_REG|dout\(1),
	datac => \not_taken_branch_detected~combout\,
	datad => \SPEC_TAG_REG|dout\(0),
	combout => \spec_tag_rs_out2~2_combout\);

-- Location: LCCOMB_X66_Y49_N24
\spec_tag_rs_out2~4\ : cycloneii_lcell_comb
-- Equation(s):
-- \spec_tag_rs_out2~4_combout\ = (\x1_val~0_combout\ & (((\spec_tag_rs_out2~2_combout\)))) # (!\x1_val~0_combout\ & (\spec_tag_rs_out2~3_combout\ & (\x1_val~4_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101001000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \x1_val~0_combout\,
	datab => \spec_tag_rs_out2~3_combout\,
	datac => \x1_val~4_combout\,
	datad => \spec_tag_rs_out2~2_combout\,
	combout => \spec_tag_rs_out2~4_combout\);

-- Location: LCCOMB_X63_Y49_N28
\spec_tag_rs_out1~4\ : cycloneii_lcell_comb
-- Equation(s):
-- \spec_tag_rs_out1~4_combout\ = (!\x1_val~0_combout\ & (((!\spec_tag_rs_out2~1_combout\) # (!\Equal14~0_combout\)) # (!\ra2_val_out~combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000011100001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ra2_val_out~combout\,
	datab => \Equal14~0_combout\,
	datac => \x1_val~0_combout\,
	datad => \spec_tag_rs_out2~1_combout\,
	combout => \spec_tag_rs_out1~4_combout\);

-- Location: LCCOMB_X93_Y49_N30
\spec_tag_rs_out2~5\ : cycloneii_lcell_comb
-- Equation(s):
-- \spec_tag_rs_out2~5_combout\ = (\PE|twoRRnotFree~combout\ & (\spec_tag_rs_out1~2_combout\)) # (!\PE|twoRRnotFree~combout\ & ((\spec_tag_rs_out2~4_combout\) # ((\spec_tag_rs_out1~2_combout\ & \spec_tag_rs_out1~4_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011101100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \spec_tag_rs_out1~2_combout\,
	datab => \spec_tag_rs_out2~4_combout\,
	datac => \spec_tag_rs_out1~4_combout\,
	datad => \PE|twoRRnotFree~combout\,
	combout => \spec_tag_rs_out2~5_combout\);

-- Location: LCCOMB_X93_Y49_N28
\spec_tag_rs_out2~6\ : cycloneii_lcell_comb
-- Equation(s):
-- \spec_tag_rs_out2~6_combout\ = (\taken_branch_detected~combout\ & (\spec_tag_rb_in~combout\(0))) # (!\taken_branch_detected~combout\ & ((\spec_tag_rs_out2~5_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \taken_branch_detected~combout\,
	datac => \spec_tag_rb_in~combout\(0),
	datad => \spec_tag_rs_out2~5_combout\,
	combout => \spec_tag_rs_out2~6_combout\);

-- Location: LCCOMB_X67_Y49_N30
\spec_tag_rs_out2~8\ : cycloneii_lcell_comb
-- Equation(s):
-- \spec_tag_rs_out2~8_combout\ = (\PE|twoRRnotFree~combout\ & (((\spec_tag_rs_out1~7_combout\)))) # (!\PE|twoRRnotFree~combout\ & ((\x1_val~0_combout\ & (\spec_tag_rs_out2~7_combout\)) # (!\x1_val~0_combout\ & ((\spec_tag_rs_out1~7_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100101011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \spec_tag_rs_out2~7_combout\,
	datab => \spec_tag_rs_out1~7_combout\,
	datac => \PE|twoRRnotFree~combout\,
	datad => \x1_val~0_combout\,
	combout => \spec_tag_rs_out2~8_combout\);

-- Location: LCCOMB_X93_Y49_N14
\spec_tag_rs_out2~9\ : cycloneii_lcell_comb
-- Equation(s):
-- \spec_tag_rs_out2~9_combout\ = (\taken_branch_detected~combout\ & (\spec_tag_rb_in~combout\(1))) # (!\taken_branch_detected~combout\ & ((\spec_tag_rs_out2~8_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \taken_branch_detected~combout\,
	datab => \spec_tag_rb_in~combout\(1),
	datad => \spec_tag_rs_out2~8_combout\,
	combout => \spec_tag_rs_out2~9_combout\);

-- Location: LCCOMB_X53_Y1_N0
\Equal0~9\ : cycloneii_lcell_comb
-- Equation(s):
-- \Equal0~9_combout\ = (\ra1_ir_out~combout\(12) & (!\ra1_ir_out~combout\(13) & (!\ra1_ir_out~combout\(15) & \ra1_ir_out~combout\(14))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000001000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ra1_ir_out~combout\(12),
	datab => \ra1_ir_out~combout\(13),
	datac => \ra1_ir_out~combout\(15),
	datad => \ra1_ir_out~combout\(14),
	combout => \Equal0~9_combout\);

-- Location: LCCOMB_X59_Y49_N10
\STORE_TAG_REG|dout[1]~17\ : cycloneii_lcell_comb
-- Equation(s):
-- \STORE_TAG_REG|dout[1]~17_combout\ = (\Equal0~9_combout\ & (\ra1_val_out~combout\ & \process_0~2_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Equal0~9_combout\,
	datac => \ra1_val_out~combout\,
	datad => \process_0~2_combout\,
	combout => \STORE_TAG_REG|dout[1]~17_combout\);

-- Location: PIN_A20,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\store_retirement_count[1]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_store_retirement_count(1),
	combout => \store_retirement_count~combout\(1));

-- Location: PIN_B20,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\store_retirement_count[0]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_store_retirement_count(0),
	combout => \store_retirement_count~combout\(0));

-- Location: LCCOMB_X29_Y50_N2
\Equal14~7\ : cycloneii_lcell_comb
-- Equation(s):
-- \Equal14~7_combout\ = (\ra2_ir_out~combout\(12) & (!\ra2_ir_out~combout\(15) & (\ra2_ir_out~combout\(14) & !\ra2_ir_out~combout\(13))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ra2_ir_out~combout\(12),
	datab => \ra2_ir_out~combout\(15),
	datac => \ra2_ir_out~combout\(14),
	datad => \ra2_ir_out~combout\(13),
	combout => \Equal14~7_combout\);

-- Location: LCCOMB_X63_Y49_N30
\store_tag_reg_en~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \store_tag_reg_en~2_combout\ = (\ra1_val_out~combout\ & ((\Equal0~9_combout\) # ((\Equal14~7_combout\ & \spec_tag_rs_out2~1_combout\)))) # (!\ra1_val_out~combout\ & (\Equal14~7_combout\ & ((\spec_tag_rs_out2~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110110010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ra1_val_out~combout\,
	datab => \Equal14~7_combout\,
	datac => \Equal0~9_combout\,
	datad => \spec_tag_rs_out2~1_combout\,
	combout => \store_tag_reg_en~2_combout\);

-- Location: LCCOMB_X62_Y49_N12
\store_tag_reg_en~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \store_tag_reg_en~3_combout\ = (\store_retirement_count~combout\(1) & (((!\store_retirement_count~combout\(0))))) # (!\store_retirement_count~combout\(1) & ((\store_retirement_count~combout\(0)) # ((\process_0~2_combout\ & \store_tag_reg_en~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011111000111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \process_0~2_combout\,
	datab => \store_retirement_count~combout\(1),
	datac => \store_retirement_count~combout\(0),
	datad => \store_tag_reg_en~2_combout\,
	combout => \store_tag_reg_en~3_combout\);

-- Location: LCCOMB_X59_Y49_N26
\store_tag_reg_in~5\ : cycloneii_lcell_comb
-- Equation(s):
-- \store_tag_reg_in~5_combout\ = (\process_0~2_combout\ & (\store_retirement_count~combout\(0) $ (!\STORE_TAG_REG|dout\(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000000001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \process_0~2_combout\,
	datac => \store_retirement_count~combout\(0),
	datad => \STORE_TAG_REG|dout\(0),
	combout => \store_tag_reg_in~5_combout\);

-- Location: LCCOMB_X59_Y49_N16
\store_tag_reg_in~4\ : cycloneii_lcell_comb
-- Equation(s):
-- \store_tag_reg_in~4_combout\ = (\Equal0~9_combout\ & \ra1_val_out~combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Equal0~9_combout\,
	datac => \ra1_val_out~combout\,
	combout => \store_tag_reg_in~4_combout\);

-- Location: LCCOMB_X59_Y49_N0
\STORE_TAG_REG|dout[0]~10\ : cycloneii_lcell_comb
-- Equation(s):
-- \STORE_TAG_REG|dout[0]~10_combout\ = (\store_tag_reg_in~24_combout\ & ((\store_tag_reg_in~4_combout\) # (\store_retirement_count~combout\(0) $ (!\STORE_TAG_REG|dout\(0))))) # (!\store_tag_reg_in~24_combout\ & ((\store_retirement_count~combout\(0) $ 
-- (!\STORE_TAG_REG|dout\(0))) # (!\store_tag_reg_in~4_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110110110110111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \store_tag_reg_in~24_combout\,
	datab => \store_retirement_count~combout\(0),
	datac => \store_tag_reg_in~4_combout\,
	datad => \STORE_TAG_REG|dout\(0),
	combout => \STORE_TAG_REG|dout[0]~10_combout\);

-- Location: LCCOMB_X59_Y49_N22
\STORE_TAG_REG|dout[0]~11\ : cycloneii_lcell_comb
-- Equation(s):
-- \STORE_TAG_REG|dout[0]~11_combout\ = (\store_tag_reg_in~6_combout\ & ((\STORE_TAG_REG|dout[0]~10_combout\) # (!\process_0~2_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \process_0~2_combout\,
	datac => \store_tag_reg_in~6_combout\,
	datad => \STORE_TAG_REG|dout[0]~10_combout\,
	combout => \STORE_TAG_REG|dout[0]~11_combout\);

-- Location: LCCOMB_X59_Y49_N8
\STORE_TAG_REG|dout[0]~12\ : cycloneii_lcell_comb
-- Equation(s):
-- \STORE_TAG_REG|dout[0]~12_combout\ = (\STORE_TAG_REG|dout[0]~11_combout\) # ((\store_tag_reg_in~5_combout\ & (\store_tag_reg_in~24_combout\ $ (\store_tag_reg_in~4_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111101001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \store_tag_reg_in~24_combout\,
	datab => \store_tag_reg_in~5_combout\,
	datac => \store_tag_reg_in~4_combout\,
	datad => \STORE_TAG_REG|dout[0]~11_combout\,
	combout => \STORE_TAG_REG|dout[0]~12_combout\);

-- Location: LCCOMB_X60_Y49_N28
\STORE_TAG_REG|dout[0]~14\ : cycloneii_lcell_comb
-- Equation(s):
-- \STORE_TAG_REG|dout[0]~14_combout\ = (\STORE_TAG_REG|dout[0]~13_combout\ & ((\store_tag_reg_en~3_combout\ & ((\STORE_TAG_REG|dout[0]~12_combout\))) # (!\store_tag_reg_en~3_combout\ & (\STORE_TAG_REG|dout\(0))))) # (!\STORE_TAG_REG|dout[0]~13_combout\ & 
-- (((\STORE_TAG_REG|dout\(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111100001110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \STORE_TAG_REG|dout[0]~13_combout\,
	datab => \store_tag_reg_en~3_combout\,
	datac => \STORE_TAG_REG|dout\(0),
	datad => \STORE_TAG_REG|dout[0]~12_combout\,
	combout => \STORE_TAG_REG|dout[0]~14_combout\);

-- Location: LCFF_X60_Y49_N29
\STORE_TAG_REG|dout[0]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \STORE_TAG_REG|dout[0]~14_combout\,
	aclr => \reset~clkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \STORE_TAG_REG|dout\(0));

-- Location: LCCOMB_X59_Y49_N4
\store_tag_reg_in~6\ : cycloneii_lcell_comb
-- Equation(s):
-- \store_tag_reg_in~6_combout\ = \STORE_TAG_REG|dout\(0) $ (((\store_retirement_count~combout\(0) & !\store_retirement_count~combout\(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110100100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \store_retirement_count~combout\(0),
	datab => \store_retirement_count~combout\(1),
	datad => \STORE_TAG_REG|dout\(0),
	combout => \store_tag_reg_in~6_combout\);

-- Location: LCCOMB_X59_Y49_N6
\store_tag_reg_in~7\ : cycloneii_lcell_comb
-- Equation(s):
-- \store_tag_reg_in~7_combout\ = (\STORE_TAG_REG|dout[1]~17_combout\ & (((\store_tag_reg_in~4_combout\ & \store_tag_reg_in~5_combout\)))) # (!\STORE_TAG_REG|dout[1]~17_combout\ & ((\store_tag_reg_in~6_combout\) # ((\store_tag_reg_in~4_combout\ & 
-- \store_tag_reg_in~5_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010001000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \STORE_TAG_REG|dout[1]~17_combout\,
	datab => \store_tag_reg_in~6_combout\,
	datac => \store_tag_reg_in~4_combout\,
	datad => \store_tag_reg_in~5_combout\,
	combout => \store_tag_reg_in~7_combout\);

-- Location: LCCOMB_X62_Y49_N28
\store_tag_reg_in~9\ : cycloneii_lcell_comb
-- Equation(s):
-- \store_tag_reg_in~9_combout\ = (\process_0~2_combout\ & ((\store_retirement_count~combout\(0)) # (!\store_retirement_count~combout\(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \store_retirement_count~combout\(1),
	datac => \store_retirement_count~combout\(0),
	datad => \process_0~2_combout\,
	combout => \store_tag_reg_in~9_combout\);

-- Location: LCCOMB_X62_Y49_N2
\store_tag_reg_in~11\ : cycloneii_lcell_comb
-- Equation(s):
-- \store_tag_reg_in~11_combout\ = ((\store_retirement_count~combout\(1) & !\store_retirement_count~combout\(0))) # (!\process_0~2_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000110011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \store_retirement_count~combout\(1),
	datac => \store_retirement_count~combout\(0),
	datad => \process_0~2_combout\,
	combout => \store_tag_reg_in~11_combout\);

-- Location: LCCOMB_X61_Y49_N14
\store_tag_reg_in~12\ : cycloneii_lcell_comb
-- Equation(s):
-- \store_tag_reg_in~12_combout\ = \STORE_TAG_REG|dout\(1) $ (((!\store_tag_reg_in~10_combout\ & (\STORE_TAG_REG|dout\(0) $ (\store_tag_reg_in~11_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101100010100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \store_tag_reg_in~10_combout\,
	datab => \STORE_TAG_REG|dout\(0),
	datac => \store_tag_reg_in~11_combout\,
	datad => \STORE_TAG_REG|dout\(1),
	combout => \store_tag_reg_in~12_combout\);

-- Location: LCCOMB_X61_Y49_N24
\store_tag_reg_in~13\ : cycloneii_lcell_comb
-- Equation(s):
-- \store_tag_reg_in~13_combout\ = (\store_tag_reg_in~10_combout\ & ((\store_tag_reg_in~9_combout\ & (\store_tag_reg_in~12_combout\)) # (!\store_tag_reg_in~9_combout\ & ((\store_tag_reg_in~8_combout\))))) # (!\store_tag_reg_in~10_combout\ & 
-- (((\store_tag_reg_in~12_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001011010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \store_tag_reg_in~10_combout\,
	datab => \store_tag_reg_in~9_combout\,
	datac => \store_tag_reg_in~12_combout\,
	datad => \store_tag_reg_in~8_combout\,
	combout => \store_tag_reg_in~13_combout\);

-- Location: LCCOMB_X59_Y49_N20
\STORE_TAG_REG|dout[1]~19\ : cycloneii_lcell_comb
-- Equation(s):
-- \STORE_TAG_REG|dout[1]~19_combout\ = (((\process_0~2_combout\ & \store_retirement_count~combout\(0))) # (!\ra1_val_out~combout\)) # (!\Equal0~9_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011111100111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \process_0~2_combout\,
	datab => \Equal0~9_combout\,
	datac => \ra1_val_out~combout\,
	datad => \store_retirement_count~combout\(0),
	combout => \STORE_TAG_REG|dout[1]~19_combout\);

-- Location: LCCOMB_X62_Y49_N30
\store_tag_reg_in~25\ : cycloneii_lcell_comb
-- Equation(s):
-- \store_tag_reg_in~25_combout\ = (\STORE_TAG_REG|dout[1]~17_combout\ & (\STORE_TAG_REG|dout\(1) $ (((\STORE_TAG_REG|dout\(0)) # (!\STORE_TAG_REG|dout[1]~19_combout\))))) # (!\STORE_TAG_REG|dout[1]~17_combout\ & (((\STORE_TAG_REG|dout[1]~19_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101110010011100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \STORE_TAG_REG|dout\(1),
	datab => \STORE_TAG_REG|dout[1]~19_combout\,
	datac => \STORE_TAG_REG|dout[1]~17_combout\,
	datad => \STORE_TAG_REG|dout\(0),
	combout => \store_tag_reg_in~25_combout\);

-- Location: LCCOMB_X61_Y49_N8
\store_tag_reg_in~26\ : cycloneii_lcell_comb
-- Equation(s):
-- \store_tag_reg_in~26_combout\ = (\STORE_TAG_REG|dout[1]~17_combout\ & (((\store_tag_reg_in~25_combout\)))) # (!\STORE_TAG_REG|dout[1]~17_combout\ & ((\store_tag_reg_in~25_combout\ & ((\store_tag_reg_in~13_combout\))) # (!\store_tag_reg_in~25_combout\ & 
-- (\store_tag_reg_in~8_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \store_tag_reg_in~8_combout\,
	datab => \STORE_TAG_REG|dout[1]~17_combout\,
	datac => \store_tag_reg_in~13_combout\,
	datad => \store_tag_reg_in~25_combout\,
	combout => \store_tag_reg_in~26_combout\);

-- Location: LCCOMB_X63_Y49_N8
\store_tag_reg_in~24\ : cycloneii_lcell_comb
-- Equation(s):
-- \store_tag_reg_in~24_combout\ = (\ra2_val_out~combout\ & (\Equal14~7_combout\ & \spec_tag_rs_out2~1_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ra2_val_out~combout\,
	datab => \Equal14~7_combout\,
	datad => \spec_tag_rs_out2~1_combout\,
	combout => \store_tag_reg_in~24_combout\);

-- Location: LCCOMB_X63_Y49_N0
\STORE_TAG_REG|dout[1]~15\ : cycloneii_lcell_comb
-- Equation(s):
-- \STORE_TAG_REG|dout[1]~15_combout\ = (((!\spec_tag_rs_out2~1_combout\) # (!\store_retirement_count~combout\(1))) # (!\Equal14~7_combout\)) # (!\ra2_val_out~combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111111111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ra2_val_out~combout\,
	datab => \Equal14~7_combout\,
	datac => \store_retirement_count~combout\(1),
	datad => \spec_tag_rs_out2~1_combout\,
	combout => \STORE_TAG_REG|dout[1]~15_combout\);

-- Location: LCCOMB_X62_Y49_N0
\STORE_TAG_REG|dout[0]~13\ : cycloneii_lcell_comb
-- Equation(s):
-- \STORE_TAG_REG|dout[0]~13_combout\ = (\store_retirement_count~combout\(1)) # ((\store_retirement_count~combout\(0)) # ((\STORE_TAG_REG|dout[0]~18_combout\ & \process_0~2_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111011111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \STORE_TAG_REG|dout[0]~18_combout\,
	datab => \store_retirement_count~combout\(1),
	datac => \store_retirement_count~combout\(0),
	datad => \process_0~2_combout\,
	combout => \STORE_TAG_REG|dout[0]~13_combout\);

-- Location: LCCOMB_X62_Y49_N20
\STORE_TAG_REG|dout[1]~16\ : cycloneii_lcell_comb
-- Equation(s):
-- \STORE_TAG_REG|dout[1]~16_combout\ = (\store_tag_reg_en~3_combout\ & (\STORE_TAG_REG|dout[0]~13_combout\ & ((\STORE_TAG_REG|dout[1]~15_combout\) # (!\STORE_TAG_REG|dout[1]~17_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010001000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \store_tag_reg_en~3_combout\,
	datab => \STORE_TAG_REG|dout[1]~17_combout\,
	datac => \STORE_TAG_REG|dout[1]~15_combout\,
	datad => \STORE_TAG_REG|dout[0]~13_combout\,
	combout => \STORE_TAG_REG|dout[1]~16_combout\);

-- Location: LCFF_X60_Y49_N1
\STORE_TAG_REG|dout[1]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \STORE_TAG_REG|dout[1]~0_combout\,
	sdata => \store_tag_reg_in~26_combout\,
	aclr => \reset~clkctrl_outclk\,
	sload => \store_tag_reg_in~24_combout\,
	ena => \STORE_TAG_REG|dout[1]~16_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \STORE_TAG_REG|dout\(1));

-- Location: LCCOMB_X61_Y49_N12
\store_tag_reg_in~8\ : cycloneii_lcell_comb
-- Equation(s):
-- \store_tag_reg_in~8_combout\ = \STORE_TAG_REG|dout\(1) $ (((\store_retirement_count~combout\(0) & (!\STORE_TAG_REG|dout\(0) & !\store_retirement_count~combout\(1))) # (!\store_retirement_count~combout\(0) & ((\store_retirement_count~combout\(1))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010110101010010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \store_retirement_count~combout\(0),
	datab => \STORE_TAG_REG|dout\(0),
	datac => \store_retirement_count~combout\(1),
	datad => \STORE_TAG_REG|dout\(1),
	combout => \store_tag_reg_in~8_combout\);

-- Location: LCCOMB_X60_Y49_N0
\STORE_TAG_REG|dout[1]~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \STORE_TAG_REG|dout[1]~0_combout\ = (\store_tag_reg_in~4_combout\ & ((\store_tag_reg_in~13_combout\))) # (!\store_tag_reg_in~4_combout\ & (\store_tag_reg_in~8_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111000100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \store_tag_reg_in~8_combout\,
	datab => \store_tag_reg_in~4_combout\,
	datad => \store_tag_reg_in~13_combout\,
	combout => \STORE_TAG_REG|dout[1]~0_combout\);

-- Location: LCCOMB_X61_Y49_N18
\STORE_TAG_INC|ist_add:2:F1|s0\ : cycloneii_lcell_comb
-- Equation(s):
-- \STORE_TAG_INC|ist_add:2:F1|s0~combout\ = \STORE_TAG_REG|dout\(2) $ (((\STORE_TAG_REG|dout\(0) & \STORE_TAG_REG|dout\(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \STORE_TAG_REG|dout\(0),
	datac => \STORE_TAG_REG|dout\(2),
	datad => \STORE_TAG_REG|dout\(1),
	combout => \STORE_TAG_INC|ist_add:2:F1|s0~combout\);

-- Location: LCCOMB_X59_Y49_N18
\STORE_TAG_DEC2|ist_add:2:F1|s0\ : cycloneii_lcell_comb
-- Equation(s):
-- \STORE_TAG_DEC2|ist_add:2:F1|s0~combout\ = \STORE_TAG_REG|dout\(2) $ (\STORE_TAG_REG|dout\(1))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \STORE_TAG_REG|dout\(2),
	datad => \STORE_TAG_REG|dout\(1),
	combout => \STORE_TAG_DEC2|ist_add:2:F1|s0~combout\);

-- Location: LCCOMB_X60_Y49_N4
\store_tag_reg_in~27\ : cycloneii_lcell_comb
-- Equation(s):
-- \store_tag_reg_in~27_combout\ = (\STORE_TAG_REG|dout[1]~19_combout\ & (((!\STORE_TAG_REG|dout[1]~17_combout\)))) # (!\STORE_TAG_REG|dout[1]~19_combout\ & ((\STORE_TAG_REG|dout[1]~17_combout\ & (\STORE_TAG_DEC2|ist_add:2:F1|s0~combout\)) # 
-- (!\STORE_TAG_REG|dout[1]~17_combout\ & ((\store_tag_reg_in~33_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100111101001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \STORE_TAG_REG|dout[1]~19_combout\,
	datab => \STORE_TAG_DEC2|ist_add:2:F1|s0~combout\,
	datac => \STORE_TAG_REG|dout[1]~17_combout\,
	datad => \store_tag_reg_in~33_combout\,
	combout => \store_tag_reg_in~27_combout\);

-- Location: LCCOMB_X60_Y49_N2
\store_tag_reg_in~28\ : cycloneii_lcell_comb
-- Equation(s):
-- \store_tag_reg_in~28_combout\ = (\STORE_TAG_REG|dout[1]~19_combout\ & ((\store_tag_reg_in~27_combout\ & ((\store_tag_reg_in~17_combout\))) # (!\store_tag_reg_in~27_combout\ & (\STORE_TAG_INC|ist_add:2:F1|s0~combout\)))) # 
-- (!\STORE_TAG_REG|dout[1]~19_combout\ & (((\store_tag_reg_in~27_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111100001011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \STORE_TAG_REG|dout[1]~19_combout\,
	datab => \STORE_TAG_INC|ist_add:2:F1|s0~combout\,
	datac => \store_tag_reg_in~27_combout\,
	datad => \store_tag_reg_in~17_combout\,
	combout => \store_tag_reg_in~28_combout\);

-- Location: LCFF_X60_Y49_N31
\STORE_TAG_REG|dout[2]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \STORE_TAG_REG|dout[2]~1_combout\,
	sdata => \store_tag_reg_in~28_combout\,
	aclr => \reset~clkctrl_outclk\,
	sload => \store_tag_reg_in~24_combout\,
	ena => \STORE_TAG_REG|dout[1]~16_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \STORE_TAG_REG|dout\(2));

-- Location: LCCOMB_X61_Y49_N2
\store_tag_reg_in~16\ : cycloneii_lcell_comb
-- Equation(s):
-- \store_tag_reg_in~16_combout\ = \STORE_TAG_REG|dout\(2) $ (((\STORE_TAG_REG|dout\(1)) # ((\store_retirement_count~combout\(0) & \STORE_TAG_REG|dout\(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111101111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \store_retirement_count~combout\(0),
	datab => \STORE_TAG_REG|dout\(0),
	datac => \STORE_TAG_REG|dout\(2),
	datad => \STORE_TAG_REG|dout\(1),
	combout => \store_tag_reg_in~16_combout\);

-- Location: LCCOMB_X61_Y49_N28
\store_tag_reg_in~33\ : cycloneii_lcell_comb
-- Equation(s):
-- \store_tag_reg_in~33_combout\ = (\STORE_TAG_REG|dout\(2) & ((\store_retirement_count~combout\(1) $ (!\store_retirement_count~combout\(0))) # (!\store_tag_reg_in~16_combout\))) # (!\STORE_TAG_REG|dout\(2) & (!\store_tag_reg_in~16_combout\ & 
-- (\store_retirement_count~combout\(1) $ (\store_retirement_count~combout\(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000001010111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \STORE_TAG_REG|dout\(2),
	datab => \store_retirement_count~combout\(1),
	datac => \store_retirement_count~combout\(0),
	datad => \store_tag_reg_in~16_combout\,
	combout => \store_tag_reg_in~33_combout\);

-- Location: LCCOMB_X60_Y49_N6
\STORE_TAG_DEC|ist_add:2:F1|s0\ : cycloneii_lcell_comb
-- Equation(s):
-- \STORE_TAG_DEC|ist_add:2:F1|s0~combout\ = \STORE_TAG_REG|dout\(2) $ (((\STORE_TAG_REG|dout\(1)) # (\STORE_TAG_REG|dout\(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001100111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \STORE_TAG_REG|dout\(2),
	datac => \STORE_TAG_REG|dout\(1),
	datad => \STORE_TAG_REG|dout\(0),
	combout => \STORE_TAG_DEC|ist_add:2:F1|s0~combout\);

-- Location: LCCOMB_X61_Y49_N0
\store_tag_reg_in~14\ : cycloneii_lcell_comb
-- Equation(s):
-- \store_tag_reg_in~14_combout\ = (\store_tag_reg_in~10_combout\ & (\store_tag_reg_in~11_combout\)) # (!\store_tag_reg_in~10_combout\ & ((\store_tag_reg_in~11_combout\ & (!\STORE_TAG_DEC|ist_add:2:F1|s0~combout\)) # (!\store_tag_reg_in~11_combout\ & 
-- ((\STORE_TAG_INC|ist_add:2:F1|s0~combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001110110001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \store_tag_reg_in~10_combout\,
	datab => \store_tag_reg_in~11_combout\,
	datac => \STORE_TAG_DEC|ist_add:2:F1|s0~combout\,
	datad => \STORE_TAG_INC|ist_add:2:F1|s0~combout\,
	combout => \store_tag_reg_in~14_combout\);

-- Location: LCCOMB_X61_Y49_N20
\store_tag_reg_in~17\ : cycloneii_lcell_comb
-- Equation(s):
-- \store_tag_reg_in~17_combout\ = (\store_tag_reg_in~10_combout\ & ((\store_tag_reg_in~14_combout\ & (\store_tag_reg_in~33_combout\)) # (!\store_tag_reg_in~14_combout\ & ((\STORE_TAG_REG|dout\(2)))))) # (!\store_tag_reg_in~10_combout\ & 
-- (((\store_tag_reg_in~14_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \store_tag_reg_in~10_combout\,
	datab => \store_tag_reg_in~33_combout\,
	datac => \STORE_TAG_REG|dout\(2),
	datad => \store_tag_reg_in~14_combout\,
	combout => \store_tag_reg_in~17_combout\);

-- Location: LCCOMB_X60_Y49_N30
\STORE_TAG_REG|dout[2]~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \STORE_TAG_REG|dout[2]~1_combout\ = (\store_tag_reg_in~4_combout\ & (\store_tag_reg_in~17_combout\)) # (!\store_tag_reg_in~4_combout\ & ((\store_tag_reg_in~33_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \store_tag_reg_in~4_combout\,
	datab => \store_tag_reg_in~17_combout\,
	datad => \store_tag_reg_in~33_combout\,
	combout => \STORE_TAG_REG|dout[2]~1_combout\);

-- Location: LCCOMB_X60_Y49_N10
\store_tag_reg_in~19\ : cycloneii_lcell_comb
-- Equation(s):
-- \store_tag_reg_in~19_combout\ = (\STORE_TAG_REG|dout\(1)) # ((\STORE_TAG_REG|dout\(2)) # ((\store_retirement_count~combout\(0) & \STORE_TAG_REG|dout\(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \store_retirement_count~combout\(0),
	datab => \STORE_TAG_REG|dout\(0),
	datac => \STORE_TAG_REG|dout\(1),
	datad => \STORE_TAG_REG|dout\(2),
	combout => \store_tag_reg_in~19_combout\);

-- Location: LCCOMB_X61_Y49_N22
\store_tag_reg_in~34\ : cycloneii_lcell_comb
-- Equation(s):
-- \store_tag_reg_in~34_combout\ = \STORE_TAG_REG|dout\(3) $ (((!\store_tag_reg_in~19_combout\ & (\store_retirement_count~combout\(1) $ (\store_retirement_count~combout\(0))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000010010110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \store_retirement_count~combout\(1),
	datab => \store_retirement_count~combout\(0),
	datac => \STORE_TAG_REG|dout\(3),
	datad => \store_tag_reg_in~19_combout\,
	combout => \store_tag_reg_in~34_combout\);

-- Location: LCCOMB_X61_Y49_N30
\STORE_TAG_INC|ist_add:3:F1|s0\ : cycloneii_lcell_comb
-- Equation(s):
-- \STORE_TAG_INC|ist_add:3:F1|s0~combout\ = \STORE_TAG_REG|dout\(3) $ (((\STORE_TAG_REG|dout\(2) & (\STORE_TAG_REG|dout\(0) & \STORE_TAG_REG|dout\(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111100011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \STORE_TAG_REG|dout\(2),
	datab => \STORE_TAG_REG|dout\(0),
	datac => \STORE_TAG_REG|dout\(3),
	datad => \STORE_TAG_REG|dout\(1),
	combout => \STORE_TAG_INC|ist_add:3:F1|s0~combout\);

-- Location: LCCOMB_X61_Y49_N16
\STORE_TAG_INC2|ist_add:3:F1|s0\ : cycloneii_lcell_comb
-- Equation(s):
-- \STORE_TAG_INC2|ist_add:3:F1|s0~combout\ = \STORE_TAG_REG|dout\(3) $ (((\STORE_TAG_REG|dout\(2) & \STORE_TAG_REG|dout\(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \STORE_TAG_REG|dout\(3),
	datac => \STORE_TAG_REG|dout\(2),
	datad => \STORE_TAG_REG|dout\(1),
	combout => \STORE_TAG_INC2|ist_add:3:F1|s0~combout\);

-- Location: LCCOMB_X62_Y49_N14
\store_tag_reg_in~29\ : cycloneii_lcell_comb
-- Equation(s):
-- \store_tag_reg_in~29_combout\ = (\STORE_TAG_REG|dout[1]~17_combout\ & ((\STORE_TAG_REG|dout[1]~19_combout\ & (\STORE_TAG_INC|ist_add:3:F1|s0~combout\)) # (!\STORE_TAG_REG|dout[1]~19_combout\ & ((\STORE_TAG_INC2|ist_add:3:F1|s0~combout\))))) # 
-- (!\STORE_TAG_REG|dout[1]~17_combout\ & (\STORE_TAG_REG|dout[1]~19_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110011011000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \STORE_TAG_REG|dout[1]~17_combout\,
	datab => \STORE_TAG_REG|dout[1]~19_combout\,
	datac => \STORE_TAG_INC|ist_add:3:F1|s0~combout\,
	datad => \STORE_TAG_INC2|ist_add:3:F1|s0~combout\,
	combout => \store_tag_reg_in~29_combout\);

-- Location: LCCOMB_X61_Y49_N10
\store_tag_reg_in~30\ : cycloneii_lcell_comb
-- Equation(s):
-- \store_tag_reg_in~30_combout\ = (\STORE_TAG_REG|dout[1]~17_combout\ & (((\store_tag_reg_in~29_combout\)))) # (!\STORE_TAG_REG|dout[1]~17_combout\ & ((\store_tag_reg_in~29_combout\ & ((\store_tag_reg_in~20_combout\))) # (!\store_tag_reg_in~29_combout\ & 
-- (\store_tag_reg_in~34_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010010100100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \STORE_TAG_REG|dout[1]~17_combout\,
	datab => \store_tag_reg_in~34_combout\,
	datac => \store_tag_reg_in~29_combout\,
	datad => \store_tag_reg_in~20_combout\,
	combout => \store_tag_reg_in~30_combout\);

-- Location: LCFF_X60_Y49_N17
\STORE_TAG_REG|dout[3]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \STORE_TAG_REG|dout[3]~2_combout\,
	sdata => \store_tag_reg_in~30_combout\,
	aclr => \reset~clkctrl_outclk\,
	sload => \store_tag_reg_in~24_combout\,
	ena => \STORE_TAG_REG|dout[1]~16_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \STORE_TAG_REG|dout\(3));

-- Location: LCCOMB_X60_Y49_N12
\STORE_TAG_INC|ist_add:2:F1|cout~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \STORE_TAG_INC|ist_add:2:F1|cout~0_combout\ = (\STORE_TAG_REG|dout\(0) & (\STORE_TAG_REG|dout\(1) & \STORE_TAG_REG|dout\(2)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \STORE_TAG_REG|dout\(0),
	datac => \STORE_TAG_REG|dout\(1),
	datad => \STORE_TAG_REG|dout\(2),
	combout => \STORE_TAG_INC|ist_add:2:F1|cout~0_combout\);

-- Location: LCCOMB_X61_Y49_N4
\store_tag_reg_in~18\ : cycloneii_lcell_comb
-- Equation(s):
-- \store_tag_reg_in~18_combout\ = (\store_tag_reg_in~11_combout\ & (\store_tag_reg_in~10_combout\)) # (!\store_tag_reg_in~11_combout\ & (\STORE_TAG_REG|dout\(3) $ (((!\store_tag_reg_in~10_combout\ & \STORE_TAG_INC|ist_add:2:F1|cout~0_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010100110111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \store_tag_reg_in~10_combout\,
	datab => \store_tag_reg_in~11_combout\,
	datac => \STORE_TAG_REG|dout\(3),
	datad => \STORE_TAG_INC|ist_add:2:F1|cout~0_combout\,
	combout => \store_tag_reg_in~18_combout\);

-- Location: LCCOMB_X61_Y49_N26
\store_tag_reg_in~20\ : cycloneii_lcell_comb
-- Equation(s):
-- \store_tag_reg_in~20_combout\ = (\store_tag_reg_in~11_combout\ & ((\store_tag_reg_in~18_combout\ & ((\store_tag_reg_in~34_combout\))) # (!\store_tag_reg_in~18_combout\ & (!\STORE_TAG_DEC|ist_add:3:F1|s0~combout\)))) # (!\store_tag_reg_in~11_combout\ & 
-- (((\store_tag_reg_in~18_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010000110100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \STORE_TAG_DEC|ist_add:3:F1|s0~combout\,
	datab => \store_tag_reg_in~11_combout\,
	datac => \store_tag_reg_in~18_combout\,
	datad => \store_tag_reg_in~34_combout\,
	combout => \store_tag_reg_in~20_combout\);

-- Location: LCCOMB_X60_Y49_N16
\STORE_TAG_REG|dout[3]~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \STORE_TAG_REG|dout[3]~2_combout\ = (\store_tag_reg_in~4_combout\ & (\store_tag_reg_in~20_combout\)) # (!\store_tag_reg_in~4_combout\ & ((\store_tag_reg_in~34_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \store_tag_reg_in~20_combout\,
	datab => \store_tag_reg_in~4_combout\,
	datad => \store_tag_reg_in~34_combout\,
	combout => \STORE_TAG_REG|dout[3]~2_combout\);

-- Location: LCCOMB_X59_Y49_N12
\STORE_TAG_INC2|ist_add:4:F1|s0\ : cycloneii_lcell_comb
-- Equation(s):
-- \STORE_TAG_INC2|ist_add:4:F1|s0~combout\ = \STORE_TAG_REG|dout\(4) $ (((\STORE_TAG_REG|dout\(3) & (\STORE_TAG_REG|dout\(1) & \STORE_TAG_REG|dout\(2)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111111110000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \STORE_TAG_REG|dout\(3),
	datab => \STORE_TAG_REG|dout\(1),
	datac => \STORE_TAG_REG|dout\(2),
	datad => \STORE_TAG_REG|dout\(4),
	combout => \STORE_TAG_INC2|ist_add:4:F1|s0~combout\);

-- Location: LCCOMB_X60_Y49_N24
\store_tag_reg_in~31\ : cycloneii_lcell_comb
-- Equation(s):
-- \store_tag_reg_in~31_combout\ = (\STORE_TAG_REG|dout[1]~19_combout\ & (!\STORE_TAG_REG|dout[1]~17_combout\)) # (!\STORE_TAG_REG|dout[1]~19_combout\ & ((\STORE_TAG_REG|dout[1]~17_combout\ & ((\STORE_TAG_INC2|ist_add:4:F1|s0~combout\))) # 
-- (!\STORE_TAG_REG|dout[1]~17_combout\ & (\store_tag_reg_in~22_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111011000110010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \STORE_TAG_REG|dout[1]~19_combout\,
	datab => \STORE_TAG_REG|dout[1]~17_combout\,
	datac => \store_tag_reg_in~22_combout\,
	datad => \STORE_TAG_INC2|ist_add:4:F1|s0~combout\,
	combout => \store_tag_reg_in~31_combout\);

-- Location: LCCOMB_X59_Y49_N24
\store_tag_reg_in~10\ : cycloneii_lcell_comb
-- Equation(s):
-- \store_tag_reg_in~10_combout\ = (\store_retirement_count~combout\(0)) # (!\process_0~2_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111101010101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \process_0~2_combout\,
	datad => \store_retirement_count~combout\(0),
	combout => \store_tag_reg_in~10_combout\);

-- Location: LCCOMB_X60_Y49_N20
\STORE_TAG_INC|ist_add:4:F1|s0\ : cycloneii_lcell_comb
-- Equation(s):
-- \STORE_TAG_INC|ist_add:4:F1|s0~combout\ = \STORE_TAG_REG|dout\(4) $ (((\STORE_TAG_REG|dout\(3) & \STORE_TAG_INC|ist_add:2:F1|cout~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \STORE_TAG_REG|dout\(4),
	datac => \STORE_TAG_REG|dout\(3),
	datad => \STORE_TAG_INC|ist_add:2:F1|cout~0_combout\,
	combout => \STORE_TAG_INC|ist_add:4:F1|s0~combout\);

-- Location: LCCOMB_X59_Y49_N28
\STORE_TAG_DEC|ist_add:3:F1|cout\ : cycloneii_lcell_comb
-- Equation(s):
-- \STORE_TAG_DEC|ist_add:3:F1|cout~combout\ = (\STORE_TAG_REG|dout\(2)) # ((\STORE_TAG_REG|dout\(1)) # ((\STORE_TAG_REG|dout\(3)) # (\STORE_TAG_REG|dout\(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \STORE_TAG_REG|dout\(2),
	datab => \STORE_TAG_REG|dout\(1),
	datac => \STORE_TAG_REG|dout\(3),
	datad => \STORE_TAG_REG|dout\(0),
	combout => \STORE_TAG_DEC|ist_add:3:F1|cout~combout\);

-- Location: LCCOMB_X59_Y49_N14
\STORE_TAG_DEC|ist_add:4:F1|s0\ : cycloneii_lcell_comb
-- Equation(s):
-- \STORE_TAG_DEC|ist_add:4:F1|s0~combout\ = \STORE_TAG_REG|dout\(4) $ (\STORE_TAG_DEC|ist_add:3:F1|cout~combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001111001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \STORE_TAG_REG|dout\(4),
	datad => \STORE_TAG_DEC|ist_add:3:F1|cout~combout\,
	combout => \STORE_TAG_DEC|ist_add:4:F1|s0~combout\);

-- Location: LCCOMB_X60_Y49_N22
\store_tag_reg_in~21\ : cycloneii_lcell_comb
-- Equation(s):
-- \store_tag_reg_in~21_combout\ = (\store_tag_reg_in~11_combout\ & ((\store_tag_reg_in~10_combout\) # ((!\STORE_TAG_DEC|ist_add:4:F1|s0~combout\)))) # (!\store_tag_reg_in~11_combout\ & (!\store_tag_reg_in~10_combout\ & 
-- (\STORE_TAG_INC|ist_add:4:F1|s0~combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001100010111010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \store_tag_reg_in~11_combout\,
	datab => \store_tag_reg_in~10_combout\,
	datac => \STORE_TAG_INC|ist_add:4:F1|s0~combout\,
	datad => \STORE_TAG_DEC|ist_add:4:F1|s0~combout\,
	combout => \store_tag_reg_in~21_combout\);

-- Location: LCCOMB_X60_Y49_N26
\store_tag_reg_in~23\ : cycloneii_lcell_comb
-- Equation(s):
-- \store_tag_reg_in~23_combout\ = (\store_tag_reg_in~10_combout\ & ((\store_tag_reg_in~21_combout\ & ((\store_tag_reg_in~22_combout\))) # (!\store_tag_reg_in~21_combout\ & (\STORE_TAG_REG|dout\(4))))) # (!\store_tag_reg_in~10_combout\ & 
-- (((\store_tag_reg_in~21_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \store_tag_reg_in~10_combout\,
	datab => \STORE_TAG_REG|dout\(4),
	datac => \store_tag_reg_in~22_combout\,
	datad => \store_tag_reg_in~21_combout\,
	combout => \store_tag_reg_in~23_combout\);

-- Location: LCCOMB_X60_Y49_N14
\store_tag_reg_in~32\ : cycloneii_lcell_comb
-- Equation(s):
-- \store_tag_reg_in~32_combout\ = (\STORE_TAG_REG|dout[1]~19_combout\ & ((\store_tag_reg_in~31_combout\ & ((\store_tag_reg_in~23_combout\))) # (!\store_tag_reg_in~31_combout\ & (\STORE_TAG_INC|ist_add:4:F1|s0~combout\)))) # 
-- (!\STORE_TAG_REG|dout[1]~19_combout\ & (((\store_tag_reg_in~31_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111100000111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \STORE_TAG_INC|ist_add:4:F1|s0~combout\,
	datab => \STORE_TAG_REG|dout[1]~19_combout\,
	datac => \store_tag_reg_in~31_combout\,
	datad => \store_tag_reg_in~23_combout\,
	combout => \store_tag_reg_in~32_combout\);

-- Location: LCFF_X60_Y49_N19
\STORE_TAG_REG|dout[4]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \STORE_TAG_REG|dout[4]~3_combout\,
	sdata => \store_tag_reg_in~32_combout\,
	aclr => \reset~clkctrl_outclk\,
	sload => \store_tag_reg_in~24_combout\,
	ena => \STORE_TAG_REG|dout[1]~16_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \STORE_TAG_REG|dout\(4));

-- Location: LCCOMB_X60_Y49_N8
\store_tag_reg_in~22\ : cycloneii_lcell_comb
-- Equation(s):
-- \store_tag_reg_in~22_combout\ = \STORE_TAG_REG|dout\(4) $ (((\store_tag_reg_in~15_combout\ & (!\STORE_TAG_REG|dout\(3) & !\store_tag_reg_in~19_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011000110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \store_tag_reg_in~15_combout\,
	datab => \STORE_TAG_REG|dout\(4),
	datac => \STORE_TAG_REG|dout\(3),
	datad => \store_tag_reg_in~19_combout\,
	combout => \store_tag_reg_in~22_combout\);

-- Location: LCCOMB_X60_Y49_N18
\STORE_TAG_REG|dout[4]~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \STORE_TAG_REG|dout[4]~3_combout\ = (\store_tag_reg_in~4_combout\ & ((\store_tag_reg_in~23_combout\))) # (!\store_tag_reg_in~4_combout\ & (\store_tag_reg_in~22_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111001000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \store_tag_reg_in~4_combout\,
	datab => \store_tag_reg_in~22_combout\,
	datad => \store_tag_reg_in~23_combout\,
	combout => \STORE_TAG_REG|dout[4]~3_combout\);

-- Location: LCCOMB_X23_Y1_N20
\C_busybit_out~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \C_busybit_out~2_combout\ = (\Ard1a~6_combout\ & (\Equal0~6_combout\ & \ra1_val_out~combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Ard1a~6_combout\,
	datac => \Equal0~6_combout\,
	datad => \ra1_val_out~combout\,
	combout => \C_busybit_out~2_combout\);

-- Location: LCCOMB_X23_Y1_N4
\C_busybit_out~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \C_busybit_out~3_combout\ = (\C_busybit_in~combout\) # ((\C_busybit_out~2_combout\) # ((\Equal0~1_combout\ & \ra1_val_out~combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111011111010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \C_busybit_in~combout\,
	datab => \Equal0~1_combout\,
	datac => \C_busybit_out~2_combout\,
	datad => \ra1_val_out~combout\,
	combout => \C_busybit_out~3_combout\);

-- Location: LCCOMB_X16_Y1_N28
\Z_busybit_out~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Z_busybit_out~0_combout\ = (!\ra1_ir_out~combout\(15) & (\ra1_val_out~combout\ & ((!\ra1_ir_out~combout\(13)) # (!\x1_op2_ready~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001010100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ra1_ir_out~combout\(15),
	datab => \x1_op2_ready~1_combout\,
	datac => \ra1_ir_out~combout\(13),
	datad => \ra1_val_out~combout\,
	combout => \Z_busybit_out~0_combout\);

-- Location: LCCOMB_X16_Y1_N22
\Z_busybit_out~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \Z_busybit_out~1_combout\ = (\ra1_ir_out~combout\(2)) # ((\ra1_ir_out~combout\(0) & \ra1_ir_out~combout\(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ra1_ir_out~combout\(0),
	datab => \ra1_ir_out~combout\(2),
	datad => \ra1_ir_out~combout\(1),
	combout => \Z_busybit_out~1_combout\);

-- Location: LCCOMB_X16_Y1_N12
\Z_busybit_out~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \Z_busybit_out~2_combout\ = (\ra1_ir_out~combout\(12) & (\ra1_ir_out~combout\(14))) # (!\ra1_ir_out~combout\(12) & ((\ra1_ir_out~combout\(14) & (\ra1_ir_out~combout\(13))) # (!\ra1_ir_out~combout\(14) & (!\ra1_ir_out~combout\(13) & 
-- \Z_busybit_out~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100100111001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ra1_ir_out~combout\(12),
	datab => \ra1_ir_out~combout\(14),
	datac => \ra1_ir_out~combout\(13),
	datad => \Z_busybit_out~1_combout\,
	combout => \Z_busybit_out~2_combout\);

-- Location: LCCOMB_X16_Y1_N2
\Z_busybit_out~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \Z_busybit_out~3_combout\ = (\Z_busybit_in~combout\) # ((\Z_busybit_out~0_combout\ & !\Z_busybit_out~2_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Z_busybit_out~0_combout\,
	datac => \Z_busybit_in~combout\,
	datad => \Z_busybit_out~2_combout\,
	combout => \Z_busybit_out~3_combout\);

-- Location: LCCOMB_X20_Y50_N10
\C_2_busybit_out~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \C_2_busybit_out~0_combout\ = (\ra2_val_out~combout\ & ((\Equal14~3_combout\) # ((\Ard2a~6_combout\ & \Equal14~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110000011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Ard2a~6_combout\,
	datab => \Equal14~3_combout\,
	datac => \ra2_val_out~combout\,
	datad => \Equal14~1_combout\,
	combout => \C_2_busybit_out~0_combout\);

-- Location: LCCOMB_X25_Y3_N24
\C_2_busybit_out~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \C_2_busybit_out~1_combout\ = (\C_2_busybit_out~0_combout\) # (\C_busybit_in~combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \C_2_busybit_out~0_combout\,
	datad => \C_busybit_in~combout\,
	combout => \C_2_busybit_out~1_combout\);

-- Location: LCCOMB_X19_Y50_N16
\Z_2_busybit_out~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \Z_2_busybit_out~1_combout\ = (\ra2_ir_out~combout\(2)) # ((\ra2_ir_out~combout\(0) & \ra2_ir_out~combout\(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110110011101100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ra2_ir_out~combout\(0),
	datab => \ra2_ir_out~combout\(2),
	datac => \ra2_ir_out~combout\(1),
	combout => \Z_2_busybit_out~1_combout\);

-- Location: LCCOMB_X20_Y50_N14
\Z_2_busybit_out~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \Z_2_busybit_out~2_combout\ = (\ra2_ir_out~combout\(12) & (((\ra2_ir_out~combout\(14))))) # (!\ra2_ir_out~combout\(12) & ((\ra2_ir_out~combout\(13) & ((\ra2_ir_out~combout\(14)))) # (!\ra2_ir_out~combout\(13) & (\Z_2_busybit_out~1_combout\ & 
-- !\ra2_ir_out~combout\(14)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101000000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ra2_ir_out~combout\(12),
	datab => \Z_2_busybit_out~1_combout\,
	datac => \ra2_ir_out~combout\(13),
	datad => \ra2_ir_out~combout\(14),
	combout => \Z_2_busybit_out~2_combout\);

-- Location: LCCOMB_X20_Y50_N20
\Z_2_busybit_out~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Z_2_busybit_out~0_combout\ = (\ra2_val_out~combout\ & (!\ra2_ir_out~combout\(15) & ((!\ra2_ir_out~combout\(13)) # (!\x2_op2_ready~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \x2_op2_ready~1_combout\,
	datab => \ra2_val_out~combout\,
	datac => \ra2_ir_out~combout\(13),
	datad => \ra2_ir_out~combout\(15),
	combout => \Z_2_busybit_out~0_combout\);

-- Location: LCCOMB_X19_Y50_N30
\Z_2_busybit_out~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \Z_2_busybit_out~3_combout\ = (\Z_busybit_in~combout\) # ((!\Z_2_busybit_out~2_combout\ & \Z_2_busybit_out~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Z_2_busybit_out~2_combout\,
	datac => \Z_busybit_in~combout\,
	datad => \Z_2_busybit_out~0_combout\,
	combout => \Z_2_busybit_out~3_combout\);

-- Location: LCCOMB_X93_Y43_N6
\PE|pen1|penout~27\ : cycloneii_lcell_comb
-- Equation(s):
-- \PE|pen1|penout~27_combout\ = (\free_rrf_vec~combout\(5)) # ((!\free_rrf_vec~combout\(6) & ((\PE|pen1|penout~26_combout\) # (\free_rrf_vec~combout\(7)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100001110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \PE|pen1|penout~26_combout\,
	datab => \free_rrf_vec~combout\(7),
	datac => \free_rrf_vec~combout\(6),
	datad => \free_rrf_vec~combout\(5),
	combout => \PE|pen1|penout~27_combout\);

-- Location: LCCOMB_X93_Y44_N18
\PE|pen1|penout[0]~28\ : cycloneii_lcell_comb
-- Equation(s):
-- \PE|pen1|penout[0]~28_combout\ = (!\free_rrf_vec~combout\(2) & ((\free_rrf_vec~combout\(3)) # ((!\free_rrf_vec~combout\(4) & \PE|pen1|penout~27_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \free_rrf_vec~combout\(4),
	datab => \PE|pen1|penout~27_combout\,
	datac => \free_rrf_vec~combout\(2),
	datad => \free_rrf_vec~combout\(3),
	combout => \PE|pen1|penout[0]~28_combout\);

-- Location: LCCOMB_X93_Y44_N12
\PE|pen1|penout[0]~29\ : cycloneii_lcell_comb
-- Equation(s):
-- \PE|pen1|penout[0]~29_combout\ = (!\free_rrf_vec~combout\(0) & ((\PE|pen1|penout[0]~28_combout\) # (\free_rrf_vec~combout\(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \PE|pen1|penout[0]~28_combout\,
	datac => \free_rrf_vec~combout\(0),
	datad => \free_rrf_vec~combout\(1),
	combout => \PE|pen1|penout[0]~29_combout\);

-- Location: PIN_Y28,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\C_tag_in[0]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_C_tag_in(0),
	combout => \C_tag_in~combout\(0));

-- Location: LCCOMB_X94_Y32_N4
\C_tag_out_arf~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \C_tag_out_arf~0_combout\ = (\C_wr~0_combout\ & (\PE|pen1|penout[0]~29_combout\)) # (!\C_wr~0_combout\ & ((\C_tag_in~combout\(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \PE|pen1|penout[0]~29_combout\,
	datac => \C_wr~0_combout\,
	datad => \C_tag_in~combout\(0),
	combout => \C_tag_out_arf~0_combout\);

-- Location: PIN_W27,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\C_tag_in[1]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_C_tag_in(1),
	combout => \C_tag_in~combout\(1));

-- Location: LCCOMB_X94_Y45_N24
\PE|pen1|penout~31\ : cycloneii_lcell_comb
-- Equation(s):
-- \PE|pen1|penout~31_combout\ = (\PE|pen1|penout~30_combout\ & (!\free_rrf_vec~combout\(25) & !\free_rrf_vec~combout\(24)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000001000000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \PE|pen1|penout~30_combout\,
	datab => \free_rrf_vec~combout\(25),
	datac => \free_rrf_vec~combout\(24),
	combout => \PE|pen1|penout~31_combout\);

-- Location: LCCOMB_X94_Y45_N14
\PE|pen1|penout~32\ : cycloneii_lcell_comb
-- Equation(s):
-- \PE|pen1|penout~32_combout\ = (!\free_rrf_vec~combout\(21) & ((\free_rrf_vec~combout\(23)) # ((\PE|pen1|penout~31_combout\) # (\free_rrf_vec~combout\(22)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001100110010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \free_rrf_vec~combout\(23),
	datab => \free_rrf_vec~combout\(21),
	datac => \PE|pen1|penout~31_combout\,
	datad => \free_rrf_vec~combout\(22),
	combout => \PE|pen1|penout~32_combout\);

-- Location: LCCOMB_X93_Y41_N4
\PE|pen1|penout~33\ : cycloneii_lcell_comb
-- Equation(s):
-- \PE|pen1|penout~33_combout\ = (\free_rrf_vec~combout\(19)) # ((\free_rrf_vec~combout\(18)) # ((\PE|pen1|penout~32_combout\ & !\free_rrf_vec~combout\(20))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111011111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \free_rrf_vec~combout\(19),
	datab => \free_rrf_vec~combout\(18),
	datac => \PE|pen1|penout~32_combout\,
	datad => \free_rrf_vec~combout\(20),
	combout => \PE|pen1|penout~33_combout\);

-- Location: LCCOMB_X93_Y41_N14
\PE|pen1|penout~34\ : cycloneii_lcell_comb
-- Equation(s):
-- \PE|pen1|penout~34_combout\ = ((!\free_rrf_vec~combout\(17) & (\PE|pen1|penout~33_combout\ & !\free_rrf_vec~combout\(16)))) # (!\PE|pen1|penout~13_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001101110011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \free_rrf_vec~combout\(17),
	datab => \PE|pen1|penout~13_combout\,
	datac => \PE|pen1|penout~33_combout\,
	datad => \free_rrf_vec~combout\(16),
	combout => \PE|pen1|penout~34_combout\);

-- Location: LCCOMB_X93_Y43_N20
\PE|pen1|penout~35\ : cycloneii_lcell_comb
-- Equation(s):
-- \PE|pen1|penout~35_combout\ = (\PE|pen1|penout~10_combout\ & (((\PE|pen1|penout~12_combout\ & \PE|pen1|penout~34_combout\)) # (!\PE|pen1|penout~11_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \PE|pen1|penout~10_combout\,
	datab => \PE|pen1|penout~12_combout\,
	datac => \PE|pen1|penout~34_combout\,
	datad => \PE|pen1|penout~11_combout\,
	combout => \PE|pen1|penout~35_combout\);

-- Location: LCCOMB_X94_Y43_N0
\PE|pen1|penout[1]~45\ : cycloneii_lcell_comb
-- Equation(s):
-- \PE|pen1|penout[1]~45_combout\ = (!\free_rrf_vec~combout\(4) & (!\free_rrf_vec~combout\(5) & ((\PE|pen1|penout~35_combout\) # (!\PE|pen1|penout~9_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000110001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \PE|pen1|penout~9_combout\,
	datab => \free_rrf_vec~combout\(4),
	datac => \PE|pen1|penout~35_combout\,
	datad => \free_rrf_vec~combout\(5),
	combout => \PE|pen1|penout[1]~45_combout\);

-- Location: LCCOMB_X94_Y44_N18
\PE|pen1|penout[1]~36\ : cycloneii_lcell_comb
-- Equation(s):
-- \PE|pen1|penout[1]~36_combout\ = (!\free_rrf_vec~combout\(0) & (!\free_rrf_vec~combout\(1) & ((\PE|pen1|penout[1]~45_combout\) # (!\PE|pen1|penout[1]~18_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \PE|pen1|penout[1]~18_combout\,
	datab => \PE|pen1|penout[1]~45_combout\,
	datac => \free_rrf_vec~combout\(0),
	datad => \free_rrf_vec~combout\(1),
	combout => \PE|pen1|penout[1]~36_combout\);

-- Location: LCCOMB_X94_Y32_N6
\C_tag_out_arf~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \C_tag_out_arf~1_combout\ = (\C_wr~0_combout\ & ((\PE|pen1|penout[1]~36_combout\))) # (!\C_wr~0_combout\ & (\C_tag_in~combout\(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100101011001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \C_tag_in~combout\(1),
	datab => \PE|pen1|penout[1]~36_combout\,
	datac => \C_wr~0_combout\,
	combout => \C_tag_out_arf~1_combout\);

-- Location: PIN_V22,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\C_tag_in[2]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_C_tag_in(2),
	combout => \C_tag_in~combout\(2));

-- Location: LCCOMB_X94_Y43_N28
\PE|pen1|penout[2]~37\ : cycloneii_lcell_comb
-- Equation(s):
-- \PE|pen1|penout[2]~37_combout\ = (\free_rrf_vec~combout\(6)) # ((\free_rrf_vec~combout\(7)) # ((\free_rrf_vec~combout\(4)) # (\free_rrf_vec~combout\(5))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \free_rrf_vec~combout\(6),
	datab => \free_rrf_vec~combout\(7),
	datac => \free_rrf_vec~combout\(4),
	datad => \free_rrf_vec~combout\(5),
	combout => \PE|pen1|penout[2]~37_combout\);

-- Location: LCCOMB_X94_Y45_N16
\PE|pen1|penout~39\ : cycloneii_lcell_comb
-- Equation(s):
-- \PE|pen1|penout~39_combout\ = (!\free_rrf_vec~combout\(23) & (!\free_rrf_vec~combout\(20) & (!\free_rrf_vec~combout\(21) & !\free_rrf_vec~combout\(22))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \free_rrf_vec~combout\(23),
	datab => \free_rrf_vec~combout\(20),
	datac => \free_rrf_vec~combout\(21),
	datad => \free_rrf_vec~combout\(22),
	combout => \PE|pen1|penout~39_combout\);

-- Location: LCCOMB_X94_Y44_N28
\PE|pen1|penout~38\ : cycloneii_lcell_comb
-- Equation(s):
-- \PE|pen1|penout~38_combout\ = (!\free_rrf_vec~combout\(27) & (!\free_rrf_vec~combout\(25) & (!\free_rrf_vec~combout\(26) & !\free_rrf_vec~combout\(24))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \free_rrf_vec~combout\(27),
	datab => \free_rrf_vec~combout\(25),
	datac => \free_rrf_vec~combout\(26),
	datad => \free_rrf_vec~combout\(24),
	combout => \PE|pen1|penout~38_combout\);

-- Location: LCCOMB_X94_Y44_N26
\PE|pen1|penout~40\ : cycloneii_lcell_comb
-- Equation(s):
-- \PE|pen1|penout~40_combout\ = ((\PE|pen1|penout~17_combout\ & ((\PE|pen1|penout~38_combout\) # (!\PE|pen1|penout~39_combout\)))) # (!\PE|pen1|penout~15_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101100111011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \PE|pen1|penout~17_combout\,
	datab => \PE|pen1|penout~15_combout\,
	datac => \PE|pen1|penout~39_combout\,
	datad => \PE|pen1|penout~38_combout\,
	combout => \PE|pen1|penout~40_combout\);

-- Location: LCCOMB_X94_Y44_N16
\PE|pen1|penout[2]~41\ : cycloneii_lcell_comb
-- Equation(s):
-- \PE|pen1|penout[2]~41_combout\ = (\PE|pen1|pennext[5]~2_combout\ & ((\PE|pen1|penout[2]~37_combout\) # ((\PE|pen1|penout[2]~16_combout\ & \PE|pen1|penout~40_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100100011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \PE|pen1|penout[2]~16_combout\,
	datab => \PE|pen1|pennext[5]~2_combout\,
	datac => \PE|pen1|penout[2]~37_combout\,
	datad => \PE|pen1|penout~40_combout\,
	combout => \PE|pen1|penout[2]~41_combout\);

-- Location: LCCOMB_X94_Y32_N28
\C_tag_out_arf~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \C_tag_out_arf~2_combout\ = (\C_wr~0_combout\ & ((\PE|pen1|penout[2]~41_combout\))) # (!\C_wr~0_combout\ & (\C_tag_in~combout\(2)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \C_tag_in~combout\(2),
	datac => \C_wr~0_combout\,
	datad => \PE|pen1|penout[2]~41_combout\,
	combout => \C_tag_out_arf~2_combout\);

-- Location: LCCOMB_X94_Y42_N6
\PE|pen1|penout~10\ : cycloneii_lcell_comb
-- Equation(s):
-- \PE|pen1|penout~10_combout\ = (!\free_rrf_vec~combout\(8) & !\free_rrf_vec~combout\(9))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \free_rrf_vec~combout\(8),
	datad => \free_rrf_vec~combout\(9),
	combout => \PE|pen1|penout~10_combout\);

-- Location: LCCOMB_X94_Y44_N30
\PE|pen1|penout~42\ : cycloneii_lcell_comb
-- Equation(s):
-- \PE|pen1|penout~42_combout\ = (!\free_rrf_vec~combout\(10) & (!\free_rrf_vec~combout\(11) & (\PE|pen1|penout~15_combout\ & \PE|pen1|penout~10_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \free_rrf_vec~combout\(10),
	datab => \free_rrf_vec~combout\(11),
	datac => \PE|pen1|penout~15_combout\,
	datad => \PE|pen1|penout~10_combout\,
	combout => \PE|pen1|penout~42_combout\);

-- Location: LCCOMB_X94_Y44_N8
\PE|pen1|penout[3]~43\ : cycloneii_lcell_comb
-- Equation(s):
-- \PE|pen1|penout[3]~43_combout\ = (\PE|pen1|penout[3]~44_combout\ & (((\PE|pen1|penout~17_combout\ & \PE|pen1|penout~39_combout\)) # (!\PE|pen1|penout~42_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011001100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \PE|pen1|penout~17_combout\,
	datab => \PE|pen1|penout~42_combout\,
	datac => \PE|pen1|penout~39_combout\,
	datad => \PE|pen1|penout[3]~44_combout\,
	combout => \PE|pen1|penout[3]~43_combout\);

-- Location: PIN_AA30,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\C_tag_in[3]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_C_tag_in(3),
	combout => \C_tag_in~combout\(3));

-- Location: LCCOMB_X94_Y32_N30
\C_tag_out_arf~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \C_tag_out_arf~3_combout\ = (\C_wr~0_combout\ & (\PE|pen1|penout[3]~43_combout\)) # (!\C_wr~0_combout\ & ((\C_tag_in~combout\(3))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \PE|pen1|penout[3]~43_combout\,
	datac => \C_wr~0_combout\,
	datad => \C_tag_in~combout\(3),
	combout => \C_tag_out_arf~3_combout\);

-- Location: PIN_W26,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\C_tag_in[4]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_C_tag_in(4),
	combout => \C_tag_in~combout\(4));

-- Location: LCCOMB_X94_Y32_N0
\C_tag_out_arf~4\ : cycloneii_lcell_comb
-- Equation(s):
-- \C_tag_out_arf~4_combout\ = (\C_wr~0_combout\ & ((\PE|pen1|penout[4]~14_combout\))) # (!\C_wr~0_combout\ & (\C_tag_in~combout\(4)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100101011001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \C_tag_in~combout\(4),
	datab => \PE|pen1|penout[4]~14_combout\,
	datac => \C_wr~0_combout\,
	combout => \C_tag_out_arf~4_combout\);

-- Location: LCCOMB_X22_Y1_N16
\Z_tag_out_arf~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \Z_tag_out_arf~2_combout\ = (\Z_tag_out_arf~1_combout\) # ((\ra1_ir_out~combout\(15)) # (!\ra1_val_out~combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111110111011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Z_tag_out_arf~1_combout\,
	datab => \ra1_val_out~combout\,
	datad => \ra1_ir_out~combout\(15),
	combout => \Z_tag_out_arf~2_combout\);

-- Location: PIN_L30,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\Z_tag_in[0]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_Z_tag_in(0),
	combout => \Z_tag_in~combout\(0));

-- Location: LCCOMB_X94_Y32_N26
\Z_tag_out_arf~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \Z_tag_out_arf~3_combout\ = (\Z_tag_out_arf~2_combout\ & ((\Z_tag_in~combout\(0)))) # (!\Z_tag_out_arf~2_combout\ & (\PE|pen1|penout[0]~29_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101000001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \PE|pen1|penout[0]~29_combout\,
	datac => \Z_tag_out_arf~2_combout\,
	datad => \Z_tag_in~combout\(0),
	combout => \Z_tag_out_arf~3_combout\);

-- Location: PIN_L29,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\Z_tag_in[1]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_Z_tag_in(1),
	combout => \Z_tag_in~combout\(1));

-- Location: LCCOMB_X94_Y32_N16
\Z_tag_out_arf~4\ : cycloneii_lcell_comb
-- Equation(s):
-- \Z_tag_out_arf~4_combout\ = (\Z_tag_out_arf~2_combout\ & ((\Z_tag_in~combout\(1)))) # (!\Z_tag_out_arf~2_combout\ & (\PE|pen1|penout[1]~36_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \PE|pen1|penout[1]~36_combout\,
	datac => \Z_tag_out_arf~2_combout\,
	datad => \Z_tag_in~combout\(1),
	combout => \Z_tag_out_arf~4_combout\);

-- Location: PIN_M28,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\Z_tag_in[2]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_Z_tag_in(2),
	combout => \Z_tag_in~combout\(2));

-- Location: LCCOMB_X94_Y32_N14
\Z_tag_out_arf~5\ : cycloneii_lcell_comb
-- Equation(s):
-- \Z_tag_out_arf~5_combout\ = (\Z_tag_out_arf~2_combout\ & ((\Z_tag_in~combout\(2)))) # (!\Z_tag_out_arf~2_combout\ & (\PE|pen1|penout[2]~41_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \PE|pen1|penout[2]~41_combout\,
	datac => \Z_tag_out_arf~2_combout\,
	datad => \Z_tag_in~combout\(2),
	combout => \Z_tag_out_arf~5_combout\);

-- Location: PIN_E23,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\Z_tag_in[3]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_Z_tag_in(3),
	combout => \Z_tag_in~combout\(3));

-- Location: LCCOMB_X94_Y32_N12
\Z_tag_out_arf~6\ : cycloneii_lcell_comb
-- Equation(s):
-- \Z_tag_out_arf~6_combout\ = (\Z_tag_out_arf~2_combout\ & (\Z_tag_in~combout\(3))) # (!\Z_tag_out_arf~2_combout\ & ((\PE|pen1|penout[3]~43_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101100011011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Z_tag_out_arf~2_combout\,
	datab => \Z_tag_in~combout\(3),
	datac => \PE|pen1|penout[3]~43_combout\,
	combout => \Z_tag_out_arf~6_combout\);

-- Location: PIN_A28,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\Z_tag_in[4]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_Z_tag_in(4),
	combout => \Z_tag_in~combout\(4));

-- Location: LCCOMB_X94_Y32_N22
\Z_tag_out_arf~7\ : cycloneii_lcell_comb
-- Equation(s):
-- \Z_tag_out_arf~7_combout\ = (\Z_tag_out_arf~2_combout\ & (\Z_tag_in~combout\(4))) # (!\Z_tag_out_arf~2_combout\ & ((\PE|pen1|penout[4]~14_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Z_tag_in~combout\(4),
	datac => \Z_tag_out_arf~2_combout\,
	datad => \PE|pen1|penout[4]~14_combout\,
	combout => \Z_tag_out_arf~7_combout\);

-- Location: LCCOMB_X93_Y44_N24
\PE|pen2|penout~60\ : cycloneii_lcell_comb
-- Equation(s):
-- \PE|pen2|penout~60_combout\ = (\PE|pen2|penout~43_combout\ & ((\free_rrf_vec~combout\(0) $ (!\free_rrf_vec~combout\(1))) # (!\free_rrf_vec~combout\(2)))) # (!\PE|pen2|penout~43_combout\ & (((\free_rrf_vec~combout\(0) & \free_rrf_vec~combout\(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001000101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \PE|pen2|penout~43_combout\,
	datab => \free_rrf_vec~combout\(2),
	datac => \free_rrf_vec~combout\(0),
	datad => \free_rrf_vec~combout\(1),
	combout => \PE|pen2|penout~60_combout\);

-- Location: LCCOMB_X78_Y47_N16
\C_2_tag_out_arf~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \C_2_tag_out_arf~0_combout\ = (\C_2_wr~2_combout\ & (\PE|pen2|penout~60_combout\)) # (!\C_2_wr~2_combout\ & ((\C_tag_in~combout\(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \C_2_wr~2_combout\,
	datac => \PE|pen2|penout~60_combout\,
	datad => \C_tag_in~combout\(0),
	combout => \C_2_tag_out_arf~0_combout\);

-- Location: LCCOMB_X93_Y43_N24
\PE|pen2|penout~45\ : cycloneii_lcell_comb
-- Equation(s):
-- \PE|pen2|penout~45_combout\ = (\free_rrf_vec~combout\(4) & (\PE|pen1|pennext[5]~2_combout\ & !\free_rrf_vec~combout\(5))) # (!\free_rrf_vec~combout\(4) & ((\PE|pen1|pennext[5]~2_combout\) # (!\free_rrf_vec~combout\(5))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011000011110011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \free_rrf_vec~combout\(4),
	datac => \PE|pen1|pennext[5]~2_combout\,
	datad => \free_rrf_vec~combout\(5),
	combout => \PE|pen2|penout~45_combout\);

-- Location: LCCOMB_X93_Y42_N0
\PE|pen2|penout~49\ : cycloneii_lcell_comb
-- Equation(s):
-- \PE|pen2|penout~49_combout\ = (\PE|pen2|penout~17_combout\ & (((\PE|pen2|penout~48_combout\ & \PE|pen2|penout~19_combout\)) # (!\PE|pen2|penout~18_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \PE|pen2|penout~48_combout\,
	datab => \PE|pen2|penout~19_combout\,
	datac => \PE|pen2|penout~18_combout\,
	datad => \PE|pen2|penout~17_combout\,
	combout => \PE|pen2|penout~49_combout\);

-- Location: LCCOMB_X93_Y43_N2
\PE|pen2|penout~50\ : cycloneii_lcell_comb
-- Equation(s):
-- \PE|pen2|penout~50_combout\ = (\PE|pen2|penout~49_combout\) # ((\free_rrf_vec~combout\(6) & ((\free_rrf_vec~combout\(7)) # (!\PE|pen1|Equal0~0_combout\))) # (!\free_rrf_vec~combout\(6) & (!\PE|pen1|Equal0~0_combout\ & \free_rrf_vec~combout\(7))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111111001110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \free_rrf_vec~combout\(6),
	datab => \PE|pen2|penout~49_combout\,
	datac => \PE|pen1|Equal0~0_combout\,
	datad => \free_rrf_vec~combout\(7),
	combout => \PE|pen2|penout~50_combout\);

-- Location: LCCOMB_X93_Y47_N8
\PE|pen2|penout~51\ : cycloneii_lcell_comb
-- Equation(s):
-- \PE|pen2|penout~51_combout\ = (!\PE|pen1|pennext[1]~23_combout\ & ((\PE|pen2|penout~44_combout\) # ((\PE|pen2|penout~45_combout\ & \PE|pen2|penout~50_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111000001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \PE|pen2|penout~44_combout\,
	datab => \PE|pen2|penout~45_combout\,
	datac => \PE|pen1|pennext[1]~23_combout\,
	datad => \PE|pen2|penout~50_combout\,
	combout => \PE|pen2|penout~51_combout\);

-- Location: LCCOMB_X78_Y47_N2
\C_2_tag_out_arf~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \C_2_tag_out_arf~1_combout\ = (\C_2_wr~2_combout\ & ((\PE|pen2|penout~51_combout\))) # (!\C_2_wr~2_combout\ & (\C_tag_in~combout\(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \C_2_wr~2_combout\,
	datac => \C_tag_in~combout\(1),
	datad => \PE|pen2|penout~51_combout\,
	combout => \C_2_tag_out_arf~1_combout\);

-- Location: LCCOMB_X93_Y42_N26
\PE|pen2|penout~52\ : cycloneii_lcell_comb
-- Equation(s):
-- \PE|pen2|penout~52_combout\ = (!\PE|pen2|penout~19_combout\) # (!\PE|pen2|penout~20_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \PE|pen2|penout~20_combout\,
	datad => \PE|pen2|penout~19_combout\,
	combout => \PE|pen2|penout~52_combout\);

-- Location: LCCOMB_X94_Y41_N18
\PE|pen2|penout~58\ : cycloneii_lcell_comb
-- Equation(s):
-- \PE|pen2|penout~58_combout\ = (\PE|pen1|penout~11_combout\ & (\PE|pen1|penout~13_combout\ & (!\free_rrf_vec~combout\(12) & !\free_rrf_vec~combout\(13))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \PE|pen1|penout~11_combout\,
	datab => \PE|pen1|penout~13_combout\,
	datac => \free_rrf_vec~combout\(12),
	datad => \free_rrf_vec~combout\(13),
	combout => \PE|pen2|penout~58_combout\);

-- Location: LCCOMB_X93_Y41_N10
\PE|pen2|penout~21\ : cycloneii_lcell_comb
-- Equation(s):
-- \PE|pen2|penout~21_combout\ = (\free_rrf_vec~combout\(17) & (\PE|pen2|penout~58_combout\ & (\PE|pen1|pennext[10]~5_combout\ & !\free_rrf_vec~combout\(16)))) # (!\free_rrf_vec~combout\(17) & (((\PE|pen2|penout~58_combout\ & 
-- \PE|pen1|pennext[10]~5_combout\)) # (!\free_rrf_vec~combout\(16))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100000011010101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \free_rrf_vec~combout\(17),
	datab => \PE|pen2|penout~58_combout\,
	datac => \PE|pen1|pennext[10]~5_combout\,
	datad => \free_rrf_vec~combout\(16),
	combout => \PE|pen2|penout~21_combout\);

-- Location: LCCOMB_X93_Y42_N4
\PE|pen2|penout~53\ : cycloneii_lcell_comb
-- Equation(s):
-- \PE|pen2|penout~53_combout\ = (\PE|pen2|penout~22_combout\ & \PE|pen2|penout~21_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \PE|pen2|penout~22_combout\,
	datad => \PE|pen2|penout~21_combout\,
	combout => \PE|pen2|penout~53_combout\);

-- Location: LCCOMB_X93_Y42_N14
\PE|pen2|penout~55\ : cycloneii_lcell_comb
-- Equation(s):
-- \PE|pen2|penout~55_combout\ = (\PE|pen2|penout~52_combout\) # ((\PE|pen2|penout~53_combout\ & ((\PE|pen2|penout~26_combout\) # (!\PE|pen2|penout~54_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110011011100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \PE|pen2|penout~54_combout\,
	datab => \PE|pen2|penout~52_combout\,
	datac => \PE|pen2|penout~53_combout\,
	datad => \PE|pen2|penout~26_combout\,
	combout => \PE|pen2|penout~55_combout\);

-- Location: LCCOMB_X93_Y42_N12
\C_2_tag_out_arf~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \C_2_tag_out_arf~2_combout\ = (\PE|pen2|next_var~10_combout\ & (((\PE|pen2|penout~57_combout\ & \PE|pen2|penout~55_combout\)) # (!\PE|pen2|penout~15_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \PE|pen2|penout~57_combout\,
	datab => \PE|pen2|next_var~10_combout\,
	datac => \PE|pen2|penout~55_combout\,
	datad => \PE|pen2|penout~15_combout\,
	combout => \C_2_tag_out_arf~2_combout\);

-- Location: LCCOMB_X78_Y47_N8
\C_2_tag_out_arf~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \C_2_tag_out_arf~3_combout\ = (\C_2_wr~2_combout\ & (\C_2_tag_out_arf~2_combout\)) # (!\C_2_wr~2_combout\ & ((\C_tag_in~combout\(2))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \C_2_wr~2_combout\,
	datac => \C_2_tag_out_arf~2_combout\,
	datad => \C_tag_in~combout\(2),
	combout => \C_2_tag_out_arf~3_combout\);

-- Location: LCCOMB_X93_Y45_N22
\PE|pen2|penout~54\ : cycloneii_lcell_comb
-- Equation(s):
-- \PE|pen2|penout~54_combout\ = (\PE|pen2|penout~24_combout\ & (!\PE|pen1|pennext[21]~18_combout\ & !\PE|pen1|pennext[20]~17_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \PE|pen2|penout~24_combout\,
	datac => \PE|pen1|pennext[21]~18_combout\,
	datad => \PE|pen1|pennext[20]~17_combout\,
	combout => \PE|pen2|penout~54_combout\);

-- Location: LCCOMB_X93_Y42_N22
\PE|pen2|penout~56\ : cycloneii_lcell_comb
-- Equation(s):
-- \PE|pen2|penout~56_combout\ = (\PE|pen2|penout~16_combout\ & (((\PE|pen2|penout~53_combout\ & \PE|pen2|penout~54_combout\)) # (!\PE|pen2|next_var~30_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \PE|pen2|penout~16_combout\,
	datab => \PE|pen2|penout~53_combout\,
	datac => \PE|pen2|penout~54_combout\,
	datad => \PE|pen2|next_var~30_combout\,
	combout => \PE|pen2|penout~56_combout\);

-- Location: LCCOMB_X78_Y47_N6
\C_2_tag_out_arf~4\ : cycloneii_lcell_comb
-- Equation(s):
-- \C_2_tag_out_arf~4_combout\ = (\C_2_wr~2_combout\ & (\PE|pen2|penout~56_combout\)) # (!\C_2_wr~2_combout\ & ((\C_tag_in~combout\(3))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \C_2_wr~2_combout\,
	datab => \PE|pen2|penout~56_combout\,
	datad => \C_tag_in~combout\(3),
	combout => \C_2_tag_out_arf~4_combout\);

-- Location: LCCOMB_X78_Y47_N12
\C_2_tag_out_arf~5\ : cycloneii_lcell_comb
-- Equation(s):
-- \C_2_tag_out_arf~5_combout\ = (\C_2_wr~2_combout\ & ((\PE|pen2|next_var~26_combout\))) # (!\C_2_wr~2_combout\ & (\C_tag_in~combout\(4)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110010011100100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \C_2_wr~2_combout\,
	datab => \C_tag_in~combout\(4),
	datac => \PE|pen2|next_var~26_combout\,
	combout => \C_2_tag_out_arf~5_combout\);

-- Location: LCCOMB_X25_Y50_N4
\Z_2_tag_out_arf~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \Z_2_tag_out_arf~1_combout\ = (\ra2_ir_out~combout\(12) & (((\ra2_ir_out~combout\(13)) # (\ra2_ir_out~combout\(14))))) # (!\ra2_ir_out~combout\(12) & ((\ra2_ir_out~combout\(14) & ((\ra2_ir_out~combout\(13)))) # (!\ra2_ir_out~combout\(14) & 
-- (!\Ard2a~6_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110011000101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Ard2a~6_combout\,
	datab => \ra2_ir_out~combout\(13),
	datac => \ra2_ir_out~combout\(12),
	datad => \ra2_ir_out~combout\(14),
	combout => \Z_2_tag_out_arf~1_combout\);

-- Location: LCCOMB_X29_Y50_N10
\Z_2_tag_out_arf~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \Z_2_tag_out_arf~2_combout\ = (\Z_2_tag_out_arf~1_combout\) # ((\ra2_ir_out~combout\(15)) # (!\ra2_val_out~combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Z_2_tag_out_arf~1_combout\,
	datac => \ra2_val_out~combout\,
	datad => \ra2_ir_out~combout\(15),
	combout => \Z_2_tag_out_arf~2_combout\);

-- Location: LCCOMB_X78_Y47_N14
\Z_2_tag_out_arf~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \Z_2_tag_out_arf~3_combout\ = (\Z_2_tag_out_arf~2_combout\ & ((\Z_tag_in~combout\(0)))) # (!\Z_2_tag_out_arf~2_combout\ & (\PE|pen2|penout~60_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Z_2_tag_out_arf~2_combout\,
	datac => \PE|pen2|penout~60_combout\,
	datad => \Z_tag_in~combout\(0),
	combout => \Z_2_tag_out_arf~3_combout\);

-- Location: LCCOMB_X78_Y47_N4
\Z_2_tag_out_arf~4\ : cycloneii_lcell_comb
-- Equation(s):
-- \Z_2_tag_out_arf~4_combout\ = (\Z_2_tag_out_arf~2_combout\ & ((\Z_tag_in~combout\(1)))) # (!\Z_2_tag_out_arf~2_combout\ & (\PE|pen2|penout~51_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111000100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \PE|pen2|penout~51_combout\,
	datab => \Z_2_tag_out_arf~2_combout\,
	datad => \Z_tag_in~combout\(1),
	combout => \Z_2_tag_out_arf~4_combout\);

-- Location: LCCOMB_X78_Y47_N10
\Z_2_tag_out_arf~5\ : cycloneii_lcell_comb
-- Equation(s):
-- \Z_2_tag_out_arf~5_combout\ = (\Z_2_tag_out_arf~2_combout\ & (\Z_tag_in~combout\(2))) # (!\Z_2_tag_out_arf~2_combout\ & ((\C_2_tag_out_arf~2_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011100010111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Z_tag_in~combout\(2),
	datab => \Z_2_tag_out_arf~2_combout\,
	datac => \C_2_tag_out_arf~2_combout\,
	combout => \Z_2_tag_out_arf~5_combout\);

-- Location: LCCOMB_X78_Y47_N20
\Z_2_tag_out_arf~6\ : cycloneii_lcell_comb
-- Equation(s):
-- \Z_2_tag_out_arf~6_combout\ = (\Z_2_tag_out_arf~2_combout\ & (\Z_tag_in~combout\(3))) # (!\Z_2_tag_out_arf~2_combout\ & ((\PE|pen2|penout~56_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Z_2_tag_out_arf~2_combout\,
	datac => \Z_tag_in~combout\(3),
	datad => \PE|pen2|penout~56_combout\,
	combout => \Z_2_tag_out_arf~6_combout\);

-- Location: LCCOMB_X78_Y47_N22
\Z_2_tag_out_arf~7\ : cycloneii_lcell_comb
-- Equation(s):
-- \Z_2_tag_out_arf~7_combout\ = (\Z_2_tag_out_arf~2_combout\ & ((\Z_tag_in~combout\(4)))) # (!\Z_2_tag_out_arf~2_combout\ & (\PE|pen2|next_var~26_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Z_2_tag_out_arf~2_combout\,
	datac => \PE|pen2|next_var~26_combout\,
	datad => \Z_tag_in~combout\(4),
	combout => \Z_2_tag_out_arf~7_combout\);

-- Location: LCCOMB_X11_Y1_N8
\busy_dest1_out~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \busy_dest1_out~0_combout\ = (\ra1_ir_out~combout\(14) & (\ra1_ir_out~combout\(15) $ (((\ra1_ir_out~combout\(13)) # (\ra1_ir_out~combout\(12))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000001010101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ra1_ir_out~combout\(14),
	datab => \ra1_ir_out~combout\(13),
	datac => \ra1_ir_out~combout\(12),
	datad => \ra1_ir_out~combout\(15),
	combout => \busy_dest1_out~0_combout\);

-- Location: PIN_AG6,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\busy_dest1_in~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_busy_dest1_in,
	combout => \busy_dest1_in~combout\);

-- Location: LCCOMB_X11_Y1_N18
\busy_dest1_out~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \busy_dest1_out~1_combout\ = ((\busy_dest1_in~combout\) # (!\ra1_val_out~combout\)) # (!\busy_dest1_out~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \busy_dest1_out~0_combout\,
	datac => \ra1_val_out~combout\,
	datad => \busy_dest1_in~combout\,
	combout => \busy_dest1_out~1_combout\);

-- Location: PIN_F12,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\busy_dest2_in~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_busy_dest2_in,
	combout => \busy_dest2_in~combout\);

-- Location: LCCOMB_X25_Y50_N14
\busy_dest2_out~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \busy_dest2_out~0_combout\ = (\ra2_ir_out~combout\(14) & (\ra2_ir_out~combout\(15) $ (((\ra2_ir_out~combout\(12)) # (\ra2_ir_out~combout\(13))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000101000101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ra2_ir_out~combout\(14),
	datab => \ra2_ir_out~combout\(12),
	datac => \ra2_ir_out~combout\(15),
	datad => \ra2_ir_out~combout\(13),
	combout => \busy_dest2_out~0_combout\);

-- Location: LCCOMB_X25_Y50_N0
\busy_dest2_out~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \busy_dest2_out~1_combout\ = (\busy_dest2_in~combout\) # ((!\ra2_val_out~combout\) # (!\busy_dest2_out~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \busy_dest2_in~combout\,
	datac => \busy_dest2_out~0_combout\,
	datad => \ra2_val_out~combout\,
	combout => \busy_dest2_out~1_combout\);

-- Location: LCCOMB_X53_Y1_N2
\dest_AR_tag_out~10\ : cycloneii_lcell_comb
-- Equation(s):
-- \dest_AR_tag_out~10_combout\ = (\ra1_ir_out~combout\(15) $ (((!\ra1_ir_out~combout\(13) & !\ra1_ir_out~combout\(12))))) # (!\ra1_val_out~combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010111010111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ra1_val_out~combout\,
	datab => \ra1_ir_out~combout\(13),
	datac => \ra1_ir_out~combout\(15),
	datad => \ra1_ir_out~combout\(12),
	combout => \dest_AR_tag_out~10_combout\);

-- Location: PIN_P24,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\tag_dest1_in[0]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_tag_dest1_in(0),
	combout => \tag_dest1_in~combout\(0));

-- Location: LCCOMB_X94_Y32_N20
\dest_AR_tag_out~11\ : cycloneii_lcell_comb
-- Equation(s):
-- \dest_AR_tag_out~11_combout\ = (\dest_AR_tag_out~10_combout\ & (\PE|pen1|penout[0]~29_combout\)) # (!\dest_AR_tag_out~10_combout\ & ((\ra1_ir_out~combout\(14) & ((\tag_dest1_in~combout\(0)))) # (!\ra1_ir_out~combout\(14) & 
-- (\PE|pen1|penout[0]~29_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101010001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \PE|pen1|penout[0]~29_combout\,
	datab => \dest_AR_tag_out~10_combout\,
	datac => \ra1_ir_out~combout\(14),
	datad => \tag_dest1_in~combout\(0),
	combout => \dest_AR_tag_out~11_combout\);

-- Location: PIN_P28,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\tag_dest1_in[1]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_tag_dest1_in(1),
	combout => \tag_dest1_in~combout\(1));

-- Location: LCCOMB_X94_Y32_N18
\dest_AR_tag_out~12\ : cycloneii_lcell_comb
-- Equation(s):
-- \dest_AR_tag_out~12_combout\ = (\dest_AR_tag_out~10_combout\ & (((\PE|pen1|penout[1]~36_combout\)))) # (!\dest_AR_tag_out~10_combout\ & ((\ra1_ir_out~combout\(14) & (\tag_dest1_in~combout\(1))) # (!\ra1_ir_out~combout\(14) & 
-- ((\PE|pen1|penout[1]~36_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111100100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \tag_dest1_in~combout\(1),
	datab => \dest_AR_tag_out~10_combout\,
	datac => \ra1_ir_out~combout\(14),
	datad => \PE|pen1|penout[1]~36_combout\,
	combout => \dest_AR_tag_out~12_combout\);

-- Location: PIN_N24,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\tag_dest1_in[2]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_tag_dest1_in(2),
	combout => \tag_dest1_in~combout\(2));

-- Location: LCCOMB_X94_Y32_N8
\dest_AR_tag_out~13\ : cycloneii_lcell_comb
-- Equation(s):
-- \dest_AR_tag_out~13_combout\ = (\ra1_ir_out~combout\(14) & ((\dest_AR_tag_out~10_combout\ & ((\PE|pen1|penout[2]~41_combout\))) # (!\dest_AR_tag_out~10_combout\ & (\tag_dest1_in~combout\(2))))) # (!\ra1_ir_out~combout\(14) & 
-- (((\PE|pen1|penout[2]~41_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101100001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \tag_dest1_in~combout\(2),
	datab => \ra1_ir_out~combout\(14),
	datac => \dest_AR_tag_out~10_combout\,
	datad => \PE|pen1|penout[2]~41_combout\,
	combout => \dest_AR_tag_out~13_combout\);

-- Location: PIN_R23,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\tag_dest1_in[3]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_tag_dest1_in(3),
	combout => \tag_dest1_in~combout\(3));

-- Location: LCCOMB_X94_Y32_N10
\dest_AR_tag_out~14\ : cycloneii_lcell_comb
-- Equation(s):
-- \dest_AR_tag_out~14_combout\ = (\ra1_ir_out~combout\(14) & ((\dest_AR_tag_out~10_combout\ & (\PE|pen1|penout[3]~43_combout\)) # (!\dest_AR_tag_out~10_combout\ & ((\tag_dest1_in~combout\(3)))))) # (!\ra1_ir_out~combout\(14) & 
-- (\PE|pen1|penout[3]~43_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111011000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ra1_ir_out~combout\(14),
	datab => \PE|pen1|penout[3]~43_combout\,
	datac => \dest_AR_tag_out~10_combout\,
	datad => \tag_dest1_in~combout\(3),
	combout => \dest_AR_tag_out~14_combout\);

-- Location: PIN_P26,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\tag_dest1_in[4]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_tag_dest1_in(4),
	combout => \tag_dest1_in~combout\(4));

-- Location: LCCOMB_X94_Y32_N24
\dest_AR_tag_out~15\ : cycloneii_lcell_comb
-- Equation(s):
-- \dest_AR_tag_out~15_combout\ = (\ra1_ir_out~combout\(14) & ((\dest_AR_tag_out~10_combout\ & ((\PE|pen1|penout[4]~14_combout\))) # (!\dest_AR_tag_out~10_combout\ & (\tag_dest1_in~combout\(4))))) # (!\ra1_ir_out~combout\(14) & 
-- (((\PE|pen1|penout[4]~14_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101100001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \tag_dest1_in~combout\(4),
	datab => \ra1_ir_out~combout\(14),
	datac => \dest_AR_tag_out~10_combout\,
	datad => \PE|pen1|penout[4]~14_combout\,
	combout => \dest_AR_tag_out~15_combout\);

-- Location: PIN_A24,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\tag_dest2_in[0]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_tag_dest2_in(0),
	combout => \tag_dest2_in~combout\(0));

-- Location: LCCOMB_X29_Y50_N4
\dest_AR_tag_2_out~10\ : cycloneii_lcell_comb
-- Equation(s):
-- \dest_AR_tag_2_out~10_combout\ = (\ra2_ir_out~combout\(15) $ (((!\ra2_ir_out~combout\(12) & !\ra2_ir_out~combout\(13))))) # (!\ra2_val_out~combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111100011111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ra2_ir_out~combout\(12),
	datab => \ra2_ir_out~combout\(13),
	datac => \ra2_val_out~combout\,
	datad => \ra2_ir_out~combout\(15),
	combout => \dest_AR_tag_2_out~10_combout\);

-- Location: LCCOMB_X78_Y47_N0
\dest_AR_tag_2_out~11\ : cycloneii_lcell_comb
-- Equation(s):
-- \dest_AR_tag_2_out~11_combout\ = (\ra2_ir_out~combout\(14) & ((\dest_AR_tag_2_out~10_combout\ & ((\PE|pen2|penout~60_combout\))) # (!\dest_AR_tag_2_out~10_combout\ & (\tag_dest2_in~combout\(0))))) # (!\ra2_ir_out~combout\(14) & 
-- (((\PE|pen2|penout~60_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000010111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \tag_dest2_in~combout\(0),
	datab => \ra2_ir_out~combout\(14),
	datac => \PE|pen2|penout~60_combout\,
	datad => \dest_AR_tag_2_out~10_combout\,
	combout => \dest_AR_tag_2_out~11_combout\);

-- Location: PIN_D25,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\tag_dest2_in[1]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_tag_dest2_in(1),
	combout => \tag_dest2_in~combout\(1));

-- Location: LCCOMB_X78_Y47_N26
\dest_AR_tag_2_out~12\ : cycloneii_lcell_comb
-- Equation(s):
-- \dest_AR_tag_2_out~12_combout\ = (\dest_AR_tag_2_out~10_combout\ & (((\PE|pen2|penout~51_combout\)))) # (!\dest_AR_tag_2_out~10_combout\ & ((\ra2_ir_out~combout\(14) & (\tag_dest2_in~combout\(1))) # (!\ra2_ir_out~combout\(14) & 
-- ((\PE|pen2|penout~51_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101101000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dest_AR_tag_2_out~10_combout\,
	datab => \ra2_ir_out~combout\(14),
	datac => \tag_dest2_in~combout\(1),
	datad => \PE|pen2|penout~51_combout\,
	combout => \dest_AR_tag_2_out~12_combout\);

-- Location: PIN_D23,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\tag_dest2_in[2]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_tag_dest2_in(2),
	combout => \tag_dest2_in~combout\(2));

-- Location: LCCOMB_X78_Y47_N24
\dest_AR_tag_2_out~13\ : cycloneii_lcell_comb
-- Equation(s):
-- \dest_AR_tag_2_out~13_combout\ = (\ra2_ir_out~combout\(14) & ((\dest_AR_tag_2_out~10_combout\ & ((\C_2_tag_out_arf~2_combout\))) # (!\dest_AR_tag_2_out~10_combout\ & (\tag_dest2_in~combout\(2))))) # (!\ra2_ir_out~combout\(14) & 
-- (((\C_2_tag_out_arf~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000010111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \tag_dest2_in~combout\(2),
	datab => \ra2_ir_out~combout\(14),
	datac => \C_2_tag_out_arf~2_combout\,
	datad => \dest_AR_tag_2_out~10_combout\,
	combout => \dest_AR_tag_2_out~13_combout\);

-- Location: PIN_A25,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\tag_dest2_in[3]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_tag_dest2_in(3),
	combout => \tag_dest2_in~combout\(3));

-- Location: LCCOMB_X78_Y47_N18
\dest_AR_tag_2_out~14\ : cycloneii_lcell_comb
-- Equation(s):
-- \dest_AR_tag_2_out~14_combout\ = (\dest_AR_tag_2_out~10_combout\ & (((\PE|pen2|penout~56_combout\)))) # (!\dest_AR_tag_2_out~10_combout\ & ((\ra2_ir_out~combout\(14) & (\tag_dest2_in~combout\(3))) # (!\ra2_ir_out~combout\(14) & 
-- ((\PE|pen2|penout~56_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101101000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dest_AR_tag_2_out~10_combout\,
	datab => \ra2_ir_out~combout\(14),
	datac => \tag_dest2_in~combout\(3),
	datad => \PE|pen2|penout~56_combout\,
	combout => \dest_AR_tag_2_out~14_combout\);

-- Location: PIN_E22,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\tag_dest2_in[4]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_tag_dest2_in(4),
	combout => \tag_dest2_in~combout\(4));

-- Location: LCCOMB_X78_Y47_N28
\dest_AR_tag_2_out~15\ : cycloneii_lcell_comb
-- Equation(s):
-- \dest_AR_tag_2_out~15_combout\ = (\dest_AR_tag_2_out~10_combout\ & (((\PE|pen2|next_var~26_combout\)))) # (!\dest_AR_tag_2_out~10_combout\ & ((\ra2_ir_out~combout\(14) & ((\tag_dest2_in~combout\(4)))) # (!\ra2_ir_out~combout\(14) & 
-- (\PE|pen2|next_var~26_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010010110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dest_AR_tag_2_out~10_combout\,
	datab => \ra2_ir_out~combout\(14),
	datac => \PE|pen2|next_var~26_combout\,
	datad => \tag_dest2_in~combout\(4),
	combout => \dest_AR_tag_2_out~15_combout\);

-- Location: LCCOMB_X43_Y4_N30
\C_tag_out_rs~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \C_tag_out_rs~1_combout\ = (!\ra1_ir_out~combout\(0) & (\C_tag_out_rs~0_combout\ & (!\ra1_ir_out~combout\(2) & \C_tag_in~combout\(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000010000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ra1_ir_out~combout\(0),
	datab => \C_tag_out_rs~0_combout\,
	datac => \ra1_ir_out~combout\(2),
	datad => \C_tag_in~combout\(0),
	combout => \C_tag_out_rs~1_combout\);

-- Location: LCCOMB_X43_Y4_N20
\C_tag_out_rs~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \C_tag_out_rs~2_combout\ = (!\ra1_ir_out~combout\(2) & (\C_tag_out_rs~0_combout\ & (\C_tag_in~combout\(1) & !\ra1_ir_out~combout\(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ra1_ir_out~combout\(2),
	datab => \C_tag_out_rs~0_combout\,
	datac => \C_tag_in~combout\(1),
	datad => \ra1_ir_out~combout\(0),
	combout => \C_tag_out_rs~2_combout\);

-- Location: LCCOMB_X43_Y4_N18
\C_tag_out_rs~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \C_tag_out_rs~3_combout\ = (!\ra1_ir_out~combout\(0) & (\C_tag_out_rs~0_combout\ & (!\ra1_ir_out~combout\(2) & \C_tag_in~combout\(2))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000010000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ra1_ir_out~combout\(0),
	datab => \C_tag_out_rs~0_combout\,
	datac => \ra1_ir_out~combout\(2),
	datad => \C_tag_in~combout\(2),
	combout => \C_tag_out_rs~3_combout\);

-- Location: LCCOMB_X43_Y4_N24
\C_tag_out_rs~4\ : cycloneii_lcell_comb
-- Equation(s):
-- \C_tag_out_rs~4_combout\ = (!\ra1_ir_out~combout\(0) & (\C_tag_out_rs~0_combout\ & (!\ra1_ir_out~combout\(2) & \C_tag_in~combout\(3))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000010000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ra1_ir_out~combout\(0),
	datab => \C_tag_out_rs~0_combout\,
	datac => \ra1_ir_out~combout\(2),
	datad => \C_tag_in~combout\(3),
	combout => \C_tag_out_rs~4_combout\);

-- Location: LCCOMB_X43_Y4_N10
\C_tag_out_rs~5\ : cycloneii_lcell_comb
-- Equation(s):
-- \C_tag_out_rs~5_combout\ = (!\ra1_ir_out~combout\(0) & (\C_tag_out_rs~0_combout\ & (!\ra1_ir_out~combout\(2) & \C_tag_in~combout\(4))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000010000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ra1_ir_out~combout\(0),
	datab => \C_tag_out_rs~0_combout\,
	datac => \ra1_ir_out~combout\(2),
	datad => \C_tag_in~combout\(4),
	combout => \C_tag_out_rs~5_combout\);

-- Location: LCCOMB_X11_Y50_N12
\Z_tag_out_rs~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Z_tag_out_rs~0_combout\ = (\Z_ready~1_combout\ & \Z_tag_in~combout\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Z_ready~1_combout\,
	datad => \Z_tag_in~combout\(0),
	combout => \Z_tag_out_rs~0_combout\);

-- Location: LCCOMB_X11_Y50_N10
\Z_tag_out_rs~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \Z_tag_out_rs~1_combout\ = (\Z_ready~1_combout\ & \Z_tag_in~combout\(1))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Z_ready~1_combout\,
	datad => \Z_tag_in~combout\(1),
	combout => \Z_tag_out_rs~1_combout\);

-- Location: LCCOMB_X11_Y50_N8
\Z_tag_out_rs~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \Z_tag_out_rs~2_combout\ = (\Z_ready~1_combout\ & \Z_tag_in~combout\(2))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Z_ready~1_combout\,
	datad => \Z_tag_in~combout\(2),
	combout => \Z_tag_out_rs~2_combout\);

-- Location: LCCOMB_X11_Y50_N22
\Z_tag_out_rs~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \Z_tag_out_rs~3_combout\ = (\Z_ready~1_combout\ & \Z_tag_in~combout\(3))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Z_ready~1_combout\,
	datad => \Z_tag_in~combout\(3),
	combout => \Z_tag_out_rs~3_combout\);

-- Location: LCCOMB_X11_Y50_N24
\Z_tag_out_rs~4\ : cycloneii_lcell_comb
-- Equation(s):
-- \Z_tag_out_rs~4_combout\ = (\Z_tag_in~combout\(4) & \Z_ready~1_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Z_tag_in~combout\(4),
	datac => \Z_ready~1_combout\,
	combout => \Z_tag_out_rs~4_combout\);

-- Location: LCCOMB_X43_Y4_N16
\C_2_tag_out_rs~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \C_2_tag_out_rs~1_combout\ = (\C_2_tag_out_rs~0_combout\ & (\x2_adc~0_combout\ & (\ra2_ir_out~combout\(1) & \C_tag_in~combout\(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \C_2_tag_out_rs~0_combout\,
	datab => \x2_adc~0_combout\,
	datac => \ra2_ir_out~combout\(1),
	datad => \C_tag_in~combout\(0),
	combout => \C_2_tag_out_rs~1_combout\);

-- Location: LCCOMB_X43_Y4_N2
\C_2_tag_out_rs~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \C_2_tag_out_rs~2_combout\ = (\C_2_tag_out_rs~0_combout\ & (\ra2_ir_out~combout\(1) & (\C_tag_in~combout\(1) & \x2_adc~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \C_2_tag_out_rs~0_combout\,
	datab => \ra2_ir_out~combout\(1),
	datac => \C_tag_in~combout\(1),
	datad => \x2_adc~0_combout\,
	combout => \C_2_tag_out_rs~2_combout\);

-- Location: LCCOMB_X43_Y4_N8
\C_2_tag_out_rs~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \C_2_tag_out_rs~3_combout\ = (\C_2_tag_out_rs~0_combout\ & (\x2_adc~0_combout\ & (\ra2_ir_out~combout\(1) & \C_tag_in~combout\(2))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \C_2_tag_out_rs~0_combout\,
	datab => \x2_adc~0_combout\,
	datac => \ra2_ir_out~combout\(1),
	datad => \C_tag_in~combout\(2),
	combout => \C_2_tag_out_rs~3_combout\);

-- Location: LCCOMB_X43_Y4_N26
\C_2_tag_out_rs~4\ : cycloneii_lcell_comb
-- Equation(s):
-- \C_2_tag_out_rs~4_combout\ = (\C_2_tag_out_rs~0_combout\ & (\x2_adc~0_combout\ & (\ra2_ir_out~combout\(1) & \C_tag_in~combout\(3))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \C_2_tag_out_rs~0_combout\,
	datab => \x2_adc~0_combout\,
	datac => \ra2_ir_out~combout\(1),
	datad => \C_tag_in~combout\(3),
	combout => \C_2_tag_out_rs~4_combout\);

-- Location: LCCOMB_X43_Y4_N28
\C_2_tag_out_rs~5\ : cycloneii_lcell_comb
-- Equation(s):
-- \C_2_tag_out_rs~5_combout\ = (\C_2_tag_out_rs~0_combout\ & (\x2_adc~0_combout\ & (\ra2_ir_out~combout\(1) & \C_tag_in~combout\(4))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \C_2_tag_out_rs~0_combout\,
	datab => \x2_adc~0_combout\,
	datac => \ra2_ir_out~combout\(1),
	datad => \C_tag_in~combout\(4),
	combout => \C_2_tag_out_rs~5_combout\);

-- Location: LCCOMB_X11_Y50_N2
\Z_2_tag_out_rs~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Z_2_tag_out_rs~0_combout\ = (\Z_2_ready~0_combout\ & \Z_tag_in~combout\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Z_2_ready~0_combout\,
	datad => \Z_tag_in~combout\(0),
	combout => \Z_2_tag_out_rs~0_combout\);

-- Location: LCCOMB_X11_Y50_N0
\Z_2_tag_out_rs~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \Z_2_tag_out_rs~1_combout\ = (\Z_2_ready~0_combout\ & \Z_tag_in~combout\(1))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Z_2_ready~0_combout\,
	datad => \Z_tag_in~combout\(1),
	combout => \Z_2_tag_out_rs~1_combout\);

-- Location: LCCOMB_X11_Y50_N14
\Z_2_tag_out_rs~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \Z_2_tag_out_rs~2_combout\ = (\Z_2_ready~0_combout\ & \Z_tag_in~combout\(2))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Z_2_ready~0_combout\,
	datad => \Z_tag_in~combout\(2),
	combout => \Z_2_tag_out_rs~2_combout\);

-- Location: LCCOMB_X11_Y50_N28
\Z_2_tag_out_rs~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \Z_2_tag_out_rs~3_combout\ = (\Z_2_ready~0_combout\ & \Z_tag_in~combout\(3))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Z_2_ready~0_combout\,
	datad => \Z_tag_in~combout\(3),
	combout => \Z_2_tag_out_rs~3_combout\);

-- Location: LCCOMB_X11_Y50_N30
\Z_2_tag_out_rs~4\ : cycloneii_lcell_comb
-- Equation(s):
-- \Z_2_tag_out_rs~4_combout\ = (\Z_tag_in~combout\(4) & \Z_2_ready~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Z_tag_in~combout\(4),
	datac => \Z_2_ready~0_combout\,
	combout => \Z_2_tag_out_rs~4_combout\);

-- Location: PIN_C7,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\jlr_resolved~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_jlr_resolved,
	combout => \jlr_resolved~combout\);

-- Location: PIN_A8,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\lw_r7_resolved~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_lw_r7_resolved,
	combout => \lw_r7_resolved~combout\);

-- Location: LCCOMB_X21_Y50_N12
\process_0~8\ : cycloneii_lcell_comb
-- Equation(s):
-- \process_0~8_combout\ = (!\alu_r7_resolved~combout\ & (!\jlr_resolved~combout\ & !\lw_r7_resolved~combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \alu_r7_resolved~combout\,
	datac => \jlr_resolved~combout\,
	datad => \lw_r7_resolved~combout\,
	combout => \process_0~8_combout\);

-- Location: LCCOMB_X20_Y50_N22
\ra1_invalidate_out~4\ : cycloneii_lcell_comb
-- Equation(s):
-- \ra1_invalidate_out~4_combout\ = (\ra2_ir_out~combout\(8) & (\ra2_ir_out~combout\(6) & \Equal14~3_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \ra2_ir_out~combout\(8),
	datac => \ra2_ir_out~combout\(6),
	datad => \Equal14~3_combout\,
	combout => \ra1_invalidate_out~4_combout\);

-- Location: LCCOMB_X20_Y50_N18
\ra1_invalidate_out~6\ : cycloneii_lcell_comb
-- Equation(s):
-- \ra1_invalidate_out~6_combout\ = (\ra1_invalidate_out~5_combout\ & (((\ra2_ir_out~combout\(7)) # (\ra2_ir_out~combout\(15))))) # (!\ra1_invalidate_out~5_combout\ & (\ra1_invalidate_out~4_combout\ & (\ra2_ir_out~combout\(7))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101011100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ra1_invalidate_out~5_combout\,
	datab => \ra1_invalidate_out~4_combout\,
	datac => \ra2_ir_out~combout\(7),
	datad => \ra2_ir_out~combout\(15),
	combout => \ra1_invalidate_out~6_combout\);

-- Location: LCCOMB_X23_Y50_N2
\process_0~9\ : cycloneii_lcell_comb
-- Equation(s):
-- \process_0~9_combout\ = (\ra2_ir_out~combout\(11) & (\ra2_ir_out~combout\(9) & \ra2_ir_out~combout\(10)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \ra2_ir_out~combout\(11),
	datac => \ra2_ir_out~combout\(9),
	datad => \ra2_ir_out~combout\(10),
	combout => \process_0~9_combout\);

-- Location: LCCOMB_X20_Y50_N0
\ra1_invalidate_out~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \ra1_invalidate_out~3_combout\ = (\ra1_invalidate_out~2_combout\) # ((\Equal14~4_combout\ & \process_0~9_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ra1_invalidate_out~2_combout\,
	datac => \Equal14~4_combout\,
	datad => \process_0~9_combout\,
	combout => \ra1_invalidate_out~3_combout\);

-- Location: LCCOMB_X21_Y50_N18
\ra1_invalidate_out~7\ : cycloneii_lcell_comb
-- Equation(s):
-- \ra1_invalidate_out~7_combout\ = (\ra1_invalidate_out~0_combout\) # ((\ra2_val_out~combout\ & ((\ra1_invalidate_out~6_combout\) # (\ra1_invalidate_out~3_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ra1_invalidate_out~0_combout\,
	datab => \ra1_invalidate_out~6_combout\,
	datac => \ra1_invalidate_out~3_combout\,
	datad => \ra2_val_out~combout\,
	combout => \ra1_invalidate_out~7_combout\);

-- Location: LCCOMB_X21_Y1_N8
\ra1_invalidate_out~9\ : cycloneii_lcell_comb
-- Equation(s):
-- \ra1_invalidate_out~9_combout\ = (\ra1_invalidate_out~8_combout\ & ((\x1_op2~4_combout\) # ((\Equal0~2_combout\ & \process_0~4_combout\)))) # (!\ra1_invalidate_out~8_combout\ & (((\Equal0~2_combout\ & \process_0~4_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111100010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ra1_invalidate_out~8_combout\,
	datab => \x1_op2~4_combout\,
	datac => \Equal0~2_combout\,
	datad => \process_0~4_combout\,
	combout => \ra1_invalidate_out~9_combout\);

-- Location: LCCOMB_X21_Y50_N0
\ra1_invalidate_out~10\ : cycloneii_lcell_comb
-- Equation(s):
-- \ra1_invalidate_out~10_combout\ = (\ra1_val_out~combout\ & (((\ra1_invalidate_out~7_combout\) # (\ra1_invalidate_out~9_combout\)))) # (!\ra1_val_out~combout\ & (\process_0~8_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \process_0~8_combout\,
	datab => \ra1_invalidate_out~7_combout\,
	datac => \ra1_invalidate_out~9_combout\,
	datad => \ra1_val_out~combout\,
	combout => \ra1_invalidate_out~10_combout\);

-- Location: PIN_A21,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\lm_stall_in~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_lm_stall_in,
	combout => \lm_stall_in~combout\);

-- Location: PIN_E19,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\rs_full_in~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_rs_full_in,
	combout => \rs_full_in~combout\);

-- Location: LCCOMB_X67_Y49_N4
\pc_en_out~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \pc_en_out~2_combout\ = (!\lm_stall_in~combout\ & !\rs_full_in~combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \lm_stall_in~combout\,
	datad => \rs_full_in~combout\,
	combout => \pc_en_out~2_combout\);

-- Location: LCCOMB_X66_Y49_N4
\pc_en_out~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \pc_en_out~3_combout\ = (!\PE|twoRRnotFree~combout\ & (\pc_en_out~2_combout\ & ((\pc_en_out~1_combout\) # (\x1_val~3_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101000001000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \PE|twoRRnotFree~combout\,
	datab => \pc_en_out~1_combout\,
	datac => \pc_en_out~2_combout\,
	datad => \x1_val~3_combout\,
	combout => \pc_en_out~3_combout\);

-- Location: LCCOMB_X23_Y1_N6
\ADDER2|F0|s0~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \ADDER2|F0|s0~0_combout\ = \ra1_pc_out~combout\(0) $ (\ra1_ir_out~combout\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \ra1_pc_out~combout\(0),
	datad => \ra1_ir_out~combout\(0),
	combout => \ADDER2|F0|s0~0_combout\);

-- Location: LCCOMB_X23_Y1_N16
\ADDER2|ist_add:1:F1|s0~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \ADDER2|ist_add:1:F1|s0~0_combout\ = \ra1_pc_out~combout\(1) $ (\ra1_ir_out~combout\(1) $ (((\ra1_pc_out~combout\(0) & \ra1_ir_out~combout\(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011001011010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ra1_pc_out~combout\(1),
	datab => \ra1_pc_out~combout\(0),
	datac => \ra1_ir_out~combout\(1),
	datad => \ra1_ir_out~combout\(0),
	combout => \ADDER2|ist_add:1:F1|s0~0_combout\);

-- Location: LCCOMB_X23_Y1_N2
\ADDER2|ist_add:1:F1|cout~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \ADDER2|ist_add:1:F1|cout~0_combout\ = (\ra1_pc_out~combout\(1) & ((\ra1_ir_out~combout\(1)) # ((\ra1_pc_out~combout\(0) & \ra1_ir_out~combout\(0))))) # (!\ra1_pc_out~combout\(1) & (\ra1_pc_out~combout\(0) & (\ra1_ir_out~combout\(1) & 
-- \ra1_ir_out~combout\(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110100010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ra1_pc_out~combout\(1),
	datab => \ra1_pc_out~combout\(0),
	datac => \ra1_ir_out~combout\(1),
	datad => \ra1_ir_out~combout\(0),
	combout => \ADDER2|ist_add:1:F1|cout~0_combout\);

-- Location: LCCOMB_X61_Y1_N18
\ADDER2|ist_add:2:F1|s0~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \ADDER2|ist_add:2:F1|s0~0_combout\ = \ra1_ir_out~combout\(2) $ (\ra1_pc_out~combout\(2) $ (\ADDER2|ist_add:1:F1|cout~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010101011010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ra1_ir_out~combout\(2),
	datac => \ra1_pc_out~combout\(2),
	datad => \ADDER2|ist_add:1:F1|cout~0_combout\,
	combout => \ADDER2|ist_add:2:F1|s0~0_combout\);

-- Location: LCCOMB_X61_Y1_N4
\ADDER2|ist_add:2:F1|cout~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \ADDER2|ist_add:2:F1|cout~0_combout\ = (\ra1_ir_out~combout\(2) & ((\ra1_pc_out~combout\(2)) # (\ADDER2|ist_add:1:F1|cout~0_combout\))) # (!\ra1_ir_out~combout\(2) & (\ra1_pc_out~combout\(2) & \ADDER2|ist_add:1:F1|cout~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ra1_ir_out~combout\(2),
	datac => \ra1_pc_out~combout\(2),
	datad => \ADDER2|ist_add:1:F1|cout~0_combout\,
	combout => \ADDER2|ist_add:2:F1|cout~0_combout\);

-- Location: LCCOMB_X61_Y1_N26
\ADDER2|ist_add:3:F1|s0\ : cycloneii_lcell_comb
-- Equation(s):
-- \ADDER2|ist_add:3:F1|s0~combout\ = \ADDER2|ist_add:2:F1|cout~0_combout\ $ (\ra1_pc_out~combout\(3) $ (\ra1_ir_out~combout\(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \ADDER2|ist_add:2:F1|cout~0_combout\,
	datac => \ra1_pc_out~combout\(3),
	datad => \ra1_ir_out~combout\(3),
	combout => \ADDER2|ist_add:3:F1|s0~combout\);

-- Location: LCCOMB_X61_Y1_N24
\ADDER2|ist_add:3:F1|cout~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \ADDER2|ist_add:3:F1|cout~0_combout\ = (\ADDER2|ist_add:2:F1|cout~0_combout\ & ((\ra1_pc_out~combout\(3)) # (\ra1_ir_out~combout\(3)))) # (!\ADDER2|ist_add:2:F1|cout~0_combout\ & (\ra1_pc_out~combout\(3) & \ra1_ir_out~combout\(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \ADDER2|ist_add:2:F1|cout~0_combout\,
	datac => \ra1_pc_out~combout\(3),
	datad => \ra1_ir_out~combout\(3),
	combout => \ADDER2|ist_add:3:F1|cout~0_combout\);

-- Location: LCCOMB_X86_Y1_N16
\ADDER2|ist_add:4:F1|s0\ : cycloneii_lcell_comb
-- Equation(s):
-- \ADDER2|ist_add:4:F1|s0~combout\ = \ra1_ir_out~combout\(4) $ (\ra1_pc_out~combout\(4) $ (\ADDER2|ist_add:3:F1|cout~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \ra1_ir_out~combout\(4),
	datac => \ra1_pc_out~combout\(4),
	datad => \ADDER2|ist_add:3:F1|cout~0_combout\,
	combout => \ADDER2|ist_add:4:F1|s0~combout\);

-- Location: LCCOMB_X86_Y1_N26
\ADDER2|ist_add:4:F1|cout~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \ADDER2|ist_add:4:F1|cout~0_combout\ = (\ra1_ir_out~combout\(4) & ((\ra1_pc_out~combout\(4)) # (\ADDER2|ist_add:3:F1|cout~0_combout\))) # (!\ra1_ir_out~combout\(4) & (\ra1_pc_out~combout\(4) & \ADDER2|ist_add:3:F1|cout~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \ra1_ir_out~combout\(4),
	datac => \ra1_pc_out~combout\(4),
	datad => \ADDER2|ist_add:3:F1|cout~0_combout\,
	combout => \ADDER2|ist_add:4:F1|cout~0_combout\);

-- Location: LCCOMB_X86_Y1_N12
\ADDER2|ist_add:5:F1|s0\ : cycloneii_lcell_comb
-- Equation(s):
-- \ADDER2|ist_add:5:F1|s0~combout\ = \ADDER2|ist_add:4:F1|cout~0_combout\ $ (\ra1_ir_out~combout\(5) $ (\ra1_pc_out~combout\(5)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \ADDER2|ist_add:4:F1|cout~0_combout\,
	datac => \ra1_ir_out~combout\(5),
	datad => \ra1_pc_out~combout\(5),
	combout => \ADDER2|ist_add:5:F1|s0~combout\);

-- Location: LCCOMB_X86_Y1_N18
\ADDER2|ist_add:5:F1|cout~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \ADDER2|ist_add:5:F1|cout~0_combout\ = (\ADDER2|ist_add:4:F1|cout~0_combout\ & ((\ra1_ir_out~combout\(5)) # (\ra1_pc_out~combout\(5)))) # (!\ADDER2|ist_add:4:F1|cout~0_combout\ & (\ra1_ir_out~combout\(5) & \ra1_pc_out~combout\(5)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \ADDER2|ist_add:4:F1|cout~0_combout\,
	datac => \ra1_ir_out~combout\(5),
	datad => \ra1_pc_out~combout\(5),
	combout => \ADDER2|ist_add:5:F1|cout~0_combout\);

-- Location: LCCOMB_X86_Y1_N20
\ADDER2|ist_add:6:F1|s0\ : cycloneii_lcell_comb
-- Equation(s):
-- \ADDER2|ist_add:6:F1|s0~combout\ = \ADDER2|ist_add:5:F1|cout~0_combout\ $ (\ra1_ir_out~combout\(6) $ (\ra1_pc_out~combout\(6)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \ADDER2|ist_add:5:F1|cout~0_combout\,
	datac => \ra1_ir_out~combout\(6),
	datad => \ra1_pc_out~combout\(6),
	combout => \ADDER2|ist_add:6:F1|s0~combout\);

-- Location: LCCOMB_X86_Y1_N30
\ADDER2|ist_add:6:F1|cout~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \ADDER2|ist_add:6:F1|cout~0_combout\ = (\ADDER2|ist_add:5:F1|cout~0_combout\ & ((\ra1_ir_out~combout\(6)) # (\ra1_pc_out~combout\(6)))) # (!\ADDER2|ist_add:5:F1|cout~0_combout\ & (\ra1_ir_out~combout\(6) & \ra1_pc_out~combout\(6)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \ADDER2|ist_add:5:F1|cout~0_combout\,
	datac => \ra1_ir_out~combout\(6),
	datad => \ra1_pc_out~combout\(6),
	combout => \ADDER2|ist_add:6:F1|cout~0_combout\);

-- Location: LCCOMB_X86_Y1_N8
\ADDER2|ist_add:7:F1|s0\ : cycloneii_lcell_comb
-- Equation(s):
-- \ADDER2|ist_add:7:F1|s0~combout\ = \ra1_ir_out~combout\(7) $ (\ADDER2|ist_add:6:F1|cout~0_combout\ $ (\ra1_pc_out~combout\(7)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001100101100110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ra1_ir_out~combout\(7),
	datab => \ADDER2|ist_add:6:F1|cout~0_combout\,
	datad => \ra1_pc_out~combout\(7),
	combout => \ADDER2|ist_add:7:F1|s0~combout\);

-- Location: LCCOMB_X86_Y1_N10
\ADDER2|ist_add:7:F1|cout~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \ADDER2|ist_add:7:F1|cout~0_combout\ = (\ra1_ir_out~combout\(7) & ((\ADDER2|ist_add:6:F1|cout~0_combout\) # (\ra1_pc_out~combout\(7)))) # (!\ra1_ir_out~combout\(7) & (\ADDER2|ist_add:6:F1|cout~0_combout\ & \ra1_pc_out~combout\(7)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ra1_ir_out~combout\(7),
	datab => \ADDER2|ist_add:6:F1|cout~0_combout\,
	datad => \ra1_pc_out~combout\(7),
	combout => \ADDER2|ist_add:7:F1|cout~0_combout\);

-- Location: LCCOMB_X94_Y9_N16
\ADDER2|ist_add:8:F1|s0\ : cycloneii_lcell_comb
-- Equation(s):
-- \ADDER2|ist_add:8:F1|s0~combout\ = \ra1_ir_out~combout\(8) $ (\ADDER2|ist_add:7:F1|cout~0_combout\ $ (\ra1_pc_out~combout\(8)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \ra1_ir_out~combout\(8),
	datac => \ADDER2|ist_add:7:F1|cout~0_combout\,
	datad => \ra1_pc_out~combout\(8),
	combout => \ADDER2|ist_add:8:F1|s0~combout\);

-- Location: LCCOMB_X94_Y9_N10
\ADDER2|ist_add:9:F1|s0\ : cycloneii_lcell_comb
-- Equation(s):
-- \ADDER2|ist_add:9:F1|s0~combout\ = \ra1_pc_out~combout\(9) $ (((\ADDER2|ist_add:7:F1|cout~0_combout\ & (!\ra1_ir_out~combout\(8) & \ra1_pc_out~combout\(8))) # (!\ADDER2|ist_add:7:F1|cout~0_combout\ & (\ra1_ir_out~combout\(8) & !\ra1_pc_out~combout\(8)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100011010011100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ADDER2|ist_add:7:F1|cout~0_combout\,
	datab => \ra1_pc_out~combout\(9),
	datac => \ra1_ir_out~combout\(8),
	datad => \ra1_pc_out~combout\(8),
	combout => \ADDER2|ist_add:9:F1|s0~combout\);

-- Location: LCCOMB_X94_Y9_N12
\ADDER2|ist_add:9:F1|cout~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \ADDER2|ist_add:9:F1|cout~0_combout\ = (\ADDER2|ist_add:7:F1|cout~0_combout\ & ((\ra1_ir_out~combout\(8)) # ((\ra1_pc_out~combout\(9) & \ra1_pc_out~combout\(8))))) # (!\ADDER2|ist_add:7:F1|cout~0_combout\ & (\ra1_ir_out~combout\(8) & 
-- ((\ra1_pc_out~combout\(9)) # (\ra1_pc_out~combout\(8)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111100011100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ADDER2|ist_add:7:F1|cout~0_combout\,
	datab => \ra1_pc_out~combout\(9),
	datac => \ra1_ir_out~combout\(8),
	datad => \ra1_pc_out~combout\(8),
	combout => \ADDER2|ist_add:9:F1|cout~0_combout\);

-- Location: LCCOMB_X94_Y9_N6
\ADDER2|ist_add:10:F1|s0~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \ADDER2|ist_add:10:F1|s0~0_combout\ = \ra1_pc_out~combout\(10) $ (\ra1_ir_out~combout\(8) $ (\ADDER2|ist_add:9:F1|cout~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010101011010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ra1_pc_out~combout\(10),
	datac => \ra1_ir_out~combout\(8),
	datad => \ADDER2|ist_add:9:F1|cout~0_combout\,
	combout => \ADDER2|ist_add:10:F1|s0~0_combout\);

-- Location: LCCOMB_X94_Y9_N28
\ADDER2|ist_add:8:F1|cout~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \ADDER2|ist_add:8:F1|cout~0_combout\ = (\ra1_ir_out~combout\(8) & ((\ADDER2|ist_add:7:F1|cout~0_combout\) # (\ra1_pc_out~combout\(8)))) # (!\ra1_ir_out~combout\(8) & (\ADDER2|ist_add:7:F1|cout~0_combout\ & \ra1_pc_out~combout\(8)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \ra1_ir_out~combout\(8),
	datac => \ADDER2|ist_add:7:F1|cout~0_combout\,
	datad => \ra1_pc_out~combout\(8),
	combout => \ADDER2|ist_add:8:F1|cout~0_combout\);

-- Location: LCCOMB_X94_Y9_N30
\ADDER2|ist_add:10:F1|cout~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \ADDER2|ist_add:10:F1|cout~0_combout\ = (\ra1_pc_out~combout\(10) & ((\ra1_ir_out~combout\(8)) # ((\ADDER2|ist_add:8:F1|cout~0_combout\ & \ra1_pc_out~combout\(9))))) # (!\ra1_pc_out~combout\(10) & (\ra1_ir_out~combout\(8) & 
-- ((\ADDER2|ist_add:8:F1|cout~0_combout\) # (\ra1_pc_out~combout\(9)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111100011100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ra1_pc_out~combout\(10),
	datab => \ADDER2|ist_add:8:F1|cout~0_combout\,
	datac => \ra1_ir_out~combout\(8),
	datad => \ra1_pc_out~combout\(9),
	combout => \ADDER2|ist_add:10:F1|cout~0_combout\);

-- Location: LCCOMB_X94_Y9_N8
\ADDER2|ist_add:11:F1|s0~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \ADDER2|ist_add:11:F1|s0~0_combout\ = \ADDER2|ist_add:10:F1|cout~0_combout\ $ (\ra1_ir_out~combout\(8) $ (\ra1_pc_out~combout\(11)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \ADDER2|ist_add:10:F1|cout~0_combout\,
	datac => \ra1_ir_out~combout\(8),
	datad => \ra1_pc_out~combout\(11),
	combout => \ADDER2|ist_add:11:F1|s0~0_combout\);

-- Location: LCCOMB_X94_Y9_N2
\ADDER2|ist_add:11:F1|cout~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \ADDER2|ist_add:11:F1|cout~0_combout\ = (\ADDER2|ist_add:9:F1|cout~0_combout\ & ((\ra1_ir_out~combout\(8)) # ((\ra1_pc_out~combout\(10) & \ra1_pc_out~combout\(11))))) # (!\ADDER2|ist_add:9:F1|cout~0_combout\ & (\ra1_ir_out~combout\(8) & 
-- ((\ra1_pc_out~combout\(10)) # (\ra1_pc_out~combout\(11)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110110011001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ADDER2|ist_add:9:F1|cout~0_combout\,
	datab => \ra1_ir_out~combout\(8),
	datac => \ra1_pc_out~combout\(10),
	datad => \ra1_pc_out~combout\(11),
	combout => \ADDER2|ist_add:11:F1|cout~0_combout\);

-- Location: LCCOMB_X94_Y9_N24
\ADDER2|ist_add:12:F1|s0~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \ADDER2|ist_add:12:F1|s0~0_combout\ = \ADDER2|ist_add:11:F1|cout~0_combout\ $ (\ra1_ir_out~combout\(8) $ (\ra1_pc_out~combout\(12)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \ADDER2|ist_add:11:F1|cout~0_combout\,
	datac => \ra1_ir_out~combout\(8),
	datad => \ra1_pc_out~combout\(12),
	combout => \ADDER2|ist_add:12:F1|s0~0_combout\);

-- Location: LCCOMB_X94_Y9_N18
\ADDER2|ist_add:12:F1|cout~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \ADDER2|ist_add:12:F1|cout~0_combout\ = (\ra1_pc_out~combout\(12) & ((\ra1_ir_out~combout\(8)) # ((\ADDER2|ist_add:10:F1|cout~0_combout\ & \ra1_pc_out~combout\(11))))) # (!\ra1_pc_out~combout\(12) & (\ra1_ir_out~combout\(8) & 
-- ((\ADDER2|ist_add:10:F1|cout~0_combout\) # (\ra1_pc_out~combout\(11)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111100011100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ra1_pc_out~combout\(12),
	datab => \ADDER2|ist_add:10:F1|cout~0_combout\,
	datac => \ra1_ir_out~combout\(8),
	datad => \ra1_pc_out~combout\(11),
	combout => \ADDER2|ist_add:12:F1|cout~0_combout\);

-- Location: LCCOMB_X94_Y9_N4
\ADDER2|ist_add:13:F1|s0~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \ADDER2|ist_add:13:F1|s0~0_combout\ = \ra1_pc_out~combout\(13) $ (\ADDER2|ist_add:12:F1|cout~0_combout\ $ (\ra1_ir_out~combout\(8)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011010010110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ra1_pc_out~combout\(13),
	datab => \ADDER2|ist_add:12:F1|cout~0_combout\,
	datac => \ra1_ir_out~combout\(8),
	combout => \ADDER2|ist_add:13:F1|s0~0_combout\);

-- Location: LCCOMB_X94_Y9_N26
\ADDER2|ist_add:13:F1|cout~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \ADDER2|ist_add:13:F1|cout~0_combout\ = (\ra1_pc_out~combout\(12) & ((\ra1_ir_out~combout\(8)) # ((\ra1_pc_out~combout\(13) & \ADDER2|ist_add:11:F1|cout~0_combout\)))) # (!\ra1_pc_out~combout\(12) & (\ra1_ir_out~combout\(8) & ((\ra1_pc_out~combout\(13)) # 
-- (\ADDER2|ist_add:11:F1|cout~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110110011001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ra1_pc_out~combout\(12),
	datab => \ra1_ir_out~combout\(8),
	datac => \ra1_pc_out~combout\(13),
	datad => \ADDER2|ist_add:11:F1|cout~0_combout\,
	combout => \ADDER2|ist_add:13:F1|cout~0_combout\);

-- Location: LCCOMB_X94_Y9_N20
\ADDER2|ist_add:14:F1|s0~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \ADDER2|ist_add:14:F1|s0~0_combout\ = \ADDER2|ist_add:13:F1|cout~0_combout\ $ (\ra1_ir_out~combout\(8) $ (\ra1_pc_out~combout\(14)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \ADDER2|ist_add:13:F1|cout~0_combout\,
	datac => \ra1_ir_out~combout\(8),
	datad => \ra1_pc_out~combout\(14),
	combout => \ADDER2|ist_add:14:F1|s0~0_combout\);

-- Location: LCCOMB_X94_Y9_N14
\ADDER2|ist_add:14:F1|cout~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \ADDER2|ist_add:14:F1|cout~0_combout\ = (\ra1_pc_out~combout\(13) & ((\ra1_ir_out~combout\(8)) # ((\ADDER2|ist_add:12:F1|cout~0_combout\ & \ra1_pc_out~combout\(14))))) # (!\ra1_pc_out~combout\(13) & (\ra1_ir_out~combout\(8) & 
-- ((\ADDER2|ist_add:12:F1|cout~0_combout\) # (\ra1_pc_out~combout\(14)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111100011100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ra1_pc_out~combout\(13),
	datab => \ADDER2|ist_add:12:F1|cout~0_combout\,
	datac => \ra1_ir_out~combout\(8),
	datad => \ra1_pc_out~combout\(14),
	combout => \ADDER2|ist_add:14:F1|cout~0_combout\);

-- Location: LCCOMB_X94_Y9_N0
\ADDER2|ist_add:15:F1|s0~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \ADDER2|ist_add:15:F1|s0~0_combout\ = \ra1_ir_out~combout\(8) $ (\ADDER2|ist_add:14:F1|cout~0_combout\ $ (\ra1_pc_out~combout\(15)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \ra1_ir_out~combout\(8),
	datac => \ADDER2|ist_add:14:F1|cout~0_combout\,
	datad => \ra1_pc_out~combout\(15),
	combout => \ADDER2|ist_add:15:F1|s0~0_combout\);

-- Location: LCCOMB_X1_Y13_N20
\ADDER3|F0|s0~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \ADDER3|F0|s0~0_combout\ = \ra2_pc_out~combout\(0) $ (\ra2_ir_out~combout\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ra2_pc_out~combout\(0),
	datac => \ra2_ir_out~combout\(0),
	combout => \ADDER3|F0|s0~0_combout\);

-- Location: LCCOMB_X1_Y13_N18
\ADDER3|ist_add:1:F1|s0~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \ADDER3|ist_add:1:F1|s0~0_combout\ = \ra2_ir_out~combout\(1) $ (\ra2_pc_out~combout\(1) $ (((\ra2_pc_out~combout\(0) & \ra2_ir_out~combout\(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001001101101100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ra2_pc_out~combout\(0),
	datab => \ra2_ir_out~combout\(1),
	datac => \ra2_ir_out~combout\(0),
	datad => \ra2_pc_out~combout\(1),
	combout => \ADDER3|ist_add:1:F1|s0~0_combout\);

-- Location: LCCOMB_X1_Y13_N12
\ADDER3|ist_add:1:F1|cout~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \ADDER3|ist_add:1:F1|cout~0_combout\ = (\ra2_ir_out~combout\(1) & ((\ra2_pc_out~combout\(1)) # ((\ra2_pc_out~combout\(0) & \ra2_ir_out~combout\(0))))) # (!\ra2_ir_out~combout\(1) & (\ra2_pc_out~combout\(0) & (\ra2_ir_out~combout\(0) & 
-- \ra2_pc_out~combout\(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110110010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ra2_pc_out~combout\(0),
	datab => \ra2_ir_out~combout\(1),
	datac => \ra2_ir_out~combout\(0),
	datad => \ra2_pc_out~combout\(1),
	combout => \ADDER3|ist_add:1:F1|cout~0_combout\);

-- Location: LCCOMB_X1_Y13_N2
\ADDER3|ist_add:2:F1|s0~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \ADDER3|ist_add:2:F1|s0~0_combout\ = \ra2_ir_out~combout\(2) $ (\ra2_pc_out~combout\(2) $ (\ADDER3|ist_add:1:F1|cout~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \ra2_ir_out~combout\(2),
	datac => \ra2_pc_out~combout\(2),
	datad => \ADDER3|ist_add:1:F1|cout~0_combout\,
	combout => \ADDER3|ist_add:2:F1|s0~0_combout\);

-- Location: LCCOMB_X1_Y13_N0
\ADDER3|ist_add:2:F1|cout~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \ADDER3|ist_add:2:F1|cout~0_combout\ = (\ra2_ir_out~combout\(2) & ((\ra2_pc_out~combout\(2)) # (\ADDER3|ist_add:1:F1|cout~0_combout\))) # (!\ra2_ir_out~combout\(2) & (\ra2_pc_out~combout\(2) & \ADDER3|ist_add:1:F1|cout~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \ra2_ir_out~combout\(2),
	datac => \ra2_pc_out~combout\(2),
	datad => \ADDER3|ist_add:1:F1|cout~0_combout\,
	combout => \ADDER3|ist_add:2:F1|cout~0_combout\);

-- Location: LCCOMB_X1_Y13_N6
\ADDER3|ist_add:3:F1|s0\ : cycloneii_lcell_comb
-- Equation(s):
-- \ADDER3|ist_add:3:F1|s0~combout\ = \ra2_ir_out~combout\(3) $ (\ra2_pc_out~combout\(3) $ (\ADDER3|ist_add:2:F1|cout~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \ra2_ir_out~combout\(3),
	datac => \ra2_pc_out~combout\(3),
	datad => \ADDER3|ist_add:2:F1|cout~0_combout\,
	combout => \ADDER3|ist_add:3:F1|s0~combout\);

-- Location: LCCOMB_X1_Y13_N4
\ADDER3|ist_add:3:F1|cout~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \ADDER3|ist_add:3:F1|cout~0_combout\ = (\ra2_ir_out~combout\(3) & ((\ra2_pc_out~combout\(3)) # (\ADDER3|ist_add:2:F1|cout~0_combout\))) # (!\ra2_ir_out~combout\(3) & (\ra2_pc_out~combout\(3) & \ADDER3|ist_add:2:F1|cout~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \ra2_ir_out~combout\(3),
	datac => \ra2_pc_out~combout\(3),
	datad => \ADDER3|ist_add:2:F1|cout~0_combout\,
	combout => \ADDER3|ist_add:3:F1|cout~0_combout\);

-- Location: LCCOMB_X1_Y23_N6
\ADDER3|ist_add:4:F1|s0\ : cycloneii_lcell_comb
-- Equation(s):
-- \ADDER3|ist_add:4:F1|s0~combout\ = \ra2_ir_out~combout\(4) $ (\ra2_pc_out~combout\(4) $ (\ADDER3|ist_add:3:F1|cout~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \ra2_ir_out~combout\(4),
	datac => \ra2_pc_out~combout\(4),
	datad => \ADDER3|ist_add:3:F1|cout~0_combout\,
	combout => \ADDER3|ist_add:4:F1|s0~combout\);

-- Location: LCCOMB_X1_Y23_N20
\ADDER3|ist_add:4:F1|cout~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \ADDER3|ist_add:4:F1|cout~0_combout\ = (\ra2_ir_out~combout\(4) & ((\ra2_pc_out~combout\(4)) # (\ADDER3|ist_add:3:F1|cout~0_combout\))) # (!\ra2_ir_out~combout\(4) & (\ra2_pc_out~combout\(4) & \ADDER3|ist_add:3:F1|cout~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \ra2_ir_out~combout\(4),
	datac => \ra2_pc_out~combout\(4),
	datad => \ADDER3|ist_add:3:F1|cout~0_combout\,
	combout => \ADDER3|ist_add:4:F1|cout~0_combout\);

-- Location: LCCOMB_X1_Y23_N14
\ADDER3|ist_add:5:F1|s0\ : cycloneii_lcell_comb
-- Equation(s):
-- \ADDER3|ist_add:5:F1|s0~combout\ = \ra2_ir_out~combout\(5) $ (\ADDER3|ist_add:4:F1|cout~0_combout\ $ (\ra2_pc_out~combout\(5)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010101011010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ra2_ir_out~combout\(5),
	datac => \ADDER3|ist_add:4:F1|cout~0_combout\,
	datad => \ra2_pc_out~combout\(5),
	combout => \ADDER3|ist_add:5:F1|s0~combout\);

-- Location: LCCOMB_X1_Y23_N12
\ADDER3|ist_add:5:F1|cout~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \ADDER3|ist_add:5:F1|cout~0_combout\ = (\ra2_ir_out~combout\(5) & ((\ADDER3|ist_add:4:F1|cout~0_combout\) # (\ra2_pc_out~combout\(5)))) # (!\ra2_ir_out~combout\(5) & (\ADDER3|ist_add:4:F1|cout~0_combout\ & \ra2_pc_out~combout\(5)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ra2_ir_out~combout\(5),
	datac => \ADDER3|ist_add:4:F1|cout~0_combout\,
	datad => \ra2_pc_out~combout\(5),
	combout => \ADDER3|ist_add:5:F1|cout~0_combout\);

-- Location: LCCOMB_X1_Y23_N18
\ADDER3|ist_add:6:F1|s0\ : cycloneii_lcell_comb
-- Equation(s):
-- \ADDER3|ist_add:6:F1|s0~combout\ = \ra2_pc_out~combout\(6) $ (\ra2_ir_out~combout\(6) $ (\ADDER3|ist_add:5:F1|cout~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \ra2_pc_out~combout\(6),
	datac => \ra2_ir_out~combout\(6),
	datad => \ADDER3|ist_add:5:F1|cout~0_combout\,
	combout => \ADDER3|ist_add:6:F1|s0~combout\);

-- Location: LCCOMB_X1_Y23_N4
\ADDER3|ist_add:6:F1|cout~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \ADDER3|ist_add:6:F1|cout~0_combout\ = (\ra2_pc_out~combout\(6) & ((\ra2_ir_out~combout\(6)) # (\ADDER3|ist_add:5:F1|cout~0_combout\))) # (!\ra2_pc_out~combout\(6) & (\ra2_ir_out~combout\(6) & \ADDER3|ist_add:5:F1|cout~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \ra2_pc_out~combout\(6),
	datac => \ra2_ir_out~combout\(6),
	datad => \ADDER3|ist_add:5:F1|cout~0_combout\,
	combout => \ADDER3|ist_add:6:F1|cout~0_combout\);

-- Location: LCCOMB_X1_Y41_N20
\ADDER3|ist_add:7:F1|s0\ : cycloneii_lcell_comb
-- Equation(s):
-- \ADDER3|ist_add:7:F1|s0~combout\ = \ra2_pc_out~combout\(7) $ (\ra2_ir_out~combout\(7) $ (\ADDER3|ist_add:6:F1|cout~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \ra2_pc_out~combout\(7),
	datac => \ra2_ir_out~combout\(7),
	datad => \ADDER3|ist_add:6:F1|cout~0_combout\,
	combout => \ADDER3|ist_add:7:F1|s0~combout\);

-- Location: LCCOMB_X1_Y41_N2
\ADDER3|ist_add:7:F1|cout~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \ADDER3|ist_add:7:F1|cout~0_combout\ = (\ra2_pc_out~combout\(7) & ((\ra2_ir_out~combout\(7)) # (\ADDER3|ist_add:6:F1|cout~0_combout\))) # (!\ra2_pc_out~combout\(7) & (\ra2_ir_out~combout\(7) & \ADDER3|ist_add:6:F1|cout~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \ra2_pc_out~combout\(7),
	datac => \ra2_ir_out~combout\(7),
	datad => \ADDER3|ist_add:6:F1|cout~0_combout\,
	combout => \ADDER3|ist_add:7:F1|cout~0_combout\);

-- Location: LCCOMB_X1_Y43_N24
\ADDER3|ist_add:8:F1|s0\ : cycloneii_lcell_comb
-- Equation(s):
-- \ADDER3|ist_add:8:F1|s0~combout\ = \ra2_pc_out~combout\(8) $ (\ra2_ir_out~combout\(8) $ (\ADDER3|ist_add:7:F1|cout~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \ra2_pc_out~combout\(8),
	datac => \ra2_ir_out~combout\(8),
	datad => \ADDER3|ist_add:7:F1|cout~0_combout\,
	combout => \ADDER3|ist_add:8:F1|s0~combout\);

-- Location: LCCOMB_X1_Y43_N10
\ADDER3|ist_add:9:F1|s0\ : cycloneii_lcell_comb
-- Equation(s):
-- \ADDER3|ist_add:9:F1|s0~combout\ = \ra2_pc_out~combout\(9) $ (((\ra2_pc_out~combout\(8) & (!\ra2_ir_out~combout\(8) & \ADDER3|ist_add:7:F1|cout~0_combout\)) # (!\ra2_pc_out~combout\(8) & (\ra2_ir_out~combout\(8) & !\ADDER3|ist_add:7:F1|cout~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010011010011010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ra2_pc_out~combout\(9),
	datab => \ra2_pc_out~combout\(8),
	datac => \ra2_ir_out~combout\(8),
	datad => \ADDER3|ist_add:7:F1|cout~0_combout\,
	combout => \ADDER3|ist_add:9:F1|s0~combout\);

-- Location: LCCOMB_X1_Y43_N4
\ADDER3|ist_add:9:F1|cout~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \ADDER3|ist_add:9:F1|cout~0_combout\ = (\ra2_pc_out~combout\(9) & ((\ra2_ir_out~combout\(8)) # ((\ra2_pc_out~combout\(8) & \ADDER3|ist_add:7:F1|cout~0_combout\)))) # (!\ra2_pc_out~combout\(9) & (\ra2_ir_out~combout\(8) & ((\ra2_pc_out~combout\(8)) # 
-- (\ADDER3|ist_add:7:F1|cout~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111100011100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ra2_pc_out~combout\(9),
	datab => \ra2_pc_out~combout\(8),
	datac => \ra2_ir_out~combout\(8),
	datad => \ADDER3|ist_add:7:F1|cout~0_combout\,
	combout => \ADDER3|ist_add:9:F1|cout~0_combout\);

-- Location: LCCOMB_X1_Y43_N2
\ADDER3|ist_add:10:F1|s0~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \ADDER3|ist_add:10:F1|s0~0_combout\ = \ra2_ir_out~combout\(8) $ (\ADDER3|ist_add:9:F1|cout~0_combout\ $ (\ra2_pc_out~combout\(10)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011010010110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ra2_ir_out~combout\(8),
	datab => \ADDER3|ist_add:9:F1|cout~0_combout\,
	datac => \ra2_pc_out~combout\(10),
	combout => \ADDER3|ist_add:10:F1|s0~0_combout\);

-- Location: LCCOMB_X1_Y43_N8
\ADDER3|ist_add:8:F1|cout~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \ADDER3|ist_add:8:F1|cout~0_combout\ = (\ra2_pc_out~combout\(8) & ((\ra2_ir_out~combout\(8)) # (\ADDER3|ist_add:7:F1|cout~0_combout\))) # (!\ra2_pc_out~combout\(8) & (\ra2_ir_out~combout\(8) & \ADDER3|ist_add:7:F1|cout~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \ra2_pc_out~combout\(8),
	datac => \ra2_ir_out~combout\(8),
	datad => \ADDER3|ist_add:7:F1|cout~0_combout\,
	combout => \ADDER3|ist_add:8:F1|cout~0_combout\);

-- Location: LCCOMB_X1_Y43_N18
\ADDER3|ist_add:10:F1|cout~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \ADDER3|ist_add:10:F1|cout~0_combout\ = (\ra2_ir_out~combout\(8) & ((\ADDER3|ist_add:8:F1|cout~0_combout\) # ((\ra2_pc_out~combout\(10)) # (\ra2_pc_out~combout\(9))))) # (!\ra2_ir_out~combout\(8) & (\ADDER3|ist_add:8:F1|cout~0_combout\ & 
-- (\ra2_pc_out~combout\(10) & \ra2_pc_out~combout\(9))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101010101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ra2_ir_out~combout\(8),
	datab => \ADDER3|ist_add:8:F1|cout~0_combout\,
	datac => \ra2_pc_out~combout\(10),
	datad => \ra2_pc_out~combout\(9),
	combout => \ADDER3|ist_add:10:F1|cout~0_combout\);

-- Location: LCCOMB_X1_Y43_N28
\ADDER3|ist_add:11:F1|s0~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \ADDER3|ist_add:11:F1|s0~0_combout\ = \ra2_pc_out~combout\(11) $ (\ra2_ir_out~combout\(8) $ (\ADDER3|ist_add:10:F1|cout~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010101011010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ra2_pc_out~combout\(11),
	datac => \ra2_ir_out~combout\(8),
	datad => \ADDER3|ist_add:10:F1|cout~0_combout\,
	combout => \ADDER3|ist_add:11:F1|s0~0_combout\);

-- Location: LCCOMB_X1_Y43_N22
\ADDER3|ist_add:11:F1|cout~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \ADDER3|ist_add:11:F1|cout~0_combout\ = (\ra2_pc_out~combout\(11) & ((\ra2_ir_out~combout\(8)) # ((\ADDER3|ist_add:9:F1|cout~0_combout\ & \ra2_pc_out~combout\(10))))) # (!\ra2_pc_out~combout\(11) & (\ra2_ir_out~combout\(8) & 
-- ((\ADDER3|ist_add:9:F1|cout~0_combout\) # (\ra2_pc_out~combout\(10)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ra2_pc_out~combout\(11),
	datab => \ADDER3|ist_add:9:F1|cout~0_combout\,
	datac => \ra2_pc_out~combout\(10),
	datad => \ra2_ir_out~combout\(8),
	combout => \ADDER3|ist_add:11:F1|cout~0_combout\);

-- Location: LCCOMB_X1_Y43_N0
\ADDER3|ist_add:12:F1|s0~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \ADDER3|ist_add:12:F1|s0~0_combout\ = \ra2_pc_out~combout\(12) $ (\ra2_ir_out~combout\(8) $ (\ADDER3|ist_add:11:F1|cout~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \ra2_pc_out~combout\(12),
	datac => \ra2_ir_out~combout\(8),
	datad => \ADDER3|ist_add:11:F1|cout~0_combout\,
	combout => \ADDER3|ist_add:12:F1|s0~0_combout\);

-- Location: LCCOMB_X1_Y43_N30
\ADDER3|ist_add:12:F1|cout~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \ADDER3|ist_add:12:F1|cout~0_combout\ = (\ra2_pc_out~combout\(11) & ((\ra2_ir_out~combout\(8)) # ((\ra2_pc_out~combout\(12) & \ADDER3|ist_add:10:F1|cout~0_combout\)))) # (!\ra2_pc_out~combout\(11) & (\ra2_ir_out~combout\(8) & ((\ra2_pc_out~combout\(12)) # 
-- (\ADDER3|ist_add:10:F1|cout~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111100011100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ra2_pc_out~combout\(11),
	datab => \ra2_pc_out~combout\(12),
	datac => \ra2_ir_out~combout\(8),
	datad => \ADDER3|ist_add:10:F1|cout~0_combout\,
	combout => \ADDER3|ist_add:12:F1|cout~0_combout\);

-- Location: LCCOMB_X1_Y43_N16
\ADDER3|ist_add:13:F1|s0~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \ADDER3|ist_add:13:F1|s0~0_combout\ = \ra2_pc_out~combout\(13) $ (\ra2_ir_out~combout\(8) $ (\ADDER3|ist_add:12:F1|cout~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \ra2_pc_out~combout\(13),
	datac => \ra2_ir_out~combout\(8),
	datad => \ADDER3|ist_add:12:F1|cout~0_combout\,
	combout => \ADDER3|ist_add:13:F1|s0~0_combout\);

-- Location: LCCOMB_X1_Y43_N6
\ADDER3|ist_add:13:F1|cout~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \ADDER3|ist_add:13:F1|cout~0_combout\ = (\ra2_pc_out~combout\(12) & ((\ra2_ir_out~combout\(8)) # ((\ra2_pc_out~combout\(13) & \ADDER3|ist_add:11:F1|cout~0_combout\)))) # (!\ra2_pc_out~combout\(12) & (\ra2_ir_out~combout\(8) & ((\ra2_pc_out~combout\(13)) # 
-- (\ADDER3|ist_add:11:F1|cout~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111100011100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ra2_pc_out~combout\(12),
	datab => \ra2_pc_out~combout\(13),
	datac => \ra2_ir_out~combout\(8),
	datad => \ADDER3|ist_add:11:F1|cout~0_combout\,
	combout => \ADDER3|ist_add:13:F1|cout~0_combout\);

-- Location: LCCOMB_X1_Y43_N20
\ADDER3|ist_add:14:F1|s0~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \ADDER3|ist_add:14:F1|s0~0_combout\ = \ra2_pc_out~combout\(14) $ (\ra2_ir_out~combout\(8) $ (\ADDER3|ist_add:13:F1|cout~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010101011010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ra2_pc_out~combout\(14),
	datac => \ra2_ir_out~combout\(8),
	datad => \ADDER3|ist_add:13:F1|cout~0_combout\,
	combout => \ADDER3|ist_add:14:F1|s0~0_combout\);

-- Location: LCCOMB_X1_Y43_N26
\ADDER3|ist_add:14:F1|cout~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \ADDER3|ist_add:14:F1|cout~0_combout\ = (\ra2_pc_out~combout\(14) & ((\ra2_ir_out~combout\(8)) # ((\ra2_pc_out~combout\(13) & \ADDER3|ist_add:12:F1|cout~0_combout\)))) # (!\ra2_pc_out~combout\(14) & (\ra2_ir_out~combout\(8) & ((\ra2_pc_out~combout\(13)) # 
-- (\ADDER3|ist_add:12:F1|cout~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111100011100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ra2_pc_out~combout\(14),
	datab => \ra2_pc_out~combout\(13),
	datac => \ra2_ir_out~combout\(8),
	datad => \ADDER3|ist_add:12:F1|cout~0_combout\,
	combout => \ADDER3|ist_add:14:F1|cout~0_combout\);

-- Location: LCCOMB_X1_Y43_N12
\ADDER3|ist_add:15:F1|s0~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \ADDER3|ist_add:15:F1|s0~0_combout\ = \ra2_pc_out~combout\(15) $ (\ra2_ir_out~combout\(8) $ (\ADDER3|ist_add:14:F1|cout~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010101011010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ra2_pc_out~combout\(15),
	datac => \ra2_ir_out~combout\(8),
	datad => \ADDER3|ist_add:14:F1|cout~0_combout\,
	combout => \ADDER3|ist_add:15:F1|s0~0_combout\);

-- Location: LCCOMB_X21_Y50_N4
\S0~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \S0~1_combout\ = (((\jlr_resolved~combout\) # (\lw_r7_resolved~combout\)) # (!\ra1_val_out~combout\)) # (!\Equal0~3_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111110111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Equal0~3_combout\,
	datab => \ra1_val_out~combout\,
	datac => \jlr_resolved~combout\,
	datad => \lw_r7_resolved~combout\,
	combout => \S0~1_combout\);

-- Location: PIN_H11,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\alu_r7_resolved~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_alu_r7_resolved,
	combout => \alu_r7_resolved~combout\);

-- Location: LCCOMB_X21_Y50_N26
\S0~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \S0~2_combout\ = (\S0~1_combout\ & (!\alu_r7_resolved~combout\ & !\taken_branch_detected~combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \S0~1_combout\,
	datac => \alu_r7_resolved~combout\,
	datad => \taken_branch_detected~combout\,
	combout => \S0~2_combout\);

-- Location: LCCOMB_X21_Y50_N2
\S0~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \S0~0_combout\ = (\process_0~9_combout\ & (\Equal14~5_combout\ & (!\process_0~6_combout\ & \ra2_val_out~combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \process_0~9_combout\,
	datab => \Equal14~5_combout\,
	datac => \process_0~6_combout\,
	datad => \ra2_val_out~combout\,
	combout => \S0~0_combout\);

-- Location: LCCOMB_X21_Y50_N20
\S0~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \S0~3_combout\ = ((\jlr_resolved~combout\) # ((\process_0~8_combout\ & \S0~0_combout\))) # (!\S0~2_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101111110011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \process_0~8_combout\,
	datab => \S0~2_combout\,
	datac => \jlr_resolved~combout\,
	datad => \S0~0_combout\,
	combout => \S0~3_combout\);

-- Location: LCCOMB_X21_Y50_N22
\Equal14~6\ : cycloneii_lcell_comb
-- Equation(s):
-- \Equal14~6_combout\ = (!\ra2_ir_out~combout\(13) & (!\ra2_ir_out~combout\(14) & (!\ra2_ir_out~combout\(12) & \ra2_ir_out~combout\(15))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ra2_ir_out~combout\(13),
	datab => \ra2_ir_out~combout\(14),
	datac => \ra2_ir_out~combout\(12),
	datad => \ra2_ir_out~combout\(15),
	combout => \Equal14~6_combout\);

-- Location: LCCOMB_X21_Y50_N8
\S2~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \S2~0_combout\ = (!\process_0~6_combout\ & (((!\ra2_val_out~combout\) # (!\Equal14~5_combout\)) # (!\process_0~9_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000011100001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \process_0~9_combout\,
	datab => \Equal14~5_combout\,
	datac => \process_0~6_combout\,
	datad => \ra2_val_out~combout\,
	combout => \S2~0_combout\);

-- Location: LCCOMB_X21_Y50_N6
\S1~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \S1~0_combout\ = (\process_0~8_combout\ & (((\Equal14~6_combout\ & \ra2_val_out~combout\)) # (!\S2~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000101000001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \process_0~8_combout\,
	datab => \Equal14~6_combout\,
	datac => \S2~0_combout\,
	datad => \ra2_val_out~combout\,
	combout => \S1~0_combout\);

-- Location: LCCOMB_X21_Y50_N28
\S1~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \S1~1_combout\ = (\S0~2_combout\ & ((\jlr_resolved~combout\) # (\S1~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \S0~2_combout\,
	datac => \jlr_resolved~combout\,
	datad => \S1~0_combout\,
	combout => \S1~1_combout\);

-- Location: LCCOMB_X21_Y50_N14
\S2~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \S2~1_combout\ = (!\jlr_resolved~combout\ & (!\lw_r7_resolved~combout\ & ((!\ra1_val_out~combout\) # (!\Equal0~3_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Equal0~3_combout\,
	datab => \ra1_val_out~combout\,
	datac => \jlr_resolved~combout\,
	datad => \lw_r7_resolved~combout\,
	combout => \S2~1_combout\);

-- Location: LCCOMB_X21_Y50_N16
\S2~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \S2~2_combout\ = (\alu_r7_resolved~combout\) # ((\taken_branch_detected~combout\) # ((!\S2~0_combout\ & \S2~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111110111010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \alu_r7_resolved~combout\,
	datab => \S2~0_combout\,
	datac => \S2~1_combout\,
	datad => \taken_branch_detected~combout\,
	combout => \S2~2_combout\);

-- Location: LCCOMB_X21_Y50_N10
\S3~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \S3~0_combout\ = (!\alu_r7_resolved~combout\ & (!\taken_branch_detected~combout\ & (!\jlr_resolved~combout\ & \lw_r7_resolved~combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \alu_r7_resolved~combout\,
	datab => \taken_branch_detected~combout\,
	datac => \jlr_resolved~combout\,
	datad => \lw_r7_resolved~combout\,
	combout => \S3~0_combout\);

-- Location: PIN_F16,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\free_rrf_vec_out[0]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => GND,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_free_rrf_vec_out(0));

-- Location: PIN_Y8,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\free_rrf_vec_out[1]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => GND,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_free_rrf_vec_out(1));

-- Location: PIN_G28,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\free_rrf_vec_out[2]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \PE|pen2|next_var~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_free_rrf_vec_out(2));

-- Location: PIN_C28,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\free_rrf_vec_out[3]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \PE|pen2|next_var~9_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_free_rrf_vec_out(3));

-- Location: PIN_H27,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\free_rrf_vec_out[4]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \PE|pen2|next_var~11_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_free_rrf_vec_out(4));

-- Location: PIN_K29,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\free_rrf_vec_out[5]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \PE|pen2|next_var~12_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_free_rrf_vec_out(5));

-- Location: PIN_L26,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\free_rrf_vec_out[6]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \PE|pen2|next_var~14_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_free_rrf_vec_out(6));

-- Location: PIN_M25,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\free_rrf_vec_out[7]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \PE|pen2|next_var~15_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_free_rrf_vec_out(7));

-- Location: PIN_G29,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\free_rrf_vec_out[8]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \PE|pen2|next_var~16_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_free_rrf_vec_out(8));

-- Location: PIN_K30,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\free_rrf_vec_out[9]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \PE|pen2|next_var~17_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_free_rrf_vec_out(9));

-- Location: PIN_K24,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\free_rrf_vec_out[10]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \PE|pen2|next_var~18_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_free_rrf_vec_out(10));

-- Location: PIN_J26,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\free_rrf_vec_out[11]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \PE|pen2|next_var~19_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_free_rrf_vec_out(11));

-- Location: PIN_M22,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\free_rrf_vec_out[12]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \PE|pen2|next_var~20_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_free_rrf_vec_out(12));

-- Location: PIN_L25,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\free_rrf_vec_out[13]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \PE|pen2|next_var~22_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_free_rrf_vec_out(13));

-- Location: PIN_L27,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\free_rrf_vec_out[14]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \PE|pen2|next_var~23_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_free_rrf_vec_out(14));

-- Location: PIN_J30,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\free_rrf_vec_out[15]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \PE|pen2|next_var~25_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_free_rrf_vec_out(15));

-- Location: PIN_M26,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\free_rrf_vec_out[16]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \PE|pen2|next_var~27_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_free_rrf_vec_out(16));

-- Location: PIN_J29,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\free_rrf_vec_out[17]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \PE|pen2|next_var~28_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_free_rrf_vec_out(17));

-- Location: PIN_H25,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\free_rrf_vec_out[18]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \PE|pen2|next_var~31_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_free_rrf_vec_out(18));

-- Location: PIN_K28,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\free_rrf_vec_out[19]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \PE|pen2|next_var~32_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_free_rrf_vec_out(19));

-- Location: PIN_E29,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\free_rrf_vec_out[20]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \PE|pen2|next_var~36_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_free_rrf_vec_out(20));

-- Location: PIN_K23,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\free_rrf_vec_out[21]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \PE|pen2|next_var~37_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_free_rrf_vec_out(21));

-- Location: PIN_F27,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\free_rrf_vec_out[22]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \PE|pen2|next_var~38_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_free_rrf_vec_out(22));

-- Location: PIN_C30,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\free_rrf_vec_out[23]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \PE|pen2|next_var~40_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_free_rrf_vec_out(23));

-- Location: PIN_H24,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\free_rrf_vec_out[24]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \PE|pen2|next_var~49_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_free_rrf_vec_out(24));

-- Location: PIN_D27,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\free_rrf_vec_out[25]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \PE|pen2|next_var~41_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_free_rrf_vec_out(25));

-- Location: PIN_G27,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\free_rrf_vec_out[26]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \PE|pen2|next_var~50_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_free_rrf_vec_out(26));

-- Location: PIN_J25,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\free_rrf_vec_out[27]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \PE|pen2|next_var~44_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_free_rrf_vec_out(27));

-- Location: PIN_E28,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\free_rrf_vec_out[28]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \PE|pen2|next_var~45_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_free_rrf_vec_out(28));

-- Location: PIN_G22,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\free_rrf_vec_out[29]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \PE|pen2|next_var~51_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_free_rrf_vec_out(29));

-- Location: PIN_F23,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\free_rrf_vec_out[30]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \PE|pen2|next_var~52_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_free_rrf_vec_out(30));

-- Location: PIN_E24,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\free_rrf_vec_out[31]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \PE|pen2|next_var~48_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_free_rrf_vec_out(31));

-- Location: PIN_AF11,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\Ard1a[0]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \Ard1a~15_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_Ard1a(0));

-- Location: PIN_AD11,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\Ard1a[1]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \Ard1a~21_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_Ard1a(1));

-- Location: PIN_AF10,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\Ard1a[2]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \Ard1a~26_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_Ard1a(2));

-- Location: PIN_AE11,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\Ard1b[0]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \Ard1b~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_Ard1b(0));

-- Location: PIN_AD12,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\Ard1b[1]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \Ard1b~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_Ard1b(1));

-- Location: PIN_AE12,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\Ard1b[2]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \Ard1b~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_Ard1b(2));

-- Location: PIN_A9,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\Ard2a[0]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \Ard2a~15_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_Ard2a(0));

-- Location: PIN_H12,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\Ard2a[1]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \Ard2a~21_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_Ard2a(1));

-- Location: PIN_F11,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\Ard2a[2]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \Ard2a~26_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_Ard2a(2));

-- Location: PIN_U6,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\Ard2b[0]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \Ard2b~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_Ard2b(0));

-- Location: PIN_U4,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\Ard2b[1]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \Ard2b~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_Ard2b(1));

-- Location: PIN_T4,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\Ard2b[2]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \Ard2b~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_Ard2b(2));

-- Location: PIN_Y26,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\Ard1c[0]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => GND,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_Ard1c(0));

-- Location: PIN_T28,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\Ard1c[1]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => GND,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_Ard1c(1));

-- Location: PIN_Y27,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\Ard1c[2]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => GND,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_Ard1c(2));

-- Location: PIN_N21,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\Ard2c[0]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => GND,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_Ard2c(0));

-- Location: PIN_R24,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\Ard2c[1]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => GND,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_Ard2c(1));

-- Location: PIN_Y29,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\Ard2c[2]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => GND,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_Ard2c(2));

-- Location: PIN_AJ7,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\Awr1[0]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \Awr1~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_Awr1(0));

-- Location: PIN_AC12,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\Awr1[1]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \Awr1~10_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_Awr1(1));

-- Location: PIN_AK7,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\Awr1[2]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \Awr1~12_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_Awr1(2));

-- Location: PIN_B9,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\Awr2[0]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \Awr2~7_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_Awr2(0));

-- Location: PIN_G12,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\Awr2[1]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \Awr2~9_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_Awr2(1));

-- Location: PIN_E11,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\Awr2[2]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \Awr2~11_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_Awr2(2));

-- Location: PIN_AK10,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\pc1[0]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \ra1_pc_out~combout\(0),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_pc1(0));

-- Location: PIN_AB12,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\pc1[1]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \ra1_pc_out~combout\(1),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_pc1(1));

-- Location: PIN_AD19,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\pc1[2]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \ra1_pc_out~combout\(2),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_pc1(2));

-- Location: PIN_AB18,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\pc1[3]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \ra1_pc_out~combout\(3),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_pc1(3));

-- Location: PIN_AD24,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\pc1[4]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \ra1_pc_out~combout\(4),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_pc1(4));

-- Location: PIN_AB24,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\pc1[5]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \ra1_pc_out~combout\(5),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_pc1(5));

-- Location: PIN_AC24,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\pc1[6]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \ra1_pc_out~combout\(6),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_pc1(6));

-- Location: PIN_AG26,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\pc1[7]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \ra1_pc_out~combout\(7),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_pc1(7));

-- Location: PIN_Y23,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\pc1[8]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \ra1_pc_out~combout\(8),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_pc1(8));

-- Location: PIN_AH30,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\pc1[9]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \ra1_pc_out~combout\(9),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_pc1(9));

-- Location: PIN_AC28,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\pc1[10]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \ra1_pc_out~combout\(10),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_pc1(10));

-- Location: PIN_AE28,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\pc1[11]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \ra1_pc_out~combout\(11),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_pc1(11));

-- Location: PIN_AJ29,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\pc1[12]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \ra1_pc_out~combout\(12),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_pc1(12));

-- Location: PIN_W24,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\pc1[13]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \ra1_pc_out~combout\(13),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_pc1(13));

-- Location: PIN_Y21,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\pc1[14]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \ra1_pc_out~combout\(14),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_pc1(14));

-- Location: PIN_AE29,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\pc1[15]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \ra1_pc_out~combout\(15),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_pc1(15));

-- Location: PIN_Y5,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\pc2[0]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \ra2_pc_out~combout\(0),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_pc2(0));

-- Location: PIN_AB2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\pc2[1]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \ra2_pc_out~combout\(1),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_pc2(1));

-- Location: PIN_AC3,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\pc2[2]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \ra2_pc_out~combout\(2),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_pc2(2));

-- Location: PIN_W7,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\pc2[3]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \ra2_pc_out~combout\(3),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_pc2(3));

-- Location: PIN_Y1,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\pc2[4]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \ra2_pc_out~combout\(4),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_pc2(4));

-- Location: PIN_V9,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\pc2[5]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \ra2_pc_out~combout\(5),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_pc2(5));

-- Location: PIN_Y3,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\pc2[6]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \ra2_pc_out~combout\(6),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_pc2(6));

-- Location: PIN_M9,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\pc2[7]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \ra2_pc_out~combout\(7),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_pc2(7));

-- Location: PIN_C1,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\pc2[8]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \ra2_pc_out~combout\(8),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_pc2(8));

-- Location: PIN_E2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\pc2[9]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \ra2_pc_out~combout\(9),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_pc2(9));

-- Location: PIN_F1,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\pc2[10]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \ra2_pc_out~combout\(10),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_pc2(10));

-- Location: PIN_J7,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\pc2[11]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \ra2_pc_out~combout\(11),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_pc2(11));

-- Location: PIN_J6,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\pc2[12]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \ra2_pc_out~combout\(12),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_pc2(12));

-- Location: PIN_E3,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\pc2[13]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \ra2_pc_out~combout\(13),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_pc2(13));

-- Location: PIN_K5,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\pc2[14]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \ra2_pc_out~combout\(14),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_pc2(14));

-- Location: PIN_D2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\pc2[15]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \ra2_pc_out~combout\(15),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_pc2(15));

-- Location: PIN_AG12,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\ir1[0]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \ra1_ir_out~combout\(0),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_ir1(0));

-- Location: PIN_AK11,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\ir1[1]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \ra1_ir_out~combout\(1),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_ir1(1));

-- Location: PIN_AC5,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\ir1[2]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \ra1_ir_out~combout\(2),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_ir1(2));

-- Location: PIN_AG22,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\ir1[3]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \ra1_ir_out~combout\(3),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_ir1(3));

-- Location: PIN_AK26,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\ir1[4]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \ra1_ir_out~combout\(4),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_ir1(4));

-- Location: PIN_AD20,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\ir1[5]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \ra1_ir_out~combout\(5),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_ir1(5));

-- Location: PIN_AF22,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\ir1[6]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \ra1_ir_out~combout\(6),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_ir1(6));

-- Location: PIN_AE20,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\ir1[7]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \ra1_ir_out~combout\(7),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_ir1(7));

-- Location: PIN_AG28,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\ir1[8]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \ra1_ir_out~combout\(8),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_ir1(8));

-- Location: PIN_AH10,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\ir1[9]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \ra1_ir_out~combout\(9),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_ir1(9));

-- Location: PIN_AE3,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\ir1[10]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \ra1_ir_out~combout\(10),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_ir1(10));

-- Location: PIN_AB6,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\ir1[11]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \ra1_ir_out~combout\(11),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_ir1(11));

-- Location: PIN_AF16,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\ir1[12]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \ra1_ir_out~combout\(12),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_ir1(12));

-- Location: PIN_AD13,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\ir1[13]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \ra1_ir_out~combout\(13),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_ir1(13));

-- Location: PIN_AD27,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\ir1[14]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \ra1_ir_out~combout\(14),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_ir1(14));

-- Location: PIN_AB23,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\ir1[15]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \ra1_ir_out~combout\(15),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_ir1(15));

-- Location: PIN_AA1,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\ir2[0]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \ra2_ir_out~combout\(0),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_ir2(0));

-- Location: PIN_AE2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\ir2[1]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \ra2_ir_out~combout\(1),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_ir2(1));

-- Location: PIN_AD2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\ir2[2]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \ra2_ir_out~combout\(2),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_ir2(2));

-- Location: PIN_V8,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\ir2[3]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \ra2_ir_out~combout\(3),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_ir2(3));

-- Location: PIN_M3,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\ir2[4]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \ra2_ir_out~combout\(4),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_ir2(4));

-- Location: PIN_N2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\ir2[5]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \ra2_ir_out~combout\(5),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_ir2(5));

-- Location: PIN_T7,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\ir2[6]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \ra2_ir_out~combout\(6),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_ir2(6));

-- Location: PIN_P3,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\ir2[7]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \ra2_ir_out~combout\(7),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_ir2(7));

-- Location: PIN_P1,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\ir2[8]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \ra2_ir_out~combout\(8),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_ir2(8));

-- Location: PIN_G11,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\ir2[9]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \ra2_ir_out~combout\(9),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_ir2(9));

-- Location: PIN_C15,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\ir2[10]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \ra2_ir_out~combout\(10),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_ir2(10));

-- Location: PIN_A10,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\ir2[11]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \ra2_ir_out~combout\(11),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_ir2(11));

-- Location: PIN_F2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\ir2[12]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \ra2_ir_out~combout\(12),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_ir2(12));

-- Location: PIN_B2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\ir2[13]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \ra2_ir_out~combout\(13),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_ir2(13));

-- Location: PIN_G17,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\ir2[14]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \ra2_ir_out~combout\(14),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_ir2(14));

-- Location: PIN_B16,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\ir2[15]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \ra2_ir_out~combout\(15),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_ir2(15));

-- Location: PIN_AK20,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\x1_op1[0]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \x1_op1~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_x1_op1(0));

-- Location: PIN_AG18,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\x1_op1[1]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \x1_op1~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_x1_op1(1));

-- Location: PIN_AH18,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\x1_op1[2]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \x1_op1~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_x1_op1(2));

-- Location: PIN_AK19,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\x1_op1[3]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \x1_op1~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_x1_op1(3));

-- Location: PIN_AK22,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\x1_op1[4]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \x1_op1~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_x1_op1(4));

-- Location: PIN_AK17,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\x1_op1[5]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \x1_op1~7_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_x1_op1(5));

-- Location: PIN_AF18,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\x1_op1[6]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \x1_op1~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_x1_op1(6));

-- Location: PIN_AG16,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\x1_op1[7]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \x1_op1~12_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_x1_op1(7));

-- Location: PIN_AE16,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\x1_op1[8]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \x1_op1~14_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_x1_op1(8));

-- Location: PIN_AH16,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\x1_op1[9]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \x1_op1~18_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_x1_op1(9));

-- Location: PIN_AJ26,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\x1_op1[10]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \x1_op1~21_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_x1_op1(10));

-- Location: PIN_AK28,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\x1_op1[11]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \x1_op1~22_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_x1_op1(11));

-- Location: PIN_AF23,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\x1_op1[12]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \x1_op1~23_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_x1_op1(12));

-- Location: PIN_AC21,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\x1_op1[13]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \x1_op1~24_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_x1_op1(13));

-- Location: PIN_AG24,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\x1_op1[14]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \x1_op1~25_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_x1_op1(14));

-- Location: PIN_AD21,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\x1_op1[15]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \x1_op1~26_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_x1_op1(15));

-- Location: PIN_AG5,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\x1_op2[0]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \x1_op2~10_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_x1_op2(0));

-- Location: PIN_AG8,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\x1_op2[1]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \x1_op2~13_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_x1_op2(1));

-- Location: PIN_AH3,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\x1_op2[2]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \x1_op2~15_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_x1_op2(2));

-- Location: PIN_AJ5,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\x1_op2[3]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \x1_op2~21_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_x1_op2(3));

-- Location: PIN_AK3,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\x1_op2[4]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \x1_op2~23_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_x1_op2(4));

-- Location: PIN_AC17,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\x1_op2[5]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \x1_op2~32_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_x1_op2(5));

-- Location: PIN_AG7,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\x1_op2[6]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \x1_op2~35_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_x1_op2(6));

-- Location: PIN_AD8,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\x1_op2[7]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \x1_op2~38_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_x1_op2(7));

-- Location: PIN_AD10,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\x1_op2[8]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \x1_op2~41_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_x1_op2(8));

-- Location: PIN_AJ6,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\x1_op2[9]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \x1_op2~44_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_x1_op2(9));

-- Location: PIN_AH5,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\x1_op2[10]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \x1_op2~47_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_x1_op2(10));

-- Location: PIN_AK21,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\x1_op2[11]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \x1_op2~50_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_x1_op2(11));

-- Location: PIN_AK6,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\x1_op2[12]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \x1_op2~53_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_x1_op2(12));

-- Location: PIN_AG4,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\x1_op2[13]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \x1_op2~56_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_x1_op2(13));

-- Location: PIN_AF9,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\x1_op2[14]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \x1_op2~59_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_x1_op2(14));

-- Location: PIN_AK9,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\x1_op2[15]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \x1_op2~62_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_x1_op2(15));

-- Location: PIN_P9,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\x2_op1[0]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \x2_op1~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_x2_op1(0));

-- Location: PIN_N10,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\x2_op1[1]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \x2_op1~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_x2_op1(1));

-- Location: PIN_J2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\x2_op1[2]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \x2_op1~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_x2_op1(2));

-- Location: PIN_N8,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\x2_op1[3]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \x2_op1~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_x2_op1(3));

-- Location: PIN_M5,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\x2_op1[4]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \x2_op1~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_x2_op1(4));

-- Location: PIN_H2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\x2_op1[5]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \x2_op1~7_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_x2_op1(5));

-- Location: PIN_K2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\x2_op1[6]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \x2_op1~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_x2_op1(6));

-- Location: PIN_M7,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\x2_op1[7]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \x2_op1~12_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_x2_op1(7));

-- Location: PIN_M6,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\x2_op1[8]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \x2_op1~14_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_x2_op1(8));

-- Location: PIN_H5,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\x2_op1[9]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \x2_op1~18_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_x2_op1(9));

-- Location: PIN_V3,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\x2_op1[10]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \x2_op1~21_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_x2_op1(10));

-- Location: PIN_W4,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\x2_op1[11]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \x2_op1~22_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_x2_op1(11));

-- Location: PIN_U3,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\x2_op1[12]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \x2_op1~23_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_x2_op1(12));

-- Location: PIN_U7,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\x2_op1[13]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \x2_op1~24_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_x2_op1(13));

-- Location: PIN_W1,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\x2_op1[14]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \x2_op1~25_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_x2_op1(14));

-- Location: PIN_U9,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\x2_op1[15]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \x2_op1~26_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_x2_op1(15));

-- Location: PIN_H6,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\x2_op2[0]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \x2_op2~13_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_x2_op2(0));

-- Location: PIN_H8,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\x2_op2[1]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \x2_op2~16_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_x2_op2(1));

-- Location: PIN_G4,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\x2_op2[2]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \x2_op2~19_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_x2_op2(2));

-- Location: PIN_C12,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\x2_op2[3]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \x2_op2~24_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_x2_op2(3));

-- Location: PIN_H13,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\x2_op2[4]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \x2_op2~26_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_x2_op2(4));

-- Location: PIN_E15,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\x2_op2[5]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \x2_op2~34_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_x2_op2(5));

-- Location: PIN_C9,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\x2_op2[6]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \x2_op2~37_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_x2_op2(6));

-- Location: PIN_D13,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\x2_op2[7]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \x2_op2~40_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_x2_op2(7));

-- Location: PIN_A14,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\x2_op2[8]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \x2_op2~43_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_x2_op2(8));

-- Location: PIN_A6,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\x2_op2[9]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \x2_op2~46_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_x2_op2(9));

-- Location: PIN_G14,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\x2_op2[10]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \x2_op2~49_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_x2_op2(10));

-- Location: PIN_A12,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\x2_op2[11]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \x2_op2~52_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_x2_op2(11));

-- Location: PIN_C13,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\x2_op2[12]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \x2_op2~55_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_x2_op2(12));

-- Location: PIN_J13,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\x2_op2[13]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \x2_op2~58_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_x2_op2(13));

-- Location: PIN_C14,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\x2_op2[14]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \x2_op2~61_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_x2_op2(14));

-- Location: PIN_H14,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\x2_op2[15]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \x2_op2~64_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_x2_op2(15));

-- Location: PIN_AJ18,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\x1_op1_ready~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \x1_op1_ready~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_x1_op1_ready);

-- Location: PIN_AD9,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\x1_op2_ready~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \x1_op2_ready~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_x1_op2_ready);

-- Location: PIN_D5,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\x2_op1_ready~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \x2_op1_ready~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_x2_op1_ready);

-- Location: PIN_D10,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\x2_op2_ready~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \x2_op2_ready~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_x2_op2_ready);

-- Location: PIN_B21,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\x1_val~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \x1_val~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_x1_val);

-- Location: PIN_E20,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\x2_val~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \x2_val~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_x2_val);

-- Location: PIN_AB13,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\C_out~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \C_out~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_C_out);

-- Location: PIN_G9,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\Z_out~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \Z_out~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_Z_out);

-- Location: PIN_AK14,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\C_ready~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \C_ready~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_C_ready);

-- Location: PIN_D7,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\Z_ready~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \Z_ready~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_Z_ready);

-- Location: PIN_AA29,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\C_wr~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \C_wr~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_C_wr);

-- Location: PIN_AJ8,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\Z_wr~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \Z_wr~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_Z_wr);

-- Location: PIN_AH15,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\C_2_out~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \C_2_out~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_C_2_out);

-- Location: PIN_AC14,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\C_2_ready~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \C_2_ready~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_C_2_ready);

-- Location: PIN_G16,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\C_2_wr~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \C_2_wr~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_C_2_wr);

-- Location: PIN_C5,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\Z_2_out~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \Z_2_out~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_Z_2_out);

-- Location: PIN_G10,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\Z_2_ready~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \Z_2_ready~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_Z_2_ready);

-- Location: PIN_E10,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\Z_2_wr~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \Z_2_wr~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_Z_2_wr);

-- Location: PIN_G24,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\spec_tag_rs_out1[0]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \spec_tag_rs_out1~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_spec_tag_rs_out1(0));

-- Location: PIN_D26,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\spec_tag_rs_out1[1]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \spec_tag_rs_out1~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_spec_tag_rs_out1(1));

-- Location: PIN_B29,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\spec_tag_rs_out2[0]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \spec_tag_rs_out2~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_spec_tag_rs_out2(0));

-- Location: PIN_F24,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\spec_tag_rs_out2[1]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \spec_tag_rs_out2~9_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_spec_tag_rs_out2(1));

-- Location: PIN_B18,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\store_tag_rs_out1[0]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \store_tag_reg_in~7_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_store_tag_rs_out1(0));

-- Location: PIN_F18,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\store_tag_rs_out1[1]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \STORE_TAG_REG|dout[1]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_store_tag_rs_out1(1));

-- Location: PIN_A17,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\store_tag_rs_out1[2]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \STORE_TAG_REG|dout[2]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_store_tag_rs_out1(2));

-- Location: PIN_G18,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\store_tag_rs_out1[3]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \STORE_TAG_REG|dout[3]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_store_tag_rs_out1(3));

-- Location: PIN_E17,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\store_tag_rs_out1[4]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \STORE_TAG_REG|dout[4]~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_store_tag_rs_out1(4));

-- Location: PIN_A19,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\store_tag_rs_out2[0]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \STORE_TAG_REG|dout\(0),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_store_tag_rs_out2(0));

-- Location: PIN_D18,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\store_tag_rs_out2[1]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \STORE_TAG_REG|dout\(1),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_store_tag_rs_out2(1));

-- Location: PIN_B17,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\store_tag_rs_out2[2]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \STORE_TAG_REG|dout\(2),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_store_tag_rs_out2(2));

-- Location: PIN_C18,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\store_tag_rs_out2[3]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \STORE_TAG_REG|dout\(3),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_store_tag_rs_out2(3));

-- Location: PIN_B19,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\store_tag_rs_out2[4]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \STORE_TAG_REG|dout\(4),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_store_tag_rs_out2(4));

-- Location: PIN_AK8,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\C_busybit_out~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \C_busybit_out~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_C_busybit_out);

-- Location: PIN_AC11,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\Z_busybit_out~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \Z_busybit_out~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_Z_busybit_out);

-- Location: PIN_AJ9,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\C_2_busybit_out~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \C_2_busybit_out~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_C_2_busybit_out);

-- Location: PIN_D9,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\Z_2_busybit_out~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \Z_2_busybit_out~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_Z_2_busybit_out);

-- Location: PIN_P30,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\C_tag_out_arf[0]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \C_tag_out_arf~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_C_tag_out_arf(0));

-- Location: PIN_R25,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\C_tag_out_arf[1]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \C_tag_out_arf~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_C_tag_out_arf(1));

-- Location: PIN_P29,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\C_tag_out_arf[2]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \C_tag_out_arf~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_C_tag_out_arf(2));

-- Location: PIN_R22,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\C_tag_out_arf[3]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \C_tag_out_arf~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_C_tag_out_arf(3));

-- Location: PIN_M29,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\C_tag_out_arf[4]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \C_tag_out_arf~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_C_tag_out_arf(4));

-- Location: PIN_R27,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\Z_tag_out_arf[0]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \Z_tag_out_arf~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_Z_tag_out_arf(0));

-- Location: PIN_N29,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\Z_tag_out_arf[1]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \Z_tag_out_arf~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_Z_tag_out_arf(1));

-- Location: PIN_M30,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\Z_tag_out_arf[2]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \Z_tag_out_arf~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_Z_tag_out_arf(2));

-- Location: PIN_N22,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\Z_tag_out_arf[3]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \Z_tag_out_arf~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_Z_tag_out_arf(3));

-- Location: PIN_P27,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\Z_tag_out_arf[4]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \Z_tag_out_arf~7_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_Z_tag_out_arf(4));

-- Location: PIN_B24,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\C_2_tag_out_arf[0]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \C_2_tag_out_arf~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_C_2_tag_out_arf(0));

-- Location: PIN_D24,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\C_2_tag_out_arf[1]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \C_2_tag_out_arf~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_C_2_tag_out_arf(1));

-- Location: PIN_D22,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\C_2_tag_out_arf[2]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \C_2_tag_out_arf~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_C_2_tag_out_arf(2));

-- Location: PIN_C24,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\C_2_tag_out_arf[3]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \C_2_tag_out_arf~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_C_2_tag_out_arf(3));

-- Location: PIN_H20,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\C_2_tag_out_arf[4]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \C_2_tag_out_arf~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_C_2_tag_out_arf(4));

-- Location: PIN_A23,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\Z_2_tag_out_arf[0]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \Z_2_tag_out_arf~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_Z_2_tag_out_arf(0));

-- Location: PIN_H19,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\Z_2_tag_out_arf[1]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \Z_2_tag_out_arf~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_Z_2_tag_out_arf(1));

-- Location: PIN_E21,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\Z_2_tag_out_arf[2]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \Z_2_tag_out_arf~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_Z_2_tag_out_arf(2));

-- Location: PIN_C21,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\Z_2_tag_out_arf[3]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \Z_2_tag_out_arf~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_Z_2_tag_out_arf(3));

-- Location: PIN_G20,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\Z_2_tag_out_arf[4]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \Z_2_tag_out_arf~7_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_Z_2_tag_out_arf(4));

-- Location: PIN_AH4,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\busy_dest1_out~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \busy_dest1_out~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_busy_dest1_out);

-- Location: PIN_B10,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\busy_dest2_out~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \busy_dest2_out~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_busy_dest2_out);

-- Location: PIN_P25,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\dest_AR_tag_out[0]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \dest_AR_tag_out~11_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_dest_AR_tag_out(0));

-- Location: PIN_P23,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\dest_AR_tag_out[1]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \dest_AR_tag_out~12_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_dest_AR_tag_out(1));

-- Location: PIN_N25,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\dest_AR_tag_out[2]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \dest_AR_tag_out~13_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_dest_AR_tag_out(2));

-- Location: PIN_N28,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\dest_AR_tag_out[3]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \dest_AR_tag_out~14_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_dest_AR_tag_out(3));

-- Location: PIN_P22,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\dest_AR_tag_out[4]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \dest_AR_tag_out~15_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_dest_AR_tag_out(4));

-- Location: PIN_B23,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\dest_AR_tag_2_out[0]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \dest_AR_tag_2_out~11_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_dest_AR_tag_2_out(0));

-- Location: PIN_B25,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\dest_AR_tag_2_out[1]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \dest_AR_tag_2_out~12_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_dest_AR_tag_2_out(1));

-- Location: PIN_C22,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\dest_AR_tag_2_out[2]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \dest_AR_tag_2_out~13_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_dest_AR_tag_2_out(2));

-- Location: PIN_J19,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\dest_AR_tag_2_out[3]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \dest_AR_tag_2_out~14_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_dest_AR_tag_2_out(3));

-- Location: PIN_G19,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\dest_AR_tag_2_out[4]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \dest_AR_tag_2_out~15_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_dest_AR_tag_2_out(4));

-- Location: PIN_AJ13,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\C_tag_out_rs[0]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \C_tag_out_rs~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_C_tag_out_rs(0));

-- Location: PIN_AF14,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\C_tag_out_rs[1]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \C_tag_out_rs~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_C_tag_out_rs(1));

-- Location: PIN_AG13,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\C_tag_out_rs[2]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \C_tag_out_rs~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_C_tag_out_rs(2));

-- Location: PIN_AK12,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\C_tag_out_rs[3]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \C_tag_out_rs~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_C_tag_out_rs(3));

-- Location: PIN_AF15,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\C_tag_out_rs[4]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \C_tag_out_rs~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_C_tag_out_rs(4));

-- Location: PIN_B5,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\Z_tag_out_rs[0]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \Z_tag_out_rs~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_Z_tag_out_rs(0));

-- Location: PIN_H10,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\Z_tag_out_rs[1]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \Z_tag_out_rs~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_Z_tag_out_rs(1));

-- Location: PIN_A5,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\Z_tag_out_rs[2]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \Z_tag_out_rs~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_Z_tag_out_rs(2));

-- Location: PIN_B4,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\Z_tag_out_rs[3]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \Z_tag_out_rs~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_Z_tag_out_rs(3));

-- Location: PIN_A3,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\Z_tag_out_rs[4]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \Z_tag_out_rs~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_Z_tag_out_rs(4));

-- Location: PIN_AG14,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\C_2_tag_out_rs[0]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \C_2_tag_out_rs~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_C_2_tag_out_rs(0));

-- Location: PIN_AJ12,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\C_2_tag_out_rs[1]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \C_2_tag_out_rs~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_C_2_tag_out_rs(1));

-- Location: PIN_AJ14,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\C_2_tag_out_rs[2]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \C_2_tag_out_rs~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_C_2_tag_out_rs(2));

-- Location: PIN_AE15,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\C_2_tag_out_rs[3]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \C_2_tag_out_rs~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_C_2_tag_out_rs(3));

-- Location: PIN_AD14,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\C_2_tag_out_rs[4]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \C_2_tag_out_rs~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_C_2_tag_out_rs(4));

-- Location: PIN_F8,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\Z_2_tag_out_rs[0]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \Z_2_tag_out_rs~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_Z_2_tag_out_rs(0));

-- Location: PIN_D6,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\Z_2_tag_out_rs[1]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \Z_2_tag_out_rs~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_Z_2_tag_out_rs(1));

-- Location: PIN_B3,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\Z_2_tag_out_rs[2]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \Z_2_tag_out_rs~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_Z_2_tag_out_rs(2));

-- Location: PIN_E8,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\Z_2_tag_out_rs[3]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \Z_2_tag_out_rs~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_Z_2_tag_out_rs(3));

-- Location: PIN_C4,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\Z_2_tag_out_rs[4]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \Z_2_tag_out_rs~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_Z_2_tag_out_rs(4));

-- Location: PIN_B7,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\ra1_invalidate_out~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \ra1_invalidate_out~10_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_ra1_invalidate_out);

-- Location: PIN_A7,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\ra2_invalidate_out~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \ra1_invalidate_out~10_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_ra2_invalidate_out);

-- Location: PIN_J18,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\pc_en_out~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \pc_en_out~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_pc_en_out);

-- Location: PIN_H18,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\ra_en_out~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \pc_en_out~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_ra_en_out);

-- Location: PIN_D19,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\arf_busy_wr_en1~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \x1_val~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_arf_busy_wr_en1);

-- Location: PIN_A22,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\arf_busy_wr_en2~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \x2_val~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_arf_busy_wr_en2);

-- Location: PIN_C19,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\arf_tag_wr_en1~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \x1_val~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_arf_tag_wr_en1);

-- Location: PIN_F20,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\arf_tag_wr_en2~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \x2_val~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_arf_tag_wr_en2);

-- Location: PIN_AH9,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\adder2_out[0]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \ADDER2|F0|s0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_adder2_out(0));

-- Location: PIN_AG9,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\adder2_out[1]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \ADDER2|ist_add:1:F1|s0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_adder2_out(1));

-- Location: PIN_AD17,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\adder2_out[2]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \ADDER2|ist_add:2:F1|s0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_adder2_out(2));

-- Location: PIN_AJ20,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\adder2_out[3]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \ADDER2|ist_add:3:F1|s0~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_adder2_out(3));

-- Location: PIN_AH24,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\adder2_out[4]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \ADDER2|ist_add:4:F1|s0~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_adder2_out(4));

-- Location: PIN_AD22,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\adder2_out[5]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \ADDER2|ist_add:5:F1|s0~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_adder2_out(5));

-- Location: PIN_AF24,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\adder2_out[6]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \ADDER2|ist_add:6:F1|s0~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_adder2_out(6));

-- Location: PIN_AG23,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\adder2_out[7]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \ADDER2|ist_add:7:F1|s0~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_adder2_out(7));

-- Location: PIN_AB25,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\adder2_out[8]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \ADDER2|ist_add:8:F1|s0~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_adder2_out(8));

-- Location: PIN_AE30,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\adder2_out[9]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \ADDER2|ist_add:9:F1|s0~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_adder2_out(9));

-- Location: PIN_AF29,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\adder2_out[10]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \ADDER2|ist_add:10:F1|s0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_adder2_out(10));

-- Location: PIN_AA23,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\adder2_out[11]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \ADDER2|ist_add:11:F1|s0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_adder2_out(11));

-- Location: PIN_AA24,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\adder2_out[12]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \ADDER2|ist_add:12:F1|s0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_adder2_out(12));

-- Location: PIN_AB26,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\adder2_out[13]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \ADDER2|ist_add:13:F1|s0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_adder2_out(13));

-- Location: PIN_AF30,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\adder2_out[14]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \ADDER2|ist_add:14:F1|s0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_adder2_out(14));

-- Location: PIN_AA25,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\adder2_out[15]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \ADDER2|ist_add:15:F1|s0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_adder2_out(15));

-- Location: PIN_W6,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\adder3_out[0]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \ADDER3|F0|s0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_adder3_out(0));

-- Location: PIN_W10,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\adder3_out[1]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \ADDER3|ist_add:1:F1|s0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_adder3_out(1));

-- Location: PIN_W9,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\adder3_out[2]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \ADDER3|ist_add:2:F1|s0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_adder3_out(2));

-- Location: PIN_W8,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\adder3_out[3]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \ADDER3|ist_add:3:F1|s0~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_adder3_out(3));

-- Location: PIN_U1,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\adder3_out[4]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \ADDER3|ist_add:4:F1|s0~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_adder3_out(4));

-- Location: PIN_V4,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\adder3_out[5]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \ADDER3|ist_add:5:F1|s0~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_adder3_out(5));

-- Location: PIN_U5,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\adder3_out[6]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \ADDER3|ist_add:6:F1|s0~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_adder3_out(6));

-- Location: PIN_L5,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\adder3_out[7]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \ADDER3|ist_add:7:F1|s0~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_adder3_out(7));

-- Location: PIN_K6,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\adder3_out[8]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \ADDER3|ist_add:8:F1|s0~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_adder3_out(8));

-- Location: PIN_E4,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\adder3_out[9]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \ADDER3|ist_add:9:F1|s0~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_adder3_out(9));

-- Location: PIN_J5,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\adder3_out[10]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \ADDER3|ist_add:10:F1|s0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_adder3_out(10));

-- Location: PIN_K7,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\adder3_out[11]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \ADDER3|ist_add:11:F1|s0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_adder3_out(11));

-- Location: PIN_K8,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\adder3_out[12]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \ADDER3|ist_add:12:F1|s0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_adder3_out(12));

-- Location: PIN_L9,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\adder3_out[13]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \ADDER3|ist_add:13:F1|s0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_adder3_out(13));

-- Location: PIN_L7,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\adder3_out[14]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \ADDER3|ist_add:14:F1|s0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_adder3_out(14));

-- Location: PIN_L8,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\adder3_out[15]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \ADDER3|ist_add:15:F1|s0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_adder3_out(15));

-- Location: PIN_C26,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\ZA7_1_out[0]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => GND,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_ZA7_1_out(0));

-- Location: PIN_D21,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\ZA7_1_out[1]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => GND,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_ZA7_1_out(1));

-- Location: PIN_Y9,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\ZA7_1_out[2]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => GND,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_ZA7_1_out(2));

-- Location: PIN_V21,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\ZA7_1_out[3]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => GND,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_ZA7_1_out(3));

-- Location: PIN_V28,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\ZA7_1_out[4]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => GND,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_ZA7_1_out(4));

-- Location: PIN_B28,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\ZA7_1_out[5]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => GND,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_ZA7_1_out(5));

-- Location: PIN_V27,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\ZA7_1_out[6]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => GND,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_ZA7_1_out(6));

-- Location: PIN_AJ15,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\ZA7_1_out[7]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \ra1_ir_out~combout\(0),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_ZA7_1_out(7));

-- Location: PIN_AE13,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\ZA7_1_out[8]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \ra1_ir_out~combout\(1),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_ZA7_1_out(8));

-- Location: PIN_AF2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\ZA7_1_out[9]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \ra1_ir_out~combout\(2),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_ZA7_1_out(9));

-- Location: PIN_AC20,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\ZA7_1_out[10]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \ra1_ir_out~combout\(3),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_ZA7_1_out(10));

-- Location: PIN_AK23,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\ZA7_1_out[11]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \ra1_ir_out~combout\(4),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_ZA7_1_out(11));

-- Location: PIN_AJ24,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\ZA7_1_out[12]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \ra1_ir_out~combout\(5),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_ZA7_1_out(12));

-- Location: PIN_AE19,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\ZA7_1_out[13]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \ra1_ir_out~combout\(6),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_ZA7_1_out(13));

-- Location: PIN_AF21,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\ZA7_1_out[14]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \ra1_ir_out~combout\(7),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_ZA7_1_out(14));

-- Location: PIN_AG29,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\ZA7_1_out[15]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \ra1_ir_out~combout\(8),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_ZA7_1_out(15));

-- Location: PIN_V23,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\ZA7_2_out[0]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_ZA7_2_out(0));

-- Location: PIN_W30,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\ZA7_2_out[1]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_ZA7_2_out(1));

-- Location: PIN_AE24,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\ZA7_2_out[2]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_ZA7_2_out(2));

-- Location: PIN_AD4,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\ZA7_2_out[3]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_ZA7_2_out(3));

-- Location: PIN_T22,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\ZA7_2_out[4]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_ZA7_2_out(4));

-- Location: PIN_AB5,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\ZA7_2_out[5]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_ZA7_2_out(5));

-- Location: PIN_B26,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\ZA7_2_out[6]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_ZA7_2_out(6));

-- Location: PIN_W5,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\ZA7_2_out[7]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \ra2_ir_out~combout\(0),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_ZA7_2_out(7));

-- Location: PIN_AE1,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\ZA7_2_out[8]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \ra2_ir_out~combout\(1),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_ZA7_2_out(8));

-- Location: PIN_AA3,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\ZA7_2_out[9]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \ra2_ir_out~combout\(2),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_ZA7_2_out(9));

-- Location: PIN_V10,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\ZA7_2_out[10]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \ra2_ir_out~combout\(3),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_ZA7_2_out(10));

-- Location: PIN_T9,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\ZA7_2_out[11]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \ra2_ir_out~combout\(4),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_ZA7_2_out(11));

-- Location: PIN_P7,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\ZA7_2_out[12]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \ra2_ir_out~combout\(5),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_ZA7_2_out(12));

-- Location: PIN_T6,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\ZA7_2_out[13]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \ra2_ir_out~combout\(6),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_ZA7_2_out(13));

-- Location: PIN_N4,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\ZA7_2_out[14]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \ra2_ir_out~combout\(7),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_ZA7_2_out(14));

-- Location: PIN_P2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\ZA7_2_out[15]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \ra2_ir_out~combout\(8),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_ZA7_2_out(15));

-- Location: PIN_C10,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\S0~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \S0~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_S0);

-- Location: PIN_B8,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\S1~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \S1~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_S1);

-- Location: PIN_J12,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\S2~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \S2~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_S2);

-- Location: PIN_D8,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\S3~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \S3~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_S3);
END structure;


