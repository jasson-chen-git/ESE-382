library ieee;
use ieee.std_logic_1164.all;

entity abacus is
	port(
		sp : in std_logic_vector(8 downto 0);
		d, c, b, a : out std_logic
		);
end abacus;

architecture cond of abacus is
begin
	d <= (not sp(7) and not sp(2)) or (not sp(7) and not sp(1));
	c <= (not sp(6) and not sp(1)) or (not sp(7) and not sp(5)) or
			(not sp(7) and not sp(4)) or (not sp(7) and not sp(3));
	b <= (not sp(6) and not sp(3)) or (not sp(6) and not sp(2)) or
			(not sp(7) and not sp(4)) or (not sp(7) and not sp(3));
	a <= (not sp(6) and not sp(4)) or (not sp(6) and not sp(2)) or
			(not sp(7) and not sp(5)) or (not sp(7) and not sp(3)) or
			(not sp(7) and not sp(1));
end cond;