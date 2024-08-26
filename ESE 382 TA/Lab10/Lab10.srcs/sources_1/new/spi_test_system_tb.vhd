-- Testbench for slave SPI digit driver
-- Ken Short     

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.all;


entity slv_spi_test_system_I_tb is
end slv_spi_test_system_I_tb;

architecture tb_architecture of slv_spi_test_system_I_tb is    
	-- stimulus signals
	signal rst_bar, clk, mosi, sck, ss_bar : std_logic;	 --, miso
	-- observed signals
	signal data_out, seg_drive : std_logic_vector(7 downto 0);
	
	-- system clock period is being specified relative to shift
	-- clock period so effect of changing the system clock
	-- on system's operation can be observed
	constant sck_period : time := 4.0 us;
	constant period : time := sck_period/4.0;
	signal end_sim : boolean := false;
	
	
begin    
	-- unit under test port map
	uut : entity spi_digit_driver -- was slv_spi_test_system_I
	port map (rst_bar => rst_bar, clk => clk, data_out => data_out,
		mosi => mosi, sck => sck, ss_bar => ss_bar, seg_drive => seg_drive
		);
	
	
	-- generate system reset
	rst_bar <= '0', '1' after period;
	
	
	-- system clock runs until end_sim = false   
	clock_gen : process
	begin
		clk <= '0';
		loop
			wait for period/2;
			clk <= not clk;
			exit when end_sim = true;
		end loop;
		wait;
	end process;
	
	
	-- Generate SPI Shift Clock and MOSI data
	send_spi_byte: process
		variable data_in : std_logic_vector(7 downto 0);
	begin
		for k in 0 to 15 loop
			data_in := std_logic_vector(to_unsigned(k, 8));
			ss_bar <= '1';	-- select slave
			sck <= '0';     -- starting shift clock value CPOL = 0
			mosi <= '0';        
			
			wait for 2 * sck_period;
			ss_bar <= '0';
			wait for sck_period;
			for i in 7 downto 0 loop    -- generate 8 data bits                
				mosi <= data_in(i);     -- and shift clock pulses
				wait for sck_period/2;
				sck <= not sck;
				wait for sck_period/2;
				sck <= not sck;                
			end loop;		-- i index
			wait for sck_period;
			ss_bar <= '1';	-- deselect slave			
			
			wait for 10 * sck_period;
			
		end loop;	-- k indexed loop
		end_sim <= true;     -- stop system clock
		std.env.finish;		-- stop simulation
	end process;
	
end tb_architecture;