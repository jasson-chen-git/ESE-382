---------------------------------------------------------------------------
----
--
-- Title : Design Task 6
-- Design : DDS System with Frequency Selection
-- Author : Jason Chen
-- Company : 112515450
--
---------------------------------------------------------------------------
----
--
-- Description : Write a structural description with the following
--				component entities:
--
--				U1 : Edge Detector FSM
--				U2 : Frequency Register
--				U3 : Phase Accumulator
--				U4 : Phase Accumulator FSM
--				U5 : Sine Lookup Table
--				U6 : Adder Subtractor
--
---------------------------------------------------------------------------
----
library ieee;
use ieee.std_logic_1164.all;
use work.all;

entity dds_w_freq_select is
	generic(
		a : positive := 14;
		m : positive := 7
		);
	port(
		clk, reset_bar, load_freq : in std_logic;
		freq_val : in std_logic_vector(a-1 downto 0);
		dac_sine_value : out std_logic_vector(7 downto 0);
		pos_sine : out std_logic
		);
end entity;

architecture structure of dds_w_freq_select is
	signal sig_edge, max, min, up, pos : std_logic;
	signal q_p, sine_val : std_logic_vector(m-1 downto 0);
	signal q_f : std_logic_vector(a-1 downto 0);
	
begin
	u1 : entity edge_det port map(
		clk => clk, rst_bar => reset_bar,
		sig => load_freq, pos => '1', sig_edge => sig_edge
		);
		
	u2 : entity frequency_reg port map(
		clk => clk, reset_bar => reset_bar,
		load => sig_edge, d => freq_val, q => q_f 
		);
		
	u3 : entity phase_accumulator port map(
		clk => clk, reset_bar => reset_bar, up => up,
		d => q_f, max => max, min => min, q => q_p
		);
		
	u4 : entity phase_accumulator_fsm port map(
		clk => clk, reset_bar => reset_bar, max => max,
		min => min, up => up, pos => pos
		);
		
	u5 : entity sine_table port map(
		addr => q_p, sine_val => sine_val
		);
		
	u6 : entity adder_subtractor port map(
		pos => pos, sine_value => sine_val,
		dac_sine_val => dac_sine_value
		);
	pos_sine <= pos;
end architecture;	