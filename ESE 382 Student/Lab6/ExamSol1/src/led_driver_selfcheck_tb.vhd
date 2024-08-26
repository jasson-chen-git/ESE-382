library ieee;
---------------------------------------------------------------------------
----
--
-- Title : Design Task 2
-- Design : Exhaustive Self-Checking Testbench for led_driver Design
-- Author : Jason Chen
-- Company : 112515450
--								   
---------------------------------------------------------------------------
----
--
-- Description : Write an exhaustive self-checking testbench that can be
--					used to verify either of these designs. Use	a case
--					statement in your testbench to compute the expected
--					outputs. For each input combination	where the decoder
--					fails, your testbench must write a message to the
--					console indicating the input combination, the expected
--					output, and the actual output.
--
---------------------------------------------------------------------------
----

use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.all;

entity led_driver_selfcheck_tb is
end led_driver_selfcheck_tb;

architecture tb_architecture of led_driver_selfcheck_tb is

signal a : std_logic_vector(3 downto 0);
signal cold, normal, hot : std_logic;
constant period: time := 20ns;

begin
	UUT : entity led_driver
		port map (adc => a,
		cold => cold, normal => normal, hot => hot);
		
	tb : process
	begin
		for i in 0 to 15 loop
			a <= std_logic_vector(to_unsigned(i, 4));
			wait for period;
			
			case a is 
				when "0000" | "0001" | "0010" | "0011" | "0100" | "0101" 
					=> assert((cold, normal, hot) = "011")
					report "Error for input " & to_string(std_logic_vector'(a)) &
						". Expected output 011."
						severity error; 
				when "1101" | "1110" | "1111" 
					=> assert((cold, normal, hot) = "110")
					report "Error for input " & to_string(std_logic_vector'(a)) &
						". Expected output 101."
						severity error;
				when others => assert((cold, normal, hot) = "101")
				report "Error for input " & to_string(std_logic_vector'(a)) &
						". Expected output 110."
						severity error;
			end case;
		end loop;
		
		std.env.finish;
	end process;
end tb_architecture;	