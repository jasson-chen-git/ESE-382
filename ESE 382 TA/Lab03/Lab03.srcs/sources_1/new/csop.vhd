----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/14/2024 01:14:22 AM
-- Design Name: 
-- Module Name: csop - Behavioral
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

entity csop is
    Port(
    p, q, r, s : in std_logic;
    d, c, b, a : out std_logic
    );
end csop;

architecture Behavioral of csop is
begin
    d <= (p and not q and r and s) or (p and q and not r and not s);
    c <= (not p and q and r and s) or (p and not q and not r and not s) or
            (p and not q and not r and s) or (p and not q and r and not s);
    b <= (not p and q and not r and s) or (not p and q and r and not s) or
            (p and not q and not r and s) or (p and not q and r and not s);
    a <= (not p and q and not r and not s) or (not p and q and r and not s) or
            (p and not q and not r and not s) or (p and not q and r and not s) or
            (p and q and not r and not s);
end Behavioral;
