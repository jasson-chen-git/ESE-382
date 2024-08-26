---------------------------------------------------------------------------
----
--
-- Title : Design Task 2
-- Design : Frequency Register
-- Author : Jason Chen
-- Company : 112515450
--
---------------------------------------------------------------------------
----
--
-- Description : Write a behavioral description for the frequency register.
--
---------------------------------------------------------------------------
----
library ieee;
use ieee.std_logic_1164.all;

entity frequency_reg is
	generic (a : positive := 14);
	port(
		load, clk, reset_bar : in std_logic;
		d : in std_logic_vector(a-1 downto 0);
		q : out std_logic_vector(a-1 downto 0)
		);
end entity;

architecture behavioral of frequency_reg is	

begin
	reg : process (reset_bar, clk)
	begin
		if reset_bar = '0' then
			q <= (others => '0');
		elsif rising_edge(clk) and load = '1' then
			q <= d;
		end if;
	end process;
end architecture;