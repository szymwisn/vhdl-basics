----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:14:10 12/10/2019 
-- Design Name: 
-- Module Name:    residue_mod4_moore - Behavioral 
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

entity residue_mod4_moore is
    Port ( CLK : in STD_LOGIC;
			  X : in  STD_LOGIC;
           Y : out  STD_LOGIC_VECTOR (1 downto 0) := "00"
			);
end residue_mod4_moore;

architecture Behavioral of residue_mod4_moore is

	type state is (stateA, stateB, stateC, stateD);
	signal currentState : state := stateA;
	signal nextState : state;

begin

	process(CLK)
	begin
		if (CLK'event and CLK='1') then
			currentState <= nextState;
		end if;
	end process;

	process(X, currentState)
	begin
		case currentState is
			when stateA =>
				if X  = '0' then
					nextState <= stateA;
				else
					nextState <= stateB;
				end if;
			when stateB =>
				if X  = '0' then
					nextState <= stateC;
				else
					nextState <= stateD;
				end if;
			when stateC =>
				if X  = '0' then
					nextState <= stateA;
				else
					nextState <= stateB;
				end if;
			when stateD =>
				if X  = '0' then
					nextState <= stateC;
				else
					nextState <= stateD;
				end if;
		end case;
	end process;
	
	process(currentState)
	begin
		case currentState is
			when stateA =>
				Y <= "00";
			when stateB => 
				Y <= "01";
			when stateC =>
				Y <= "10";
			when stateD =>
				Y <= "11";
		end case;
	end process;

end Behavioral;

