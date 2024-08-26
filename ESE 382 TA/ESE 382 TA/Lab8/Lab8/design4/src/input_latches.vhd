library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity input_latches is
port(
	a: in std_logic_vector(2 downto 0);
	o: out std_logic_vector(2 downto 0);
	le_bar: in std_logic
);
end entity;

architecture behavior of input_latches is
begin
	latch: process(le_bar, a)
	begin
		if le_bar = '0' then
			o <= a;
		end if;
	end process;
end architecture;
