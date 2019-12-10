--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   18:23:20 11/27/2019
-- Design Name:   
-- Module Name:   C:/Users/lab/Desktop/27.11.2019/counter_synchr/counter_synchr_test.vhd
-- Project Name:  counter_synchr
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: counter_synchr
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
 
ENTITY counter_synchr_test IS
END counter_synchr_test;
 
ARCHITECTURE behavior OF counter_synchr_test IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT counter_synchr
    PORT(
         clk : IN  std_logic;
			rst : IN std_logic;
         count : OUT  std_logic_vector(2 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
	
	signal rst : std_logic := '0';

 	--Outputs
   signal count : std_logic_vector(2 downto 0) := "000";

   -- Clock period definitions
   constant clk_period : time := 50 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: counter_synchr PORT MAP (
          clk => clk,
			 rst => rst,
          count => count
        );

   clk_process :process
   begin
		wait for clk_period / 2;
		clk <= not clk;		
   end process;

END;
