----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/04/2024 05:19:39 PM
-- Design Name: 
-- Module Name: task2_tb - Behavioral
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

entity task2_tb is
end task2_tb;

architecture Behavioral of task2_tb is
signal gn, an, c0, c1 : std_logic;
type vector1 is record
    gn, an, c0, c1 : std_logic;
end record;
type array1 is array (natural range <>) of vector1;
constant test1 : array1 :=
    (('0', '0', '1', '0'),
    ('0', '1', '0', '1'),
    ('1', '0', '0', '0'),
    ('1', '1', '0', '0'));

signal a, ae, b, be, y : std_logic;
type vector2 is record
    a, ae, b, be, y : std_logic;
end record;
type array2 is array (natural range <>) of vector2;
constant test2 : array2 :=
    (('0', '0', '0', '0', '1'),
    ('0', '0', '0', '1', '1'), 
    ('0', '0', '1', '0', '1'), 
    ('0', '0', '1', '1', '0'), 
    ('0', '1', '0', '0', '1'), 
    ('0', '1', '0', '1', '1'), 
    ('0', '1', '1', '0', '1'), 
    ('0', '1', '1', '1', '0'),
    ('1', '0', '0', '0', '1'),
    ('1', '0', '0', '1', '1'), 
    ('1', '0', '1', '0', '1'), 
    ('1', '0', '1', '1', '0'), 
    ('1', '1', '0', '0', '0'), 
    ('1', '1', '0', '1', '0'), 
    ('1', '1', '1', '0', '0'), 
    ('1', '1', '1', '1', '0'));    

constant period : time := 20ns;

begin
    UUT1 : entity control port map
            (gn => gn, an => an, c0 => c0, c1 => c1);
    UUT2 : entity route port map
            (a => a, ae => ae, b => b, be => be, y => y);
            
    p1 : process
    begin
        for i in 0 to 3 loop
            (gn, an) <= std_logic_vector'(test1(i).gn, test1(i).an);
            wait for period;
            assert (c0 = test1(i).c0 and c1 = test1(i).c1)
            report lf &
                    "Error for input: " & to_string(unsigned'(gn, an)) & lf &
                    "Received output: c0 = " & std_logic'image(c0) &
                    " c1 = " & std_logic'image(c1) & lf &
                    "Expected output: c0 = " & std_logic'image(test1(i).c0) &
                    " c1 = " & std_logic'image(test1(i).c1) & "."
            severity error;
        end loop;
        
        for j in 0 to 15 loop
            (a, ae, b, be) <= std_logic_vector'(test2(j).a, test2(j).ae,
                                                test2(j).b, test2(j).be);
            wait for period;
            assert y = test2(j).y
            report "Error for input: " & to_string(unsigned'(a, ae, b, be)) & lf &
                    "Received output: y = " & std_logic'image(y) & lf &
                    "Expected output: y = " & std_logic'image(test2(j).y) & "."
            severity error;
        end loop;
        std.env.finish;
    end process;

end Behavioral;
