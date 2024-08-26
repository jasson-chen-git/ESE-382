---------------------------------------------------------------------------
----
--
-- Title : Design Task 3
-- Design : Adder Subtractor
-- Author : Jason Chen
-- Company : 112515450
--
---------------------------------------------------------------------------
----
--
-- Description : Write a behavioral description for adder_subtractor.
--
---------------------------------------------------------------------------
----
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.all;

entity adder_subtractor is
	port(
		pos : in std_logic;
		sine_value : in std_logic_vector(6 downto 0);
		dac_sine_val : out std_logic_vector(7 downto 0)
	);
end entity;

architecture behavioral of adder_subtractor is
begin
	as : process(sine_value)
	variable val : unsigned(7 downto 0) := "10000000";
	begin
		if pos = '1' then
			val := 128 + unsigned('0' & sine_value);
		elsif pos = '0' then 
			val := 128 - unsigned('0' & sine_value);
		end if;
		dac_sine_val <= std_logic_vector(val);
	end process;
end architecture;
	


