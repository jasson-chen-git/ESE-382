-------------------------------------------------------------------------------
--
-- Title       : multidigit_muxed_seven_seg_spi
-- Design      : four_digit_driver
-- Author      : ESDL User
-- Company     : Stony Brook
--
-------------------------------------------------------------------------------
--
-- File        : E:\Lab11\Four_Digits\four_digit_driver\src\multidigit_muxed_seven_seg_spi.vhd
-- Generated   : Tue Apr 30 15:04:45 2024
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
use work.all;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity multidigit_muxed_seven_seg_spi is
port(
	ss_bar, mosi, rst_bar, clk, sck: in std_logic;
	sel: in std_logic_vector(1 downto 0);
	seg_drive: out std_logic_vector(7 downto 0)
	);
attribute loc : string;
attribute loc of rst_bar   : signal is "P2";
attribute loc of sel       : signal is "P3,P4";
attribute loc of ss_bar    : signal is "P6";
attribute loc of sck       : signal is "P7";
attribute loc of mosi      : signal is "P9";
attribute loc of clk       : signal is "P11";
attribute loc of seg_drive : signal is "P31,P30,P29,P28,P27,P26,P25,P24";
 
end multidigit_muxed_seven_seg_spi;



architecture multidigit_muxed_seven_seg_spi of multidigit_muxed_seven_seg_spi is
signal sck_pe, ss_bar_pe, load_dig: std_logic;
signal rx_data_out, rx_buff_out: std_logic_vector(7 downto 0);
signal y, hex_dig_0, hex_dig_1, hex_dig_2, hex_dig_3, hex_dig_out: std_logic_vector(3 downto 0);

begin 
	
	u1: entity edge_det port map(
			rst_bar => rst_bar, 
			clk => clk,
			sig => sck, 
			pos => '1',
			sig_edge => sck_pe);
		
	u2: entity slv_spi_rx_shifter port map(
			rxd => mosi,
			rst_bar => rst_bar,
			sel_bar => ss_bar,
			clk => clk,	 
			shift_en => sck_pe,
			rx_data_out => rx_data_out);
				
	u3: entity edge_det port map(
			rst_bar => rst_bar, 
			clk => clk,
			sig => ss_bar, 
			pos => '1',
			sig_edge => ss_bar_pe);
				
	u4: entity rx_buff_reg port map(
			rst_bar => rst_bar, 
			clk => clk,
			load_en => ss_bar_pe,
			rx_buff_in => rx_data_out,
			rx_buff_out => rx_buff_out);
				
	u5: entity decoder_2to4 port map(
			b => rx_buff_out(5),
			a => rx_buff_out(4),
			y => y);
				
	u12: entity load_digit_fsm port map(
			rst_bar => rst_bar, 
			clk => clk,
			ss_bar_pe => ss_bar_pe, 
			ld_cmnd => rx_buff_out(7),
			load_dig => load_dig);
				
	u6: entity hex_digit_reg port map(
			rst_bar => rst_bar, 
			clk => clk,
			load_en1 => y(0),
			load_en2 => load_dig,
			hex_dig_in => rx_buff_out(3 downto 0),
			hex_dig_out => hex_dig_0);
				
	u7: entity hex_digit_reg port map(
			rst_bar => rst_bar, 
			clk => clk,
			load_en1 => y(1),
			load_en2 => load_dig,
			hex_dig_in => rx_buff_out(3 downto 0),
			hex_dig_out => hex_dig_1);
				
	u8: entity hex_digit_reg port map(
			rst_bar => rst_bar, 
			clk => clk,
			load_en1 => y(2),
			load_en2 => load_dig,
			hex_dig_in => rx_buff_out(3 downto 0),
			hex_dig_out => hex_dig_2);
				
	u9: entity hex_digit_reg port map(
			rst_bar => rst_bar, 
			clk => clk,
			load_en1 => y(3),
			load_en2 => load_dig,
			hex_dig_in => rx_buff_out(3 downto 0),
			hex_dig_out => hex_dig_3);
				
	u10: entity hex_dig_mux port map(
			hex_dig_0 => hex_dig_0,
			hex_dig_1 => hex_dig_1,
			hex_dig_2 => hex_dig_2,
			hex_dig_3 => hex_dig_3,
			sel => sel,
			hex_dig_out => hex_dig_out);
				
	u11: entity hex_seven port map(
			hex => hex_dig_out,
			seg_drive => seg_drive
			);

end multidigit_muxed_seven_seg_spi;