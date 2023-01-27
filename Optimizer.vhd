----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:42:31 07/24/2022 
-- Design Name: 
-- Module Name:    Optimizer - Behavioral 
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

entity Optimizer is
    Port ( 
	 
				clock : in  STD_LOGIC;
				Result : in  signed (10 downto 0);
				param_1 : out  signed (7 downto 0);
				config_params : out  STD_LOGIC
			  
			  );
end Optimizer;

architecture Behavioral of Optimizer is

		--- registering inputs --- 
	signal Result_int	:Signed(10 downto 0) := (others => '0');


		--- registering outputs --- 
	signal Param_1_int	: signed(7 downto 0) := (others => '0');
	signal config_params_int : std_logic := '0';


		--- internal signals --- 
	signal Param_1_save	: signed(7 downto 0) := (others => '0');
	signal Result_save	:Signed(10 downto 0) := (others => '0');
	signal Result_pre	:Signed(10 downto 0) := (others => '0');
	signal clock_counter: unsigned(29 downto 0) := (others => '0');
	signal optimization_done: std_logic := '0';






begin

config_params			<= config_params_int;

	process(clock)
	begin 

		if rising_edge(clock) then 

			Result_int			<= Result;
			Result_Pre			<= Result_int;
			clock_counter 		<= clock_counter +1;
			config_params_int	<= '0';


			if (clock_counter = to_unsigned(100000000,30) and optimization_done = '0') then 
				
				Param_1_int			<= Param_1_int + 1;
				Param_1				<= Param_1_int;
				clock_counter		<= (others => '0');
				config_params_int	<= '1';

			end if;


			if (Result_int < Result_Pre) then 

				Result_save 	<= Result_int;
				Param_1_save	<= Param_1_int;

			end if;


			if (Param_1_int = to_signed(100,8)) then 

				Param_1					<= Param_1_save;
				optimization_done		<= '1';
				config_params_int		<= '1';

			end if;

		end if;

	end process;


end Behavioral;

