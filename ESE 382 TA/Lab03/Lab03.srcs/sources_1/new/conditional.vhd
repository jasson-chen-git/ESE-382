----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/14/2024 02:14:15 AM
-- Design Name: 
-- Module Name: conditional - Behavioral
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

entity conditional is
    Port(
    p, q, r, s : in std_logic;
    d, c, b, a : out std_logic
    );
end conditional;

architecture Behavioral of conditional is
signal temp : std_logic_vector(3 downto 0);
begin
    temp <= 
        "0000" when std_logic_vector'(p, q, r, s) = "0011" else
        "0001" when std_logic_vector'(p, q, r, s) = "0100" else
        "0010" when std_logic_vector'(p, q, r, s) = "0101" else
        "0011" when std_logic_vector'(p, q, r, s) = "0110" else
        "0100" when std_logic_vector'(p, q, r, s) = "0111" else
        "0101" when std_logic_vector'(p, q, r, s) = "1000" else
        "0110" when std_logic_vector'(p, q, r, s) = "1001" else
        "0111" when std_logic_vector'(p, q, r, s) = "1010" else
        "1000" when std_logic_vector'(p, q, r, s) = "1011" else
        "1001" when std_logic_vector'(p, q, r, s) = "1100" else
        "----";
    (d, c, b, a) <= temp;
end Behavioral;
