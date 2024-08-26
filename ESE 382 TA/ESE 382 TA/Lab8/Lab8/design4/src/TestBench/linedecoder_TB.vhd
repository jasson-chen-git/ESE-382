library ieee;
use ieee.NUMERIC_STD.all;
use ieee.std_logic_1164.all;

	-- Add your library and packages declaration here ...

entity linedecoder_tb is
end linedecoder_tb;

architecture TB_ARCHITECTURE of linedecoder_tb is
	-- Component declaration of the tested unit
	component linedecoder
	port(
		le_bar : in STD_LOGIC;
		e1_bar : in STD_LOGIC;
		e2 : in STD_LOGIC;
		a : in STD_LOGIC_VECTOR(2 downto 0);
		y : out STD_LOGIC_VECTOR(7 downto 0) );
	end component;

	-- Stimulus signals - signals mapped to the input and inout ports of tested entity
	signal le_bar : STD_LOGIC;
	signal e1_bar : STD_LOGIC;
	signal e2 : STD_LOGIC;
	signal a : STD_LOGIC_VECTOR(2 downto 0);
	-- Observed signals - signals mapped to the output ports of tested entity
	signal y : STD_LOGIC_VECTOR(7 downto 0);

	-- Add your code here ...

begin

	-- Unit Under Test port map
	UUT: linedecoder
		port map (
			le_bar => le_bar,
			e1_bar => e1_bar,
			e2 => e2,
			a => a,
			y => y
		);

	--Below VHDL code is an inserted .\compile\wf.vhs
	--User can modify it ....

STIMULUS: process
begin  -- of stimulus process
--wait for <time to next event>; -- <current time>

	a <= "000";
	le_bar <= '0';
	e1_bar <= '0';
	e2 <= '0';
    wait for 50 ns; --0 fs
	a <= "001";
    wait for 50 ns; --50 ns
	a <= "010";
    wait for 50 ns; --100 ns
	a <= "011";
    wait for 50 ns; --150 ns
	a <= "100";
    wait for 50 ns; --200 ns
	a <= "101";
    wait for 50 ns; --250 ns
	a <= "110";
    wait for 50 ns; --300 ns
	a <= "111";
    wait for 50 ns; --350 ns
	a <= "000";
	e1_bar <= '1';
    wait for 50 ns; --400 ns
	a <= "001";
    wait for 50 ns; --450 ns
	a <= "010";
    wait for 50 ns; --500 ns
	a <= "011";
    wait for 50 ns; --550 ns
	a <= "100";
    wait for 50 ns; --600 ns
	a <= "101";
    wait for 50 ns; --650 ns
	a <= "110";
    wait for 50 ns; --700 ns
	a <= "111";
    wait for 50 ns; --750 ns
	a <= "000";
	e1_bar <= '0';
	e2 <= '1';
    wait for 50 ns; --800 ns
	a <= "001";
    wait for 50 ns; --850 ns
	a <= "010";
    wait for 50 ns; --900 ns
	a <= "011";
    wait for 50 ns; --950 ns
	a <= "100";
    wait for 50 ns; --1 us
	a <= "101";
    wait for 50 ns; --1050 ns
	a <= "110";
    wait for 50 ns; --1100 ns
	a <= "111";
    wait for 50 ns; --1150 ns
	a <= "000";
	e1_bar <= '1';
    wait for 50 ns; --1200 ns
	a <= "001";
    wait for 50 ns; --1250 ns
	a <= "010";
    wait for 50 ns; --1300 ns
	a <= "011";
    wait for 50 ns; --1350 ns
	a <= "100";
    wait for 50 ns; --1400 ns
	a <= "101";
    wait for 50 ns; --1450 ns
	a <= "110";
    wait for 50 ns; --1500 ns
	a <= "111";
    wait for 50 ns; --1550 ns
	a <= "000";
	le_bar <= '1';
	e1_bar <= '0';
	e2 <= '0';
    wait for 50 ns; --1600 ns
	a <= "001";
    wait for 50 ns; --1650 ns
	a <= "010";
    wait for 50 ns; --1700 ns
	a <= "011";
    wait for 50 ns; --1750 ns
	a <= "100";
    wait for 50 ns; --1800 ns
	a <= "101";
    wait for 50 ns; --1850 ns
	a <= "110";
    wait for 50 ns; --1900 ns
	a <= "111";
    wait for 50 ns; --1950 ns
	a <= "000";
	e1_bar <= '1';
    wait for 50 ns; --2 us
	a <= "001";
    wait for 50 ns; --2050 ns
	a <= "010";
    wait for 50 ns; --2100 ns
	a <= "011";
    wait for 50 ns; --2150 ns
	a <= "100";
    wait for 50 ns; --2200 ns
	a <= "101";
    wait for 50 ns; --2250 ns
	a <= "110";
    wait for 50 ns; --2300 ns
	a <= "111";
    wait for 50 ns; --2350 ns
	a <= "000";
	wait for 15 ns;
	e1_bar <= '0';
	wait for 15 ns;
	e2 <= '1';
    wait for 20 ns; --2400 ns
	a <= "001";
    wait for 50 ns; --2450 ns
	a <= "010";
    wait for 50 ns; --2500 ns
	a <= "011";
    wait for 50 ns; --2550 ns
	a <= "100";
    wait for 50 ns; --2600 ns
	a <= "101";
    wait for 50 ns; --2650 ns
	a <= "110";
    wait for 50 ns; --2700 ns
	a <= "111";
    wait for 50 ns; --2750 ns
	a <= "000";
	e1_bar <= '1';
    wait for 50 ns; --2800 ns
	a <= "001";
    wait for 50 ns; --2850 ns
	a <= "010";
    wait for 50 ns; --2900 ns
	a <= "011";
    wait for 50 ns; --2950 ns
	a <= "100";
    wait for 50 ns; --3 us
	a <= "101";
    wait for 50 ns; --3050 ns
	a <= "110";
    wait for 50 ns; --3100 ns
	a <= "111";
    wait for 50 ns; --3150 ns
	a <= "000";
	le_bar <= '0';
	e1_bar <= '0';
	e2 <= '0';
--	end of stimulus events
	wait;
end process; -- end of stimulus process
	



	-- Add your stimulus here ...

end TB_ARCHITECTURE;

configuration TESTBENCH_FOR_linedecoder of linedecoder_tb is
	for TB_ARCHITECTURE
		for UUT : linedecoder
			use entity work.linedecoder(structure);
		end for;
	end for;
end TESTBENCH_FOR_linedecoder;

