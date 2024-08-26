-------------------------------------------------------------------------------
--
-- Title       : half_sub
-- Design      : Lab01_half_adder
-- Author      : 
-- Company     : 
--
-------------------------------------------------------------------------------
--
-- File        : C:\Users\Jason\Documents\VHDL\Lab01_half_adder\Lab01_half_adder\src\half_sub.vhd
-- Generated   : Tue Jan 24 17:35:15 2023
-- From        : interface description file
-- By          : Itf2Vhdl ver. 1.22
--
-------------------------------------------------------------------------------
--
-- Description : 
--
-------------------------------------------------------------------------------

--{{ Section below this comment is automatically maintained
--   and may be overwritten
--{entity {half_sub} architecture {half_sub}}

library IEEE;
use IEEE.std_logic_1164.all;

entity half_sub is
	 port(
		 a : in STD_LOGIC;
		 b : in STD_LOGIC;
		 diff : out STD_LOGIC;
		 borrow : out STD_LOGIC
	     );
end half_sub;

--}} End of automatically maintained section

architecture dataflow of half_sub is
begin

	diff <= (not a and b) or (a and not b);
	borrow <= not a and b;

end dataflow;