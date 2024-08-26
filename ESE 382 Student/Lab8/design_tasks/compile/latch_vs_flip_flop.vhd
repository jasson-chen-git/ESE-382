-------------------------------------------------------------------------------
--
-- Title       : 
-- Design      : design_tasks
-- Author      : Jason
-- Company     : Stony Brook University
--
-------------------------------------------------------------------------------
--
-- File        : c:\Users\Jason\Documents\VHDL\Lab8\design_tasks\compile\latch_vs_flip_flop.vhd
-- Generated   : Thu Apr  6 17:09:37 2023
-- From        : c:\Users\Jason\Documents\VHDL\Lab8\design_tasks\src\latch_vs_flip_flop.bde
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

entity latch_vs_flip_flop is
  port(
       d : in STD_LOGIC;
       clk : in STD_LOGIC;
       ql : out STD_LOGIC;
       qff : out STD_LOGIC
  );
end latch_vs_flip_flop;

architecture structure of latch_vs_flip_flop is

---- Component declarations -----

component d_flip_flop
  port(
       d : in STD_LOGIC;
       clk : in STD_LOGIC;
       qff : out STD_LOGIC
  );
end component;
component d_latch
  port(
       d : in STD_LOGIC;
       le_bar : in STD_LOGIC;
       ql : out STD_LOGIC
  );
end component;

begin

----  Component instantiations  ----

u0 : d_latch
  port map(
       d => d,
       le_bar => clk,
       ql => ql
  );

u1 : d_flip_flop
  port map(
       d => d,
       clk => clk,
       qff => qff
  );


end structure;
