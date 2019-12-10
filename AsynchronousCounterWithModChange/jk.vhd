----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:45:45 11/26/2019 
-- Design Name: 
-- Module Name:    jk - Behavioral 
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
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;
use IEEE.NUMERIC_STD.ALL;

entity jk is
    Port ( clk : 	in  STD_LOGIC;
           rst : 	in  STD_LOGIC;
           j : 	in  STD_LOGIC;
           k : 	in  STD_LOGIC;
           q : 	out  STD_LOGIC);
end jk;

architecture Behavioral of jk is

signal jk: std_logic_vector(1 downto 0):="00";
signal q_sig: std_logic:='0';

begin
	jk <= j & k;
	
	process(clk, rst) 
	begin
		if rst = '1' then
		   q_sig <= '0';
		elsif falling_edge(clk) then
			case(jk) is
				when "00" => q_sig <= q_sig;
				when "01" => q_sig <= '0';
				when "10" => q_sig <= '1';
				when others => q_sig <= not q_sig;
			end case;
		end if;
	end process;
	
	q <= q_sig;

end Behavioral;

