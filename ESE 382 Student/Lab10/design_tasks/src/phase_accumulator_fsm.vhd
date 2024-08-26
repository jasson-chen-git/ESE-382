---------------------------------------------------------------------------
----
--
-- Title : Design Task 4
-- Design : Phase Accumulator FSM
-- Author : Jason Chen
-- Company : 112515450
--
---------------------------------------------------------------------------
----
--
-- Description : Write a three process Moore FSM to implement this entity.
--
---------------------------------------------------------------------------
----
library ieee;
use ieee.std_logic_1164.all;

entity phase_accumulator_fsm is
	port(
		clk, reset_bar, max, min : in std_logic;
		up, pos : out std_logic
		);
end entity;

architecture moore_fsm of phase_accumulator_fsm is
	type state is (quad_1, quad_2, quad_3, quad_4);
	signal present_state, next_state : state;
	
begin
	phase : process (clk, reset_bar)
	begin
		if reset_bar = '0' then
			present_state <= quad_1;
		elsif rising_edge(clk) then
			present_state <= next_state;
		end if;
	end process;
	
	output : process(present_state)
	begin
		case present_state is
			when quad_1 => (up, pos) <= std_logic_vector'("11");
			when quad_2 => (up, pos) <= std_logic_vector'("01");
			when quad_3 => (up, pos) <= std_logic_vector'("10");
			when quad_4 => (up, pos) <= std_logic_vector'("00");
		end case;
	end process;	
	
	transition : process (present_state, min, max)
	begin
		case present_state is
			when quad_1 =>
				if max = '1' then
					next_state <= quad_2;
				else
					next_state <= quad_1;
				end if;
			when quad_2 =>
				if min = '1' then
					next_state <= quad_3;
				else
					next_state <= quad_2;
				end if;
			when quad_3 =>
				if max = '1' then
					next_state <= quad_4;
				else
					next_state <= quad_3;
				end if;
			when quad_4 => 
				if min = '1' then
					next_state <= quad_1;
				else
					next_state <= quad_4;
				end if;
		end case;
	end process;
end architecture;