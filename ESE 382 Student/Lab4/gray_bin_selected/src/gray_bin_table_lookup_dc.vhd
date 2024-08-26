library ieee;
use ieee.std_logic_1164.all; 
use ieee.numeric_std.all;

entity gray_bin is	
	port (
	g : in std_logic_vector(3 downto 0);
	b : out std_logic_vector(3 downto 0));	
end gray_bin;

architecture table_lookup_dc of gray_bin is
	type truth_table is array (0 to 15) of std_logic_vector(3 downto 0); 

	constant b_out : truth_table :=
	("0000", "0001", "0011", "0010",
	 "0111", "0110", "0100", "0101",
	 "----", "----", "----", "----",
	 "1000", "1001", "1011", "1010");
	
begin
	b <= b_out(to_integer(unsigned(g)));
end table_lookup_dc;
	