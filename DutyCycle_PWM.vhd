----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:23:40 05/05/2022 
-- Design Name: 
-- Module Name:    DutyCycle_PWM - Behavioral 
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity DutyCycle_PWM is
    Port ( 
	 
				clock 			: in  STD_LOGIC;
				Duty_cycle 		: in  unsigned (7 downto 0);
				PWM 				: out  STD_LOGIC
				
				);
end DutyCycle_PWM;

architecture Behavioral of DutyCycle_PWM is

	--- internal signals --- 
	
signal 		clock_counter	: unsigned(9 downto 0) := (others => '0');
signal 		counter			: unsigned(6 downto 0) := (others => '0');

	--- registering outputs --- 
	
signal 	PWM_int		:std_logic := '0';

begin


PWM 			<= PWM_int; 
process(clock)
begin 

	if rising_edge(clock) then

		clock_counter 			<= clock_counter +1;
	
		if (clock_counter = to_unsigned(0,10)) then 
		
			counter 			<= counter +1;
			PWM_int 			<= '0';
			
			if (counter < Duty_cycle) then 
			
				PWM_int		<= '1';
				
			end if;
			
			if (counter = to_unsigned(100,7)) then 
			
				counter				<= (others=> '0');
			
			end if;
			
		end if;
	
	end if; 
	
end process;


end Behavioral;

