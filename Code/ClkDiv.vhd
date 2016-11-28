LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;

-----------------------------------------

ENTITY ClkDiv IS 
	PORT(Clock_50MHz: IN STD_LOGIC;
			rst: IN STD_LOGIC;
			clk_out, clk_seg: OUT STD_LOGIC);
END ClkDiv;

-----------------------------------------

ARCHITECTURE func OF ClkDiv IS
SIGNAL cnt: STD_LOGIC_VECTOR(23 DOWNTO 0);
SIGNAL cnt_seg: STD_LOGIC_VECTOR(10 DOWNTO 0);
BEGIN

-- Clock divider for the count with reset implemented
clkcount:
PROCESS(rst, Clock_50MHz)
BEGIN
	IF (rst = '1') THEN
		cnt <= x"000000";
	ELSIF (Clock_50MHz'EVENT AND Clock_50MHz = '1') THEN
		cnt <= cnt + 1;
	END IF;
END PROCESS;

-- Clock divider for the seven segment displays without reset
clkseg:
PROCESS(Clock_50MHz)
BEGIN
	IF (Clock_50MHz'EVENT AND Clock_50MHz = '1') THEN
		cnt_seg <= cnt_seg + 1;
	END IF;	
END PROCESS;

-- Output statements 
clk_seg <= cnt_seg(10); -- refresh hate: 24414.06 Hz
clk_out <= cnt(23); -- count rate: 2.98 Hz

END func;