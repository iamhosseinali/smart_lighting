--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   15:29:00 07/24/2022
-- Design Name:   
-- Module Name:   F:/Edu/FPGA/generic_fuzzy_test/optimizer_tb.vhd
-- Project Name:  generic_fuzzy_test
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Optimizer
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- signed for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
USE ieee.numeric_std.ALL;
 
ENTITY optimizer_tb IS
END optimizer_tb;
 
ARCHITECTURE behavior OF optimizer_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Optimizer
    PORT(
         clock : IN  std_logic;
         Result : IN  signed(10 downto 0);
         param_1 : OUT  signed(7 downto 0);
         config_params : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal clock : std_logic := '0';
   signal Result : signed(10 downto 0) := (others => '0');

 	--Outputs
   signal param_1 : signed(7 downto 0);
   signal config_params : std_logic;

   -- Clock period definitions
   constant clock_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Optimizer PORT MAP (
          clock => clock,
          Result => Result,
          param_1 => param_1,
          config_params => config_params
        );

   -- Clock process definitions
   clock_process :process
   begin
		clock <= '0';
		wait for clock_period/2;
		clock <= '1';
		wait for clock_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      wait for clock_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
