----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:10:55 12/10/2019 
-- Design Name: 
-- Module Name:    residue_mod4_mealy - Behavioral 
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

entity residue_mod4_mealy is
    Port ( CLK : in  STD_LOGIC;
           X : in  STD_LOGIC;
           Y : out  STD_LOGIC_VECTOR (1 downto 0) := "00"
			);
end residue_mod4_mealy;

architecture Behavioral of residue_mod4_mealy is

	type state is (stateA, stateB);
	signal currentState : state := stateA;

begin

	process(X, CLK) 
	begin
		if(CLK'event and CLK = '1') then
			if (X = '0' and currentState = stateA) then
				Y <= "00";
			elsif (X = '1' and currentState = stateA) then
				currentState <= stateB;
				Y <= "01";
			elsif (X = '0' and currentState = stateB) then
				currentState <= stateA;
				Y <= "10";
			elsif (X = '1' and currentState = stateB) then
				Y <= "11";
			end if;		
		end if;
	end process;

end Behavioral;

