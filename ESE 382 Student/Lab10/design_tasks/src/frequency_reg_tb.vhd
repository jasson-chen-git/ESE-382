---------------------------------------------------------------------------
----
--
-- Title : Design Task 2
-- Design : Frequency Register Testbench
-- Author : Jason Chen
-- Company : 112515450
--
---------------------------------------------------------------------------
----
--
-- Description : Write a non selfchecking testbench for the frequency
--				register.
--
---------------------------------------------------------------------------
----
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.all;

entity frequency_reg_tb is
	generic (a : positive := 14);
end entity;

architecture tb of frequency_reg_tb is
	signal load, clk, reset_bar : std_logic := '0';
	signal d, q : std_logic_vector(a-1 downto 0);
	constant period : time := 10ns;
	
begin
	UUT : entity frequency_reg port map(
		load => load, clk => clk,
		reset_bar => reset_bar,
		d => d, q => q
		);
		
	po : process
	begin
		reset_bar <= '1' after 2 * period;
		for i in 0 to 2**a loop	
			clk <= not clk;
			load <= to_unsigned(i, a)(5);
			d <= std_logic_vector(to_unsigned(i, a));
			wait for period;
		end loop;
		std.env.finish;
	end process;
end architecture;