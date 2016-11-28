LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY Counter_updown IS
PORT(	clk_count, clk_seg, rst, up_down, pause: IN STD_LOGIC;
		DataOut: OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
		sevseg: OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
		Display_EN: OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
		LED_clk: OUT STD_LOGIC);
END Counter_updown;

ARCHITECTURE func OF Counter_updown IS

COMPONENT Counter
PORT(	clk, up_down, rst, pause: IN STD_LOGIC;
		Data_out: OUT STD_LOGIC_VECTOR(15 DOWNTO 0));
END COMPONENT;

--COMPONENT ClkDiv
--	PORT(Clock_50MHz: IN STD_LOGIC;
--			rst: IN STD_LOGIC;
--			clk_out, clk_seg: OUT STD_LOGIC);
--END COMPONENT;

COMPONENT Hex_Display
	PORT (data: IN STD_LOGIC_VECTOR (3 DOWNTO 0);
		   sevseg: OUT STD_LOGIC_VECTOR (6 DOWNTO 0));
END COMPONENT;

--SIGNAL clkout, clk_seg: STD_LOGIC;
SIGNAL Data_count: STD_LOGIC_VECTOR(15 DOWNTO 0);
SIGNAL Data_seg: STD_LOGIC_VECTOR(3 DOWNTO 0);

BEGIN
--U1: ClkDiv PORT MAP (clkin, rst, clkout, clk_seg);
U2: Counter PORT MAP (clk_count, up_down, rst, pause, Data_count);

D0: Hex_Display PORT MAP (Data_seg, sevseg);

LED_clk <= clk_count;


-- Process to refresh the values in the displays in a faster clock (clk_seg).

PROCESS(clk_seg)
VARIABLE refresh: INTEGER RANGE 0 TO 3 := 0;
BEGIN
IF (clk_seg'EVENT AND clk_seg = '1') THEN
	CASE refresh IS
		WHEN 0 =>
			Data_seg <= Data_count(3 DOWNTO 0);
			Display_EN <= "1110";
			refresh := refresh + 1;
		WHEN 1 =>
			Data_seg <= Data_count(7 DOWNTO 4);
			Display_EN <= "1101";
			refresh := refresh + 1;
		WHEN 2 =>
			Data_seg <= Data_count(11 DOWNTO 8);
			Display_EN <= "1011";
			refresh := refresh + 1;
		WHEN 3 =>
			Data_seg <= Data_count(15 DOWNTO 12);
			Display_EN <= "0111";
			refresh := 0;
	END CASE;
END IF;
END PROCESS;

DataOut <= Data_count;

END func;