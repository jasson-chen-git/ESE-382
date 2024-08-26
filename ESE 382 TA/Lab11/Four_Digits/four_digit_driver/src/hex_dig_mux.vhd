-------------------------------------------------------------------------------
--
-- Title       : hex_dig_mux
-- Design      : four_digit_driver
-- Author      : ESDL User
-- Company     : Stony Brook
--
-------------------------------------------------------------------------------
--
-- File        : E:\Lab11\Four_Digits\four_digit_driver\src\hex_dig_mux.vhd
-- Generated   : Tue Apr 30 14:53:49 2024
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

entity hex_dig_mux is
port(
	hex_dig_0, hex_dig_1, hex_dig_2, hex_dig_3: in std_logic_vector(3 downto 0);
	sel: in std_logic_vector(1 downto 0);
	hex_dig_out: out std_logic_vector(3 downto 0)
	);
end hex_dig_mux;

--}} End of automatically maintained section

architecture hex_dig_mux of hex_dig_mux is
begin
	with sel select hex_dig_out <=
	hex_dig_0 when "00",
	hex_dig_1 when "01",
	hex_dig_2 when "10",
	hex_dig_3 when "11",
	(others => '0') when others;
end hex_dig_mux;
