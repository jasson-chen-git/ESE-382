----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/24/2024 06:18:51 PM
-- Design Name: 
-- Module Name: design3 - Behavioral
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

entity design3 is
    Port (
    pqrs : in std_logic_vector(3 downto 0);
    dcba : out std_logic_vector(3 downto 0)
    );
end design3;

architecture Behavioral of design3 is
signal temp : std_logic_vector(3 downto 0);
begin
    
    p1 : process (pqrs)
    begin
        dcba <= "----";
        if (to_integer(unsigned(pqrs)) >= 3 and to_integer(unsigned(pqrs)) <= 12) then
            dcba <= std_logic_vector(unsigned(pqrs) - 3);
        end if;
    end process;

end Behavioral;
