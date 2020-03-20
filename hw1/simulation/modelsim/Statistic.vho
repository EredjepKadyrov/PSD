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

-- DATE "03/20/2020 15:31:01"

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

ENTITY 	statistic IS
    PORT (
	din : IN std_logic_vector(3 DOWNTO 0);
	dout : BUFFER std_logic_vector(3 DOWNTO 0);
	dout_mode : IN std_logic_vector(1 DOWNTO 0);
	clk : IN std_logic;
	go : IN std_logic;
	rst : IN std_logic;
	done : BUFFER std_logic
	);
END statistic;

-- Design Ports Information
-- dout[0]	=>  Location: PIN_K21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- dout[1]	=>  Location: PIN_M22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- dout[2]	=>  Location: PIN_K22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- dout[3]	=>  Location: PIN_M18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- done	=>  Location: PIN_N16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- dout_mode[0]	=>  Location: PIN_L18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- dout_mode[1]	=>  Location: PIN_L19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- din[1]	=>  Location: PIN_L17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- din[0]	=>  Location: PIN_M20,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- din[2]	=>  Location: PIN_L22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- clk	=>  Location: PIN_M16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- rst	=>  Location: PIN_N21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- din[3]	=>  Location: PIN_N19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- go	=>  Location: PIN_N20,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF statistic IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_din : std_logic_vector(3 DOWNTO 0);
SIGNAL ww_dout : std_logic_vector(3 DOWNTO 0);
SIGNAL ww_dout_mode : std_logic_vector(1 DOWNTO 0);
SIGNAL ww_clk : std_logic;
SIGNAL ww_go : std_logic;
SIGNAL ww_rst : std_logic;
SIGNAL ww_done : std_logic;
SIGNAL \~QUARTUS_CREATED_GND~I_combout\ : std_logic;
SIGNAL \clk~input_o\ : std_logic;
SIGNAL \clk~inputCLKENA0_outclk\ : std_logic;
SIGNAL \din[0]~input_o\ : std_logic;
SIGNAL \din[3]~input_o\ : std_logic;
SIGNAL \din[2]~input_o\ : std_logic;
SIGNAL \rst~input_o\ : std_logic;
SIGNAL \din[1]~input_o\ : std_logic;
SIGNAL \dpath|mux2|O[2]~2_combout\ : std_logic;
SIGNAL \go~input_o\ : std_logic;
SIGNAL \contr|en[4]~feeder_combout\ : std_logic;
SIGNAL \dpath|upc|count[0]~2_combout\ : std_logic;
SIGNAL \dpath|upc|count[1]~1_combout\ : std_logic;
SIGNAL \dpath|upc|count[1]~feeder_combout\ : std_logic;
SIGNAL \dpath|upc|count[1]~DUPLICATE_q\ : std_logic;
SIGNAL \dpath|upc|count[2]~0_combout\ : std_logic;
SIGNAL \dpath|upc|count[2]~feeder_combout\ : std_logic;
SIGNAL \dpath|upc|count[2]~DUPLICATE_q\ : std_logic;
SIGNAL \contr|en[4]~1_combout\ : std_logic;
SIGNAL \dpath|upc|count[0]~DUPLICATE_q\ : std_logic;
SIGNAL \contr|process_0~1_combout\ : std_logic;
SIGNAL \contr|regrise~0_combout\ : std_logic;
SIGNAL \contr|regrise~q\ : std_logic;
SIGNAL \contr|process_0~0_combout\ : std_logic;
SIGNAL \contr|state[0]~2_combout\ : std_logic;
SIGNAL \contr|state[0]~3_combout\ : std_logic;
SIGNAL \contr|state[3]~6_combout\ : std_logic;
SIGNAL \contr|en[4]~0_combout\ : std_logic;
SIGNAL \dpath|mux2|O[3]~3_combout\ : std_logic;
SIGNAL \dpath|LessThan1~2_combout\ : std_logic;
SIGNAL \dpath|LessThan0~2_combout\ : std_logic;
SIGNAL \dpath|LessThan1~1_combout\ : std_logic;
SIGNAL \dpath|LessThan0~0_combout\ : std_logic;
SIGNAL \contr|s2~0_combout\ : std_logic;
SIGNAL \contr|s2~3_combout\ : std_logic;
SIGNAL \contr|s2~q\ : std_logic;
SIGNAL \dpath|mux2|O[1]~1_combout\ : std_logic;
SIGNAL \dpath|mux2|O[0]~0_combout\ : std_logic;
SIGNAL \dpath|LessThan1~0_combout\ : std_logic;
SIGNAL \contr|s3~0_combout\ : std_logic;
SIGNAL \contr|s3~q\ : std_logic;
SIGNAL \dpath|mux3|O[3]~3_combout\ : std_logic;
SIGNAL \dpath|mux3|O[0]~0_combout\ : std_logic;
SIGNAL \dpath|mux3|O[1]~1_combout\ : std_logic;
SIGNAL \dpath|mux3|O[2]~2_combout\ : std_logic;
SIGNAL \contr|s2~1_combout\ : std_logic;
SIGNAL \contr|s2~2_combout\ : std_logic;
SIGNAL \contr|state[0]~5_combout\ : std_logic;
SIGNAL \contr|Equal2~1_combout\ : std_logic;
SIGNAL \dpath|LessThan0~1_combout\ : std_logic;
SIGNAL \contr|state[1]~1_combout\ : std_logic;
SIGNAL \contr|state[0]~0_combout\ : std_logic;
SIGNAL \contr|state[1]~4_combout\ : std_logic;
SIGNAL \contr|Equal2~0_combout\ : std_logic;
SIGNAL \dpath|reg4|o[0]~2_combout\ : std_logic;
SIGNAL \dpath|sumr|FA:1:FA_i|o_sum~combout\ : std_logic;
SIGNAL \dpath|sumr|FA:2:FA_i|o_sum~combout\ : std_logic;
SIGNAL \dout_mode[1]~input_o\ : std_logic;
SIGNAL \dout_mode[0]~input_o\ : std_logic;
SIGNAL \dpath|mux1|Mux3~0_combout\ : std_logic;
SIGNAL \dpath|sumr|FA:2:FA_i|o_carry~combout\ : std_logic;
SIGNAL \dpath|sumr|FA:3:FA_i|o_sum~combout\ : std_logic;
SIGNAL \dpath|mux1|Mux2~0_combout\ : std_logic;
SIGNAL \dpath|reg4|o[4]~0_combout\ : std_logic;
SIGNAL \dpath|mux1|Mux1~0_combout\ : std_logic;
SIGNAL \dpath|reg4|o[5]~1_combout\ : std_logic;
SIGNAL \dpath|mux1|Mux0~0_combout\ : std_logic;
SIGNAL \contr|done~0_combout\ : std_logic;
SIGNAL \contr|done~q\ : std_logic;
SIGNAL \dpath|reg2|o\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \dpath|reg4|o\ : std_logic_vector(5 DOWNTO 0);
SIGNAL \dpath|reg1|o\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \dpath|reg3|o\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \dpath|upc|count\ : std_logic_vector(2 DOWNTO 0);
SIGNAL \contr|en\ : std_logic_vector(4 DOWNTO 0);
SIGNAL \contr|state\ : std_logic_vector(31 DOWNTO 0);
SIGNAL \dpath|upc|ALT_INV_count[0]~DUPLICATE_q\ : std_logic;
SIGNAL \dpath|upc|ALT_INV_count[1]~DUPLICATE_q\ : std_logic;
SIGNAL \dpath|upc|ALT_INV_count[2]~DUPLICATE_q\ : std_logic;
SIGNAL \ALT_INV_go~input_o\ : std_logic;
SIGNAL \ALT_INV_din[3]~input_o\ : std_logic;
SIGNAL \ALT_INV_rst~input_o\ : std_logic;
SIGNAL \ALT_INV_din[2]~input_o\ : std_logic;
SIGNAL \ALT_INV_din[0]~input_o\ : std_logic;
SIGNAL \ALT_INV_din[1]~input_o\ : std_logic;
SIGNAL \ALT_INV_dout_mode[1]~input_o\ : std_logic;
SIGNAL \ALT_INV_dout_mode[0]~input_o\ : std_logic;
SIGNAL \contr|ALT_INV_process_0~1_combout\ : std_logic;
SIGNAL \contr|ALT_INV_state[0]~3_combout\ : std_logic;
SIGNAL \contr|ALT_INV_state[0]~2_combout\ : std_logic;
SIGNAL \contr|ALT_INV_state[1]~1_combout\ : std_logic;
SIGNAL \contr|ALT_INV_state[0]~0_combout\ : std_logic;
SIGNAL \dpath|upc|ALT_INV_count[1]~1_combout\ : std_logic;
SIGNAL \dpath|upc|ALT_INV_count[2]~0_combout\ : std_logic;
SIGNAL \contr|ALT_INV_s2~2_combout\ : std_logic;
SIGNAL \contr|ALT_INV_s2~1_combout\ : std_logic;
SIGNAL \contr|ALT_INV_s3~0_combout\ : std_logic;
SIGNAL \dpath|ALT_INV_LessThan0~2_combout\ : std_logic;
SIGNAL \dpath|ALT_INV_LessThan0~1_combout\ : std_logic;
SIGNAL \dpath|ALT_INV_LessThan1~2_combout\ : std_logic;
SIGNAL \dpath|ALT_INV_LessThan1~1_combout\ : std_logic;
SIGNAL \dpath|ALT_INV_LessThan0~0_combout\ : std_logic;
SIGNAL \dpath|ALT_INV_LessThan1~0_combout\ : std_logic;
SIGNAL \contr|ALT_INV_Equal2~1_combout\ : std_logic;
SIGNAL \contr|ALT_INV_process_0~0_combout\ : std_logic;
SIGNAL \contr|ALT_INV_regrise~q\ : std_logic;
SIGNAL \contr|ALT_INV_en[4]~0_combout\ : std_logic;
SIGNAL \contr|ALT_INV_Equal2~0_combout\ : std_logic;
SIGNAL \contr|ALT_INV_state\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \dpath|upc|ALT_INV_count\ : std_logic_vector(2 DOWNTO 0);
SIGNAL \dpath|sumr|FA:2:FA_i|ALT_INV_o_carry~combout\ : std_logic;
SIGNAL \contr|ALT_INV_s3~q\ : std_logic;
SIGNAL \contr|ALT_INV_s2~q\ : std_logic;
SIGNAL \contr|ALT_INV_en\ : std_logic_vector(3 DOWNTO 3);
SIGNAL \dpath|reg4|ALT_INV_o\ : std_logic_vector(5 DOWNTO 0);
SIGNAL \contr|ALT_INV_done~q\ : std_logic;
SIGNAL \dpath|reg3|ALT_INV_o\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \dpath|reg2|ALT_INV_o\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \dpath|reg1|ALT_INV_o\ : std_logic_vector(3 DOWNTO 0);

