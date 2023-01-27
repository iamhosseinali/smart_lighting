----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:46:22 02/19/2022 
-- Design Name: 
-- Module Name:    FIS - Behavioral 
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

entity fuzzifier is
    Port ( 
	 
				clock 			: in  STD_LOGIC;
				config_params 	: in  STD_LOGIC;
				lux_error	 	: in  signed (10 downto 0);
				
				level_1_a	 	: in  signed (10 downto 0);
				level_1_b	 	: in  signed (10 downto 0);
				level_1_c	 	: in  signed (10 downto 0);
				
				level_2_a	 	: in  signed (10 downto 0);
				level_2_b	 	: in  signed (10 downto 0);
				level_2_c	 	: in  signed (10 downto 0);
				
				level_3_a	 	: in  signed (10 downto 0);
				level_3_b	 	: in  signed (10 downto 0);
				level_3_c	 	: in  signed (10 downto 0);
				
				level_4_a	 	: in  signed (10 downto 0);
				level_4_b	 	: in  signed (10 downto 0);
				level_4_c	 	: in  signed (10 downto 0);
				
				z1	 				: in  signed (7 downto 0);
				z2	 				: in  signed (7 downto 0);
				z3	 				: in  signed (7 downto 0);
				z4	 				: in  signed (7 downto 0);
				
				change_in_DC 	: out signed (7 downto 0);
				data_valid	 	: out std_logic
				
			
			);
end fuzzifier;

architecture Behavioral of fuzzifier is

component divider
	port (
	clk: in std_logic;
	rfd: out std_logic;
	dividend: in std_logic_vector(14 downto 0);
	divisor: in std_logic_vector(10 downto 0);
	quotient: out std_logic_vector(14 downto 0);
	fractional: out std_logic_vector(11 downto 0));
end component;


		--- registering inputs --- 
	
	signal  lux_error_int : signed (10 downto 0) := (others => '0');
	signal  level_1_a_int : signed (10 downto 0) := (others => '0');
	signal  level_1_b_int : signed (10 downto 0) := (others => '0');
	signal  level_1_c_int : signed (10 downto 0) := (others => '0');
	signal  level_2_a_int : signed (10 downto 0) := (others => '0');
	signal  level_2_b_int : signed (10 downto 0) := (others => '0');
	signal  level_2_c_int : signed (10 downto 0) := (others => '0');
	signal  level_3_a_int : signed (10 downto 0) := (others => '0');
	signal  level_3_b_int : signed (10 downto 0) := (others => '0');
	signal  level_3_c_int : signed (10 downto 0) := (others => '0');
	signal  level_4_a_int : signed (10 downto 0) := (others => '0');
	signal  level_4_b_int : signed (10 downto 0) := (others => '0');
	signal  level_4_c_int : signed (10 downto 0) := (others => '0');
	signal  config_params_int 					:std_logic:= '0'; 
		
		---- defuzzification Zs --- 

	signal 	z1_int					: signed (7 downto 0) := (others => '0');
	signal 	z2_int					: signed (7 downto 0) := (others => '0');
	signal 	z3_int					: signed (7 downto 0) := (others => '0');
	signal 	z4_int					: signed (7 downto 0) := (others => '0');
	
		
		--- registering outputs --- 
		
	signal 	level_1_int				: signed (6 downto 0) := (others=> '0');
	signal 	level_2_int				: signed (6 downto 0) := (others=> '0');
	signal 	level_3_int				: signed (6 downto 0) := (others=> '0');
	signal 	level_4_int				: signed (6 downto 0) := (others=> '0');
	signal 	change_in_DC_int	  	: signed (7 downto 0) := (others => '0');
	signal  	data_valid_int			:std_logic:= '0'; 




			-- internal signals --- 

signal  	rfd 						:std_logic:= '0'; 
signal  	config_params_pre		:std_logic:= '0'; 
signal  	nd 						:std_logic:= '0'; 
signal  	quotient 				:std_logic_vector(14 downto 0) 		:= (others => '0' ); 
signal  	dividend 				:signed(14 downto 0) 					:= (others => '0' ); 
signal  	weight_1 				:signed(14 downto 0) 					:= (others => '0' ); 
signal  	weight_2 				:signed(14 downto 0) 					:= (others => '0' ); 
signal  	fractional 				:std_logic_vector(11 downto 0) 		:= (others => '0' ); 
signal  	clock_counter 			:unsigned(5 downto 0) 					:= (others => '0' ); 
signal  	divisor 					:signed(10 downto 0) 					:= (others => '0' ); 


