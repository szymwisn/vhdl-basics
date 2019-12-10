----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:43:07 11/26/2019 
-- Design Name: 
-- Module Name:    asynchronous_counter - Behavioral 
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

entity asynchronous_counter is
    Port ( z : 		in  STD_LOGIC_VECTOR (1 downto 0);
           clk : 		in  STD_LOGIC;
           count : 	out  STD_LOGIC_VECTOR (3 downto 0));
end asynchronous_counter;

architecture Behavioral of asynchronous_counter is

component jk    
	Port ( clk : 	in  STD_LOGIC;
           rst : 	in  STD_LOGIC;
           j : 	in  STD_LOGIC;
           k : 	in  STD_LOGIC;
           q : 	out  STD_LOGIC);
end component;

signal temp: std_logic_vector(3 downto 0);
signal reset: STD_LOGIC := '1';
signal mode: std_logic_vector(3 downto 0);


begin

	d0: jk port map(clk => clk,
						rst => reset,
						j => '1',
						k => '1',
						q => temp(0));
						
	d1: jk port map(clk => temp(0),
						rst => reset,
						j => '1',
						k => '1',
						q => temp(1));

	d2: jk port map(clk => temp(1),
						rst => reset,
						j => '1',
						k => '1',
						q => temp(2));
						
	d3: jk port map(clk => temp(2),
						rst => reset,
						j => '1',
						k => '1',
						q => temp(3));
						
	count(3) <= temp(3);
	count(2) <= temp(2);
	count(1) <= temp(1);
	count(0) <= temp(0);
	
	process(z, clk) 
	begin
	
		case z is 
			when "00" => 
				mode <= "1001";
			when "01" => 
				mode <= "1100";
			when "11" => 
				mode <= "1101";
			when "10" => 
				mode <= "1110";
			when others => 
				mode <= "1111";
		end case;
	
		if temp = mode then
			reset <= '1'; 
		else
			reset <= '0';
		end if;
	
	end process;

end Behavioral;

