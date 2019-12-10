----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:25:47 12/10/2019 
-- Design Name: 
-- Module Name:    min_max_listener - Behavioral 
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

entity min_max_listener is
    Port ( number : in  STD_LOGIC_VECTOR (3 downto 0);
           mode : in  STD_LOGIC := '0';
           rst : in  STD_LOGIC;
           accept : in  STD_LOGIC;
           minmax : out  STD_LOGIC_VECTOR (3 downto 0) := "0000"
			);
end min_max_listener;

architecture Behavioral of min_max_listener is
	signal value: integer;
	signal max: integer := 0;
	signal min: integer := 15;
	
begin

	process(rst) 
	begin
		if(rst = '1') then
			max <= -99999;
			min <= 99999;
			minmax <= "0000";
		end if;
	end process;
	
	process(number, mode, accept)
	begin
		value <= to_integer(unsigned(number));
	
		if (accept'event and accept = '1') then
			if (mode = '0' and value < min) then
				minmax <= number;
			end if;
			
			if (mode = '1' and value > max) then 
				minmax <= number;
			end if;
		end if;
	end process;

end Behavioral;

