---------------------------------------------------------------------------
----
--
-- Title : Design Task 2
-- Design : D flip-flop with Enable Input
-- Author : Jason Chen
-- Company : 112515450
--
---------------------------------------------------------------------------
----
--
-- Description : Design a D-flipflop with an enable input.
--
---------------------------------------------------------------------------
----
------------------------------
------------------------------
--	D Flip Flop with Enable Input

library ieee;
use ieee.std_logic_1164.all;
use work.all;

entity dff_en is
	port(
		d, clk, en, rst_bar : in std_logic;
		q : out std_logic
	);
end dff_en;

architecture behavioral of dff_en is
begin
	df : process (clk, rst_bar)
	begin
		if rst_bar = '0' then
			q <= '0';
		elsif rising_edge(clk) and en = '1' then
			q <= d;
		end if;
	end process;	
end behavioral;