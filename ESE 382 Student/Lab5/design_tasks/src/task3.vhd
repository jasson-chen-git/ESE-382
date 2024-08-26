-------------------------------------------------------------------------------
--
-- Title       : Design Task 3
-- Design      : Gray Code to Binary Code Decoder Described Using an If
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
-- Description : Repeat Task 2, except write the design description using an If
--					statement(s). Do not use variables in your description.
--					Again, be sure to use don�t cares to allow the synthesizer
--					and place and route tools to generate minimal logic. Name
--					the architecture gray_bin_if_vect.
--
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all; 

entity gray_bin is	
	port(
	g: in std_logic_vector(3 downto 0);
	b: out std_logic_vector(3 downto 0));	
end gray_bin;

architecture gray_bin_if_vect of gray_bin is
begin	
	p1: process (g)
	begin
		if g = "0000" then
			b <= "0000";
		elsif g = "0001" then
			b <= "0001";
		elsif g = "0011" then
			b <= "0010";
		elsif g = "0010" then
			b <= "0011";
		elsif g = "0110" then
			b <= "0100";
		elsif g = "0111" then
			b <= "0101";
		elsif g = "0101" then
			b <= "0110";
		elsif g = "0100" then
			b <= "0111";
		elsif g = "1100" then
			b <= "1000";
		elsif g = "1101" then
			b <= "1001";
		elsif g = "1111" then
			b <= "1010";
		elsif g = "1110" then
			b <= "1011";
		else
			b <= "----";
		end if;
	end process;
end gray_bin_if_vect;