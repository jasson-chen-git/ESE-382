library ieee;
use ieee.std_logic_1164.all;

entity led_driver is
	port(
		adc : in std_logic_vector(3 downto 0);
		cold, normal, hot : out std_logic 
	);	
end led_driver;

architecture cond of led_driver is
begin
	(cold, normal, hot) <= std_logic_vector'("011") when adc < "0110" else
	"101" when adc < "1101" else
	"110"; 
end cond;
	
	