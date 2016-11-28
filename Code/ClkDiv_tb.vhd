--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   11:09:27 10/20/2015
-- Design Name:   
-- Module Name:   E:/Documents/ASU Courses/EEE 333 - Hardware Design/Labs/Lab 1/Counter_updown/ClkDiv_tb.vhd
-- Project Name:  Counter_updown
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: ClkDiv
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
 
ENTITY ClkDiv_tb IS
END ClkDiv_tb;
 
ARCHITECTURE behavior OF ClkDiv_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT ClkDiv
    PORT(
         Clock_50MHz : IN  std_logic;
         rst : IN  std_logic;
         clk_out : OUT  std_logic;
         clk_seg : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal Clock_50MHz : std_logic := '0';
   signal rst : std_logic := '0';

 	--Outputs
   signal clk_out : std_logic;
   signal clk_seg : std_logic;

BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: ClkDiv PORT MAP (
          Clock_50MHz => Clock_50MHz,
          rst => rst,
          clk_out => clk_out,
          clk_seg => clk_seg
        );
		  
   -- Clock process definitions
   Clock_50MHz_process :process
   begin
		Clock_50MHz <= '0';
		wait for 2 NS;
		Clock_50MHz <= '1';
		wait for 2 NS;
   end process;
 
END;
