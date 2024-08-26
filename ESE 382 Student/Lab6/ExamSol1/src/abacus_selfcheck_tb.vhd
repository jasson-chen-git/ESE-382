---------------------------------------------------------------------------
----
--
-- Title : Design Task 3
-- Design : Non-Exhaustive Self-Checking Testbench for suan_pan_decoder
-- Author : Jason Chen
-- Company : 112515450
--
---------------------------------------------------------------------------
----
--
-- Description : Write a non-exhaustive self-checking testbench that can be
--					used to verify either of these designs. Use table
--					lookup to determine	the input combinations to apply.
--					Use the same index value used for the table lookup to
--					get and input stimulus value, to determine the
--					corresponding expected output value. For each stimulus
--					value where the decoder fails, your testbench must
--					write a message to the console indicating the input
--					combination, the expected output, and the actual
--					output. Take advantage of the to_string function in
--					VHDL 2008 to display the input vector value as a string
--					in the report string.
--
---------------------------------------------------------------------------
----

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.all;

entity abacus_selfcheck_tb is
end abacus_selfcheck_tb;

architecture tb_architecture of abacus_selfcheck_tb is

signal sp : std_logic_vector(8 downto 0);
signal d, c, b, a : std_logic;
constant period: time := 20ns;

type gram_table is array (0 to 9) of std_logic_vector(8 downto 0);
constant sp_pattern : gram_table :=
("110011111", "110101111", "110110111", "110111011", "110111101",
"101011111", "101101111", "101110111", "101111011", "101111101");

type bcd_table is array (0 to 9) of std_logic_vector(3 downto 0);
constant bit_pattern : bcd_table :=
("0000", "0001", "0010", "0011", "0100",
"0101", "0110", "0111", "1000", "1001");

begin
	UUT : entity abacus
		port map (sp => sp,
		d => d, c => c, b => b, a => a);
		
	tb : process
	begin
		for i in 0 to 9 loop
			sp <= sp_pattern(i);
			
			wait for period;
			
			assert((d, c, b, a) = bit_pattern(i))
			report "Error for input " & to_string(std_logic_vector'(sp)) &
				". Expected output " & to_string(std_logic_vector'((d, c, b, a))) & "."
				severity error;
		end loop;
	
		std.env.finish;
	end process;
end tb_architecture;