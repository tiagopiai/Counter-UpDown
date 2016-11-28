--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   13:51:07 10/20/2015
-- Design Name:   
-- Module Name:   E:/Documents/ASU Courses/EEE 333 - Hardware Design/Labs/Lab 1/Counter_updown/Counter_updown_tb.vhd
-- Project Name:  Counter_updown
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Counter_updown
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY Counter_updown_tb IS
END Counter_updown_tb;
 
ARCHITECTURE behavior OF Counter_updown_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Counter_updown
    PORT(
         clk_count : IN  std_logic;
         clk_seg : IN  std_logic;
         rst : IN  std_logic;
         up_down : IN  std_logic;
         pause : IN  std_logic;
         DataOut : OUT  std_logic_vector(15 downto 0);
         sevseg : OUT  std_logic_vector(6 downto 0);
         Display_EN : OUT  std_logic_vector(3 downto 0);
         LED_clk : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal clk_count : std_logic := '0';
   signal clk_seg : std_logic := '0';
   signal rst : std_logic := '0';
   signal up_down : std_logic := '0';
   signal pause : std_logic := '0';

 	--Outputs
   signal DataOut : std_logic_vector(15 downto 0);
   signal sevseg : std_logic_vector(6 downto 0);
   signal Display_EN : std_logic_vector(3 downto 0);
   signal LED_clk : std_logic;

   
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Counter_updown PORT MAP (
          clk_count => clk_count,
          clk_seg => clk_seg,
          rst => rst,
          up_down => up_down,
          pause => pause,
          DataOut => DataOut,
          sevseg => sevseg,
          Display_EN => Display_EN,
          LED_clk => LED_clk
        );

-- Process for the clock of the counter
	PROCESS
	BEGIN
		clk_count <= '1';
		WAIT FOR 4 NS;
		clk_count <= '0';
		WAIT FOR 4 NS;
	END PROCESS;
	
-- Process for the clock of the seven segment display
	PROCESS
	BEGIN
		clk_seg <= '1';
		WAIT FOR 1 NS;
		clk_seg <= '0';
		WAIT FOR 1 NS;
	END PROCESS;
	
-- Process to test reset, pause and up/down counting
	PROCESS
	BEGIN
	-- Down couting
		up_down <= '0';
		rst <= '0';
		pause <= '0';
		WAIT FOR 32 NS;
		
	-- Up counting
		up_down <= '1';
		WAIT FOR 20 NS;
	
	-- Pause test
		pause <= '1';
		WAIT FOR 24 NS;
		pause <= '0';
		WAIT FOR 20 NS;
	
	-- Reset test
		rst <= '1';
		WAIT FOR 20 NS;
		rst <= '0';
		WAIT;
	END PROCESS;
END;
