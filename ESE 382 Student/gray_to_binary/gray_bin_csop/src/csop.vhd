-------------------------------------------------------------------------------
--
-- Title       : csop
-- Design      : gray_bin
-- Author      : Jason
-- Company     : Stony Brook University
--
-------------------------------------------------------------------------------
--
-- File        : c:\Users\Jason\Documents\VHDL\gray_to_binary\gray_bin\src\csop.vhd
-- Generated   : Wed Feb 15 17:37:58 2023
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
--{entity {csop} architecture {csop}}

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

architecture csop of gray_bin is
begin

	-- enter your statements here --
	b3 <=
	(g3 and not g2 and not g1 and not g0) or	
	(g3 and not g2 and not g1 and 	  g0) or
	(g3 and not g2 and     g1 and not g0) or
	(g3 and not g2 and 	   g1 and 	  g0) or
	(g3 and 	g2 and not g1 and not g0) or
	(g3 and 	g2 and not g1 and 	  g0) or
	(g3 and 	g2 and	   g1 and not g0) or
	(g3 and 	g2 and 	   g1 and 	  g0);	 
	
	b2 <= 
	(not g3 and 	g2 and not g1 and not g0) or
	(not g3 and		g2 and not g1 and 	  g0) or
	(not g3 and		g2 and	   g1 and not g0) or
	(not g3 and		g2 and	   g1 and	  g0) or
	(	 g3 and not g2 and not g1 and not g0) or
	(	 g3 and not g2 and not g1 and	  g0) or
	(	 g3 and not g2 and	   g1 and not g0) or
	(	 g3 and not g2 and	   g1 and 	  g0);
	
	b1 <=
	(not g3 and not g2 and     g1 and not g0) or
	(not g3 and	not g2 and 	   g1 and 	  g0) or
	(not g3 and		g2 and not g1 and not g0) or
	(not g3 and		g2 and not g1 and	  g0) or
	(	 g3 and	    g2 and     g1 and not g0) or
	(	 g3 and	    g2 and	   g1 and	  g0) or
	(	 g3 and	not g2 and not g1 and not g0) or
	(	 g3 and	not g2 and not g1 and 	  g0);
	
	b0 <=
	(not g3 and not g2 and not g1 and 	  g0) or
	(not g3 and not g2 and 	   g1 and not g0) or
	(not g3 and		g2 and	   g1 and 	  g0) or
	(not g3 and		g2 and not g1 and not g0) or
	(	 g3 and     g2 and not g1 and 	  g0) or
	(	 g3 and	    g2 and     g1 and not g0) or
	(	 g3 and not g2 and	   g1 and	  g0) or
	(	 g3 and not g2 and not g1 and not g0);
	
end csop;


