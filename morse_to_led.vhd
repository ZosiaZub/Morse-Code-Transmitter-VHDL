----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:18:18 04/29/2023 
-- Design Name: 
-- Module Name:    morse_to_led - Behavioral 
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
use IEEE.NUMERIC_STD.ALL;
use IEEE.std_logic_unsigned.all;
use IEEE.std_logic_arith.all;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity morse_to_led is
    Port ( MORSE_RDY : in  STD_LOGIC;
           CLK : in  STD_LOGIC;
           MORSE_IN : in  STD_LOGIC_VECTOR (4 downto 0);
           LED : out  STD_LOGIC;
           MORSE_LEN : in  STD_LOGIC_VECTOR (4 downto 0));
end morse_to_led;

architecture Behavioral of morse_to_led is
	constant short_led : integer := 10; 	  		  -- 1/5 sec 	--> kropka
	constant long_led : integer := short_led * 3;  -- 3/5 sec   --> kreska
	type state_type is (IDLE, A, B, C, D);
	signal state, next_state : state_type;
	signal clocks : integer := 0;
   signal index : integer := 0;
	signal what_is_counted : integer := 0; 		  -- 0 to przerwa, 1 to znak
	
	
begin

	-- CLK
	process_CLK : process (CLK)				
	begin
		if rising_edge(CLK) then
			state <= next_state;
		end if;
	end process;
	
	
	-- clocks (zegar do odliczania LEDa)
	process_clocks : process (CLK, state, MORSE_IN)			
	begin
		if rising_edge(CLK) then
		
			--if state = IDLE then									-- przerwa przed literka
			--	clocks <= 1; 
				
			if state = A AND MORSE_IN(index) = '1' then		-- kreska
				clocks <= long_led;
				
			elsif state = A AND MORSE_IN(index) = '0' then	-- kropka
				clocks <= short_led;
				
			elsif state = C then										-- przerwa miedzy - i .
				clocks <= short_led;
				
			else 
				clocks <= clocks - 1; 								-- odliczamy
				
			end if;
		end if;
	end process;
	
	
	-- index
	process_index : process (CLK, state)				
	begin
		if rising_edge(CLK) then
		
			if state = IDLE then
				index <= 4;
				
			elsif state = C then
				index <= index - 1;
				
			end if;
		end if;
	end process;
	
	
	-- what is counted (1 to znak, 0 to przerwa)
	process_what_is_counted : process (CLK, state)
	begin
		if rising_edge(CLK) then
		
			if state = IDLE  OR state = C then
				what_is_counted <= 0;
				
			elsif state = A then
				what_is_counted <= 1;
			
			end if;
		end if;
	end process;
	
	
	-- LED
	process_LED : process (CLK, state)				 
	begin
		if rising_edge(CLK) then
			if state = B  AND what_is_counted = 1 then
				if clocks > 0 then
					LED <= '1';
				else
					LED <= '0';
				end if;	
			else
				   LED <= '0';
			end if;
		end if;
	end process;
	
	
	-- main
	process_main : process (state, MORSE_RDY, CLK)
	begin
		next_state <= state;
		
			case state is

				-- STAN POCZTKOWY
				when IDLE =>
					if MORSE_RDY = '1' then
						next_state <= A;
					end if;
					
					
				-- ODCZYT ZNAKU
				when A =>
					next_state <= B;
				
				
				-- ODLICZANIE CZASU
				when B =>
					if what_is_counted = 1 AND clocks = 0 then		-- skonczyl sie znak
						next_state <= C;
						
					elsif what_is_counted = 0 AND clocks = 0 then	-- skonczyla sie przerwa
						next_state <= A;
						
					end if;
				
				
				-- ZMIANA INDEKSU
				when C =>
					next_state <= D;
				
				
				-- SPRAWDZENIE CZY DALEJ ODCZYTYWAC 
				when D =>
					if index = -1 OR MORSE_LEN(index) = '0' then
						next_state <= IDLE;
					else
						next_state <= B;
					end if;
					
					
			end case;
	end process;

end Behavioral;

