---------------------------------------------------------------------------
----
--
-- Title : Design Task 1
-- Design : Quad Address Counter
-- Author : Jason Chen
-- Company : 112515450
--
---------------------------------------------------------------------------
----
--
-- Description : The address counter entity is named quad_address_counter
--				where quad means that it produces the appropriate count
--				sequence to address a sine table that contains values for 
--				only the first quadrant of a sine wave cycle. The counter
--				counts on the rising edge of the clock. Write a behaviorial
--				description for the counter.
--
---------------------------------------------------------------------------
----
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.all;  

entity quad_address_counter is
	port(
		clk, reset_bar : in std_logic;
		pos_neg : out std_logic;
		address : out std_logic_vector(6 downto 0)
	);
end entity;

architecture behavioral of quad_address_counter is
begin
	co : process(clk, reset_bar)
		variable add_sub : std_logic;
		variable count : unsigned(6 downto 0) := "0000000";
	begin
		if reset_bar = '0' then
			add_sub := '1';
			pos_neg <= '1';
		elsif rising_edge(clk)  then
			if add_sub = '1' then
				count := count + 1;
			else
				count := count - 1;
			end if;	 
			if count = 0 then
				add_sub := not add_sub;
				if pos_neg = '1' then
					pos_neg <= '0';
				else
					pos_neg <= '1';
				end if;
			elsif count = 127 then
				add_sub := not add_sub;
			end if;
		end if;
		address <= std_logic_vector(count);
	end process;
end architecture;
	
			