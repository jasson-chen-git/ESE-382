----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/04/2024 04:46:08 PM
-- Design Name: 
-- Module Name: data_selector - Behavioral
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

entity data_selector is
port(
    a1, b1, a2, b2, gn, an : in std_logic;
    y1, y2 : out std_logic
    );
end data_selector;

architecture Behavioral of data_selector is
signal s1, s2 : std_logic;

begin
    u1: entity control port map (gn => gn, an => an, c0 => s1, c1 => s2);
    u2: entity route port map(a => a1, ae => s1, b => b1, be => s2, y => y1);
    u3: entity route port map(a => a2, ae => s1, b => b2, be => s2, y => y2);

end Behavioral;
