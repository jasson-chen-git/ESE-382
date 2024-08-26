----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/14/2024 01:57:28 AM
-- Design Name: 
-- Module Name: selected - Behavioral
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

entity selected is
    Port(
    p, q, r, s : in std_logic;
    d, c, b, a : out std_logic
    );
end selected;

architecture Behavioral of selected is
signal temp : std_logic_vector(3 downto 0);
begin
    with std_logic_vector'(p, q, r, s) select (temp) <= 
        "0000" when "0011",
        "0001" when "0100",
        "0010" when "0101", 
        "0011" when "0110",
        "0100" when "0111",
        "0101" when "1000",
        "0110" when "1001",
        "0111" when "1010",
        "1000" when "1011",
        "1001" when "1100",
        "----" when others;
    (d, c, b, a) <= temp;    
end Behavioral;
