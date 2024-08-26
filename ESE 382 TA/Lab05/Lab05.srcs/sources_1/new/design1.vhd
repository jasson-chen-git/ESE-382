----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/24/2024 05:58:52 PM
-- Design Name: 
-- Module Name: design1 - Behavioral
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

entity design1 is
    Port (
    p, q, r, s : in std_logic;
    d, b, c, a : out std_logic
    );
end design1;

architecture Behavioral of design1 is
signal temp : std_logic_vector(3 downto 0);
begin

    p1 : process(q, p, r, s)
    begin
        case std_logic_vector'(p, q, r, s) is
            when "0011" => temp <= "0000";
            when "0100" => temp <= "0001";
            when "0101" => temp <= "0010";
            when "0110" => temp <= "0011";
            when "0111" => temp <= "0100";
            when "1000" => temp <= "0101";
            when "1001" => temp <= "0110";
            when "1010" => temp <= "0111";
            when "1011" => temp <= "1000";
            when "1100" => temp <= "1001";
            when others => temp <= "----";
        end case;
    end process;
    
    (d, c, b, a) <= temp;
    
end Behavioral;
