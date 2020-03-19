-- Copyright (C) 2018  Intel Corporation. All rights reserved.
-- Your use of Intel Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Intel Program License 
-- Subscription Agreement, the Intel Quartus Prime License Agreement,
-- the Intel FPGA IP License Agreement, or other applicable license
-- agreement, including, without limitation, that your use is for
-- the sole purpose of programming logic devices manufactured by
-- Intel and sold by Intel or its authorized distributors.  Please
-- refer to the applicable agreement for further details.

-- VENDOR "Altera"
-- PROGRAM "Quartus Prime"
-- VERSION "Version 18.1.0 Build 625 09/12/2018 SJ Lite Edition"

-- DATE "03/19/2020 18:33:31"

-- 
-- Device: Altera 5CGXFC7C7F23C8 Package FBGA484
-- 

-- 
-- This VHDL file should be used for ModelSim-Altera (VHDL) only
-- 

LIBRARY ALTERA;
LIBRARY ALTERA_LNSIM;
LIBRARY CYCLONEV;
LIBRARY IEEE;
USE ALTERA.ALTERA_PRIMITIVES_COMPONENTS.ALL;
USE ALTERA_LNSIM.ALTERA_LNSIM_COMPONENTS.ALL;
USE CYCLONEV.CYCLONEV_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	controller IS
    PORT (
	go : IN std_logic;
	clk : IN std_logic;
	rst : IN std_logic;
	zi : IN std_logic;
	en : OUT std_logic_vector(4 DOWNTO 0);
	gt : IN std_logic_vector(2 DOWNTO 0);
	done : OUT std_logic;
	s2 : OUT std_logic;
	s3 : OUT std_logic
	);
END controller;

-- Design Ports Information
-- en[0]	=>  Location: PIN_M22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- en[1]	=>  Location: PIN_K22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- en[2]	=>  Location: PIN_L18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- en[3]	=>  Location: PIN_K17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- en[4]	=>  Location: PIN_M20,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- done	=>  Location: PIN_N20,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- s2	=>  Location: PIN_N19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- s3	=>  Location: PIN_L19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- clk	=>  Location: PIN_M16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- rst	=>  Location: PIN_N16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- zi	=>  Location: PIN_N21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- go	=>  Location: PIN_M21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- gt[2]	=>  Location: PIN_L17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- gt[0]	=>  Location: PIN_L22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- gt[1]	=>  Location: PIN_M18,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF controller IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_go : std_logic;
SIGNAL ww_clk : std_logic;
SIGNAL ww_rst : std_logic;
SIGNAL ww_zi : std_logic;
SIGNAL ww_en : std_logic_vector(4 DOWNTO 0);
SIGNAL ww_gt : std_logic_vector(2 DOWNTO 0);
SIGNAL ww_done : std_logic;
SIGNAL ww_s2 : std_logic;
SIGNAL ww_s3 : std_logic;
SIGNAL \~QUARTUS_CREATED_GND~I_combout\ : std_logic;
SIGNAL \clk~input_o\ : std_logic;
SIGNAL \clk~inputCLKENA0_outclk\ : std_logic;
SIGNAL \go~input_o\ : std_logic;
SIGNAL \gt[0]~input_o\ : std_logic;
SIGNAL \zi~input_o\ : std_logic;
SIGNAL \gt[1]~input_o\ : std_logic;
SIGNAL \en~6_combout\ : std_logic;
SIGNAL \gt[2]~input_o\ : std_logic;
SIGNAL \rst~input_o\ : std_logic;
SIGNAL \en[0]~1_combout\ : std_logic;
SIGNAL \state[3]~1_combout\ : std_logic;
SIGNAL \state[3]~2_combout\ : std_logic;
SIGNAL \process_0~0_combout\ : std_logic;
SIGNAL \state[0]~0_combout\ : std_logic;
SIGNAL \state[1]~3_combout\ : std_logic;
SIGNAL \en[0]~2_combout\ : std_logic;
SIGNAL \state[1]~4_combout\ : std_logic;
SIGNAL \en~0_combout\ : std_logic;
SIGNAL \en[0]~reg0_q\ : std_logic;
SIGNAL \en[1]~3_combout\ : std_logic;
SIGNAL \en[1]~4_combout\ : std_logic;
SIGNAL \en[1]~reg0_q\ : std_logic;
SIGNAL \en[2]~reg0_q\ : std_logic;
SIGNAL \en~5_combout\ : std_logic;
SIGNAL \en[3]~reg0_q\ : std_logic;
SIGNAL \done~0_combout\ : std_logic;
SIGNAL \done~reg0_q\ : std_logic;
SIGNAL \s2~0_combout\ : std_logic;
SIGNAL \s2~1_combout\ : std_logic;
SIGNAL \s2~reg0_q\ : std_logic;
SIGNAL \s3~reg0_q\ : std_logic;
SIGNAL state : std_logic_vector(31 DOWNTO 0);
SIGNAL \ALT_INV_gt[1]~input_o\ : std_logic;
SIGNAL \ALT_INV_gt[0]~input_o\ : std_logic;
SIGNAL \ALT_INV_gt[2]~input_o\ : std_logic;
SIGNAL \ALT_INV_go~input_o\ : std_logic;
SIGNAL \ALT_INV_zi~input_o\ : std_logic;
SIGNAL \ALT_INV_rst~input_o\ : std_logic;
SIGNAL \ALT_INV_state[1]~3_combout\ : std_logic;
SIGNAL \ALT_INV_state[3]~1_combout\ : std_logic;
SIGNAL \ALT_INV_en~6_combout\ : std_logic;
SIGNAL \ALT_INV_process_0~0_combout\ : std_logic;
SIGNAL \ALT_INV_en[1]~3_combout\ : std_logic;
SIGNAL \ALT_INV_en[0]~2_combout\ : std_logic;
SIGNAL \ALT_INV_en[0]~1_combout\ : std_logic;
SIGNAL ALT_INV_state : std_logic_vector(3 DOWNTO 0);
SIGNAL \ALT_INV_done~reg0_q\ : std_logic;
SIGNAL \ALT_INV_en[1]~reg0_q\ : std_logic;

