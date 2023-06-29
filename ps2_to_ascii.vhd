----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:19:49 04/29/2023 
-- Design Name: 
-- Module Name:    ps2_to_ascii - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

ENTITY ps2_to_ascii IS
	PORT (
		CLK : IN STD_LOGIC;
		KBD_RDY : IN STD_LOGIC;
		KBD_F0 : IN STD_LOGIC;
		KBD_IN : IN STD_LOGIC_VECTOR (7 DOWNTO 0);
		ASCII : OUT STD_LOGIC_VECTOR (7 DOWNTO 0);
		ASCII_RDY : OUT STD_LOGIC);
END ps2_to_ascii;

ARCHITECTURE Behavioral OF ps2_to_ascii IS

BEGIN

	PROCESS (KBD_RDY, CLK)
	BEGIN
		IF rising_edge(CLK) AND KBD_RDY = '1' THEN	-- czy tu faktycznie clk?
			IF KBD_F0 = '1' THEN
				CASE KBD_IN IS
				
					WHEN x"1C" => ASCII <= x"41"; -- A
					WHEN x"32" => ASCII <= x"42"; -- B
					WHEN x"21" => ASCII <= x"43"; -- C
					WHEN x"23" => ASCII <= x"44"; -- D
					WHEN x"24" => ASCII <= x"45"; -- E
					WHEN x"2B" => ASCII <= x"46"; -- F
					WHEN x"34" => ASCII <= x"47"; -- G
					WHEN x"33" => ASCII <= x"48"; -- H
					WHEN x"43" => ASCII <= x"49"; -- I
					WHEN x"3B" => ASCII <= x"50"; -- J
					WHEN x"42" => ASCII <= x"51"; -- K
					WHEN x"4B" => ASCII <= x"52"; -- L
					WHEN x"3A" => ASCII <= x"53"; -- M
					WHEN x"31" => ASCII <= x"54"; -- N
					WHEN x"44" => ASCII <= x"55"; -- O
					WHEN x"4D" => ASCII <= x"56"; -- P
					WHEN x"2D" => ASCII <= x"57"; -- R
					WHEN x"1B" => ASCII <= x"58"; -- S
					WHEN x"2C" => ASCII <= x"58"; -- T
					WHEN x"3C" => ASCII <= x"59"; -- U
					WHEN x"1D" => ASCII <= x"60"; -- W
					WHEN x"35" => ASCII <= x"61"; -- Y
					WHEN x"1A" => ASCII <= x"62"; -- Z
					
					WHEN x"45" => ASCII <= x"30"; -- 0
					WHEN x"16" => ASCII <= x"31"; -- 1
					WHEN x"1E" => ASCII <= x"32"; -- 2
					WHEN x"26" => ASCII <= x"33"; -- 3
					WHEN x"25" => ASCII <= x"34"; -- 4
					WHEN x"2E" => ASCII <= x"35"; -- 5
					WHEN x"36" => ASCII <= x"36"; -- 6
					WHEN x"3D" => ASCII <= x"37"; -- 7
					WHEN x"3E" => ASCII <= x"38"; -- 8
					WHEN x"46" => ASCII <= x"39"; -- 9
						
					WHEN OTHERS => ASCII <= x"00";
						
				END CASE;
				
				ASCII_RDY <= '1';
			ELSE
				ASCII_RDY <= '0';
			END IF;
		END IF;
	END PROCESS;
END Behavioral;