BEGIN

ww_din <= din;
dout <= ww_dout;
ww_dout_mode <= dout_mode;
ww_clk <= clk;
ww_go <= go;
ww_rst <= rst;
done <= ww_done;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;
\dpath|upc|ALT_INV_count[0]~DUPLICATE_q\ <= NOT \dpath|upc|count[0]~DUPLICATE_q\;
\dpath|upc|ALT_INV_count[1]~DUPLICATE_q\ <= NOT \dpath|upc|count[1]~DUPLICATE_q\;
\dpath|upc|ALT_INV_count[2]~DUPLICATE_q\ <= NOT \dpath|upc|count[2]~DUPLICATE_q\;
\ALT_INV_go~input_o\ <= NOT \go~input_o\;
\ALT_INV_din[3]~input_o\ <= NOT \din[3]~input_o\;
\ALT_INV_rst~input_o\ <= NOT \rst~input_o\;
\ALT_INV_din[2]~input_o\ <= NOT \din[2]~input_o\;
\ALT_INV_din[0]~input_o\ <= NOT \din[0]~input_o\;
\ALT_INV_din[1]~input_o\ <= NOT \din[1]~input_o\;
\ALT_INV_dout_mode[1]~input_o\ <= NOT \dout_mode[1]~input_o\;
\ALT_INV_dout_mode[0]~input_o\ <= NOT \dout_mode[0]~input_o\;
\contr|ALT_INV_process_0~1_combout\ <= NOT \contr|process_0~1_combout\;
\contr|ALT_INV_state[0]~3_combout\ <= NOT \contr|state[0]~3_combout\;
\contr|ALT_INV_state[0]~2_combout\ <= NOT \contr|state[0]~2_combout\;
\contr|ALT_INV_state[1]~1_combout\ <= NOT \contr|state[1]~1_combout\;
\contr|ALT_INV_state[0]~0_combout\ <= NOT \contr|state[0]~0_combout\;
\dpath|upc|ALT_INV_count[1]~1_combout\ <= NOT \dpath|upc|count[1]~1_combout\;
\dpath|upc|ALT_INV_count[2]~0_combout\ <= NOT \dpath|upc|count[2]~0_combout\;
\contr|ALT_INV_s2~2_combout\ <= NOT \contr|s2~2_combout\;
\contr|ALT_INV_s2~1_combout\ <= NOT \contr|s2~1_combout\;
\contr|ALT_INV_s3~0_combout\ <= NOT \contr|s3~0_combout\;
\dpath|ALT_INV_LessThan0~2_combout\ <= NOT \dpath|LessThan0~2_combout\;
\dpath|ALT_INV_LessThan0~1_combout\ <= NOT \dpath|LessThan0~1_combout\;
\dpath|ALT_INV_LessThan1~2_combout\ <= NOT \dpath|LessThan1~2_combout\;
\dpath|ALT_INV_LessThan1~1_combout\ <= NOT \dpath|LessThan1~1_combout\;
\dpath|ALT_INV_LessThan0~0_combout\ <= NOT \dpath|LessThan0~0_combout\;
\dpath|ALT_INV_LessThan1~0_combout\ <= NOT \dpath|LessThan1~0_combout\;
\contr|ALT_INV_Equal2~1_combout\ <= NOT \contr|Equal2~1_combout\;
\contr|ALT_INV_process_0~0_combout\ <= NOT \contr|process_0~0_combout\;
\contr|ALT_INV_regrise~q\ <= NOT \contr|regrise~q\;
\contr|ALT_INV_en[4]~0_combout\ <= NOT \contr|en[4]~0_combout\;
\contr|ALT_INV_Equal2~0_combout\ <= NOT \contr|Equal2~0_combout\;
\contr|ALT_INV_state\(3) <= NOT \contr|state\(3);
\contr|ALT_INV_state\(0) <= NOT \contr|state\(0);
\contr|ALT_INV_state\(1) <= NOT \contr|state\(1);
\dpath|upc|ALT_INV_count\(0) <= NOT \dpath|upc|count\(0);
\dpath|upc|ALT_INV_count\(1) <= NOT \dpath|upc|count\(1);
\dpath|upc|ALT_INV_count\(2) <= NOT \dpath|upc|count\(2);
\dpath|sumr|FA:2:FA_i|ALT_INV_o_carry~combout\ <= NOT \dpath|sumr|FA:2:FA_i|o_carry~combout\;
\contr|ALT_INV_s3~q\ <= NOT \contr|s3~q\;
\contr|ALT_INV_s2~q\ <= NOT \contr|s2~q\;
\contr|ALT_INV_en\(3) <= NOT \contr|en\(3);
\dpath|reg4|ALT_INV_o\(0) <= NOT \dpath|reg4|o\(0);
\dpath|reg4|ALT_INV_o\(1) <= NOT \dpath|reg4|o\(1);
\contr|ALT_INV_done~q\ <= NOT \contr|done~q\;
\dpath|reg3|ALT_INV_o\(3) <= NOT \dpath|reg3|o\(3);
\dpath|reg2|ALT_INV_o\(3) <= NOT \dpath|reg2|o\(3);
\dpath|reg1|ALT_INV_o\(3) <= NOT \dpath|reg1|o\(3);
\dpath|reg4|ALT_INV_o\(5) <= NOT \dpath|reg4|o\(5);
\dpath|reg3|ALT_INV_o\(2) <= NOT \dpath|reg3|o\(2);
\dpath|reg2|ALT_INV_o\(2) <= NOT \dpath|reg2|o\(2);
\dpath|reg1|ALT_INV_o\(2) <= NOT \dpath|reg1|o\(2);
\dpath|reg4|ALT_INV_o\(4) <= NOT \dpath|reg4|o\(4);
\dpath|reg3|ALT_INV_o\(1) <= NOT \dpath|reg3|o\(1);
\dpath|reg2|ALT_INV_o\(1) <= NOT \dpath|reg2|o\(1);
\dpath|reg1|ALT_INV_o\(1) <= NOT \dpath|reg1|o\(1);
\dpath|reg4|ALT_INV_o\(3) <= NOT \dpath|reg4|o\(3);
\dpath|reg3|ALT_INV_o\(0) <= NOT \dpath|reg3|o\(0);
\dpath|reg2|ALT_INV_o\(0) <= NOT \dpath|reg2|o\(0);
\dpath|reg1|ALT_INV_o\(0) <= NOT \dpath|reg1|o\(0);
\dpath|reg4|ALT_INV_o\(2) <= NOT \dpath|reg4|o\(2);

-- Location: IOOBUF_X89_Y38_N39
\dout[0]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \dpath|mux1|Mux3~0_combout\,
	devoe => ww_devoe,
	o => ww_dout(0));

-- Location: IOOBUF_X89_Y36_N39
\dout[1]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \dpath|mux1|Mux2~0_combout\,
	devoe => ww_devoe,
	o => ww_dout(1));

-- Location: IOOBUF_X89_Y38_N56
\dout[2]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \dpath|mux1|Mux1~0_combout\,
	devoe => ww_devoe,
	o => ww_dout(2));

-- Location: IOOBUF_X89_Y36_N22
\dout[3]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \dpath|mux1|Mux0~0_combout\,
	devoe => ww_devoe,
	o => ww_dout(3));

-- Location: IOOBUF_X89_Y35_N45
\done~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \contr|done~q\,
	devoe => ww_devoe,
	o => ww_done);

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

-- Location: IOIBUF_X89_Y37_N38
\din[0]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_din(0),
	o => \din[0]~input_o\);

-- Location: IOIBUF_X89_Y36_N4
\din[3]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_din(3),
	o => \din[3]~input_o\);

-- Location: IOIBUF_X89_Y36_N55
\din[2]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_din(2),
	o => \din[2]~input_o\);

-- Location: IOIBUF_X89_Y35_N95
\rst~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_rst,
	o => \rst~input_o\);

-- Location: IOIBUF_X89_Y37_N21
\din[1]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_din(1),
	o => \din[1]~input_o\);

-- Location: MLABCELL_X87_Y34_N27
\dpath|mux2|O[2]~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \dpath|mux2|O[2]~2_combout\ = ( \dpath|reg1|o\(2) & ( \contr|s2~q\ & ( \din[2]~input_o\ ) ) ) # ( !\dpath|reg1|o\(2) & ( \contr|s2~q\ & ( \din[2]~input_o\ ) ) ) # ( \dpath|reg1|o\(2) & ( !\contr|s2~q\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111101010101010101010101010101010101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_din[2]~input_o\,
	datae => \dpath|reg1|ALT_INV_o\(2),
	dataf => \contr|ALT_INV_s2~q\,
	combout => \dpath|mux2|O[2]~2_combout\);

-- Location: IOIBUF_X89_Y35_N78
\go~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_go,
	o => \go~input_o\);

-- Location: LABCELL_X88_Y35_N54
\contr|en[4]~feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \contr|en[4]~feeder_combout\ = ( \contr|Equal2~0_combout\ )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => \contr|ALT_INV_Equal2~0_combout\,
	combout => \contr|en[4]~feeder_combout\);

