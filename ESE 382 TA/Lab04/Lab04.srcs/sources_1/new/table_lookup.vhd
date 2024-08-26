----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/18/2024 02:08:40 PM
-- Design Name: 
-- Module Name: table_lookup - Behavioral
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

entity table_lookup is
    Port(
    p, q, r, s : in std_logic;
    d, c, b, a : out std_logic
    );
end table_lookup;

architecture Behavioral of table_lookup is
type table is array (0 to 15) of std_logic_vector(3 downto 0);
constant xs3 : table := 
    ("----", "----", "----", "0000", "0001", "0010", "0011", "0100",
    "0101", "0110", "0111", "1000", "1001", "----", "----", "----"); 
    
begin
    (d, c, b, a) <= xs3(to_integer(unsigned'(p, q, r, s)));

end Behavioral;
