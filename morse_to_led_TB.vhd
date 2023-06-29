--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   00:32:35 04/30/2023
-- Design Name:   
-- Module Name:   /home/ise/Projekty/morse_code/morse_to_led_TB.vhd
-- Project Name:  morse_code
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: morse_to_led
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
 
ENTITY morse_to_led_TB IS
END morse_to_led_TB;
 
ARCHITECTURE behavior OF morse_to_led_TB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT morse_to_led
    PORT(
         MORSE_RDY : IN  std_logic;
         CLK : IN  std_logic;
         MORSE_IN : IN  std_logic_vector(4 downto 0);
         LED : OUT  std_logic;
         MORSE_LEN : IN  std_logic_vector(4 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal MORSE_RDY : std_logic := '1';
   signal CLK : std_logic := '0';
	signal MORSE_IN : std_logic_vector(4 downto 0) := "00001";
   signal MORSE_LEN : std_logic_vector(4 downto 0) := "11111";

 	--Outputs
   signal LED : std_logic;

   -- Clock period definitions
   constant CLK_period : time := 20 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: morse_to_led PORT MAP (
          MORSE_RDY => MORSE_RDY,
          CLK => CLK,
          MORSE_IN => MORSE_IN,
          LED => LED,
          MORSE_LEN => MORSE_LEN
        );

   -- Clock process definitions
   CLK_process: process
   begin
		CLK <= '0';
		wait for CLK_period/2;
		CLK <= '1';
		wait for CLK_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
	
   begin		
      -- hold reset state for 2.5 ns.
      --wait for 2.5 ns;	
		
		MORSE_RDY <= '0', '1' after 100 ns, '0' after 120 ns;

      wait;
   end process;

END;
