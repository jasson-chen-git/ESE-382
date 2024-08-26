----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/04/2024 04:49:26 PM
-- Design Name: 
-- Module Name: task1_tb - Behavioral
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

entity task1_tb is
end task1_tb;

architecture Behavioral of task1_tb is
signal d, c, b, a, p, q, r, s : std_logic;
type table is array (0 to 15) of std_logic_vector(3 downto 0);
constant conv_table : table :=
    ("0000", "0111", "0110", "0101",
    "0100", "1011", "1010", "1001",
    "1000", "1111", "----", "----",
    "----", "----", "----", "----");
constant period : time := 20ns;

begin
    UUT : entity p1 port map
            (d => d, c => c, b => b, a => a,
            p => p, q => q, r => r, s => s);
    
    p0: process
    begin
        for i in 0 to 15 loop
            (d, c, b, a) <= std_logic_vector(to_unsigned(i, 4));
            wait for period;
            assert std_logic_vector'(p, q, r, s) = conv_table(i)
            report lf &
                    "Error for input: " & to_string(unsigned'(d, c, b, a)) & "." & lf &
                    "Received output: " & to_string(unsigned'(p, q, r, s)) & "." & lf &
                    "Expected output: " & to_string(conv_table(i)) & "."
            severity error;
        end loop;
        std.env.finish;
    end process;

end Behavioral;