BEGIN

ww_go <= go;
ww_clk <= clk;
ww_rst <= rst;
ww_zi <= zi;
en <= ww_en;
ww_gt <= gt;
done <= ww_done;
s2 <= ww_s2;
s3 <= ww_s3;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;
\ALT_INV_gt[1]~input_o\ <= NOT \gt[1]~input_o\;
\ALT_INV_gt[0]~input_o\ <= NOT \gt[0]~input_o\;
\ALT_INV_gt[2]~input_o\ <= NOT \gt[2]~input_o\;
\ALT_INV_go~input_o\ <= NOT \go~input_o\;
\ALT_INV_zi~input_o\ <= NOT \zi~input_o\;
\ALT_INV_rst~input_o\ <= NOT \rst~input_o\;
\ALT_INV_state[1]~3_combout\ <= NOT \state[1]~3_combout\;
\ALT_INV_state[3]~1_combout\ <= NOT \state[3]~1_combout\;
\ALT_INV_en~6_combout\ <= NOT \en~6_combout\;
\ALT_INV_process_0~0_combout\ <= NOT \process_0~0_combout\;
\ALT_INV_en[1]~3_combout\ <= NOT \en[1]~3_combout\;
\ALT_INV_en[0]~2_combout\ <= NOT \en[0]~2_combout\;
\ALT_INV_en[0]~1_combout\ <= NOT \en[0]~1_combout\;
ALT_INV_state(1) <= NOT state(1);
ALT_INV_state(3) <= NOT state(3);
ALT_INV_state(0) <= NOT state(0);
\ALT_INV_done~reg0_q\ <= NOT \done~reg0_q\;
\ALT_INV_en[1]~reg0_q\ <= NOT \en[1]~reg0_q\;

-- Location: IOOBUF_X89_Y36_N39
\en[0]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \en[0]~reg0_q\,
	devoe => ww_devoe,
	o => ww_en(0));

-- Location: IOOBUF_X89_Y38_N56
\en[1]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \en[1]~reg0_q\,
	devoe => ww_devoe,
	o => ww_en(1));

-- Location: IOOBUF_X89_Y38_N22
\en[2]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \en[2]~reg0_q\,
	devoe => ww_devoe,
	o => ww_en(2));

-- Location: IOOBUF_X89_Y37_N5
\en[3]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \en[3]~reg0_q\,
	devoe => ww_devoe,
	o => ww_en(3));

-- Location: IOOBUF_X89_Y37_N39
\en[4]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \en[3]~reg0_q\,
	devoe => ww_devoe,
	o => ww_en(4));

-- Location: IOOBUF_X89_Y35_N79
\done~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \done~reg0_q\,
	devoe => ww_devoe,
	o => ww_done);

-- Location: IOOBUF_X89_Y36_N5
\s2~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \s2~reg0_q\,
	devoe => ww_devoe,
	o => ww_s2);

