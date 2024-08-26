---------------------------------------------------------------------------
----
--
-- Title : Design Task 3
-- Design : Shift Register
-- Author : Jason Chen
-- Company : 112515450
--
---------------------------------------------------------------------------
----
--
-- Description : Design a shift register in behavioral coding style
--
---------------------------------------------------------------------------
------------------------------
------------------------------
--	Left Shift Register

library ieee;
use ieee.std_logic_1164.all;
use work.all;

entity left_shift_register is
	port(
		d : in std_logic_vector(3 downto 0);
		load, en_shift, clk, rst_bar : in std_logic;
		serial_out : out std_logic
	);
end entity;

architecture behavioral of left_shift_register is
begin
	process (clk, rst_bar)
		variable q : std_logic_vector(3 downto 0);
	begin
		if rst_bar = '0' then
			q := "0000";
		elsif rising_edge(clk) then
			if en_shift = '1' then
				q := q(2 downto 0) & '0';
			elsif load = '1' then
				q := d;	
			end if;
		end if;
		serial_out <= q(3);
	end process;
end behavioral;	