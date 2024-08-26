---------------------------------------------------------------------------
----
--
-- Title : Design Task 4
-- Design : Phase Accumulator FSM Testbench
-- Author : Jason Chen
-- Company : 112515450
--
---------------------------------------------------------------------------
----
--
-- Description : Write a non selfchecking testbench for the phase
--				accumulator FSM
--
---------------------------------------------------------------------------
----
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.all;

entity phase_accumulator_fsm_tb is
end entity;

architecture tb of phase_accumulator_fsm_tb is
	signal clk, reset_bar, max, min, up, pos : std_logic := '0';
	constant period : time := 10ns;

begin
	UUT : entity phase_accumulator_fsm port map(
		clk => clk, reset_bar => reset_bar,
		max => max, min => min, up => up, pos => pos
		);
		
	po : process
	begin
		reset_bar <= '1' after 2 * period;
		for i in 0 to 32 loop
			clk <= not clk;
			min <= to_unsigned(i, 6)(3);
			max <= not to_unsigned(i, 6)(3);
			wait for period;
		end loop;
		std.env.finish;
	end process;
end architecture;
	