----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/24/2024 01:37:31 PM
-- Design Name: 
-- Module Name: spi_digit_driver - Behavioral
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
use work.all;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity spi_digit_driver is
Port (
    rst_bar, clk, mosi, sck, ss_bar: in std_logic;
    data_out, seg_drive: out std_logic_vector(7 downto 0)
    );
end spi_digit_driver;

architecture Behavioral of spi_digit_driver is
    signal sig_edge: std_logic;
    signal data: std_logic_vector(7 downto 0);

begin
    u1: entity edge_detector port map(
        rst_bar => rst_bar, clk => clk, sig => sck,
        pos => '1', sig_edge => sig_edge);
    
    u2: entity slv_spi_rx_shifter port map(
        rxd => mosi, rst_bar => rst_bar, sel_bar => ss_bar,
        clk => clk, shift_en => sig_edge, rx_data_out => data);
        
    u3: entity hex_driver port map(
        hex => data(3 downto 0), seg_drive => seg_drive);
        
    data_out <= data;

end Behavioral;
