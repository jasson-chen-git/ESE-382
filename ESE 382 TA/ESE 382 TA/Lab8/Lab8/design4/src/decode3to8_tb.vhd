library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all; 
use work.all;						 

entity decode3to8_tb is
end entity;

architecture tb of decode3to8_tb is
signal o: std_logic_vector(2 downto 0);
signal y: std_logic_vector(7 downto 0);
signal e: std_logic;
constant period: time:= 20ns;

type table is array (0 to 15) of std_logic_vector(7 downto 0);
constant tt : table := ("00000000", "00000000", "00000000", "00000000", 
						"00000000", "00000000", "00000000", "00000000", 
						"00000001", "00000010", "00000100", "00001000", 
						"00010000", "00100000", "01000000", "10000000");


begin 
	UUT: entity decode3to8 port map(o => o, y => y, e => e);
		
	tb: process	
	begin 
		for i in 0 to 2**4-1 loop
			(e, o) <= std_logic_vector(to_unsigned(i, 4));
			wait for period;
			
			assert y = 
			report
			severity error;
			
		end loop;
		std.env.finish;	
	end process;
end architecture;