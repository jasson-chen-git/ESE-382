---------------------------------------------------------------------------
----
--
-- Title : Design Task 1
-- Design : Exhaustive Self-Checking Testbench for smpl_combo Design
-- Author : Jason Chen
-- Company : 112515450		    
--
---------------------------------------------------------------------------
----
--
-- Description : Write an exhaustive self-checking testbench that can be
--					used to verify either of these designs. For a
--					selfchecking testbench to be effective, the code that
--					computes the expected values in the testbench must be
--					different than the code that computes the actual output
--					values in the design description.
--
---------------------------------------------------------------------------
----

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.all;

entity smpl_combo_selfcheck_tb is
end smpl_combo_selfcheck_tb;

architecture tb_architecture of smpl_combo_selfcheck_tb is

signal a, b, c : std_logic;
signal x, y : std_logic;
constant period: time := 20ns;

begin
	UUT : entity smpl_combo
		port map (a => a, b => b, c => c,
		x => x, y => y);
		
	tb : process
	begin
		for i in 0 to 7 loop
			(a, b, c) <= to_unsigned(i, 3);
			wait for period;
			
			assert(x = ((not a and not c) or (b and not c)) and
			y = ((a and b) or c))
			report "Error for input " & to_string(std_logic_vector'(a, b, c)) & 
				". Expected output " & to_string(std_logic_vector'(x, y)) & "."
				severity error;
		end loop;
		
		std.env.finish;
	end process;
end tb_architecture;
	