----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    19:04:38 03/06/2022 
-- Design Name: 
-- Module Name:    BH1750_application - Behavioral 
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

entity BH1750_application is
    Port ( 
	 
					clock		 	: 	in  STD_LOGIC;
					SCL		 	: 	out  STD_LOGIC;
					ADD			:	out  STD_LOGIC;
					USER_LED		: 	out  STD_LOGIC;
					LUX 			:	out unsigned(10 downto 0) := (others=> '0');
					SDA 			: inout  STD_LOGIC
					
			);
end BH1750_application;

architecture Behavioral of BH1750_application is




		--- registering outputs --- 
		
signal ADD_int 								: std_logic := '0';
signal LUX_int 								: unsigned(10 downto 0) := (others=> '0');


		--- internal signals --- 

signal send 									: std_logic := '0';
signal valid 									: std_logic := '0';
signal one_time_send_sender 				: std_logic := '0';

signal 	Data_out 							: unsigned(15 downto 0) := (others=> '0');
signal 	clock_counter 						: unsigned(3 downto 0) := (others=> '0');
signal 	product								: signed(21 DOWNTO 0) := (others => '0');
constant coef 									: signed (4 downto 0) := to_signed(13,5); --- 0.8



begin

ADD						<= ADD_int;
LUX						<= LUX_int;
ADD_int					<= '1';
LUX_int 					<= unsigned(product(14 downto 4))	 when valid = '1';


 ---- BH1750 Driver ---- 

BH1750_driver_module: entity work.BH1750_driver 
PORT MAP

(
		clock 			=> clock,
		send 				=> send,
		Instruction_in => to_unsigned(16,16), --- "0001_0000" Continuously H-Resolution Mode, Start measurement at 1lx resolution.Measurement Time is typically 120ms. 
		busy 				=> open,
		Data_out_valid => valid,
		SCL 				=> SCL,
		Data_out 		=> Data_out,
		SDA 				=> SDA,
		USER_LED			=> USER_LED
	);


	 
process(clock)
	begin 
	 
	 if rising_edge (clock) then 
	 
		clock_counter 		<= clock_counter +1;
		send 					<= '0';
		
		product 				<= coef * signed('0' & data_out);

		if (clock_counter = "1111" and one_time_send_sender = '0') then 
		
			send 								<= '1';
			one_time_send_sender			<= '1';
			
		end if;
	  
	  end if;
  end process;
end Behavioral;

