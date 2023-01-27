----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:31:36 05/05/2022 
-- Design Name: 
-- Module Name:    Smart_Lighting_Top - Behavioral 
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

entity Smart_Lighting_Top is
    Port ( 
	 
				clock 		:  in  STD_LOGIC;
				desired_lux 		:  in  unsigned(10 downto 0);
				SCL		 	: 	out  STD_LOGIC;
				ADD			:	out  STD_LOGIC;
				USER_LED		: 	out  STD_LOGIC;
				PWM 			: 	out  STD_LOGIC;
				SDA 			: 	inout  STD_LOGIC

			 );
			 
end Smart_Lighting_Top;

architecture Behavioral of Smart_Lighting_Top is

component dcm
port
 (
  Clock           : in     std_logic;
  
  CLK_100          : out    std_logic
 );
end component;

component icon
  PORT (
    CONTROL0 : INOUT STD_LOGIC_VECTOR(35 DOWNTO 0));

end component;


component vio
  PORT (
    CONTROL : INOUT STD_LOGIC_VECTOR(35 DOWNTO 0);
    CLK : IN STD_LOGIC;
    SYNC_IN : IN STD_LOGIC_VECTOR(69 DOWNTO 0);
    SYNC_OUT : OUT STD_LOGIC_VECTOR(199 DOWNTO 0));

end component;



	---- 	internal signals --- 
	
signal 	CLK_100 	: std_logic := '0';
signal 	config_params 	: std_logic := '0';
signal 	one_time_config 	: std_logic := '0';
signal 	data_valid 	: std_logic := '0';

signal 	Duty_cycle			:signed(7 DOWNTO 0) := (others => '0');
signal 	change_in_DC			:signed(7 DOWNTO 0) := (others => '0');
signal 	param_1			:signed(7 DOWNTO 0) := (others => '0');
signal 	current_DC			:signed(7 DOWNTO 0) := (others => '0');
signal CONTROL 				:STD_LOGIC_VECTOR(35 DOWNTO 0) := (others => '0');
signal SYNC_OUT 				:STD_LOGIC_VECTOR(199 DOWNTO 0) := (others => '0');
signal 	clock_counter			:unsigned(27 DOWNTO 0) := (others => '0');
signal 	LUX		: unsigned(10 DOWNTO 0) := (others => '0');
signal 	lux_error		: unsigned(10 DOWNTO 0) := (others => '0');
signal 	desired_lux_int		: unsigned(10 DOWNTO 0) := (others => '0');


begin

	
	
	
	--- BH1750_sensor_driver --- 
	 
	 	BH1750_sensor_driver:entity work.BH1750_application 
		
	PORT MAP
	
	(
		clock		 	=> CLK_100 ,
		SCL 			=> SCL,
		ADD 			=> ADD,
		USER_LED 	=> open,
		LUX 			=> LUX,
		SDA 			=> SDA
	);	
	
	
	
	
	---- Fuzzy controller module ---- 
	
		Fuzzy_controller: entity work.fuzzifier 
		
	PORT MAP
		
	(
		clock 				=> CLK_100,
		config_params 		=> SYNC_OUT(11),-- or --config_params,--config_params,
		lux_error 			=> signed(lux_error),
		level_1_a 			=> signed (SYNC_OUT(22 downto 12)), --to_signed(0,11),,
		level_1_b 			=> signed (SYNC_OUT(33 downto 23)), --to_signed(200,11),
		level_1_c 			=> signed (SYNC_OUT(44 downto 34)),--to_signed(300,11),  --
		level_2_a 			=> signed (SYNC_OUT(55 downto 45)),--to_signed(100,11),  --
		level_2_b 			=> signed (SYNC_OUT(66 downto 56)),  --to_signed(200,11),
		level_2_c 			=> signed (SYNC_OUT(77 downto 67)),  --to_signed(500,11),
		level_3_a 			=> signed (SYNC_OUT(88 downto 78)),  --to_signed(400,11),
		level_3_b 			=> signed (SYNC_OUT(99 downto 89)),  --to_signed(600,11),
		level_3_c 			=> signed (SYNC_OUT(110 downto 100)),  --to_signed(700,11),
		level_4_a 			=> signed (SYNC_OUT(121 downto 111)),  --to_signed(800,11),
		level_4_b 			=> signed (SYNC_OUT(132 downto 122)),  --to_signed(900,11),
		level_4_c 			=> signed (SYNC_OUT(143 downto 133)),  --to_signed(1000,11),
		z1 					=> signed (SYNC_OUT(151 downto 144)),  --to_signed(0,8),
		z2 					=> signed (SYNC_OUT(159 downto 152)),--param_1, --- -- --to_signed(30,8),
		z3 					=> signed (SYNC_OUT(167 downto 160)),--to_signed(60,8),---
		z4 					=> signed (SYNC_OUT(175 downto 168)),  --to_signed(100,8),
		change_in_DC 		=> change_in_DC,
		data_valid 			=> data_valid
	);

		Duty_cycle		<= change_in_DC when data_valid = '1';
		
	--- Duty cycle to PWM module --- 
	
		Duty_cycle_to_PWM_module: entity work.DutyCycle_PWM 
		
	PORT MAP
		
	(
		clock			 	=> CLK_100,
		Duty_cycle 		=> unsigned(Duty_cycle),
		PWM 				=> USER_LED
	);

		
	
	
		---- Optimizer module ---- 
	
--	Optimizer_module: entity work.Optimizer 
--	
--	PORT MAP
--	(
--		clock 			=> CLK_100,
--		Result 			=> signed(lux_error),
--		param_1 		=> param_1,
--		config_params 	=> config_params
--	);



	--- DCM module --- 
	
	
		dcm_module : dcm
  	port map
   	
	(
    
 	  	Clock => clock,
    
    	CLK_100 => CLK_100
	
	);
	
	
	icon_module : icon
  port map (
    CONTROL0 => CONTROL);
	 
	 vio_module : vio
  port map (
    CONTROL 	=> CONTROL,
    CLK 		=> CLK_100,
    SYNC_IN 	=> std_logic_vector(param_1) & std_logic_vector(Duty_cycle) & std_logic_vector(resize(LUX,43)) & std_logic_vector(lux_error) ,
    SYNC_OUT 	=> SYNC_OUT
	
	);

	

process(CLK_100)
begin 
	if rising_edge(CLK_100) then 

				---- registering inputs --- 

		--desired_lux_int				<= to_unsigned(400,11);
		--desired_lux_int				<= desired_lux;
		desired_lux_int				<= unsigned(SYNC_OUT(10 downto 0));

				---- "config_params" port control ---- 
		
		--clock_counter			<= clock_counter + 1;
		--config_params			<= '0';

		--if (clock_counter = to_unsigned(255,28) and one_time_config = '0') then 

			--config_params			<= '1';
			--one_time_config			<= '1';
		
		--END IF;


				----- error calculation  ---- 

		lux_error  			<= desired_lux_int - lux; 


			---- current duty cycle caculation using accumulator ---- 

		--if (clock_counter = to_unsigned(10000000,28)) then 

			--if (current_DC <= to_signed(100,8)) then 

				--current_DC					<= current_DC + Duty_cycle;
				--clock_counter				<= (others => '0');
			
			--end if;
		
		--end if;

	end if;

end process;		
	


end Behavioral;

