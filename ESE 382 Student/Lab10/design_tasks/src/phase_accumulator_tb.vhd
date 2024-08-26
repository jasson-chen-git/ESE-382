---------------------------------------------------------------------------
----
--
-- Title : Design Task 3
-- Design : Phase Accumulator Testbench
-- Author : Jason Chen
-- Company : 112515450
--
---------------------------------------------------------------------------
----
--
-- Description : Write a non selfchecking testbench for the phase
--				accumulator.
--
---------------------------------------------------------------------------
----
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.all;

entity phase_accumulator_tb is
	generic(
		a : positive := 14;
		m : positive := 7
		);
end entity;

architecture tb of phase_accumulator_tb is
	signal clk, reset_bar, up, max, min : std_logic := '0';
	signal d : std_logic_vector(a-1 downto 0);
	signal q : std_logic_vector(m-1 downto 0);
	constant period : time := 10ns;
	
begin
	UUT : entity phase_accumulator port map(
		clk => clk, reset_bar => reset_bar,
		up => up, max => max, min => min,
		d => d, q => q);
	po : process 
	begin
		reset_bar <= '1' after 2 * period;
		for i in 0 to 2**a loop
			clk <= not clk;
			up <= to_unsigned(i, a)(12);
			d <= std_logic_vector(to_unsigned(i, a) / 1000);
			wait for period;
		end loop;
		std.env.finish;
	end process;
end architecture;