library ieee;
use ieee.std_logic_1164.all; 

entity gray_bin is	
	port (
	g : in std_logic_vector(3 downto 0);
	b : out std_logic_vector(3 downto 0));	
end gray_bin;


architecture conditional_dc of gray_bin is	  
begin
	b(3) <= '1' when g = "1100" or g = "1101" or g = "1111" or
					 g = "1110" else
			'-' when g = "1010" or g = "1011" or g = "1001" or
					 g = "1000" else
			'0'; 
	
	b(2) <= '1' when g = "0110" or g = "0111" or g = "0101" or
					 g = "0100" else
			'-' when g = "1010" or g = "1011" or g = "1001" or
					 g = "1000" else
			'0';
		
	b(1) <= '1' when g = "0011" or g = "0010" or g = "0101" or
					 g = "0100" or g = "1111" or g = "1110" else  
			'-' when g = "1010" or g = "1011" or g = "1001" or
					 g = "1000" else
			'0';
	
	b(0) <= '1' when g = "0001" or g = "0010" or g = "0111" or
					 g = "0100" or g = "1101" or g = "1110" else 
			'-' when g = "1010" or g = "1011" or g = "1001" or
					 g = "1000" else
			'0';	
end conditional_dc;	