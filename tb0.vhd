--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   09:12:33 07/09/2022
-- Design Name:   
-- Module Name:   F:/Edu/FPGA/generic_fuzzy_test/tb0.vhd
-- Project Name:  generic_fuzzy_test
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: fuzzifier
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
 
ENTITY tb0 IS
END tb0;
 
ARCHITECTURE behavior OF tb0 IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT fuzzifier
    PORT(
         clock : IN  std_logic;
         config_params : IN  std_logic;
         lux_error : IN  signed(10 downto 0);
         level_1_a : IN  signed(10 downto 0);
         level_1_b : IN  signed(10 downto 0);
         level_1_c : IN  signed(10 downto 0);
         level_2_a : IN  signed(10 downto 0);
         level_2_b : IN  signed(10 downto 0);
         level_2_c : IN  signed(10 downto 0);
         level_3_a : IN  signed(10 downto 0);
         level_3_b : IN  signed(10 downto 0);
         level_3_c : IN  signed(10 downto 0);
         level_4_a : IN  signed(10 downto 0);
         level_4_b : IN  signed(10 downto 0);
         level_4_c : IN  signed(10 downto 0);
         z1 : IN  signed(7 downto 0);
         z2 : IN  signed(7 downto 0);
         z3 : IN  signed(7 downto 0);
         z4 : IN  signed(7 downto 0);
         change_in_DC : OUT  signed(7 downto 0);
         data_valid : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal clock : std_logic := '0';
   signal config_params : std_logic := '0';
   signal lux_error : signed(10 downto 0) := (others => '0');
   signal level_1_a : signed(10 downto 0) := (others => '0');
   signal level_1_b : signed(10 downto 0) := (others => '0');
   signal level_1_c : signed(10 downto 0) := (others => '0');
   signal level_2_a : signed(10 downto 0) := (others => '0');
   signal level_2_b : signed(10 downto 0) := (others => '0');
   signal level_2_c : signed(10 downto 0) := (others => '0');
   signal level_3_a : signed(10 downto 0) := (others => '0');
   signal level_3_b : signed(10 downto 0) := (others => '0');
   signal level_3_c : signed(10 downto 0) := (others => '0');
   signal level_4_a : signed(10 downto 0) := (others => '0');
   signal level_4_b : signed(10 downto 0) := (others => '0');
   signal level_4_c : signed(10 downto 0) := (others => '0');
   signal z1 : signed(7 downto 0) := (others => '0');
   signal z2 : signed(7 downto 0) := (others => '0');
   signal z3 : signed(7 downto 0) := (others => '0');
   signal z4 : signed(7 downto 0) := (others => '0');

 	--Outputs
   signal change_in_DC : signed(7 downto 0);
   signal data_valid : std_logic;

   -- Clock period definitions
   constant clock_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: fuzzifier PORT MAP (
          clock => clock,
          config_params => config_params,
          lux_error => lux_error,
          level_1_a => level_1_a,
          level_1_b => level_1_b,
          level_1_c => level_1_c,
          level_2_a => level_2_a,
          level_2_b => level_2_b,
          level_2_c => level_2_c,
          level_3_a => level_3_a,
          level_3_b => level_3_b,
          level_3_c => level_3_c,
          level_4_a => level_4_a,
          level_4_b => level_4_b,
          level_4_c => level_4_c,
          z1 => z1,
          z2 => z2,
          z3 => z3,
          z4 => z4,
          change_in_DC => change_in_DC,
          data_valid => data_valid
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
		
		lux_error 				<= to_signed(300,11);
		
		
		level_1_a		<= to_signed(0,11);
		level_1_b		<= to_signed(0,11);
		level_1_c		<= to_signed(200,11);		
		
		level_2_a		<= to_signed(0,11);
		level_2_b		<= to_signed(200,11);
		level_2_c		<= to_signed(400,11);		
		
		level_3_a		<= to_signed(200,11);
		level_3_b		<= to_signed(400,11);
		level_3_c		<= to_signed(600,11);		
		
		level_4_a		<= to_signed(400,11);
		level_4_b		<= to_signed(600,11);
		level_4_c		<= to_signed(600,11);
		
		z1					<= to_signed(0,8);
		z2					<= to_signed(40,8);
		z3					<= to_signed(60,8);
		z4					<= to_signed(100,8);
		
		config_params	<= '1';

      wait;
   end process;

END;
