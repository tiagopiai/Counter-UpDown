--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   11:34:50 10/20/2015
-- Design Name:   
-- Module Name:   E:/Documents/ASU Courses/EEE 333 - Hardware Design/Labs/Lab 1/Counter_updown/Hex_Display_tb.vhd
-- Project Name:  Counter_updown
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Hex_Display
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
 
ENTITY Hex_Display_tb IS
END Hex_Display_tb;
 
ARCHITECTURE behavior OF Hex_Display_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Hex_Display
    PORT(
         data : IN  std_logic_vector(3 downto 0);
         sevseg : OUT  std_logic_vector(6 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal data : std_logic_vector(3 downto 0) := (others => '0');

 	--Outputs
   signal sevseg : std_logic_vector(6 downto 0);

 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Hex_Display PORT MAP (
          data => data,
          sevseg => sevseg
        );
	
PROCESS
	BEGIN
	
	data <= x"0";
	WAIT FOR 2 NS;
	
	data <= x"1";
	WAIT FOR 2 NS;
	
	data <= x"2";
	WAIT FOR 2 NS;
	
	data <= x"3";
	WAIT FOR 2 NS;
	
	data <= x"4";
	WAIT FOR 2 NS;
	
	data <= x"5";
	WAIT FOR 2 NS;
	
	data <= x"6";
	WAIT FOR 2 NS;
	
	data <= x"7";
	WAIT FOR 2 NS;
	
	data <= x"8";
	WAIT FOR 2 NS;
	
	data <= x"9";
	WAIT FOR 2 NS;
	
	data <= x"A";
	WAIT FOR 2 NS;
	
	data <= x"B";
	WAIT FOR 2 NS;

	data <= x"C";
	WAIT FOR 2 NS;
	
	data <= x"D";
	WAIT FOR 2 NS;
	
	data <= x"E";
	WAIT FOR 2 NS;
	
	data <= x"F";
	
	WAIT FOR 2 NS;
	
	data <= x"0";
	WAIT;
END PROCESS;


END;