-- Location: IOOBUF_X89_Y38_N5
\s3~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \s3~reg0_q\,
	devoe => ww_devoe,
	o => ww_s3);

-- Location: IOIBUF_X89_Y35_N61
\clk~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_clk,
	o => \clk~input_o\);

-- Location: CLKCTRL_G10
\clk~inputCLKENA0\ : cyclonev_clkena
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	disable_mode => "low",
	ena_register_mode => "always enabled",
	ena_register_power_up => "high",
	test_syn => "high")
-- pragma translate_on
PORT MAP (
	inclk => \clk~input_o\,
	outclk => \clk~inputCLKENA0_outclk\);

-- Location: IOIBUF_X89_Y37_N55
\go~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_go,
	o => \go~input_o\);

-- Location: IOIBUF_X89_Y36_N55
\gt[0]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_gt(0),
	o => \gt[0]~input_o\);

-- Location: IOIBUF_X89_Y35_N95
\zi~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_zi,
	o => \zi~input_o\);

-- Location: IOIBUF_X89_Y36_N21
\gt[1]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_gt(1),
	o => \gt[1]~input_o\);

-- Location: LABCELL_X88_Y36_N57
\en~6\ : cyclonev_lcell_comb
-- Equation(s):
-- \en~6_combout\ = ( !\gt[0]~input_o\ & ( !\gt[1]~input_o\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111000011110000111100001111000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ALT_INV_gt[1]~input_o\,
	dataf => \ALT_INV_gt[0]~input_o\,
	combout => \en~6_combout\);

-- Location: IOIBUF_X89_Y37_N21
\gt[2]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_gt(2),
	o => \gt[2]~input_o\);

-- Location: IOIBUF_X89_Y35_N44
\rst~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_rst,
	o => \rst~input_o\);