-- Location: LABCELL_X88_Y35_N21
\dpath|upc|count[0]~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \dpath|upc|count[0]~2_combout\ = ( !\dpath|upc|count[0]~DUPLICATE_q\ )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111111111111111111111111111100000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => \dpath|upc|ALT_INV_count[0]~DUPLICATE_q\,
	combout => \dpath|upc|count[0]~2_combout\);

-- Location: FF_X88_Y35_N19
\dpath|upc|count[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \contr|en\(4),
	asdata => \dpath|upc|count[0]~2_combout\,
	clrn => \ALT_INV_rst~input_o\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \dpath|upc|count\(0));

-- Location: LABCELL_X88_Y35_N30
\dpath|upc|count[1]~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \dpath|upc|count[1]~1_combout\ = ( \dpath|upc|count\(0) & ( !\dpath|upc|count[1]~DUPLICATE_q\ ) ) # ( !\dpath|upc|count\(0) & ( \dpath|upc|count[1]~DUPLICATE_q\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011111111000000001111111111111111000000001111111100000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \dpath|upc|ALT_INV_count[1]~DUPLICATE_q\,
	dataf => \dpath|upc|ALT_INV_count\(0),
	combout => \dpath|upc|count[1]~1_combout\);

-- Location: LABCELL_X88_Y35_N15
\dpath|upc|count[1]~feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \dpath|upc|count[1]~feeder_combout\ = ( \dpath|upc|count[1]~1_combout\ )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => \dpath|upc|ALT_INV_count[1]~1_combout\,
	combout => \dpath|upc|count[1]~feeder_combout\);

-- Location: FF_X88_Y35_N17
\dpath|upc|count[1]~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \contr|en\(4),
	d => \dpath|upc|count[1]~feeder_combout\,
	clrn => \ALT_INV_rst~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \dpath|upc|count[1]~DUPLICATE_q\);

-- Location: FF_X88_Y35_N43
\dpath|upc|count[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \contr|en\(4),
	d => \dpath|upc|count[2]~feeder_combout\,
	clrn => \ALT_INV_rst~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \dpath|upc|count\(2));

-- Location: FF_X88_Y35_N16
\dpath|upc|count[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \contr|en\(4),
	d => \dpath|upc|count[1]~feeder_combout\,
	clrn => \ALT_INV_rst~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \dpath|upc|count\(1));

-- Location: LABCELL_X88_Y35_N27
\dpath|upc|count[2]~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \dpath|upc|count[2]~0_combout\ = ( \dpath|upc|count\(2) & ( \dpath|upc|count\(1) & ( !\dpath|upc|count[0]~DUPLICATE_q\ ) ) ) # ( !\dpath|upc|count\(2) & ( \dpath|upc|count\(1) & ( \dpath|upc|count[0]~DUPLICATE_q\ ) ) ) # ( \dpath|upc|count\(2) & ( 
-- !\dpath|upc|count\(1) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000111111111111111100000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \dpath|upc|ALT_INV_count[0]~DUPLICATE_q\,
	datae => \dpath|upc|ALT_INV_count\(2),
	dataf => \dpath|upc|ALT_INV_count\(1),
	combout => \dpath|upc|count[2]~0_combout\);

-- Location: LABCELL_X88_Y35_N42
\dpath|upc|count[2]~feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \dpath|upc|count[2]~feeder_combout\ = ( \dpath|upc|count[2]~0_combout\ )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => \dpath|upc|ALT_INV_count[2]~0_combout\,
	combout => \dpath|upc|count[2]~feeder_combout\);

-- Location: FF_X88_Y35_N44
\dpath|upc|count[2]~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \contr|en\(4),
	d => \dpath|upc|count[2]~feeder_combout\,
	clrn => \ALT_INV_rst~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \dpath|upc|count[2]~DUPLICATE_q\);

-- Location: LABCELL_X88_Y35_N9
\contr|en[4]~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \contr|en[4]~1_combout\ = ( \contr|en[4]~0_combout\ & ( \contr|process_0~0_combout\ & ( (!\dpath|upc|count[0]~DUPLICATE_q\) # ((!\dpath|upc|count[1]~DUPLICATE_q\) # (\dpath|upc|count[2]~DUPLICATE_q\)) ) ) ) # ( !\contr|en[4]~0_combout\ & ( 
-- \contr|process_0~0_combout\ & ( (!\dpath|upc|count[0]~DUPLICATE_q\) # ((!\dpath|upc|count[1]~DUPLICATE_q\) # (\dpath|upc|count[2]~DUPLICATE_q\)) ) ) ) # ( \contr|en[4]~0_combout\ & ( !\contr|process_0~0_combout\ & ( (!\dpath|upc|count[0]~DUPLICATE_q\) # 
-- ((!\dpath|upc|count[1]~DUPLICATE_q\) # (\dpath|upc|count[2]~DUPLICATE_q\)) ) ) ) # ( !\contr|en[4]~0_combout\ & ( !\contr|process_0~0_combout\ & ( (\contr|state\(1) & ((!\dpath|upc|count[0]~DUPLICATE_q\) # ((!\dpath|upc|count[1]~DUPLICATE_q\) # 
-- (\dpath|upc|count[2]~DUPLICATE_q\)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111000001111111011101111111111101110111111111110111011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \dpath|upc|ALT_INV_count[0]~DUPLICATE_q\,
	datab => \dpath|upc|ALT_INV_count[1]~DUPLICATE_q\,
	datac => \contr|ALT_INV_state\(1),
	datad => \dpath|upc|ALT_INV_count[2]~DUPLICATE_q\,
	datae => \contr|ALT_INV_en[4]~0_combout\,
	dataf => \contr|ALT_INV_process_0~0_combout\,
	combout => \contr|en[4]~1_combout\);

-- Location: FF_X88_Y35_N56
\contr|en[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \contr|en[4]~feeder_combout\,
	clrn => \ALT_INV_rst~input_o\,
	ena => \contr|en[4]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \contr|en\(4));

-- Location: FF_X88_Y35_N20
\dpath|upc|count[0]~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \contr|en\(4),
	asdata => \dpath|upc|count[0]~2_combout\,
	clrn => \ALT_INV_rst~input_o\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \dpath|upc|count[0]~DUPLICATE_q\);

-- Location: MLABCELL_X87_Y35_N21
\contr|process_0~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \contr|process_0~1_combout\ = (!\contr|state\(0) & (!\contr|state\(1) & !\contr|state\(3)))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1000100000000000100010000000000010001000000000001000100000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \contr|ALT_INV_state\(0),
	datab => \contr|ALT_INV_state\(1),
	datad => \contr|ALT_INV_state\(3),
	combout => \contr|process_0~1_combout\);

-- Location: MLABCELL_X87_Y35_N54
\contr|regrise~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \contr|regrise~0_combout\ = ( \contr|regrise~q\ & ( \dpath|upc|count[2]~DUPLICATE_q\ & ( \go~input_o\ ) ) ) # ( !\contr|regrise~q\ & ( \dpath|upc|count[2]~DUPLICATE_q\ & ( (\go~input_o\ & \contr|process_0~1_combout\) ) ) ) # ( \contr|regrise~q\ & ( 
-- !\dpath|upc|count[2]~DUPLICATE_q\ & ( \go~input_o\ ) ) ) # ( !\contr|regrise~q\ & ( !\dpath|upc|count[2]~DUPLICATE_q\ & ( (\go~input_o\ & (\contr|process_0~1_combout\ & ((!\dpath|upc|count[0]~DUPLICATE_q\) # (!\dpath|upc|count[1]~DUPLICATE_q\)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000001110000011110000111100000000000011110000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \dpath|upc|ALT_INV_count[0]~DUPLICATE_q\,
	datab => \dpath|upc|ALT_INV_count[1]~DUPLICATE_q\,
	datac => \ALT_INV_go~input_o\,
	datad => \contr|ALT_INV_process_0~1_combout\,
	datae => \contr|ALT_INV_regrise~q\,
	dataf => \dpath|upc|ALT_INV_count[2]~DUPLICATE_q\,
	combout => \contr|regrise~0_combout\);

-- Location: FF_X87_Y35_N56
\contr|regrise\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \contr|regrise~0_combout\,
	ena => \ALT_INV_rst~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \contr|regrise~q\);

