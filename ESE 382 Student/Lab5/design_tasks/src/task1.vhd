-------------------------------------------------------------------------------
--
-- Title       : Design Task 1
-- Design      : Gray Code to Binary Code Decoder Described Using a Case 
--					Statement and Scalar Inputs and Outputs 
-- Author      : Jason Chen
-- Company     : 112515450
--
-------------------------------------------------------------------------------
--
-- File        : gray_bin_case.vhd
-- Generated   : Mon Feb 27
-- From        : interface description file
-- By          : Itf2Vhdl ver. 1.22
--
-------------------------------------------------------------------------------
--
-- Description : In this task you are to write a design description for the
--					Gray Code to Binary Code Decoder that uses only a case
--					statement. Do not use variables in your description. Refer
--					to Laboratory 3 Design Task 2 for the basic definition of
--					the function of the Gray Code to Binary Code Decoder with
--					don’t care outputs. The entity name, inputs, outputs, and
--					function remain the same. Name the architecture
--					gray_bin_case.
--
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all; 

entity gray_bin is
	port(
	g3, g2, g1, g0 : in std_logic;
	b3, b2, b1, b0 : out std_logic);
end gray_bin;

architecture gray_bin_case of gray_bin is
signal b : std_logic_vector(3 downto 0);

begin
	(b3, b2, b1, b0) <= b;
	p1: process (g3, g2, g1, g0)
	begin
		case std_logic_vector'(g3, g2, g1, g0) is
			when "0000" => b <= "0000";
			when "0001" => b <= "0001";
			when "0011" => b <= "0010";
			when "0010" => b <= "0011";
			when "0110" => b <= "0100";
			when "0111" => b <= "0101";
			when "0101" => b <= "0110";
			when "0100" => b <= "0111";
			when "1100" => b <= "1000";
			when "1101" => b <= "1001";
			when "1111" => b <= "1010";
			when "1110" => b <= "1011";
			when others => b <= "----";				
		end case;
	end process;
end gray_bin_case;
