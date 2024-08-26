---------------------------------------------------------------------------
----
--
-- Title : Design Task 3
-- Design : Phase Accumulator
-- Author : Jason Chen
-- Company : 112515450
--
---------------------------------------------------------------------------
----
--
-- Description : Write a behavioral description for the phase accumulator.
--
---------------------------------------------------------------------------
----
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity phase_accumulator is
	generic(
		a : positive := 14;
		m : positive := 7
		);
	port(
		clk, reset_bar, up : in std_logic;
		d : in std_logic_vector(a-1 downto 0);
		max, min : out std_logic;
		q : out std_logic_vector(m-1 downto 0)
		);
end entity;

architecture behavioral of phase_accumulator is
begin
    pa : process(clk, reset_bar)
        variable count : unsigned(a-1 downto 0);
        variable allones : unsigned(a-1 downto 0) := (others => '1');
    begin
        if reset_bar = '0' then
            count := (others => '0');
        elsif rising_edge(clk) then
            max <= '0';
            min <= '0';
            if up = '1' then
                if 2**a - 1 - count < unsigned(d) then
                    count := allones + allones - count - unsigned(d);
                    max <= '1';
                else
                    count := count + unsigned(d);
                end if;
            else
                if count < unsigned(d) then
                    count := unsigned(d) - count;
                    min <= '1';
                else
                    count := count - unsigned(d);
                end if;
				if count < 2 * unsigned(d) then
					min <= '1';
				end if;
            end if;
        end if;
--		if count = 0 then
--			min <= '1';
--		elsif count = 2**a - 1 then
--			max <= '1';
--		end if;
		q <= std_logic_vector(count(a-1 downto 7));
	end process;
end architecture;	