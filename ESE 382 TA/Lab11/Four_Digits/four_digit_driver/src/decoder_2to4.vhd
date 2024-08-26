-------------------------------------------------------------------------------
--
-- Title       : decoder_2to4
-- Design      : four_digit_driver
-- Author      : ESDL User
-- Company     : Stony Brook
--
-------------------------------------------------------------------------------
--
-- File        : E:\Lab11\Four_Digits\four_digit_driver\src\decoder_2to4.vhd
-- Generated   : Tue Apr 30 14:43:45 2024
-- From        : interface description file
-- By          : Itf2Vhdl ver. 1.22
--
-------------------------------------------------------------------------------
--
-- Description : 
--
-------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity decoder_2to4 is
port(
	b, a: in std_logic;
	y: out std_logic_vector(3 downto 0)
	);
end decoder_2to4;

--}} End of automatically maintained section

architecture decoder_2to4 of decoder_2to4 is
begin
	with std_logic_vector'(b, a) select y <=
	"0001" when "00", 
	"0010" when "01", 
	"0100" when "10", 
	"1000" when "11", 
	"0000" when others; 
end decoder_2to4;
