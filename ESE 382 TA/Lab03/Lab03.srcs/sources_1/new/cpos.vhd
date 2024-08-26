----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/14/2024 01:44:56 AM
-- Design Name: 
-- Module Name: cpos - Behavioral
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

entity cpos is
    Port(
    p, q, r, s : in std_logic;
    d, c, b, a : out std_logic
    );
end cpos;

architecture Behavioral of cpos is
begin
    d <= (p or q or not r or not s) and (p or not q or r or s) and
            (p or not q or r or not s) and (p or not q or not r or s) and
            (p or not q or not r or not s) and (not p or q or r or s) and
            (not p or q or r or not s) and (not p or q or not r or s);
    c <= (p or q or not r or not s) and (p or not q or r or s) and
            (p or not q or r or not s) and (p or not q or not r or s) and
            (not p or q or not r or not s) and (not p or not q or r or s);
    b <= (p or q or not r or not s) and (p or not q or r or s) and
            (p or not q or not r or not s) and (not p or q or r or s) and
            (not p or q or not r or not s) and (not p or not q or r or s);
    a <= (p or q or not r or not s) and (p or not q or r or not s) and
            (p or not q or not r or not s) and (not p or q or r or not s) and
            (not p or q or not r or not s);
end Behavioral;