signal  	Level_1_rise_slope 		:signed(12 downto 0) 				:= (others => '0' ); 
signal  	Level_1_fall_slope 		:signed(12 downto 0) 				:= (others => '0' ); 
signal  	level_1_rise_intercept 	:signed(23 downto 0) 				:= (others => '0' ); 
signal  	level_1_fall_intercept 	:signed(23 downto 0) 				:= (others => '0' ); 


signal  	Level_2_rise_slope 		:signed(12 downto 0) 				:= (others => '0' ); 
signal  	Level_2_fall_slope 		:signed(12 downto 0) 				:= (others => '0' ); 
signal  	level_2_rise_intercept 	:signed(23 downto 0) 				:= (others => '0' ); 
signal  	level_2_fall_intercept 	:signed(23 downto 0) 				:= (others => '0' ); 

signal  	Level_3_rise_slope 		:signed(12 downto 0) 				:= (others => '0' ); 
signal  	Level_3_fall_slope 		:signed(12 downto 0) 				:= (others => '0' ); 
signal  	level_3_rise_intercept 	:signed(23 downto 0) 				:= (others => '0' ); 
signal  	level_3_fall_intercept 	:signed(23 downto 0) 				:= (others => '0' ); 

signal  	Level_4_rise_slope 		:signed(12 downto 0) 				:= (others => '0' ); 
signal  	Level_4_fall_slope 		:signed(12 downto 0) 				:= (others => '0' ); 
signal  	level_4_rise_intercept 	:signed(23 downto 0) 				:= (others => '0' ); 
signal  	level_4_fall_intercept 	:signed(23 downto 0) 				:= (others => '0' ); 





signal numerator : signed (14 downto 0) 	:= (others => '0');
signal product	  : signed (7 downto 0) 	:= (others => '0');



signal 	product1	: signed (23 downto 0):= (others=> '0');
signal 	product2	: signed (23 downto 0):= (others=> '0');
signal 	product3	: signed (23 downto 0):= (others=> '0');
signal 	product4	: signed (23 downto 0):= (others=> '0');

		

				------------- FSM -------------- 

type state_type is (idle,level_1_rise_function_state,level_1_fall_function_state,level_2_rise_function_state,level_2_fall_function_state,
	level_3_rise_function_state,level_3_fall_function_state,level_4_rise_function_state,level_4_fall_function_state,fuzzification_state,sugeno_implication_state);


signal FSM :state_type := idle;

begin

Divider_module : divider
		port map 
		
		(
			clk 				=> clock,
			rfd 				=> rfd,
			dividend 		=> std_logic_vector(dividend),
			divisor 			=> std_logic_vector(divisor),
			quotient 		=> quotient,
			fractional 		=> fractional
			
			);





change_in_DC_int				<= product;--(others => '0') 
									--when lux_error_int <= to_signed(0,11) else to_signed(100,8) 
									--when lux_error_int = to_signed(600,11) else product;

			---- registering outputs --- 

level_1_int						<= product1(12 downto 6);
level_2_int						<= product2(12 downto 6);
level_3_int						<= product3(12 downto 6);
level_4_int						<= product4(12 downto 6);

change_in_DC					<= change_in_DC_int;
data_valid						<= data_valid_int;


