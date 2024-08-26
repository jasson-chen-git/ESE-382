----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/24/2024 01:02:15 PM
-- Design Name: 
-- Module Name: edge_detector - Behavioral
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity edge_detector is
Port (
    rst_bar, clk, sig, pos: in std_logic;
    sig_edge: out std_logic
    );
end edge_detector;

architecture Behavioral of edge_detector is
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
            when state_c => sig_edge <= '1';
            when state_a | state_b => sig_edge <= '0';
        end case;
    end process;
    
    nxt_state: process(present_state, sig)
    begin
        case present_state is
            when state_a =>
                if sig = not pos then
                    next_state <= state_b;
                else
                    next_state <= state_a;
                end if;
            when state_b =>
                if sig = pos then
                    next_state <= state_c;
                else
                    next_state <= state_b;
                end if;
            when state_c => 
                if sig = not pos then
                    next_state <= state_b;
                else
                    next_state <= state_a;
                end if;
        end case;
    end process;
end Behavioral;
