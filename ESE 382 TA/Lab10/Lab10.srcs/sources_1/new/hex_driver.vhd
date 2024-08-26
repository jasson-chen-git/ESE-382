----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/24/2024 01:28:06 PM
-- Design Name: 
-- Module Name: hex_driver - Behavioral
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

entity hex_driver is
Port (
    hex: in std_logic_vector(3 downto 0);
    seg_drive: out std_logic_vector(7 downto 0)
    );
end hex_driver;

architecture Behavioral of hex_driver is
    type segments is array (0 to 15) of std_logic_vector(6 downto 0);
    signal hex_pattern: segments :=
        ("1111110", "0110000", "1101101", "1111001",
        "0110011", "1011011", "1011111", "1110000",
        "1111111", "1111011", "1110111", "0011111",
        "1001110", "0111101", "1001111", "1000111");
        
begin
    seg_drive <= '0' & hex_pattern(to_integer(unsigned(hex)));
end Behavioral;
