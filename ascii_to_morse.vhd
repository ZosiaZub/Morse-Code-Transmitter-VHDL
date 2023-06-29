----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:16:10 04/29/2023 
-- Design Name: 
-- Module Name:    ascii_to_morse - Behavioral 
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
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ascii_to_morse is
    Port ( CLK :  IN STD_LOGIC;
			  ASCII : in  STD_LOGIC_VECTOR (7 downto 0);
           MORSE : out  STD_LOGIC_VECTOR (4 downto 0);
           MORSE_LEN : out  STD_LOGIC_VECTOR (4 downto 0);
           ASCII_RDY : in  STD_LOGIC;
           MORSE_RDY : out  STD_LOGIC);
end ascii_to_morse;

architecture Behavioral of ascii_to_morse is

begin

process(ASCII_RDY, CLK)	-- czy tu faktycznie clk?
begin
if ASCII_RDY = '1' then
	case ASCII is
	
		-- 1 to w morsie dlugi  (-)
		-- 0 to w morsie krotki (.)
	
		when x"41" =>					-- A
			MORSE <= "01000";
			MORSE_LEN <= "11000";
		
		when x"42" =>					-- B
			MORSE <= "10000";
			MORSE_LEN <= "11110";
			
		when x"43" =>					-- C
			MORSE <= "10100";
			MORSE_LEN <= "11110";
		
		when x"34" =>					-- 4
			MORSE <= "00001";
			MORSE_LEN <= "11111";
			
		when others =>
			MORSE <= "00000";
			MORSE_LEN <= "00000";
			
	end case;
	MORSE_RDY <= '1';
else
	MORSE_RDY <= '0';
end if;
end process;


end Behavioral;

