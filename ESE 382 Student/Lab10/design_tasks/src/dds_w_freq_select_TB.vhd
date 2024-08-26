-- Testbench for Task 6 of Laboratory 10, Spring 2023


library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.all;

entity dds_w_freq_select_tb is
	-- Generic declarations of the tested unit
		generic(
		a : positive := 14;
		m : positive := 7 );
end dds_w_freq_select_tb;

architecture tb_architecture of dds_w_freq_select_tb is

	-- Stimulus signals - signals mapped to the input and inout ports of tested entity
	signal clk : std_logic := '0';
	signal reset_bar : std_logic;
	signal freq_val : std_logic_vector(a-1 downto 0);
	signal load_freq : std_logic;
	-- Observed signals - signals mapped to the output ports of tested entity
	signal dac_sine_value : std_logic_vector(7 downto 0);
	
	constant period : time := 20ns;

begin
	-- Unit Under Test port map
	UUT : entity dds_w_freq_select
		generic map (
			a => a,
			m => m
		)

		port map (
			clk => clk,
			reset_bar => reset_bar,
			freq_val => freq_val,
			load_freq => load_freq,
			dac_sine_value => dac_sine_value
		);

 	freq_val <= "01010100000001";
	load_freq <= '0', '1' after 7 * period, '0' after 10 * period, '1' after (2**16 + 7) * period, '0' after (2**16 + 10) * period;	
	reset_bar <= '0', '1' after 4 * period;	-- reset signal
	
	clock: process				-- system clock
	begin
		for i in 0 to 1032 * (2 ** 8) loop
			wait for period/2;
			clk <= not clk;
		end loop;
		std.env.finish;
	end process; 
	
	
--	reset_bar <= '0', '1' after 4 * period; 
--	clock : process
--		variable freq : unsigned(13 downto 0) := to_unsigned(512, 14);
--	begin
--		for i in 0 to 2** 20 - 1 loop
--			wait for period / 2;
--			clk <= not clk;
--			if i mod 2**18 = 0 then
--				freq := to_unsigned(to_integer(freq * 2), 14);
--			end if;
--			freq_val <= std_logic_vector(freq);
--			if i mod 2**18 > 7 and i mod 2**18 < 10 then
--				load_freq <= '1';
--			else
--				load_freq <= '0';
--			end if;
--		end loop;
--		std.env.finish;
--	end process;
end tb_architecture;



