---------------------------------------------------------------------------
----
--
-- Title : Design Task 1
-- Design : Latch versus Flip-flop
-- Author : Jason Chen
-- Company : 112515450
--
---------------------------------------------------------------------------
----
--
-- Description : Design a D-latch and D-flipflop and an entity to compare
--				both using stimulators.
--
---------------------------------------------------------------------------
------------------------------
------------------------------
--	D Latch Entity
	
library ieee;
use ieee.std_logic_1164.all;
use work.all;

entity d_latch is
	port(
		d, le_bar : in std_logic;
		ql : out std_logic
	);
end d_latch; 

architecture behavioral of d_latch is
begin
	l1 : process (d, le_bar)
	begin 
		if le_bar = '0' then
			ql <= d;
		end if;
	end process;
end behavioral;		

------------------------------
------------------------------
--	D Flip Flop

library ieee;
use ieee.std_logic_1164.all;
use work.all;

entity d_flip_flop is
	port(
		d : in std_logic;
		clk : in std_logic;
		qff : out std_logic
	);
end d_flip_flop;

architecture behavioral of d_flip_flop is
begin
	f1 : process (clk)
	begin 
		if rising_edge(clk) then 
			qff <= d;
		end if;
	end process;
end behavioral;			

------------------------------
------------------------------
--	Latch vs Flip Flop

library ieee;
use ieee.std_logic_1164.all;
use work.all;

entity latch_vs_flip_flop is
	port(
		d : in std_logic;
		clk : in std_logic;
		ql : out std_logic;
		qff : out std_logic
	);
end entity;

architecture structure of latch_vs_flip_flop is
begin 
	u0 : entity d_latch port map (d => d, le_bar => clk, ql => ql);
	u1 : entity d_flip_flop port map (d => d, clk => clk, qff => qff);
end architecture;
	