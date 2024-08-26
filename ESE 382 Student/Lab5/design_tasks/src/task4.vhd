-------------------------------------------------------------------------------
--
-- Title       : Design Task 4
-- Design      : Gray Code to Binary Code Decoder Described Using a Loop
--					Statement
-- Author      : Jason Chen
-- Company     : 112515450
--
-------------------------------------------------------------------------------
--
-- File        : gray_bin_case_vect.vhd
-- Generated   : Mon Feb 27
-- From        : interface description file
-- By          : Itf2Vhdl ver. 1.22
--
-------------------------------------------------------------------------------
--
-- Description : Write a design description for a 4-bit Gray to Binary Decoder
--					with vector input and outputs using looping. This
--					description will not be able to use don’t cares to simplify
--					the logic. You will need to use a variable(s) to implement
--					the algorithm using a loop.
--
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all; 

entity gray_bin is	
	port(
	g: in std_logic_vector(3 downto 0);
	b: out std_logic_vector(3 downto 0));	
end gray_bin;

architecture gray_bin_loop of gray_bin is

begin	
	p1: process (g)
	variable v : std_logic_vector(4 downto 0);
	begin
		v(4) := '0';
		for i in 3 downto 0 loop
			v(i) := g(i) xor v(i + 1);
			b(i) <= v(i);
		end loop;
	end process;
end gray_bin_loop;