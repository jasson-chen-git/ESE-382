----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01/30/2024 12:30:35 PM
-- Design Name: 
-- Module Name: half_sub_tb - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity half_sub_tb is
--  Port ( );
end half_sub_tb;

architecture Behavioral of half_sub_tb is
signal a_tb, b_tb, diff_tb, borrow_tb : std_logic;
begin

uut: entity half_subtractor port map(a => a_tb, b => b_tb, diff => diff_tb, borrow => borrow_tb);

tb : process
		constant period: time := 20 ns;
		
		begin		-- Apply every possible input combination
		
		a_tb <= '0';	--apply input combination 00 and check outputs
		b_tb <= '0';
		wait for period;
		assert ((borrow_tb = '0') and (diff_tb = '0'))
		report "test failed for input combination 00" severity error;
		
		a_tb <= '0';	--apply input combination 01 and check outputs
		b_tb <= '1';
		wait for period;
		assert ((borrow_tb = '1') and (diff_tb = '1'))
		report "test failed for input combination 01" severity error;
		
		a_tb <= '1';	--apply input combination 10 and check outputs
		b_tb <= '0';
		wait for period;
		assert ((borrow_tb = '0') and (diff_tb = '1'))
		report "test failed for input combination 10" severity error;
		
		a_tb <= '1';	--apply input combination 11 and check outputs
		b_tb <= '1';
		wait for period;
		assert ((borrow_tb = '0') and (diff_tb = '0'))
		report "test failed for input combination 11" severity error;
		
		wait;	-- indefinitely suspend process
		
	end process;

end Behavioral;
