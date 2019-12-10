----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:50:34 11/27/2019 
-- Design Name: 
-- Module Name:    counter_synchr - Behavioral 
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

entity counter_synchr is
    Port ( clk : in  STD_LOGIC;
			  rst : in STD_LOGIC;
           count : out  STD_LOGIC_VECTOR (2 downto 0));
end counter_synchr;

architecture Behavioral of counter_synchr is

signal iter : integer := 0;

begin

process (clk, rst)
begin

	if rst = '1' then
		count <= "000";
		iter <= 0;
	elsif clk'event then 
		case iter is 
			when 0 => 
				count <= "000";
				iter <= iter + 1;
			when 1 => 
				count <= "001";
				iter <= iter + 1;
			when 2 => 
				count <= "010";
				iter <= iter + 1;
			when 3 => 
				count <= "101";
				iter <= iter + 1;
			when 4 => 
				count <= "100";
				iter <= 0;		
			when others =>
				count <= "000";
				iter <= 0;
		end case;
	end if;

end process;


end Behavioral;

