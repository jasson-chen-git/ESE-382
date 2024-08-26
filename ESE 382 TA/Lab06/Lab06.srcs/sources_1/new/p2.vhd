----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/04/2024 04:34:02 PM
-- Design Name: 
-- Module Name: p2 - Behavioral
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

entity p2 is
port(
    d, c, b, a : in std_logic;
    p, q, r, s : out std_logic
    );
end p2;

architecture Behavioral of p2 is
type table is array(0 to 15) of std_logic_vector(3 downto 0);
constant conv_table : table :=
    ("0000", "0111", "0110", "0101",
    "0100", "1011", "1010", "1001",
    "1000", "1111", "----", "----",
    "----", "----", "----", "----");
    
begin
    (p, q, r, s) <= conv_table(to_integer(unsigned'(d, c, b, a)));

end Behavioral;
