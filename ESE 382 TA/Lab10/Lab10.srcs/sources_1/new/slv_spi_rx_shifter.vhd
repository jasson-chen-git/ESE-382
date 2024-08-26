----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/24/2024 01:21:06 PM
-- Design Name: 
-- Module Name: slv_spi_rx_shifter - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity slv_spi_rx_shifter is
Port (
    rxd, rst_bar, sel_bar, clk, shift_en: in std_logic;
    rx_data_out: out std_logic_vector(7 downto 0)
    );
end slv_spi_rx_shifter;

architecture Behavioral of slv_spi_rx_shifter is
begin
    sh: process(clk, rst_bar)
        variable reg: std_logic_vector(7 downto 0);
    begin
        if rst_bar = '0' then
            reg := (others => '0');
        elsif rising_edge(clk) and sel_bar = '0' and shift_en = '1' then
            reg := reg(6 downto 0) & rxd;
        end if;
        rx_data_out <= reg;
    end process;
end Behavioral;
