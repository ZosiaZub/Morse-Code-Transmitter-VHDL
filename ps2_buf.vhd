----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:24:17 04/29/2023 
-- Design Name: 
-- Module Name:    ps2_buf - Behavioral 
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

entity ps2_buf is
    Port ( KBD_IN : in  STD_LOGIC_VECTOR (7 downto 0);
           F0 : in  STD_LOGIC;
           KBD_RDY : in  STD_LOGIC;
           CLK : in  STD_LOGIC;
           KBD_OUT : out  STD_LOGIC_VECTOR (7 downto 0);
           F0_OUT : out  STD_LOGIC;
           KBD_RDY_OUT : out  STD_LOGIC);
end ps2_buf;

architecture Behavioral of ps2_buf is

begin

KBD_OUT <= KBD_IN;
F0_OUT <= F0;
KBD_RDY_OUT <= KBD_RDY;

end Behavioral;

