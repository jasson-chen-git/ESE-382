library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all; 

entity decode3to8 is
port(
	o: in std_logic_vector(2 downto 0);
	y: out std_logic_vector(7 downto 0);
	e: in std_logic
	);
end entity;

architecture behavior of decode3to8 is
begin
	decode: process(o, e)
	begin
		if e = '1' then
			with o select y <=	   	
			"00000001" when "000",
			"00000010" when "001",
			"00000100" when "010",
			"00001000" when "011",
			"00010000" when "100",
			"00100000" when "101",
			"01000000" when "110",
			"10000000" when others;
		else 
			y <= "00000000";
		end if;
	end process;
end architecture;
