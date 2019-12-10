----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:43:12 12/10/2019 
-- Design Name: 
-- Module Name:    signal_delay - Behavioral 
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

entity signal_delay is
    Port ( clk : in  STD_LOGIC;
           rst : in  STD_LOGIC;
           start : in  STD_LOGIC;
           delay : in  STD_LOGIC_VECTOR (3 downto 0);
           y : out  STD_LOGIC);
end signal_delay;

architecture Behavioral of signal_delay is
	signal counter: integer;
	signal isCounterRunning: STD_LOGIC;
	
begin
	process(clk)
	begin
		if (clk'event and clk = '1') then
			if (isCounterRunning = '1' and counter > 0) then
				counter <= counter - 1;
			end if;
		end if;
	end process;

	process(start, rst)
	begin
		counter <= to_integer(unsigned(delay));

		if start = '1' then 
			isCouterRunning <= '1';
		end if;
		
		if rst = '1' then 
			isCounterRunning <= '0';
		end if;
	end process;
	
	process(counter) 
	begin
		if (counter = 0 and isCounterRunning = '1') then
			y <= '1';
			isCounterRunning <= '0';
		else
			y <= '0';
		end if;
	end process;


end Behavioral;

