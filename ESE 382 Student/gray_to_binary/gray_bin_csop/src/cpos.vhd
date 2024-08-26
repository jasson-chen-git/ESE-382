-------------------------------------------------------------------------------
--
-- Title       : cpos
-- Design      : gray_bin
-- Author      : Jason
-- Company     : Stony Brook University
--
-------------------------------------------------------------------------------
--
-- File        : c:\Users\Jason\Documents\VHDL\gray_to_binary\gray_bin\src\cpos.vhd
-- Generated   : Wed Feb 15 18:12:15 2023
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
--{entity {cpos} architecture {cpos}}

library IEEE;
use IEEE.std_logic_1164.all;

entity gray_bin is
	 port(
		 g3 : in STD_LOGIC;
		 g2 : in STD_LOGIC;
		 g1 : in STD_LOGIC;
		 g0 : in STD_LOGIC;
		 b3 : out STD_LOGIC;
		 b2 : out STD_LOGIC;
		 b1 : out STD_LOGIC;
		 b0 : out STD_LOGIC
	     );
end gray_bin;

--}} End of automatically maintained section

architecture cpos of gray_bin is
begin

	-- enter your statements here --
	b3 <=
	(g3 or	   g2 or 	 g1 or 	   g0) and
	(g3 or	   g2 or	 g1 or not g0) and
	(g3 or 	   g2 or not g1 or 	   g0) and
	(g3 or 	   g2 or not g1 or not g0) and
	(g3 or not g2 or 	 g1 or	   g0) and
	(g3 or not g2 or 	 g1 or not g0) and
	(g3 or not g2 or not g1 or 	   g0) and
	(g3 or not g2 or not g1 or not g0);
	
	b2 <=
	(	 g3 or	   g2 or 	 g1 or 	   g0) and
	(	 g3 or	   g2 or	 g1 or not g0) and
	(	 g3 or 	   g2 or not g1 or 	   g0) and
	(	 g3 or 	   g2 or not g1 or not g0) and
	(not g3 or not g2 or	 g1 or 	   g0) and
	(not g3 or not g2 or 	 g1 or not g0) and
	(not g3 or not g2 or not g1 or 	   g0) and
	(not g3 or not g2 or not g1 or not g0);
	
	b1 <=
	(	 g3 or	   g2 or 	 g1 or 	   g0) and
	(	 g3 or	   g2 or	 g1 or not g0) and
	(	 g3 or not g2 or not g1 or	   g0) and
	(	 g3 or not g2 or not g1 or not g0) and
	(not g3 or not g2 or	 g1 or 	   g0) and
	(not g3 or not g2 or	 g1 or not g0) and
	(not g3 or 	   g2 or not g1 or 	   g0) and
	(not g3 or 	   g2 or not g1 or not g0);
	
	b0 <=
	(	 g3 or	   g2 or	 g1 or     g0) and	
	(	 g3 or 	   g2 or not g1 or not g0) and		
	(	 g3 or not g2 or not g1 or	   g0) and	   
	(	 g3 or not g2 or  	 g1 or not g0) and
	(not g3 or not g2 or 	 g1 or 	   g0) and
	(not g3 or not g2 or not g1 or not g0) and
	(not g3 or	   g2 or not g1 or     g0) and
	(not g3 or	   g2 or     g1 or not g0);
	
end cpos;
