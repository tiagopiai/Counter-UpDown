--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   11:32:01 10/20/2015
-- Design Name:   
-- Module Name:   E:/Documents/ASU Courses/EEE 333 - Hardware Design/Labs/Lab 1/Counter_updown/Counter_tb.vhd
-- Project Name:  Counter_updown
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Counter
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
 
ENTITY Counter_tb IS
END Counter_tb;
 
ARCHITECTURE behavior OF Counter_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Counter
    PORT(
         clk : IN  std_logic;
         up_down : IN  std_logic;
         rst : IN  std_logic;
         pause : IN  std_logic;
         Data_out : OUT  std_logic_vector(15 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal up_down : std_logic := '0';
   signal rst : std_logic := '0';
   signal pause : std_logic := '0';

 	--Outputs
   signal Data_out : std_logic_vector(15 downto 0);

 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Counter PORT MAP (
          clk => clk,
          up_down => up_down,
          rst => rst,
          pause => pause,
          Data_out => Data_out
        );

clktest:
	PROCESS
	BEGIN
		clk <= NOT clk;
		WAIT FOR 2 NS;
	END PROCESS;

data:
	PROCESS
	BEGIN
		up_down <= '1';
		WAIT FOR 20 NS;
		pause <= '1';
		WAIT FOR 10 NS;
		pause <= '0';
		WAIT FOR 20 NS;
		up_down <= '0';
		WAIT FOR 20 NS;
		rst <= '1';
		WAIT FOR 10 NS;
		rst <= '0';	
	END PROCESS;
END;
