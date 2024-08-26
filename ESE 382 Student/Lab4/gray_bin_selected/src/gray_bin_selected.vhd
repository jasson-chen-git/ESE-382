library ieee;
use ieee.std_logic_1164.all;   

entity gray_bin is
	port (
	g3, g2, g1, g0 : in std_logic;
	b3, b2, b1, b0 : out std_logic);
end gray_bin;	 

architecture selected of gray_bin is
begin
	with std_logic_vector'(g3, g2, g1, g0) select
	b3 <= '1' when "1100" | "1101" | "1111" | "1110" |
	"1010" | "1011" | "1001" | "1000",
	'0' when others;
	  
	with std_logic_vector'(g3, g2, g1, g0) select
	b2 <= '1' when "0110" | "0111" | "0101" | "0100" |
	"1010" | "1011" | "1001" | "1000",
	'0' when others;
		 
	with std_logic_vector'(g3, g2, g1, g0) select
	b1 <= '1' when "0011" | "0010" | "0101" | "0100" |
	"1111" | "1110" | "1001" | "1000",
	'0' when others;
	   
	with std_logic_vector'(g3, g2, g1, g0) select
	b0 <= '1' when "0001" | "0010" | "0111" | "0100" |
	"1101" | "1110" | "1011" | "1000",
	'0' when others;
end selected;

	