-- Location: LABCELL_X88_Y36_N9
\en[0]~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \en[0]~1_combout\ = ( !\gt[2]~input_o\ & ( (!\gt[1]~input_o\ & !\gt[0]~input_o\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111000000000000111100000000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ALT_INV_gt[1]~input_o\,
	datad => \ALT_INV_gt[0]~input_o\,
	dataf => \ALT_INV_gt[2]~input_o\,
	combout => \en[0]~1_combout\);

-- Location: LABCELL_X88_Y36_N33
\state[3]~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \state[3]~1_combout\ = ( state(0) & ( !state(1) ) ) # ( !state(0) & ( (!state(1) & ((!\go~input_o\) # ((\gt[0]~input_o\) # (\gt[1]~input_o\)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1000110011001100100011001100110011001100110011001100110011001100",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_go~input_o\,
	datab => ALT_INV_state(1),
	datac => \ALT_INV_gt[1]~input_o\,
	datad => \ALT_INV_gt[0]~input_o\,
	dataf => ALT_INV_state(0),
	combout => \state[3]~1_combout\);

-- Location: LABCELL_X88_Y36_N48
\state[3]~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \state[3]~2_combout\ = ( state(3) & ( \state[3]~1_combout\ & ( (((\process_0~0_combout\ & \en[0]~1_combout\)) # (\zi~input_o\)) # (\rst~input_o\) ) ) ) # ( state(3) & ( !\state[3]~1_combout\ & ( (((\process_0~0_combout\ & \en[0]~1_combout\)) # 
-- (\zi~input_o\)) # (\rst~input_o\) ) ) ) # ( !state(3) & ( !\state[3]~1_combout\ & ( (!\rst~input_o\ & (!\zi~input_o\ & ((!\process_0~0_combout\) # (!\en[0]~1_combout\)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1000100010000000011101110111111100000000000000000111011101111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_rst~input_o\,
	datab => \ALT_INV_zi~input_o\,
	datac => \ALT_INV_process_0~0_combout\,
	datad => \ALT_INV_en[0]~1_combout\,
	datae => ALT_INV_state(3),
	dataf => \ALT_INV_state[3]~1_combout\,
	combout => \state[3]~2_combout\);

-- Location: FF_X88_Y36_N50
\state[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \state[3]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => state(3));

-- Location: LABCELL_X88_Y36_N21
\process_0~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \process_0~0_combout\ = ( !state(3) & ( (!state(0) & (\go~input_o\ & !state(1))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0010000000100000001000000010000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => ALT_INV_state(0),
	datab => \ALT_INV_go~input_o\,
	datac => ALT_INV_state(1),
	dataf => ALT_INV_state(3),
	combout => \process_0~0_combout\);

-- Location: LABCELL_X88_Y36_N0
\state[0]~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \state[0]~0_combout\ = ( state(0) & ( \process_0~0_combout\ & ( ((!\en~6_combout\) # ((!\gt[2]~input_o\) # (\rst~input_o\))) # (\zi~input_o\) ) ) ) # ( !state(0) & ( \process_0~0_combout\ & ( (!\zi~input_o\ & (!\en~6_combout\ & !\rst~input_o\)) ) ) ) # ( 
-- state(0) & ( !\process_0~0_combout\ & ( (\rst~input_o\) # (\zi~input_o\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000010101011111111110001000000000001111110111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_zi~input_o\,
	datab => \ALT_INV_en~6_combout\,
	datac => \ALT_INV_gt[2]~input_o\,
	datad => \ALT_INV_rst~input_o\,
	datae => ALT_INV_state(0),
	dataf => \ALT_INV_process_0~0_combout\,
	combout => \state[0]~0_combout\);

-- Location: FF_X88_Y36_N2
\state[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \state[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => state(0));

-- Location: LABCELL_X88_Y36_N18
\state[1]~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \state[1]~3_combout\ = ( !state(0) & ( (!\go~input_o\) # (\gt[0]~input_o\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1100111111001111110011111100111100000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \ALT_INV_go~input_o\,
	datac => \ALT_INV_gt[0]~input_o\,
	dataf => ALT_INV_state(0),
	combout => \state[1]~3_combout\);

-- Location: LABCELL_X88_Y36_N24
\en[0]~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \en[0]~2_combout\ = ( state(0) & ( state(1) & ( !\zi~input_o\ ) ) ) # ( !state(0) & ( state(1) & ( !\zi~input_o\ ) ) ) # ( state(0) & ( !state(1) & ( !\zi~input_o\ ) ) ) # ( !state(0) & ( !state(1) & ( (!\zi~input_o\ & ((!\go~input_o\) # 
-- ((!\en[0]~1_combout\) # (state(3))))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1110111100000000111111110000000011111111000000001111111100000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_go~input_o\,
	datab => \ALT_INV_en[0]~1_combout\,
	datac => ALT_INV_state(3),
	datad => \ALT_INV_zi~input_o\,
	datae => ALT_INV_state(0),
	dataf => ALT_INV_state(1),
	combout => \en[0]~2_combout\);

-- Location: LABCELL_X88_Y36_N6
\state[1]~4\ : cyclonev_lcell_comb
-- Equation(s):
-- \state[1]~4_combout\ = ( state(3) & ( (state(1) & ((!\en[0]~2_combout\) # (\rst~input_o\))) ) ) # ( !state(3) & ( ((!\state[1]~3_combout\ & (!\rst~input_o\ & \en[0]~2_combout\))) # (state(1)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000100011111111000010001111111100000000111100110000000011110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_state[1]~3_combout\,
	datab => \ALT_INV_rst~input_o\,
	datac => \ALT_INV_en[0]~2_combout\,
	datad => ALT_INV_state(1),
	dataf => ALT_INV_state(3),
	combout => \state[1]~4_combout\);

-- Location: FF_X88_Y36_N8
\state[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \state[1]~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => state(1));

-- Location: LABCELL_X88_Y36_N54
\en~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \en~0_combout\ = ( !state(3) & ( (state(1) & !state(0)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011000000110000001100000011000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => ALT_INV_state(1),
	datac => ALT_INV_state(0),
	dataf => ALT_INV_state(3),
	combout => \en~0_combout\);

-- Location: FF_X88_Y36_N31
\en[0]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	asdata => \en~0_combout\,
	clrn => \ALT_INV_rst~input_o\,
	sload => VCC,
	ena => \en[0]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \en[0]~reg0_q\);

-- Location: LABCELL_X88_Y36_N30
\en[1]~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \en[1]~3_combout\ = ( \en[1]~reg0_q\ & ( (\go~input_o\ & (!state(1) & !state(3))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000001000000010000000100000001000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_go~input_o\,
	datab => ALT_INV_state(1),
	datac => ALT_INV_state(3),
	dataf => \ALT_INV_en[1]~reg0_q\,
	combout => \en[1]~3_combout\);

-- Location: LABCELL_X88_Y36_N12
\en[1]~4\ : cyclonev_lcell_comb
-- Equation(s):
-- \en[1]~4_combout\ = ( \en[1]~reg0_q\ & ( state(0) & ( ((!state(3)) # ((\en[0]~1_combout\ & \en[1]~3_combout\))) # (\zi~input_o\) ) ) ) # ( !\en[1]~reg0_q\ & ( state(0) & ( (!\zi~input_o\ & ((!state(3)) # ((\en[0]~1_combout\ & \en[1]~3_combout\)))) # 
-- (\zi~input_o\ & (\en[0]~1_combout\ & ((\en[1]~3_combout\)))) ) ) ) # ( \en[1]~reg0_q\ & ( !state(0) & ( ((\en[0]~1_combout\ & \en[1]~3_combout\)) # (\zi~input_o\) ) ) ) # ( !\en[1]~reg0_q\ & ( !state(0) & ( (\en[0]~1_combout\ & \en[1]~3_combout\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000110011010101010111011110100000101100111111010111110111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_zi~input_o\,
	datab => \ALT_INV_en[0]~1_combout\,
	datac => ALT_INV_state(3),
	datad => \ALT_INV_en[1]~3_combout\,
	datae => \ALT_INV_en[1]~reg0_q\,
	dataf => ALT_INV_state(0),
	combout => \en[1]~4_combout\);

-- Location: FF_X88_Y36_N14
\en[1]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \en[1]~4_combout\,
	clrn => \ALT_INV_rst~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \en[1]~reg0_q\);

-- Location: FF_X88_Y36_N23
\en[2]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \process_0~0_combout\,
	clrn => \ALT_INV_rst~input_o\,
	ena => \en[0]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \en[2]~reg0_q\);

-- Location: LABCELL_X88_Y36_N42
\en~5\ : cyclonev_lcell_comb
-- Equation(s):
-- \en~5_combout\ = ( state(0) & ( !state(3) & ( state(1) ) ) ) # ( !state(0) & ( !state(3) & ( ((!\gt[1]~input_o\ & (\go~input_o\ & !\gt[0]~input_o\))) # (state(1)) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0010111100001111000011110000111100000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_gt[1]~input_o\,
	datab => \ALT_INV_go~input_o\,
	datac => ALT_INV_state(1),
	datad => \ALT_INV_gt[0]~input_o\,
	datae => ALT_INV_state(0),
	dataf => ALT_INV_state(3),
	combout => \en~5_combout\);

-- Location: FF_X88_Y36_N44
\en[3]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \en~5_combout\,
	clrn => \ALT_INV_rst~input_o\,
	ena => \en[0]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \en[3]~reg0_q\);

-- Location: LABCELL_X88_Y35_N12
\done~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \done~0_combout\ = ( \done~reg0_q\ ) # ( !\done~reg0_q\ & ( \zi~input_o\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111100001111111111111111111100001111000011111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ALT_INV_zi~input_o\,
	datae => \ALT_INV_done~reg0_q\,
	combout => \done~0_combout\);

-- Location: FF_X88_Y35_N13
\done~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \done~0_combout\,
	clrn => \ALT_INV_rst~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \done~reg0_q\);

-- Location: MLABCELL_X87_Y36_N27
\s2~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \s2~0_combout\ = ( !\gt[0]~input_o\ & ( \gt[1]~input_o\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101010101010101010101010100000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_gt[1]~input_o\,
	dataf => \ALT_INV_gt[0]~input_o\,
	combout => \s2~0_combout\);

-- Location: LABCELL_X88_Y36_N36
\s2~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \s2~1_combout\ = ( !state(0) & ( !state(3) & ( (!\zi~input_o\ & (!\en[0]~1_combout\ & (\go~input_o\ & !state(1)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000100000000000000000000000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_zi~input_o\,
	datab => \ALT_INV_en[0]~1_combout\,
	datac => \ALT_INV_go~input_o\,
	datad => ALT_INV_state(1),
	datae => ALT_INV_state(0),
	dataf => ALT_INV_state(3),
	combout => \s2~1_combout\);

-- Location: FF_X88_Y36_N58
\s2~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	asdata => \s2~0_combout\,
	clrn => \ALT_INV_rst~input_o\,
	sload => VCC,
	ena => \s2~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \s2~reg0_q\);

-- Location: FF_X88_Y36_N55
\s3~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	asdata => \en~6_combout\,
	clrn => \ALT_INV_rst~input_o\,
	sload => VCC,
	ena => \s2~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \s3~reg0_q\);

-- Location: LABCELL_X35_Y26_N0
\~QUARTUS_CREATED_GND~I\ : cyclonev_lcell_comb
-- Equation(s):

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
;
END structure;