process(clock)
begin 
	
	if rising_edge (clock) then

			---- registering inputs --- 
		
		lux_error_int					<= lux_error;
		config_params_int 			<= config_params;
		level_1_a_int					<= level_1_a;
		level_1_b_int					<= level_1_b;
		level_1_c_int					<= level_1_c;
		level_2_a_int					<= level_2_a;
		level_2_b_int					<= level_2_b;
		level_2_c_int					<= level_2_c;
		level_3_a_int					<= level_3_a;
		level_3_b_int					<= level_3_b;
		level_3_c_int					<= level_3_c;
		level_4_a_int					<= level_4_a;
		level_4_b_int					<= level_4_b;
		level_4_c_int					<= level_4_c;

		z1_int							<= z1;
		z2_int							<= z2;
		z3_int							<= z3;
		z4_int							<= z4;


		


		config_params_pre 		<= config_params_int;
		clock_counter				<= clock_counter +1;
		data_valid_int				<= '0';


		if (config_params_int = '1' and config_params_pre = '0') then 
			
			FSM		<= level_1_rise_function_state;
			clock_counter					<= (others => '0');


		end if;



		--- level_1_slope 			(s,1,11)
		--- level_1_a_int     			(s,10,0)
		--- level_1_intercept		(s,12,11)

			 --- level rise function --- 
		case  FSM is 

			when idle 		=> 


						-------------------------------------------------------------------------------------------

							---------------- Calculating membership functions equations ----------------------
					
						-------------------------------------------------------------------------------------------


				---	Level 1 calculating MF params ---  


			when level_1_rise_function_state => 

				dividend							<= to_signed(1,15);
				divisor							<= level_1_b_int - level_1_a_int;
				Level_1_rise_slope			<= signed(quotient(1 downto 0) & "00000000000")  +  signed(fractional);
				level_1_rise_intercept		<= - (Level_1_rise_slope * level_1_a_int);
				
				if (clock_counter = to_unsigned(40,6)) then 
					
					FSM								<= level_1_fall_function_state;
					clock_counter					<= (others => '0');

				end if;


			
			when level_1_fall_function_state => 
					
				divisor								<= level_1_b_int - level_1_c_int;
				Level_1_fall_slope				<= signed(quotient(1 downto 0) & "00000000000")  +  signed(fractional);
				level_1_fall_intercept			<= - (Level_1_fall_slope * level_1_c_int);
				
				if (clock_counter = to_unsigned(40,6)) then 
					
					FSM								<= level_2_rise_function_state;
					clock_counter					<= (others => '0');

				end if;

				
				
				
				---	Level 2 calculating MF params ---  


			when level_2_rise_function_state => 

				divisor								<= level_2_b_int - level_2_a_int;
				Level_2_rise_slope				<= signed(quotient(1 downto 0) & "00000000000")  +  signed(fractional);
				level_2_rise_intercept			<= - (Level_2_rise_slope * level_2_a_int);
				
				if (clock_counter = to_unsigned(40,6)) then 
					
					FSM								<= level_2_fall_function_state;
					clock_counter					<= (others => '0');

				end if;


			
			when level_2_fall_function_state => 
					
				divisor								<= level_2_b_int - level_2_c_int;
				Level_2_fall_slope				<= signed(quotient(1 downto 0) & "00000000000")  +  signed(fractional);
				level_2_fall_intercept			<= - (Level_2_fall_slope * level_2_c_int);
				
				if (clock_counter = to_unsigned(40,6)) then 
					
					FSM								<= level_3_rise_function_state;
					clock_counter					<= (others => '0');

				end if;



				
				---	Level 3 calculating MF params ---  



			when level_3_rise_function_state => 

				divisor								<= level_3_b_int - level_3_a_int;
				Level_3_rise_slope				<= signed(quotient(1 downto 0) & "00000000000")  +  signed(fractional);
				level_3_rise_intercept			<= - (Level_3_rise_slope * level_3_a_int);
				
				if (clock_counter = to_unsigned(40,6)) then 
					
					FSM								<= level_3_fall_function_state;
					clock_counter					<= (others => '0');

				end if;


			
			when level_3_fall_function_state => 
					
				divisor								<= level_3_b_int - level_3_c_int;
				Level_3_fall_slope				<= signed(quotient(1 downto 0) & "00000000000")  +  signed(fractional);
				level_3_fall_intercept			<= - (Level_3_fall_slope * level_3_c_int);
				
				if (clock_counter = to_unsigned(40,6)) then 
					
					FSM								<= level_4_rise_function_state;
					clock_counter					<= (others => '0');

				end if;



					---	Level 4 calculating MF params ---  



			when level_4_rise_function_state => 

				divisor								<= level_4_b_int - level_4_a_int;
				Level_4_rise_slope				<= signed(quotient(1 downto 0) & "00000000000")  +  signed(fractional);
				level_4_rise_intercept			<= - (Level_4_rise_slope * level_4_a_int);
			
				if (clock_counter = to_unsigned(40,6)) then 
				
					FSM								<= level_4_fall_function_state;
					clock_counter					<= (others => '0');

				end if;


		
			when level_4_fall_function_state => 
				
				divisor								<= level_4_b_int - level_4_c_int;
				Level_4_fall_slope				<= signed(quotient(1 downto 0) & "00000000000")  +  signed(fractional);
				level_4_fall_intercept			<= - (Level_4_fall_slope * level_4_c_int);
			
				if (clock_counter = to_unsigned(40,6)) then 
				
					FSM								<= fuzzification_state;
					clock_counter					<= (others => '0');

				end if;




			-------------------------------------------------------------------------------------------

						------------------------ fuzzification -----------------------------
					
			-------------------------------------------------------------------------------------------



			--- fuzzification_state --- 

		
			when fuzzification_state => 

					

					--- "level 1" MF ---
			
				if (lux_error_int = level_1_a_int ) then 
					
					product1 					<= (others => '0');
					
				elsif (lux_error_int > level_1_a_int and lux_error_int < level_1_b_int ) then 
			
					product1 					<= (lux_error_int * Level_1_rise_slope) + level_1_rise_intercept;
				
				elsif (lux_error_int >= level_1_b_int and lux_error_int <= level_1_c_int) then 
				
					product1						<= (lux_error_int * Level_1_fall_slope) + level_1_fall_intercept;

				elsif (lux_error_int > level_1_c_int) then 
							
					product1 					<= (others => '0');

				end if;




						
					--- "level 2" MF ---
			
				if (lux_error_int = level_2_a_int ) then 
					
					product2 					<= (others => '0');
					
				elsif (lux_error_int > level_2_a_int and lux_error_int < level_2_b_int ) then 
			
					product2 					<= (lux_error_int * Level_2_rise_slope) + level_2_rise_intercept;
				
				elsif (lux_error_int >= level_2_b_int and lux_error_int <= level_2_c_int) then 
				
					product2						<= (lux_error_int * Level_2_fall_slope) + level_2_fall_intercept;

				elsif (lux_error_int > level_2_c_int) then 
							
					product2 					<= (others => '0');

				end if;




				
					--- "level 3" MF ---
			
				if (lux_error_int = level_3_a_int ) then 
					
					product3 					<= (others => '0');
						
				elsif (lux_error_int > level_3_a_int and lux_error_int < level_3_b_int ) then 
				
					product3 					<= (lux_error_int * Level_3_rise_slope) + level_3_rise_intercept;
					
				elsif (lux_error_int >= level_3_b_int and lux_error_int <= level_3_c_int) then 
					
					product3						<= (lux_error_int * Level_3_fall_slope) + level_3_fall_intercept;
	
				elsif (lux_error_int > level_3_c_int) then 
								
					product3 					<= (others => '0');
	
				end if;


			
				--- "level 4" MF ---
			
				if (lux_error_int = level_4_a_int ) then 
					
					product4 					<= (others => '0');
						
				elsif (lux_error_int > level_4_a_int and lux_error_int < level_4_b_int ) then 
				
					product4 					<= (lux_error_int * Level_4_rise_slope) + level_4_rise_intercept;
					
				elsif (lux_error_int >= level_4_b_int and lux_error_int <= level_4_c_int) then 
					
					product4						<= (lux_error_int * Level_4_fall_slope) + level_4_fall_intercept;
	
				elsif (lux_error_int > level_4_c_int) then 
								
					product4 					<= (others => '0');
	
				end if;

				FSM								<= sugeno_implication_state;
				clock_counter					<= (others => '0');				





					-------------------------------------------------------------------------------------------

							------------------------ sugeno implication -----------------------------
					
					-------------------------------------------------------------------------------------------
			
			
			
			when sugeno_implication_state => 

				weight_1			<= (level_1_int * z1_int) + (level_2_int * z2_int);
				weight_2			<= (level_3_int * z3_int) + (level_4_int * z4_int); 
				dividend			<= weight_1 + weight_2;
				divisor			<= resize(level_1_int,11) + level_2_int + level_3_int + level_4_int;

				if (clock_counter = to_unsigned(45,6)) then 
				
					FSM					<= fuzzification_state;
					clock_counter		<= (others => '0');				
					product				<= signed(quotient(7 downto 0));
					data_valid_int		<= '1';


				end if;

			when others => 
		end case;			

	end if;
	
end process;


end Behavioral;


-----------------------------------------------


