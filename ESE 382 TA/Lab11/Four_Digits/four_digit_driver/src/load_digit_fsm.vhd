-------------------------------------------------------------------------------
--
-- Title       : load_digit_fsm
-- Design      : four_digit_driver
-- Author      : ESDL User
-- Company     : Stony Brook
--
-------------------------------------------------------------------------------
--
-- File        : E:\Lab11\Four_Digits\four_digit_driver\src\load_digit_fsm.vhd
-- Generated   : Tue Apr 30 15:00:03 2024
-- From        : interface description file
-- By          : Itf2Vhdl ver. 1.22
--
-------------------------------------------------------------------------------
--
-- Description : 
--
-------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity load_digit_fsm is
port(
	rst_bar, clk, ss_bar_pe, ld_cmnd: in std_logic;
	load_dig: out std_logic
	);
end load_digit_fsm;

--}} End of automatically maintained section

architecture load_digit_fsm of load_digit_fsm is
type state is (state_a, state_b, state_c);
    signal present_state, next_state: state; 
    
begin
    state_reg: process(clk, rst_bar)
    begin
        if rst_bar = '0' then
            present_state <= state_a;
        elsif rising_edge(clk) then
            present_state <= next_state;
        end if;
    end process;
    
    outputs: process(present_state)
    begin
        case present_state is
            when state_c => load_dig <= '1';
            when state_a | state_b => load_dig <= '0';
        end case;
    end process;
    
    nxt_state: process(present_state, ss_bar_pe, ld_cmnd)
    begin
        case present_state is
            when state_a =>
                if ss_bar_pe = '1' then
                    next_state <= state_b;
                else
                    next_state <= state_a;
                end if;
            when state_b =>
                if ld_cmnd = '1' then
                    next_state <= state_c;
                else
                    next_state <= state_a;
                end if;
            when state_c => 
				--if ss_bar_pe = '1' then
--                	next_state <= state_b;
--				else 
					next_state <= state_a;
				--end if;
        end case;
    end process;
end load_digit_fsm;