-- Location: MLABCELL_X87_Y35_N39
\contr|process_0~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \contr|process_0~0_combout\ = ( !\contr|state\(3) & ( !\contr|state\(0) & ( (\go~input_o\ & (!\contr|state\(1) & !\contr|regrise~q\)) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101000000000000000000000000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_go~input_o\,
	datac => \contr|ALT_INV_state\(1),
	datad => \contr|ALT_INV_regrise~q\,
	datae => \contr|ALT_INV_state\(3),
	dataf => \contr|ALT_INV_state\(0),
	combout => \contr|process_0~0_combout\);

-- Location: MLABCELL_X87_Y35_N30
\contr|state[0]~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \contr|state[0]~2_combout\ = ( !\contr|state\(1) & ( ((!\contr|state\(0) & ((!\go~input_o\) # (\contr|regrise~q\)))) # (\contr|state\(3)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1101010111011101110101011101110100000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \contr|ALT_INV_state\(3),
	datab => \contr|ALT_INV_state\(0),
	datac => \ALT_INV_go~input_o\,
	datad => \contr|ALT_INV_regrise~q\,
	dataf => \contr|ALT_INV_state\(1),
	combout => \contr|state[0]~2_combout\);

-- Location: MLABCELL_X87_Y35_N51
\contr|state[0]~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \contr|state[0]~3_combout\ = ( \dpath|upc|count[2]~DUPLICATE_q\ & ( (\contr|state[0]~2_combout\) # (\rst~input_o\) ) ) # ( !\dpath|upc|count[2]~DUPLICATE_q\ & ( (((\dpath|upc|count[1]~DUPLICATE_q\ & \dpath|upc|count[0]~DUPLICATE_q\)) # 
-- (\contr|state[0]~2_combout\)) # (\rst~input_o\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001111111111111000111111111111100001111111111110000111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \dpath|upc|ALT_INV_count[1]~DUPLICATE_q\,
	datab => \dpath|upc|ALT_INV_count[0]~DUPLICATE_q\,
	datac => \ALT_INV_rst~input_o\,
	datad => \contr|ALT_INV_state[0]~2_combout\,
	dataf => \dpath|upc|ALT_INV_count[2]~DUPLICATE_q\,
	combout => \contr|state[0]~3_combout\);

-- Location: MLABCELL_X87_Y35_N0
\contr|state[3]~6\ : cyclonev_lcell_comb
-- Equation(s):
-- \contr|state[3]~6_combout\ = ( !\contr|state\(3) & ( (!\contr|state[0]~3_combout\ & ((!\contr|process_0~0_combout\ & (((\contr|state\(1))))) # (\contr|process_0~0_combout\ & ((!\contr|s3~0_combout\ & ((\contr|state\(1)))) # (\contr|s3~0_combout\ & 
-- (\contr|s2~2_combout\)))))) ) ) # ( \contr|state\(3) & ( ((!\contr|process_0~0_combout\ & (!\contr|state\(0) & (\contr|state\(1)))) # (\contr|process_0~0_combout\ & (((!\contr|state\(0) & \contr|state\(1))) # (\contr|s3~0_combout\)))) # 
-- (\contr|state[0]~3_combout\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "on",
	lut_mask => "0000000011001100001100111111001100000100100011000111011111110111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \contr|ALT_INV_process_0~0_combout\,
	datab => \contr|ALT_INV_state[0]~3_combout\,
	datac => \contr|ALT_INV_state\(0),
	datad => \contr|ALT_INV_state\(1),
	datae => \contr|ALT_INV_state\(3),
	dataf => \contr|ALT_INV_s3~0_combout\,
	datag => \contr|ALT_INV_s2~2_combout\,
	combout => \contr|state[3]~6_combout\);

-- Location: FF_X87_Y35_N2
\contr|state[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \contr|state[3]~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \contr|state\(3));

-- Location: MLABCELL_X87_Y35_N33
\contr|en[4]~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \contr|en[4]~0_combout\ = ( \contr|state\(0) & ( !\contr|state\(3) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011111111000000001111111100000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \contr|ALT_INV_state\(3),
	dataf => \contr|ALT_INV_state\(0),
	combout => \contr|en[4]~0_combout\);

-- Location: FF_X87_Y35_N28
\contr|en[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	asdata => \contr|en[4]~0_combout\,
	clrn => \ALT_INV_rst~input_o\,
	sload => VCC,
	ena => \contr|en[4]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \contr|en\(1));

-- Location: FF_X87_Y34_N29
\dpath|reg2|o[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \dpath|mux2|O[2]~2_combout\,
	clrn => \ALT_INV_rst~input_o\,
	ena => \contr|en\(1),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \dpath|reg2|o\(2));

-- Location: FF_X88_Y34_N50
\dpath|reg1|o[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	asdata => \din[3]~input_o\,
	clrn => \ALT_INV_rst~input_o\,
	sload => VCC,
	ena => \contr|en\(0),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \dpath|reg1|o\(3));

-- Location: MLABCELL_X87_Y34_N45
\dpath|mux2|O[3]~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \dpath|mux2|O[3]~3_combout\ = ( \contr|s2~q\ & ( \din[3]~input_o\ ) ) # ( !\contr|s2~q\ & ( \dpath|reg1|o\(3) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011111111000000001111111100001111000011110000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ALT_INV_din[3]~input_o\,
	datad => \dpath|reg1|ALT_INV_o\(3),
	dataf => \contr|ALT_INV_s2~q\,
	combout => \dpath|mux2|O[3]~3_combout\);

-- Location: FF_X87_Y34_N47
\dpath|reg2|o[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \dpath|mux2|O[3]~3_combout\,
	clrn => \ALT_INV_rst~input_o\,
	ena => \contr|en\(1),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \dpath|reg2|o\(3));

-- Location: LABCELL_X88_Y34_N36
\dpath|LessThan1~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \dpath|LessThan1~2_combout\ = ( !\dpath|reg2|o\(2) & ( \dpath|reg2|o\(3) & ( (\din[3]~input_o\ & \din[2]~input_o\) ) ) ) # ( \dpath|reg2|o\(2) & ( !\dpath|reg2|o\(3) & ( \din[3]~input_o\ ) ) ) # ( !\dpath|reg2|o\(2) & ( !\dpath|reg2|o\(3) & ( 
-- (\din[2]~input_o\) # (\din[3]~input_o\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011111100111111001100110011001100000011000000110000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \ALT_INV_din[3]~input_o\,
	datac => \ALT_INV_din[2]~input_o\,
	datae => \dpath|reg2|ALT_INV_o\(2),
	dataf => \dpath|reg2|ALT_INV_o\(3),
	combout => \dpath|LessThan1~2_combout\);

-- Location: LABCELL_X88_Y34_N48
\dpath|LessThan0~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \dpath|LessThan0~2_combout\ = ( !\dpath|reg1|o\(2) & ( \dpath|reg1|o\(3) & ( (\din[3]~input_o\ & \din[2]~input_o\) ) ) ) # ( \dpath|reg1|o\(2) & ( !\dpath|reg1|o\(3) & ( \din[3]~input_o\ ) ) ) # ( !\dpath|reg1|o\(2) & ( !\dpath|reg1|o\(3) & ( 
-- (\din[2]~input_o\) # (\din[3]~input_o\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011111100111111001100110011001100000011000000110000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \ALT_INV_din[3]~input_o\,
	datac => \ALT_INV_din[2]~input_o\,
	datae => \dpath|reg1|ALT_INV_o\(2),
	dataf => \dpath|reg1|ALT_INV_o\(3),
	combout => \dpath|LessThan0~2_combout\);

-- Location: LABCELL_X88_Y34_N33
\dpath|LessThan1~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \dpath|LessThan1~1_combout\ = ( \dpath|reg2|o\(2) & ( \dpath|reg2|o\(3) & ( (\din[2]~input_o\ & \din[3]~input_o\) ) ) ) # ( !\dpath|reg2|o\(2) & ( \dpath|reg2|o\(3) & ( (!\din[2]~input_o\ & \din[3]~input_o\) ) ) ) # ( \dpath|reg2|o\(2) & ( 
-- !\dpath|reg2|o\(3) & ( (\din[2]~input_o\ & !\din[3]~input_o\) ) ) ) # ( !\dpath|reg2|o\(2) & ( !\dpath|reg2|o\(3) & ( (!\din[2]~input_o\ & !\din[3]~input_o\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1010000010100000010100000101000000001010000010100000010100000101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_din[2]~input_o\,
	datac => \ALT_INV_din[3]~input_o\,
	datae => \dpath|reg2|ALT_INV_o\(2),
	dataf => \dpath|reg2|ALT_INV_o\(3),
	combout => \dpath|LessThan1~1_combout\);

-- Location: FF_X88_Y34_N29
\dpath|reg1|o[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	asdata => \din[0]~input_o\,
	clrn => \ALT_INV_rst~input_o\,
	sload => VCC,
	ena => \contr|en\(0),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \dpath|reg1|o\(0));

-- Location: FF_X88_Y34_N26
\dpath|reg1|o[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	asdata => \din[1]~input_o\,
	clrn => \ALT_INV_rst~input_o\,
	sload => VCC,
	ena => \contr|en\(0),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \dpath|reg1|o\(1));

-- Location: LABCELL_X88_Y34_N24
\dpath|LessThan0~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \dpath|LessThan0~0_combout\ = ( !\dpath|reg1|o\(0) & ( \dpath|reg1|o\(1) & ( (\din[1]~input_o\ & \din[0]~input_o\) ) ) ) # ( \dpath|reg1|o\(0) & ( !\dpath|reg1|o\(1) & ( \din[1]~input_o\ ) ) ) # ( !\dpath|reg1|o\(0) & ( !\dpath|reg1|o\(1) & ( 
-- (\din[0]~input_o\) # (\din[1]~input_o\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101111101011111010101010101010100000101000001010000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_din[1]~input_o\,
	datac => \ALT_INV_din[0]~input_o\,
	datae => \dpath|reg1|ALT_INV_o\(0),
	dataf => \dpath|reg1|ALT_INV_o\(1),
	combout => \dpath|LessThan0~0_combout\);

