---------------------------------------------------------------------------
----
--
-- Title : Design Task 1
-- Design : Edge Detector Testbench
-- Author : Jason Chen
-- Company : 112515450
--
---------------------------------------------------------------------------
----
--
-- Description : Write a non selfchecking testbench for the edge detector.
--
---------------------------------------------------------------------------
----
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.all;

entity edge_det_tb is
end entity;

architecture tb of edge_det_tb is
	signal sig, pos, sig_edge : std_logic;
	signal rst_bar, clk : std_logic := '0';
	constant period : time := 10ns;
	
begin
	UUT : entity edge_det port map(
		rst_bar => rst_bar, clk => clk,
		sig => sig, pos => pos,
		sig_edge => sig_edge
		);	 
		
	po : process
	begin
		rst_bar <= '1' after 2 * period;
		for i in 0 to 64 loop
			clk <= not clk;
			pos <= to_unsigned(i, 6)(5);
			sig <= to_unsigned(i, 6)(3);
			wait for period;
		end loop;
		std.env.finish;
	end process;
end architecture;	