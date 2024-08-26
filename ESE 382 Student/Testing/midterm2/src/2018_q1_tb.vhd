library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.all;

entity q1_2018_tb is
end entity;

architecture tb	of q1_2018_tb is
	signal inp : std_logic_vector(3 downto 0);
	signal en, opt : std_logic;
	constant period : time := 10ns;
	
begin
	UUT : entity nand_4_z
		port map (inp => inp, en => en, opt => opt);
	
	p0 : process
	begin
		for i in 0 to 31 loop
			(en, inp(3), inp(2), inp(1), inp(0)) <= to_unsigned(i, 5);
			wait for period; 
		end loop;
		std.env.finish;
	end process;
end architecture;