-- Location: LABCELL_X88_Y34_N6
\contr|s2~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \contr|s2~0_combout\ = ( !\dpath|LessThan0~1_combout\ & ( \dpath|LessThan0~0_combout\ & ( (!\dpath|LessThan0~2_combout\ & (((\dpath|LessThan1~1_combout\ & \dpath|LessThan1~0_combout\)) # (\dpath|LessThan1~2_combout\))) ) ) ) # ( 
-- \dpath|LessThan0~1_combout\ & ( !\dpath|LessThan0~0_combout\ & ( (!\dpath|LessThan0~2_combout\ & (((\dpath|LessThan1~1_combout\ & \dpath|LessThan1~0_combout\)) # (\dpath|LessThan1~2_combout\))) ) ) ) # ( !\dpath|LessThan0~1_combout\ & ( 
-- !\dpath|LessThan0~0_combout\ & ( (!\dpath|LessThan0~2_combout\ & (((\dpath|LessThan1~1_combout\ & \dpath|LessThan1~0_combout\)) # (\dpath|LessThan1~2_combout\))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0100010001001100010001000100110001000100010011000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \dpath|ALT_INV_LessThan1~2_combout\,
	datab => \dpath|ALT_INV_LessThan0~2_combout\,
	datac => \dpath|ALT_INV_LessThan1~1_combout\,
	datad => \dpath|ALT_INV_LessThan1~0_combout\,
	datae => \dpath|ALT_INV_LessThan0~1_combout\,
	dataf => \dpath|ALT_INV_LessThan0~0_combout\,
	combout => \contr|s2~0_combout\);

-- Location: LABCELL_X88_Y34_N0
\contr|s2~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \contr|s2~3_combout\ = ( \contr|s3~0_combout\ & ( \contr|s2~2_combout\ & ( (\contr|process_0~0_combout\ & ((!\dpath|upc|count[1]~DUPLICATE_q\) # ((!\dpath|upc|count[0]~DUPLICATE_q\) # (\dpath|upc|count[2]~DUPLICATE_q\)))) ) ) ) # ( !\contr|s3~0_combout\ & 
-- ( \contr|s2~2_combout\ & ( (\contr|process_0~0_combout\ & ((!\dpath|upc|count[1]~DUPLICATE_q\) # ((!\dpath|upc|count[0]~DUPLICATE_q\) # (\dpath|upc|count[2]~DUPLICATE_q\)))) ) ) ) # ( !\contr|s3~0_combout\ & ( !\contr|s2~2_combout\ & ( 
-- (\contr|process_0~0_combout\ & ((!\dpath|upc|count[1]~DUPLICATE_q\) # ((!\dpath|upc|count[0]~DUPLICATE_q\) # (\dpath|upc|count[2]~DUPLICATE_q\)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011111011000000000000000000000000111110110000000011111011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \dpath|upc|ALT_INV_count[1]~DUPLICATE_q\,
	datab => \dpath|upc|ALT_INV_count[2]~DUPLICATE_q\,
	datac => \dpath|upc|ALT_INV_count[0]~DUPLICATE_q\,
	datad => \contr|ALT_INV_process_0~0_combout\,
	datae => \contr|ALT_INV_s3~0_combout\,
	dataf => \contr|ALT_INV_s2~2_combout\,
	combout => \contr|s2~3_combout\);

-- Location: FF_X88_Y34_N8
\contr|s2\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \contr|s2~0_combout\,
	clrn => \ALT_INV_rst~input_o\,
	ena => \contr|s2~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \contr|s2~q\);

-- Location: MLABCELL_X87_Y34_N36
\dpath|mux2|O[1]~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \dpath|mux2|O[1]~1_combout\ = ( \dpath|reg1|o\(1) & ( (!\contr|s2~q\) # (\din[1]~input_o\) ) ) # ( !\dpath|reg1|o\(1) & ( (\contr|s2~q\ & \din[1]~input_o\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000001100000011000000110000001111001111110011111100111111001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \contr|ALT_INV_s2~q\,
	datac => \ALT_INV_din[1]~input_o\,
	dataf => \dpath|reg1|ALT_INV_o\(1),
	combout => \dpath|mux2|O[1]~1_combout\);

-- Location: FF_X87_Y34_N38
\dpath|reg2|o[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \dpath|mux2|O[1]~1_combout\,
	clrn => \ALT_INV_rst~input_o\,
	ena => \contr|en\(1),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \dpath|reg2|o\(1));

-- Location: MLABCELL_X87_Y34_N39
\dpath|mux2|O[0]~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \dpath|mux2|O[0]~0_combout\ = ( \dpath|reg1|o\(0) & ( (!\contr|s2~q\) # (\din[0]~input_o\) ) ) # ( !\dpath|reg1|o\(0) & ( (\contr|s2~q\ & \din[0]~input_o\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000001100000011000000110000001111001111110011111100111111001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \contr|ALT_INV_s2~q\,
	datac => \ALT_INV_din[0]~input_o\,
	dataf => \dpath|reg1|ALT_INV_o\(0),
	combout => \dpath|mux2|O[0]~0_combout\);

-- Location: FF_X87_Y34_N41
\dpath|reg2|o[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \dpath|mux2|O[0]~0_combout\,
	clrn => \ALT_INV_rst~input_o\,
	ena => \contr|en\(1),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \dpath|reg2|o\(0));

-- Location: MLABCELL_X87_Y34_N42
\dpath|LessThan1~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \dpath|LessThan1~0_combout\ = ( \dpath|reg2|o\(0) & ( (\din[1]~input_o\ & !\dpath|reg2|o\(1)) ) ) # ( !\dpath|reg2|o\(0) & ( (!\din[0]~input_o\ & (\din[1]~input_o\ & !\dpath|reg2|o\(1))) # (\din[0]~input_o\ & ((!\dpath|reg2|o\(1)) # (\din[1]~input_o\))) ) 
-- )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011111100000011001111110000001100001111000000000000111100000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \ALT_INV_din[0]~input_o\,
	datac => \ALT_INV_din[1]~input_o\,
	datad => \dpath|reg2|ALT_INV_o\(1),
	dataf => \dpath|reg2|ALT_INV_o\(0),
	combout => \dpath|LessThan1~0_combout\);

-- Location: LABCELL_X88_Y34_N21
\contr|s3~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \contr|s3~0_combout\ = ( !\dpath|LessThan1~2_combout\ & ( \dpath|LessThan1~1_combout\ & ( (!\dpath|LessThan1~0_combout\ & (!\dpath|LessThan0~2_combout\ & ((!\dpath|LessThan0~1_combout\) # (!\dpath|LessThan0~0_combout\)))) ) ) ) # ( 
-- !\dpath|LessThan1~2_combout\ & ( !\dpath|LessThan1~1_combout\ & ( (!\dpath|LessThan0~2_combout\ & ((!\dpath|LessThan0~1_combout\) # (!\dpath|LessThan0~0_combout\))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111000010100000000000000000000011000000100000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \dpath|ALT_INV_LessThan0~1_combout\,
	datab => \dpath|ALT_INV_LessThan1~0_combout\,
	datac => \dpath|ALT_INV_LessThan0~2_combout\,
	datad => \dpath|ALT_INV_LessThan0~0_combout\,
	datae => \dpath|ALT_INV_LessThan1~2_combout\,
	dataf => \dpath|ALT_INV_LessThan1~1_combout\,
	combout => \contr|s3~0_combout\);

-- Location: FF_X88_Y34_N2
\contr|s3\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	asdata => \contr|s3~0_combout\,
	clrn => \ALT_INV_rst~input_o\,
	sload => VCC,
	ena => \contr|s2~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \contr|s3~q\);

-- Location: MLABCELL_X87_Y34_N21
\dpath|mux3|O[3]~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \dpath|mux3|O[3]~3_combout\ = ( \dpath|reg2|o\(3) & ( (!\contr|s3~q\) # (\din[3]~input_o\) ) ) # ( !\dpath|reg2|o\(3) & ( (\din[3]~input_o\ & \contr|s3~q\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000001111000000000000111111111111000011111111111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ALT_INV_din[3]~input_o\,
	datad => \contr|ALT_INV_s3~q\,
	dataf => \dpath|reg2|ALT_INV_o\(3),
	combout => \dpath|mux3|O[3]~3_combout\);

-- Location: FF_X87_Y35_N41
\contr|en[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \contr|process_0~0_combout\,
	clrn => \ALT_INV_rst~input_o\,
	ena => \contr|en[4]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \contr|en\(2));

-- Location: FF_X87_Y34_N23
\dpath|reg3|o[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \dpath|mux3|O[3]~3_combout\,
	clrn => \ALT_INV_rst~input_o\,
	ena => \contr|en\(2),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \dpath|reg3|o\(3));

-- Location: MLABCELL_X87_Y34_N54
\dpath|mux3|O[0]~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \dpath|mux3|O[0]~0_combout\ = ( \dpath|reg2|o\(0) & ( (!\contr|s3~q\) # (\din[0]~input_o\) ) ) # ( !\dpath|reg2|o\(0) & ( (\contr|s3~q\ & \din[0]~input_o\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000001010101000000000101010110101010111111111010101011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \contr|ALT_INV_s3~q\,
	datad => \ALT_INV_din[0]~input_o\,
	dataf => \dpath|reg2|ALT_INV_o\(0),
	combout => \dpath|mux3|O[0]~0_combout\);

-- Location: FF_X87_Y34_N56
\dpath|reg3|o[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \dpath|mux3|O[0]~0_combout\,
	clrn => \ALT_INV_rst~input_o\,
	ena => \contr|en\(2),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \dpath|reg3|o\(0));

-- Location: MLABCELL_X87_Y34_N57
\dpath|mux3|O[1]~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \dpath|mux3|O[1]~1_combout\ = ( \dpath|reg2|o\(1) & ( (!\contr|s3~q\) # (\din[1]~input_o\) ) ) # ( !\dpath|reg2|o\(1) & ( (\contr|s3~q\ & \din[1]~input_o\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000001010101000000000101010110101010111111111010101011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \contr|ALT_INV_s3~q\,
	datad => \ALT_INV_din[1]~input_o\,
	dataf => \dpath|reg2|ALT_INV_o\(1),
	combout => \dpath|mux3|O[1]~1_combout\);

-- Location: FF_X87_Y34_N59
\dpath|reg3|o[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \dpath|mux3|O[1]~1_combout\,
	clrn => \ALT_INV_rst~input_o\,
	ena => \contr|en\(2),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \dpath|reg3|o\(1));

-- Location: MLABCELL_X87_Y34_N18
\dpath|mux3|O[2]~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \dpath|mux3|O[2]~2_combout\ = ( \dpath|reg2|o\(2) & ( (!\contr|s3~q\) # (\din[2]~input_o\) ) ) # ( !\dpath|reg2|o\(2) & ( (\din[2]~input_o\ & \contr|s3~q\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000001111000000000000111111111111000011111111111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ALT_INV_din[2]~input_o\,
	datad => \contr|ALT_INV_s3~q\,
	dataf => \dpath|reg2|ALT_INV_o\(2),
	combout => \dpath|mux3|O[2]~2_combout\);

-- Location: FF_X87_Y34_N20
\dpath|reg3|o[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \dpath|mux3|O[2]~2_combout\,
	clrn => \ALT_INV_rst~input_o\,
	ena => \contr|en\(2),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \dpath|reg3|o\(2));

-- Location: MLABCELL_X87_Y34_N9
\contr|s2~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \contr|s2~1_combout\ = ( \dpath|reg3|o\(1) & ( \dpath|reg3|o\(2) & ( (\din[1]~input_o\ & (\din[2]~input_o\ & (\din[0]~input_o\ & !\dpath|reg3|o\(0)))) ) ) ) # ( !\dpath|reg3|o\(1) & ( \dpath|reg3|o\(2) & ( (\din[2]~input_o\ & (((\din[0]~input_o\ & 
-- !\dpath|reg3|o\(0))) # (\din[1]~input_o\))) ) ) ) # ( \dpath|reg3|o\(1) & ( !\dpath|reg3|o\(2) & ( ((\din[1]~input_o\ & (\din[0]~input_o\ & !\dpath|reg3|o\(0)))) # (\din[2]~input_o\) ) ) ) # ( !\dpath|reg3|o\(1) & ( !\dpath|reg3|o\(2) & ( 
-- (((\din[0]~input_o\ & !\dpath|reg3|o\(0))) # (\din[2]~input_o\)) # (\din[1]~input_o\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0111111101110111001101110011001100010011000100010000000100000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_din[1]~input_o\,
	datab => \ALT_INV_din[2]~input_o\,
	datac => \ALT_INV_din[0]~input_o\,
	datad => \dpath|reg3|ALT_INV_o\(0),
	datae => \dpath|reg3|ALT_INV_o\(1),
	dataf => \dpath|reg3|ALT_INV_o\(2),
	combout => \contr|s2~1_combout\);

-- Location: LABCELL_X88_Y34_N12
\contr|s2~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \contr|s2~2_combout\ = ( \dpath|reg3|o\(3) & ( \contr|s2~1_combout\ & ( \din[3]~input_o\ ) ) ) # ( !\dpath|reg3|o\(3) & ( \contr|s2~1_combout\ ) ) # ( !\dpath|reg3|o\(3) & ( !\contr|s2~1_combout\ & ( \din[3]~input_o\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011001100110011000000000000000011111111111111110011001100110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \ALT_INV_din[3]~input_o\,
	datae => \dpath|reg3|ALT_INV_o\(3),
	dataf => \contr|ALT_INV_s2~1_combout\,
	combout => \contr|s2~2_combout\);

-- Location: MLABCELL_X87_Y35_N42
\contr|state[0]~5\ : cyclonev_lcell_comb
-- Equation(s):
-- \contr|state[0]~5_combout\ = ( \contr|state\(0) & ( \contr|Equal2~0_combout\ & ( (!\contr|s2~2_combout\) # (((!\contr|process_0~0_combout\) # (!\contr|s3~0_combout\)) # (\contr|state[0]~3_combout\)) ) ) ) # ( !\contr|state\(0) & ( \contr|Equal2~0_combout\ 
-- & ( (!\contr|state[0]~3_combout\ & ((!\contr|process_0~0_combout\) # (!\contr|s3~0_combout\))) ) ) ) # ( \contr|state\(0) & ( !\contr|Equal2~0_combout\ & ( ((\contr|process_0~0_combout\ & ((!\contr|s2~2_combout\) # (!\contr|s3~0_combout\)))) # 
-- (\contr|state[0]~3_combout\) ) ) ) # ( !\contr|state\(0) & ( !\contr|Equal2~0_combout\ & ( (!\contr|state[0]~3_combout\ & (\contr|process_0~0_combout\ & !\contr|s3~0_combout\)) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000110000000000001111110011101111001100110000001111111111111011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \contr|ALT_INV_s2~2_combout\,
	datab => \contr|ALT_INV_state[0]~3_combout\,
	datac => \contr|ALT_INV_process_0~0_combout\,
	datad => \contr|ALT_INV_s3~0_combout\,
	datae => \contr|ALT_INV_state\(0),
	dataf => \contr|ALT_INV_Equal2~0_combout\,
	combout => \contr|state[0]~5_combout\);

-- Location: FF_X87_Y35_N44
\contr|state[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \contr|state[0]~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \contr|state\(0));

-- Location: MLABCELL_X87_Y35_N12
\contr|Equal2~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \contr|Equal2~1_combout\ = (!\contr|state\(0) & (!\contr|state\(3) & \contr|state\(1)))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011000000000000001100000000000000110000000000000011000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \contr|ALT_INV_state\(0),
	datac => \contr|ALT_INV_state\(3),
	datad => \contr|ALT_INV_state\(1),
	combout => \contr|Equal2~1_combout\);

-- Location: FF_X87_Y35_N13
\contr|en[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \contr|Equal2~1_combout\,
	clrn => \ALT_INV_rst~input_o\,
	ena => \contr|en[4]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \contr|en\(0));

-- Location: FF_X88_Y34_N59
\dpath|reg1|o[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	asdata => \din[2]~input_o\,
	clrn => \ALT_INV_rst~input_o\,
	sload => VCC,
	ena => \contr|en\(0),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \dpath|reg1|o\(2));

-- Location: LABCELL_X88_Y34_N54
\dpath|LessThan0~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \dpath|LessThan0~1_combout\ = ( \dpath|reg1|o\(2) & ( \dpath|reg1|o\(3) & ( (\din[3]~input_o\ & \din[2]~input_o\) ) ) ) # ( !\dpath|reg1|o\(2) & ( \dpath|reg1|o\(3) & ( (\din[3]~input_o\ & !\din[2]~input_o\) ) ) ) # ( \dpath|reg1|o\(2) & ( 
-- !\dpath|reg1|o\(3) & ( (!\din[3]~input_o\ & \din[2]~input_o\) ) ) ) # ( !\dpath|reg1|o\(2) & ( !\dpath|reg1|o\(3) & ( (!\din[3]~input_o\ & !\din[2]~input_o\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1100000011000000000011000000110000110000001100000000001100000011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \ALT_INV_din[3]~input_o\,
	datac => \ALT_INV_din[2]~input_o\,
	datae => \dpath|reg1|ALT_INV_o\(2),
	dataf => \dpath|reg1|ALT_INV_o\(3),
	combout => \dpath|LessThan0~1_combout\);

-- Location: MLABCELL_X87_Y35_N24
\contr|state[1]~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \contr|state[1]~1_combout\ = ( \dpath|LessThan0~0_combout\ & ( \contr|en[4]~0_combout\ & ( (\contr|process_0~0_combout\ & ((\dpath|LessThan0~2_combout\) # (\dpath|LessThan0~1_combout\))) ) ) ) # ( !\dpath|LessThan0~0_combout\ & ( \contr|en[4]~0_combout\ & 
-- ( (\contr|process_0~0_combout\ & \dpath|LessThan0~2_combout\) ) ) ) # ( \dpath|LessThan0~0_combout\ & ( !\contr|en[4]~0_combout\ & ( (!\contr|process_0~0_combout\ & (((!\contr|Equal2~1_combout\)))) # (\contr|process_0~0_combout\ & 
-- (((\dpath|LessThan0~2_combout\)) # (\dpath|LessThan0~1_combout\))) ) ) ) # ( !\dpath|LessThan0~0_combout\ & ( !\contr|en[4]~0_combout\ & ( (!\contr|process_0~0_combout\ & (!\contr|Equal2~1_combout\)) # (\contr|process_0~0_combout\ & 
-- ((\dpath|LessThan0~2_combout\))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1100000011001111110001011100111100000000000011110000010100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \dpath|ALT_INV_LessThan0~1_combout\,
	datab => \contr|ALT_INV_Equal2~1_combout\,
	datac => \contr|ALT_INV_process_0~0_combout\,
	datad => \dpath|ALT_INV_LessThan0~2_combout\,
	datae => \dpath|ALT_INV_LessThan0~0_combout\,
	dataf => \contr|ALT_INV_en[4]~0_combout\,
	combout => \contr|state[1]~1_combout\);

-- Location: MLABCELL_X87_Y35_N15
\contr|state[0]~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \contr|state[0]~0_combout\ = ( \contr|s3~0_combout\ & ( (\contr|process_0~0_combout\ & !\contr|s2~2_combout\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000001111000000000000111100000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \contr|ALT_INV_process_0~0_combout\,
	datad => \contr|ALT_INV_s2~2_combout\,
	dataf => \contr|ALT_INV_s3~0_combout\,
	combout => \contr|state[0]~0_combout\);

-- Location: MLABCELL_X87_Y35_N6
\contr|state[1]~4\ : cyclonev_lcell_comb
-- Equation(s):
-- \contr|state[1]~4_combout\ = ( \contr|state\(1) & ( \contr|state\(0) & ( (!\contr|state[1]~1_combout\) # ((\contr|state[0]~0_combout\) # (\contr|state[0]~3_combout\)) ) ) ) # ( !\contr|state\(1) & ( \contr|state\(0) & ( (!\contr|state[1]~1_combout\ & 
-- (!\contr|state[0]~3_combout\ & !\contr|state[0]~0_combout\)) ) ) ) # ( \contr|state\(1) & ( !\contr|state\(0) & ( (!\contr|state[1]~1_combout\) # (((\contr|state[0]~0_combout\) # (\contr|state\(3))) # (\contr|state[0]~3_combout\)) ) ) ) # ( 
-- !\contr|state\(1) & ( !\contr|state\(0) & ( (!\contr|state[1]~1_combout\ & (!\contr|state[0]~3_combout\ & !\contr|state[0]~0_combout\)) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1000100000000000101111111111111110001000000000001011101111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \contr|ALT_INV_state[1]~1_combout\,
	datab => \contr|ALT_INV_state[0]~3_combout\,
	datac => \contr|ALT_INV_state\(3),
	datad => \contr|ALT_INV_state[0]~0_combout\,
	datae => \contr|ALT_INV_state\(1),
	dataf => \contr|ALT_INV_state\(0),
	combout => \contr|state[1]~4_combout\);

-- Location: FF_X87_Y35_N8
\contr|state[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \contr|state[1]~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \contr|state\(1));

-- Location: MLABCELL_X87_Y35_N18
\contr|Equal2~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \contr|Equal2~0_combout\ = ( \contr|state\(3) & ( (\contr|state\(1) & !\contr|state\(0)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000110011000000000011001100000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \contr|ALT_INV_state\(1),
	datad => \contr|ALT_INV_state\(0),
	dataf => \contr|ALT_INV_state\(3),
	combout => \contr|Equal2~0_combout\);

-- Location: FF_X87_Y35_N38
\contr|en[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	asdata => \contr|Equal2~0_combout\,
	clrn => \ALT_INV_rst~input_o\,
	sload => VCC,
	ena => \contr|en[4]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \contr|en\(3));

-- Location: LABCELL_X85_Y34_N33
\dpath|reg4|o[0]~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \dpath|reg4|o[0]~2_combout\ = ( \dpath|reg4|o\(0) & ( (!\din[0]~input_o\) # (!\contr|en\(3)) ) ) # ( !\dpath|reg4|o\(0) & ( (\din[0]~input_o\ & \contr|en\(3)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000001010101111111111010101000000000010101011111111110101010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_din[0]~input_o\,
	datad => \contr|ALT_INV_en\(3),
	datae => \dpath|reg4|ALT_INV_o\(0),
	combout => \dpath|reg4|o[0]~2_combout\);

-- Location: FF_X85_Y34_N35
\dpath|reg4|o[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \dpath|reg4|o[0]~2_combout\,
	clrn => \ALT_INV_rst~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \dpath|reg4|o\(0));

-- Location: LABCELL_X85_Y34_N39
\dpath|sumr|FA:1:FA_i|o_sum\ : cyclonev_lcell_comb
-- Equation(s):
-- \dpath|sumr|FA:1:FA_i|o_sum~combout\ = ( \dpath|reg4|o\(1) & ( \dpath|reg4|o\(0) & ( !\din[0]~input_o\ $ (\din[1]~input_o\) ) ) ) # ( !\dpath|reg4|o\(1) & ( \dpath|reg4|o\(0) & ( !\din[0]~input_o\ $ (!\din[1]~input_o\) ) ) ) # ( \dpath|reg4|o\(1) & ( 
-- !\dpath|reg4|o\(0) & ( !\din[1]~input_o\ ) ) ) # ( !\dpath|reg4|o\(1) & ( !\dpath|reg4|o\(0) & ( \din[1]~input_o\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111100001111111100001111000001011010010110101010010110100101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_din[0]~input_o\,
	datac => \ALT_INV_din[1]~input_o\,
	datae => \dpath|reg4|ALT_INV_o\(1),
	dataf => \dpath|reg4|ALT_INV_o\(0),
	combout => \dpath|sumr|FA:1:FA_i|o_sum~combout\);

-- Location: FF_X85_Y34_N41
\dpath|reg4|o[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \dpath|sumr|FA:1:FA_i|o_sum~combout\,
	clrn => \ALT_INV_rst~input_o\,
	ena => \contr|en\(3),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \dpath|reg4|o\(1));

-- Location: LABCELL_X85_Y34_N0
\dpath|sumr|FA:2:FA_i|o_sum\ : cyclonev_lcell_comb
-- Equation(s):
-- \dpath|sumr|FA:2:FA_i|o_sum~combout\ = ( \dpath|reg4|o\(2) & ( \dpath|reg4|o\(1) & ( !\din[2]~input_o\ $ ((((\dpath|reg4|o\(0) & \din[0]~input_o\)) # (\din[1]~input_o\))) ) ) ) # ( !\dpath|reg4|o\(2) & ( \dpath|reg4|o\(1) & ( !\din[2]~input_o\ $ 
-- (((!\din[1]~input_o\ & ((!\dpath|reg4|o\(0)) # (!\din[0]~input_o\))))) ) ) ) # ( \dpath|reg4|o\(2) & ( !\dpath|reg4|o\(1) & ( !\din[2]~input_o\ $ (((\dpath|reg4|o\(0) & (\din[1]~input_o\ & \din[0]~input_o\)))) ) ) ) # ( !\dpath|reg4|o\(2) & ( 
-- !\dpath|reg4|o\(1) & ( !\din[2]~input_o\ $ (((!\dpath|reg4|o\(0)) # ((!\din[1]~input_o\) # (!\din[0]~input_o\)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000111111110111111100000000100110111110010001100100000110111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \dpath|reg4|ALT_INV_o\(0),
	datab => \ALT_INV_din[1]~input_o\,
	datac => \ALT_INV_din[0]~input_o\,
	datad => \ALT_INV_din[2]~input_o\,
	datae => \dpath|reg4|ALT_INV_o\(2),
	dataf => \dpath|reg4|ALT_INV_o\(1),
	combout => \dpath|sumr|FA:2:FA_i|o_sum~combout\);

-- Location: FF_X85_Y34_N2
\dpath|reg4|o[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \dpath|sumr|FA:2:FA_i|o_sum~combout\,
	clrn => \ALT_INV_rst~input_o\,
	ena => \contr|en\(3),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \dpath|reg4|o\(2));

-- Location: IOIBUF_X89_Y38_N4
\dout_mode[1]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_dout_mode(1),
	o => \dout_mode[1]~input_o\);

-- Location: IOIBUF_X89_Y38_N21
\dout_mode[0]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_dout_mode(0),
	o => \dout_mode[0]~input_o\);

-- Location: MLABCELL_X87_Y34_N48
\dpath|mux1|Mux3~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \dpath|mux1|Mux3~0_combout\ = ( \dout_mode[0]~input_o\ & ( \dpath|reg2|o\(0) & ( (!\dout_mode[1]~input_o\ & ((\dpath|reg1|o\(0)))) # (\dout_mode[1]~input_o\ & (\dpath|reg3|o\(0))) ) ) ) # ( !\dout_mode[0]~input_o\ & ( \dpath|reg2|o\(0) & ( 
-- (\dout_mode[1]~input_o\) # (\dpath|reg4|o\(2)) ) ) ) # ( \dout_mode[0]~input_o\ & ( !\dpath|reg2|o\(0) & ( (!\dout_mode[1]~input_o\ & ((\dpath|reg1|o\(0)))) # (\dout_mode[1]~input_o\ & (\dpath|reg3|o\(0))) ) ) ) # ( !\dout_mode[0]~input_o\ & ( 
-- !\dpath|reg2|o\(0) & ( (\dpath|reg4|o\(2) & !\dout_mode[1]~input_o\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0100010001000100000000111100111101110111011101110000001111001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \dpath|reg4|ALT_INV_o\(2),
	datab => \ALT_INV_dout_mode[1]~input_o\,
	datac => \dpath|reg3|ALT_INV_o\(0),
	datad => \dpath|reg1|ALT_INV_o\(0),
	datae => \ALT_INV_dout_mode[0]~input_o\,
	dataf => \dpath|reg2|ALT_INV_o\(0),
	combout => \dpath|mux1|Mux3~0_combout\);

-- Location: LABCELL_X85_Y34_N12
\dpath|sumr|FA:2:FA_i|o_carry\ : cyclonev_lcell_comb
-- Equation(s):
-- \dpath|sumr|FA:2:FA_i|o_carry~combout\ = ( \dpath|reg4|o\(2) & ( \dpath|reg4|o\(1) & ( (((\din[0]~input_o\ & \dpath|reg4|o\(0))) # (\din[2]~input_o\)) # (\din[1]~input_o\) ) ) ) # ( !\dpath|reg4|o\(2) & ( \dpath|reg4|o\(1) & ( (\din[2]~input_o\ & 
-- (((\din[0]~input_o\ & \dpath|reg4|o\(0))) # (\din[1]~input_o\))) ) ) ) # ( \dpath|reg4|o\(2) & ( !\dpath|reg4|o\(1) & ( ((\din[0]~input_o\ & (\din[1]~input_o\ & \dpath|reg4|o\(0)))) # (\din[2]~input_o\) ) ) ) # ( !\dpath|reg4|o\(2) & ( !\dpath|reg4|o\(1) 
-- & ( (\din[0]~input_o\ & (\din[1]~input_o\ & (\dpath|reg4|o\(0) & \din[2]~input_o\))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000001000000011111111100000000001101110011011111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_din[0]~input_o\,
	datab => \ALT_INV_din[1]~input_o\,
	datac => \dpath|reg4|ALT_INV_o\(0),
	datad => \ALT_INV_din[2]~input_o\,
	datae => \dpath|reg4|ALT_INV_o\(2),
	dataf => \dpath|reg4|ALT_INV_o\(1),
	combout => \dpath|sumr|FA:2:FA_i|o_carry~combout\);

-- Location: LABCELL_X85_Y34_N42
\dpath|sumr|FA:3:FA_i|o_sum\ : cyclonev_lcell_comb
-- Equation(s):
-- \dpath|sumr|FA:3:FA_i|o_sum~combout\ = ( \dpath|reg4|o\(3) & ( \dpath|sumr|FA:2:FA_i|o_carry~combout\ & ( \din[3]~input_o\ ) ) ) # ( !\dpath|reg4|o\(3) & ( \dpath|sumr|FA:2:FA_i|o_carry~combout\ & ( !\din[3]~input_o\ ) ) ) # ( \dpath|reg4|o\(3) & ( 
-- !\dpath|sumr|FA:2:FA_i|o_carry~combout\ & ( !\din[3]~input_o\ ) ) ) # ( !\dpath|reg4|o\(3) & ( !\dpath|sumr|FA:2:FA_i|o_carry~combout\ & ( \din[3]~input_o\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011001100110011110011001100110011001100110011000011001100110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \ALT_INV_din[3]~input_o\,
	datae => \dpath|reg4|ALT_INV_o\(3),
	dataf => \dpath|sumr|FA:2:FA_i|ALT_INV_o_carry~combout\,
	combout => \dpath|sumr|FA:3:FA_i|o_sum~combout\);

-- Location: FF_X85_Y34_N44
\dpath|reg4|o[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \dpath|sumr|FA:3:FA_i|o_sum~combout\,
	clrn => \ALT_INV_rst~input_o\,
	ena => \contr|en\(3),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \dpath|reg4|o\(3));

-- Location: MLABCELL_X87_Y34_N30
\dpath|mux1|Mux2~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \dpath|mux1|Mux2~0_combout\ = ( \dpath|reg3|o\(1) & ( \dpath|reg2|o\(1) & ( ((!\dout_mode[0]~input_o\ & (\dpath|reg4|o\(3))) # (\dout_mode[0]~input_o\ & ((\dpath|reg1|o\(1))))) # (\dout_mode[1]~input_o\) ) ) ) # ( !\dpath|reg3|o\(1) & ( \dpath|reg2|o\(1) 
-- & ( (!\dout_mode[1]~input_o\ & ((!\dout_mode[0]~input_o\ & (\dpath|reg4|o\(3))) # (\dout_mode[0]~input_o\ & ((\dpath|reg1|o\(1)))))) # (\dout_mode[1]~input_o\ & (((!\dout_mode[0]~input_o\)))) ) ) ) # ( \dpath|reg3|o\(1) & ( !\dpath|reg2|o\(1) & ( 
-- (!\dout_mode[1]~input_o\ & ((!\dout_mode[0]~input_o\ & (\dpath|reg4|o\(3))) # (\dout_mode[0]~input_o\ & ((\dpath|reg1|o\(1)))))) # (\dout_mode[1]~input_o\ & (((\dout_mode[0]~input_o\)))) ) ) ) # ( !\dpath|reg3|o\(1) & ( !\dpath|reg2|o\(1) & ( 
-- (!\dout_mode[1]~input_o\ & ((!\dout_mode[0]~input_o\ & (\dpath|reg4|o\(3))) # (\dout_mode[0]~input_o\ & ((\dpath|reg1|o\(1)))))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0100000001001100010000110100111101110000011111000111001101111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \dpath|reg4|ALT_INV_o\(3),
	datab => \ALT_INV_dout_mode[1]~input_o\,
	datac => \ALT_INV_dout_mode[0]~input_o\,
	datad => \dpath|reg1|ALT_INV_o\(1),
	datae => \dpath|reg3|ALT_INV_o\(1),
	dataf => \dpath|reg2|ALT_INV_o\(1),
	combout => \dpath|mux1|Mux2~0_combout\);

-- Location: LABCELL_X85_Y34_N48
\dpath|reg4|o[4]~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \dpath|reg4|o[4]~0_combout\ = ( \dpath|reg4|o\(4) & ( \dpath|sumr|FA:2:FA_i|o_carry~combout\ & ( (!\contr|en\(3)) # ((!\din[3]~input_o\ & !\dpath|reg4|o\(3))) ) ) ) # ( !\dpath|reg4|o\(4) & ( \dpath|sumr|FA:2:FA_i|o_carry~combout\ & ( (\contr|en\(3) & 
-- ((\dpath|reg4|o\(3)) # (\din[3]~input_o\))) ) ) ) # ( \dpath|reg4|o\(4) & ( !\dpath|sumr|FA:2:FA_i|o_carry~combout\ & ( (!\din[3]~input_o\) # ((!\contr|en\(3)) # (!\dpath|reg4|o\(3))) ) ) ) # ( !\dpath|reg4|o\(4) & ( 
-- !\dpath|sumr|FA:2:FA_i|o_carry~combout\ & ( (\din[3]~input_o\ & (\contr|en\(3) & \dpath|reg4|o\(3))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000011111111111111110000000011000011111111110011110000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \ALT_INV_din[3]~input_o\,
	datac => \contr|ALT_INV_en\(3),
	datad => \dpath|reg4|ALT_INV_o\(3),
	datae => \dpath|reg4|ALT_INV_o\(4),
	dataf => \dpath|sumr|FA:2:FA_i|ALT_INV_o_carry~combout\,
	combout => \dpath|reg4|o[4]~0_combout\);

-- Location: FF_X85_Y34_N50
\dpath|reg4|o[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \dpath|reg4|o[4]~0_combout\,
	clrn => \ALT_INV_rst~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \dpath|reg4|o\(4));

-- Location: MLABCELL_X87_Y34_N12
\dpath|mux1|Mux1~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \dpath|mux1|Mux1~0_combout\ = ( \dpath|reg1|o\(2) & ( \dout_mode[1]~input_o\ & ( (!\dout_mode[0]~input_o\ & (\dpath|reg2|o\(2))) # (\dout_mode[0]~input_o\ & ((\dpath|reg3|o\(2)))) ) ) ) # ( !\dpath|reg1|o\(2) & ( \dout_mode[1]~input_o\ & ( 
-- (!\dout_mode[0]~input_o\ & (\dpath|reg2|o\(2))) # (\dout_mode[0]~input_o\ & ((\dpath|reg3|o\(2)))) ) ) ) # ( \dpath|reg1|o\(2) & ( !\dout_mode[1]~input_o\ & ( (\dout_mode[0]~input_o\) # (\dpath|reg4|o\(4)) ) ) ) # ( !\dpath|reg1|o\(2) & ( 
-- !\dout_mode[1]~input_o\ & ( (\dpath|reg4|o\(4) & !\dout_mode[0]~input_o\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011001100000000001100111111111101010101000011110101010100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \dpath|reg2|ALT_INV_o\(2),
	datab => \dpath|reg4|ALT_INV_o\(4),
	datac => \dpath|reg3|ALT_INV_o\(2),
	datad => \ALT_INV_dout_mode[0]~input_o\,
	datae => \dpath|reg1|ALT_INV_o\(2),
	dataf => \ALT_INV_dout_mode[1]~input_o\,
	combout => \dpath|mux1|Mux1~0_combout\);

-- Location: LABCELL_X85_Y34_N54
\dpath|reg4|o[5]~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \dpath|reg4|o[5]~1_combout\ = ( \dpath|reg4|o\(5) & ( \dpath|sumr|FA:2:FA_i|o_carry~combout\ & ( (!\contr|en\(3)) # ((!\dpath|reg4|o\(4)) # ((!\dpath|reg4|o\(3) & !\din[3]~input_o\))) ) ) ) # ( !\dpath|reg4|o\(5) & ( \dpath|sumr|FA:2:FA_i|o_carry~combout\ 
-- & ( (\contr|en\(3) & (\dpath|reg4|o\(4) & ((\din[3]~input_o\) # (\dpath|reg4|o\(3))))) ) ) ) # ( \dpath|reg4|o\(5) & ( !\dpath|sumr|FA:2:FA_i|o_carry~combout\ & ( (!\contr|en\(3)) # ((!\dpath|reg4|o\(3)) # ((!\dpath|reg4|o\(4)) # (!\din[3]~input_o\))) ) ) 
-- ) # ( !\dpath|reg4|o\(5) & ( !\dpath|sumr|FA:2:FA_i|o_carry~combout\ & ( (\contr|en\(3) & (\dpath|reg4|o\(3) & (\dpath|reg4|o\(4) & \din[3]~input_o\))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000001111111111111111000000001000001011111111011111010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \contr|ALT_INV_en\(3),
	datab => \dpath|reg4|ALT_INV_o\(3),
	datac => \dpath|reg4|ALT_INV_o\(4),
	datad => \ALT_INV_din[3]~input_o\,
	datae => \dpath|reg4|ALT_INV_o\(5),
	dataf => \dpath|sumr|FA:2:FA_i|ALT_INV_o_carry~combout\,
	combout => \dpath|reg4|o[5]~1_combout\);

-- Location: FF_X85_Y34_N55
\dpath|reg4|o[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \dpath|reg4|o[5]~1_combout\,
	clrn => \ALT_INV_rst~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \dpath|reg4|o\(5));

-- Location: MLABCELL_X87_Y34_N0
\dpath|mux1|Mux0~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \dpath|mux1|Mux0~0_combout\ = ( \dpath|reg3|o\(3) & ( \dpath|reg2|o\(3) & ( ((!\dout_mode[0]~input_o\ & (\dpath|reg4|o\(5))) # (\dout_mode[0]~input_o\ & ((\dpath|reg1|o\(3))))) # (\dout_mode[1]~input_o\) ) ) ) # ( !\dpath|reg3|o\(3) & ( \dpath|reg2|o\(3) 
-- & ( (!\dout_mode[0]~input_o\ & (((\dout_mode[1]~input_o\)) # (\dpath|reg4|o\(5)))) # (\dout_mode[0]~input_o\ & (((!\dout_mode[1]~input_o\ & \dpath|reg1|o\(3))))) ) ) ) # ( \dpath|reg3|o\(3) & ( !\dpath|reg2|o\(3) & ( (!\dout_mode[0]~input_o\ & 
-- (\dpath|reg4|o\(5) & (!\dout_mode[1]~input_o\))) # (\dout_mode[0]~input_o\ & (((\dpath|reg1|o\(3)) # (\dout_mode[1]~input_o\)))) ) ) ) # ( !\dpath|reg3|o\(3) & ( !\dpath|reg2|o\(3) & ( (!\dout_mode[1]~input_o\ & ((!\dout_mode[0]~input_o\ & 
-- (\dpath|reg4|o\(5))) # (\dout_mode[0]~input_o\ & ((\dpath|reg1|o\(3)))))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0100000001110000010000110111001101001100011111000100111101111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \dpath|reg4|ALT_INV_o\(5),
	datab => \ALT_INV_dout_mode[0]~input_o\,
	datac => \ALT_INV_dout_mode[1]~input_o\,
	datad => \dpath|reg1|ALT_INV_o\(3),
	datae => \dpath|reg3|ALT_INV_o\(3),
	dataf => \dpath|reg2|ALT_INV_o\(3),
	combout => \dpath|mux1|Mux0~0_combout\);

-- Location: MLABCELL_X87_Y35_N48
\contr|done~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \contr|done~0_combout\ = ( \dpath|upc|count[2]~DUPLICATE_q\ & ( \contr|done~q\ ) ) # ( !\dpath|upc|count[2]~DUPLICATE_q\ & ( ((\dpath|upc|count[0]~DUPLICATE_q\ & \dpath|upc|count[1]~DUPLICATE_q\)) # (\contr|done~q\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000001111111111000000111111111100000000111111110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \dpath|upc|ALT_INV_count[0]~DUPLICATE_q\,
	datac => \dpath|upc|ALT_INV_count[1]~DUPLICATE_q\,
	datad => \contr|ALT_INV_done~q\,
	dataf => \dpath|upc|ALT_INV_count[2]~DUPLICATE_q\,
	combout => \contr|done~0_combout\);

-- Location: FF_X87_Y35_N49
\contr|done\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \contr|done~0_combout\,
	clrn => \ALT_INV_rst~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \contr|done~q\);

-- Location: MLABCELL_X39_Y53_N3
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


