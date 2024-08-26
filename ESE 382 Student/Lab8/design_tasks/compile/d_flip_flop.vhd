-------------------------------------------------------------------------------
--
-- Title       : 
-- Design      : design_tasks
-- Author      : Jason
-- Company     : Stony Brook University
--
-------------------------------------------------------------------------------
--
-- File        : c:\Users\Jason\Documents\VHDL\Lab8\design_tasks\compile\d_flip_flop.vhd
-- Generated   : Thu Apr  6 17:07:10 2023
-- From        : c:\Users\Jason\Documents\VHDL\Lab8\design_tasks\src\d_flip_flop.bde
-- By          : Bde2Vhdl ver. 2.6
--
-------------------------------------------------------------------------------
--
-- Description : 
--
-------------------------------------------------------------------------------
-- Design unit header --
library ieee;
use ieee.std_logic_1164.all;

entity d_flip_flop is
  port(
       d : in STD_LOGIC;
       clk : in STD_LOGIC;
       qff : out STD_LOGIC
  );
end d_flip_flop;

architecture behavioral of d_flip_flop is

begin

---- Processes ----

f1 : process (clk)
                       begin
                         if rising_edge(clk) then
                            qff <= d;
                         end if;
                       end process;
                      

end behavioral;
