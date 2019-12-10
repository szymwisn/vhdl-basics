----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    19:18:26 11/27/2019 
-- Design Name: 
-- Module Name:    range_detector - Behavioral 
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

entity range_detector is
    Port ( x : in  STD_LOGIC_VECTOR (3 downto 0);
           y : out  STD_LOGIC);
end range_detector;

architecture Behavioral of range_detector is

begin

process (x) 
begin

--	case x is 
--		when "0010" => y <= '1';
--		when "0011" => y <= '1';
--		when "0100" => y <= '1';
--		when "0101" => y <= '1';
--		when "0110" => y <= '1';
--		when "0111" => y <= '1';
--		when "1001" => y <= '1';
--		when "1010" => y <= '1';
--		when "1011" => y <= '1';
--		when others => y <= '0';
--	end case;

--with x select y <=
--	'1' when "0010",
--	'1' when "0011",
--	'1' when "0100",
--	'1' when "0101",
--	'1' when "0110",
--	'1' when "0111",
--	'1' when "1001",
--	'1' when "1010",
--	'1' when "1011",
--	'0' when others;


--y <= '1' when x = "0010" else
--'1' when x = "0011" else
--'1' when x = "0100" else
--'1' when x = "0101" else
--'1' when x = "0110" else
--'1' when x = "0111" else
--'1' when x = "1001" else
--'1' when x = "1010" else
--'1' when x = "1011" else
--'0';

if x = "0010" then y <= '1';
elsif x = "0011" then y <= '1';
elsif x = "0100" then y <= '1';
elsif x = "0101" then y <= '1';
elsif x = "0110" then y <= '1';
elsif x = "0111" then y <= '1';
elsif x = "1001" then y <= '1';
elsif x = "1010" then y <= '1';
elsif x = "1011" then y <= '1';
else y <= '0';
end if;

end process;


end Behavioral;

