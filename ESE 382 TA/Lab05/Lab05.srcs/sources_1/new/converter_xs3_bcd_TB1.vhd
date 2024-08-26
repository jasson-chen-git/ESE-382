-- Ken Short 020624 Testbench for XS3 to BCD converter using
-- vector inputs and outputs

library ieee;
use ieee.numeric_std.all;
use ieee.std_logic_1164.all;
use work.all;

entity converter_xs3_bcd_vector_tb is
end converter_xs3_bcd_vector_tb;

architecture tb_architecture of converter_xs3_bcd_vector_tb is
	
	-- Stimulus signals
	signal pqrs : std_logic_vector(3 downto 0);
	-- Observed signals
	signal dcba : std_logic_vector(3 downto 0);
	
	-- time between application of input stimulus vectors	
	constant period : time := 20ns;
	
begin
	
	-- Unit Under Test port map
	UUT : entity design4
	port map (
		pqrs => pqrs,
		dcba => dcba
		);
	
	stimulus: process
	begin
		-- Loops to apply input vectors from "0000" to "1111"
		
		-- Block comment out loop l1 for timing simulation
		l1: for i in 0 to 2 loop
			pqrs <= std_logic_vector(to_unsigned(i, 4));
			wait for period;
			assert (dcba = "----")
			report "Error for input " & to_string(pqrs) & "."
			severity error;
		end loop;
		
		-- Keep loop l2 for all simulations	
		l2: for i in 3 to 12 loop
			pqrs <= std_logic_vector(to_unsigned(i, 4));
			wait for period;
			assert ((to_integer(unsigned(pqrs))) - 3) = (to_integer(unsigned(dcba)))
			report "Error for input " & to_string(pqrs) & "."
			severity error;
		end loop;
		
		-- Block comment out loop l3 for timing simulation
		l3: for i in 13 to 15 loop
			pqrs <= std_logic_vector(to_unsigned(i, 4));
			wait for period;
			assert (dcba = "----")
			report "Error for input " & to_string(pqrs) & "."
			severity error;
		end loop;		
		
		std.env.finish;	--stop simulation
	end process;	
		
end tb_architecture;


