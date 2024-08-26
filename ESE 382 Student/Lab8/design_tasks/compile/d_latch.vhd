-------------------------------------------------------------------------------
--
-- Title       : 
-- Design      : design_tasks
-- Author      : Jason
-- Company     : Stony Brook University
--
-------------------------------------------------------------------------------
--
-- File        : c:\Users\Jason\Documents\VHDL\Lab8\design_tasks\compile\d_latch.vhd
-- Generated   : Thu Apr  6 17:07:11 2023
-- From        : c:\Users\Jason\Documents\VHDL\Lab8\design_tasks\src\d_latch.bde
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

entity d_latch is
  port(
       d : in STD_LOGIC;
       le_bar : in STD_LOGIC;
       ql : out STD_LOGIC
  );
end d_latch;

architecture behavioral of d_latch is

begin

---- Processes ----

l1 : process (d,le_bar)
                       begin
                         if le_bar = '1' then
                            ql <= d;
                         end if;
                       end process;
                      

end behavioral;
