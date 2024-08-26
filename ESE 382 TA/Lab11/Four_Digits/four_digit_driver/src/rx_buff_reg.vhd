-------------------------------------------------------------------------------
--
-- Title       : rx_buff_reg
-- Design      : four_digit_driver
-- Author      : ESDL User
-- Company     : Stony Brook
--
-------------------------------------------------------------------------------
--
-- File        : E:\Lab11\Four_Digits\four_digit_driver\src\rx_buff_reg.vhd
-- Generated   : Tue Apr 30 14:38:03 2024
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


entity rx_buff_reg is
port(
	rst_bar, clk, load_en: in std_logic;
	rx_buff_in: in std_logic_vector(7 downto 0);
	rx_buff_out: out std_logic_vector(7 downto 0)
	);
end rx_buff_reg;

--}} End of automatically maintained section

architecture rx_buff_reg of rx_buff_reg is
begin

	-- enter your statements here --
	pulse: process(clk, rst_bar)
	begin
		if rst_bar = '0' then
			rx_buff_out <= (others => '0');
		elsif rising_edge(clk) and load_en = '1' then
			rx_buff_out <= rx_buff_in;
		end if;
	end process;
end rx_buff_reg;
