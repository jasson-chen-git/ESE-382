----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/04/2024 07:29:31 PM
-- Design Name: 
-- Module Name: task3_tb - Behavioral
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

entity task3_tb is
--  Port ( );
end task3_tb;

architecture Behavioral of task3_tb is
signal a1, a2, b1, b2, gn, an, y1, y2 : std_logic;
constant period : time := 10ns;

begin
    UUT0: entity data_selector port map
            (a1 => a1, a2 => a2, b1 => b1, b2 => b2,
            gn => gn, an => an, y1 => y1, y2 => y2);
            
    p0 : process
    begin
        for i in 0 to 2**6 - 1 loop
            (gn, an, a1, b1, a2, b2) <= std_logic_vector(to_unsigned(i, 6));
            wait for period;
        end loop;
        std.env.finish;
    end process;

end Behavioral;
