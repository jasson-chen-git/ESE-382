----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/18/2024 09:35:26 PM
-- Design Name: 
-- Module Name: Design_1 - Behavioral
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
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Design_1 is
Port(
    a, b, c : in std_logic;
    f : out std_logic);
end Design_1;

architecture Behavioral of Design_1 is
signal s1 : std_logic;

begin
    u0: process(a, b)
    begin
        s1 <= a and b;
    end process;
    
    u1: process(s1, c)
    begin
        f <= s1 or c;
    end process;
end Behavioral;
