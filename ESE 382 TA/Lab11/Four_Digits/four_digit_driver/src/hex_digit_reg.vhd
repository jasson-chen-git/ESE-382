-------------------------------------------------------------------------------
--
-- Title       : hex_digit_reg
-- Design      : four_digit_driver
-- Author      : ESDL User
-- Company     : Stony Brook
--
-------------------------------------------------------------------------------
--
-- File        : E:\Lab11\Four_Digits\four_digit_driver\src\hex_digit_reg.vhd
-- Generated   : Tue Apr 30 14:49:00 2024
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

entity hex_digit_reg is
port(
	rst_bar, clk, load_en1, load_en2: in std_logic;
	hex_dig_in: in std_logic_vector(3 downto 0);
	hex_dig_out: out std_logic_vector(3 downto 0)
	);
end hex_digit_reg;

--}} End of automatically maintained section

architecture hex_digit_reg of hex_digit_reg is
begin
	update_reg: process(clk, rst_bar)
	begin
		if rst_bar = '0' then
			hex_dig_out <= (others => '0');
		elsif rising_edge(clk) and load_en1 = '1' and load_en2 = '1' then
			hex_dig_out <= hex_dig_in;
		end if;
	end process;
end hex_digit_reg;
