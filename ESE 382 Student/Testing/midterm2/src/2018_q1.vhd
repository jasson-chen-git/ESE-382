library ieee;
use ieee.std_logic_1164.all;

entity nand_4_z is
	port(
		inp : in std_logic_vector(3 downto 0);
		en : in std_logic;
		opt : out std_logic
		);
end entity;

architecture behavioral of nand_4_z is
begin
	p0 : process(inp, en)
	begin
		opt <= '0';
		for i in 3 downto 0 loop
			if inp(i) = '1' then
				opt <= '1';
			end if;
		end loop;
		if en = '0' then opt <= 'Z';
		end if;
	end process;
end architecture;