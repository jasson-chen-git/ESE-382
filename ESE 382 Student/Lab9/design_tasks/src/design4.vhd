---------------------------------------------------------------------------
----
--
-- Title : Design Task 4
-- Design : Simple DDS System
-- Author : Jason Chen
-- Company : 112515450
--
---------------------------------------------------------------------------
----
--
-- Description : This top level system has a structural architecture.
--
---------------------------------------------------------------------------
----
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.all;

entity simple_dds is
	port(
		clk, reset_bar : in std_logic;
		dac_sine_value : out std_logic_vector(7 downto 0)
		);
end entity;

architecture structural of simple_dds is
	signal pos_neg : std_logic;
	signal address, sine_value : std_logic_vector(6 downto 0);
begin
	qac : entity quad_address_counter port map(
		clk => clk, reset_bar => reset_bar, pos_neg => pos_neg, address => address);
	sta : entity sine_table port map(
		addr => address, sine_val => sine_value);
	ads : entity adder_subtractor port map(
		pos => pos_neg, sine_value => sine_value, dac_sine_val => dac_sine_value);
end architecture;