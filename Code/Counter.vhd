LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;
USE ieee.std_logic_arith.all;

-----------------------------------------

ENTITY Counter IS
PORT(	clk, up_down, rst, pause: IN STD_LOGIC;
		Data_out: OUT STD_LOGIC_VECTOR(15 DOWNTO 0));
END Counter;

-----------------------------------------

ARCHITECTURE func OF Counter IS
SIGNAL Data_count: INTEGER RANGE 0 TO 65535;
BEGIN

-- Process that increments or decrements the count with reset and pause implemented 
PROCESS(clk, rst, pause)
BEGIN
-- check for reset
IF (rst = '1') THEN
Data_count <= 0;

-- check for pause
ELSIF (pause = '0') THEN
	IF (clk'EVENT AND clk = '1') THEN
	-- up counting
		IF (up_down = '1') THEN
			IF (Data_count < 65535) THEN
				Data_count <= Data_count + 1;
			ELSE
				Data_count <= 0; -- restart counting
			END IF;
	-- down counting
		ELSIF (up_down = '0') THEN
			IF (Data_count > 0) THEN
				Data_count <= Data_count - 1;
			ELSE
				Data_count <= 65535; -- restart counting
			END IF;
		END IF;
	END IF;
END IF;
END PROCESS;

-- Output statement
Data_out <= CONV_STD_LOGIC_VECTOR(Data_count, 16); -- Convert integer to 16 bit std_logic_vector

END func;