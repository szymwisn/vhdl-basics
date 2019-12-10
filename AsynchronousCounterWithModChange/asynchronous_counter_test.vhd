--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   18:06:35 11/26/2019
-- Design Name:   
-- Module Name:   /home/szymon/Pulpit/UCISW/AsyncCounter/asynchronous_counter_test.vhd
-- Project Name:  AsyncCounter
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: asynchronous_counter
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
 
ENTITY asynchronous_counter_test IS
END asynchronous_counter_test;
 
ARCHITECTURE behavior OF asynchronous_counter_test IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT asynchronous_counter
    PORT(
         z : IN  std_logic_vector(1 downto 0);
         clk : IN  std_logic;
         count : OUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal z : std_logic_vector(1 downto 0) := "00";
   signal clk : std_logic := '0';

 	--Outputs
   signal count : std_logic_vector(3 downto 0);

   -- Clock period definitions
   constant clk_period : time := 50 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: asynchronous_counter PORT MAP (
          z => z,
          clk => clk,
          count => count
        );

   -- Clock process definitions
   clk_process :process
   begin
		wait for clk_period / 2;
		clk <= not clk;		
   end process;	


END;
