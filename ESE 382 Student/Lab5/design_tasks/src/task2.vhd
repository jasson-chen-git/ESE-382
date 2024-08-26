-------------------------------------------------------------------------------
--
-- Title       : Design Task 2
-- Design      : Gray Code to Binary Code Decoder Described Using a Case 
--					Statement and Vector Inputs and Outputs 
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
-- Description : In this task you are also to write a design description for
--					the Gray Code to Binary Code Decoder that uses only a case
--					statement. Do not use variables in your description.
--					However, while the entity name and function remain the
--					same, the inputs and outputs are to be declared as vectors.
--					The input vector is named g and the output vector is named
--					b. Name the architecture gray_bin_case_vect.
--
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all; 

entity gray_bin is	
	port(
	g: in std_logic_vector(3 downto 0);
	b: out std_logic_vector(3 downto 0));	
end gray_bin;

architecture gray_bin_case_vect of gray_bin is
begin	
	p1: process (g)
	begin
		case g is
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
end gray_bin_case_vect;