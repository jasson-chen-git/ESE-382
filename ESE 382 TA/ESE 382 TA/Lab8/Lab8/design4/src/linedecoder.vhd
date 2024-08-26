library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.all;

entity linedecoder is
port(
	le_bar, e1_bar, e2: in std_logic;
	a: in std_logic_vector(2 downto 0);
	y: out std_logic_vector(7 downto 0)
	); 
	attribute loc : string;
	attribute loc of a      : signal is "P2,P3,P4";
	attribute loc of e1_bar : signal is "P14";
	attribute loc of e2     : signal is "P15";
	attribute loc of le_bar : signal is "P16";
	attribute loc of y      : signal is "P43,P42,P41,P40,P39,P38,P37,P36";
end entity;

architecture structure of linedecoder is
signal e: std_logic;
signal s: std_logic_vector(2 downto 0);
begin
	UUT1: entity input_latches port map(a => a, o => s, le_bar => le_bar);
	UUT2: entity decode3to8 port map(o => s, e => e, y => y);
	e <= not e1_bar and e2;
end architecture;
	