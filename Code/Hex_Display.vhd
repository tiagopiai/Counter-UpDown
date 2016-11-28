LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY Hex_Display IS
	PORT (data: IN STD_LOGIC_VECTOR (3 DOWNTO 0);
		   sevseg: OUT STD_LOGIC_VECTOR (6 DOWNTO 0));
END Hex_Display;

ARCHITECTURE func OF Hex_Display IS

	SIGNAL leds: STD_LOGIC_VECTOR (6 DOWNTO 0);
	
BEGIN
-- Conversion of a for bit data to the equivalent in seven segment display
	PROCESS (data)
		BEGIN
				CASE data IS			 	  --abcdefg
					WHEN x"0"=> 	leds 	<= "1111110";
					WHEN x"1"=> 	leds 	<= "0110000";
					WHEN x"2"=> 	leds 	<= "1101101";
					WHEN x"3"=> 	leds 	<= "1111001";
					WHEN x"4"=> 	leds 	<= "0110011";
					WHEN x"5"=> 	leds 	<= "1011011";
					WHEN x"6"=> 	leds 	<= "1011111";
					WHEN x"7"=> 	leds 	<= "1110000";
					WHEN x"8"=> 	leds 	<= "1111111";
					WHEN x"9"=> 	leds 	<= "1111011";
					WHEN x"A" => 	leds 	<= "1110111"; 
					WHEN x"B" => 	leds 	<= "0011111"; 
					WHEN x"C" => 	leds 	<= "0001101"; 
					WHEN x"D" => 	leds 	<= "0111101"; 
					WHEN x"E" => 	leds 	<= "1001111"; 
					WHEN OTHERS => leds 	<= "1000111"; 
				END CASE;
		END PROCESS;
		
	-- Invert the seven segment
	sevseg <= NOT(leds);		
end func;

