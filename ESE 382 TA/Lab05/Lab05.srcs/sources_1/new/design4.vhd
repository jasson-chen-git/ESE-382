----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/24/2024 06:28:44 PM
-- Design Name: 
-- Module Name: design4 - Behavioral
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

entity design4 is
    Port (
    pqrs : in std_logic_vector(3 downto 0);
    dcba : out std_logic_vector(3 downto 0)
    );
end design4;

architecture Behavioral of design4 is
begin
    
    p1 : process (pqrs)
    variable temp : std_logic_vector(3 downto 0);
    begin
        for i in 0 to 3 loop
            if (unsigned(pqrs) >= 3 and unsigned(pqrs) <= 12) then
                temp := std_logic_vector(unsigned(pqrs) - 3);
                dcba(i) <= temp(i);
            else
                dcba(i) <= '-';
            end if;
        end loop;
    end process;
    
end Behavioral;
