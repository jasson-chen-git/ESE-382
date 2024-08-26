--
-- Synopsys
-- Vhdl wrapper for top level design, written on Tue Mar 26 14:51:30 2024
--
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity wrapper_for_linedecoder is
   port (
      le_bar : in std_logic;
      e1_bar : in std_logic;
      e2 : in std_logic;
      a : in std_logic_vector(2 downto 0);
      y : out std_logic_vector(7 downto 0)
   );
end wrapper_for_linedecoder;

architecture structure of wrapper_for_linedecoder is

component linedecoder
 port (
   le_bar : in std_logic;
   e1_bar : in std_logic;
   e2 : in std_logic;
   a : in std_logic_vector (2 downto 0);
   y : out std_logic_vector (7 downto 0)
 );
end component;

signal tmp_le_bar : std_logic;
signal tmp_e1_bar : std_logic;
signal tmp_e2 : std_logic;
signal tmp_a : std_logic_vector (2 downto 0);
signal tmp_y : std_logic_vector (7 downto 0);

begin

tmp_le_bar <= le_bar;

tmp_e1_bar <= e1_bar;

tmp_e2 <= e2;

tmp_a <= a;

y <= tmp_y;



u1:   linedecoder port map (
		le_bar => tmp_le_bar,
		e1_bar => tmp_e1_bar,
		e2 => tmp_e2,
		a => tmp_a,
		y => tmp_y
       );
end structure;
