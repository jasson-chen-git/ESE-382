----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/04/2024 04:21:55 PM
-- Design Name: 
-- Module Name: p1 - Behavioral
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

entity p1 is
port(
    d, c, b, a: in std_logic;
    q,  p, r, s: out std_logic
    );
end p1;

architecture Behavioral of p1 is
begin
    p <= (not d and c and not b and a) or (not d and c and b and not a) or
        (not d and c and b and a) or (d and not c and not b and not a) or 
        (d and not c and not b and a);
        
    q <= (d or c or b or a) and (d or not c or b or not a) and
        (d or not c or not b or a) and (d or not c or not b or not a) and
        (not d or c or b or a);
        
    with std_logic_vector'(d, c, b, a) select
    r <= '1' when "0001" | "0010" | "0101" | "0110" | "1001",
        '0' when others;
        
    s <= '1' when std_logic_vector'(d, c, b, a) = "0001" else
        '1' when std_logic_vector'(d, c, b, a) = "0011" else
        '1' when std_logic_vector'(d, c, b, a) = "0101" else
        '1' when std_logic_vector'(d, c, b, a) = "0111" else
        '1' when std_logic_vector'(d, c, b, a) = "1001" else
        '0';
end Behavioral;
