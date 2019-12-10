--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   19:21:44 11/27/2019
-- Design Name:   
-- Module Name:   C:/Users/lab/Desktop/27.11.2019/range_detector/range_detector_test.vhd
-- Project Name:  range_detector
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: range_detector
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
 
ENTITY range_detector_test IS
END range_detector_test;
 
ARCHITECTURE behavior OF range_detector_test IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT range_detector
    PORT(
         x : IN  std_logic_vector(3 downto 0);
         y : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal x : std_logic_vector(3 downto 0) := (others => '0');

 	--Outputs
   signal y : std_logic;
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: range_detector PORT MAP (
          x => x,
          y => y
        );
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	
		
		x <= "0001";
		wait for 50 ns;
		x <= "0011";
		wait for 50 ns;
		x <= "0001";
		wait for 50 ns;
		x <= "0010";
		wait for 50 ns;
		x <= "0000";
		wait for 50 ns;
		x <= "0111";
		wait for 50 ns;
		x <= "1000";
		wait for 50 ns;
		x <= "1111";
		wait for 50 ns;
		x <= "1001";
		wait for 50 ns;
		x <= "1000";
		wait for 50 ns;
		x <= "1100";
		wait for 50 ns;
		x <= "1011";
		wait for 50 ns;

   end process;

END;
