----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:53:26 03/01/2022 
-- Design Name: 
-- Module Name:    BH1750_driver - Behavioral 
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
library UNISIM;
use UNISIM.VComponents.all;

entity BH1750_driver is
    Port ( 
	 
			
			clock 				: in  STD_LOGIC;
			send 					: in 	std_logic;
			Instruction_in	 	: in 	unsigned(15 downto 0);
			
			busy					: out std_logic;
			USER_LED				: out std_logic;
			Data_out_valid		: out std_logic;
			SCL					: out std_logic;
			Data_out			 	: out	unsigned(15 downto 0);
			SDA				 	: inout	std_logic
			
			);

end BH1750_driver;

architecture Behavioral of BH1750_driver is

		--- registering inputs --- 
		
		signal 		send_int 					: std_logic := '0';
		signal 		SDA_in_int					: std_logic := '1';
		signal 		Instruction_in_int		: unsigned(15 downto 0) := (others => '0');
		
		
		
		--- registering outputs --- 
		
		signal 		busy_int 					: std_logic := '0';
		signal 		Data_out_valid_int 		: std_logic := '0';
		signal 		SCL_int				 		: std_logic := '0';
		signal 		SDA_out_int				 	: std_logic := '0';
		signal 		USER_LED_int 				: std_logic := '0';
		signal 		Data_out_int				: unsigned(15 downto 0) := (others => '0');
		
		
		--- internal signals --- 
		
		signal 		clock_counter 							: unsigned(8 downto 0) := (others => '0');
		signal 		SCL_counter 							: unsigned(16 downto 0) := (others => '0');
		signal 		SDA_counter 							: unsigned(3 downto 0) := (others => '0');
		signal 		start_stop_counter 					: unsigned(7 downto 0) := (others => '0');
		signal 		instruction_buff 						: unsigned(15 downto 0) := (others => '0');
		signal 		SCL_enable 								: std_logic := '0';
		signal 		send_int_pre 							: std_logic := '0';
		signal 		IObuff_RW_mode 						: std_logic := '0';
		signal 		SDA_in									: std_logic := '0';
		signal 		SDA_out									: std_logic := '0';

		
		constant 	module_address							: unsigned(15 downto 0) := to_unsigned(92,16); --92


		--- FSMs ---- 
		signal 		instruction_sender_FSM 	: unsigned(3 downto 0) := (others => '0');
		signal 		Reading_result_FSM 		: unsigned(3 downto 0) := (others => '0');

begin

   
   IOBUF_inst : IOBUF
   generic map (
      DRIVE => 12,
      IOSTANDARD => "DEFAULT",
      SLEW => "SLOW")
   port map (
      O => SDA_in,     -- Buffer output
      IO => SDA,   -- Buffer inout port (connect directly to top-level port)
      I => SDA_out,     -- Buffer input
      T => IObuff_RW_mode      -- 3-state enable input, high=input, low=output 
   );
	
busy 					<= busy_int;
SCL					<= SCL_int;
Data_out				<= Data_out_int;
Data_out_valid		<= Data_out_valid_int;
SDA_out				<= SDA_out_int;
USER_LED 			<= USER_LED_int;			

			




process(clock)
begin
	
	if rising_edge (clock) then 
	
	--- this timing module works with 10ns period clock --- 
	
	-- Tbuf 		= 1.3 us 
	-- Thdsta	= 0.61 us
	-- Tsusto   = 0.61 us
	-- Thigh		= 1.22 us
	-- Tlow 		= 1.5 us 
	-- Thddat	= 0.75 us
	-- Tsudat 	= 0.75 us
	-- period of I2C clock = 2.72 us
	-- period of I2C dat   = 2.72 us
	
		--- registering inputs --- 
	
		send_int					<= send;
		Instruction_in_int	<= Instruction_in;
		SDA_in_int				<= SDA_in;
		
		
		---the main circuit ---
		send_int_pre 			<= send_int;
		clock_counter 			<= clock_counter + 1;
		start_stop_counter 	<= start_stop_counter + 1;
		SCL_int					<= '1';
		SDA_out_int				<= '1';
		IObuff_RW_mode			<= '0';
		Data_out_valid_int	<= '0';
		
		
		--- craeting SCL ---
		
		if (clock_counter	< to_unsigned(75,9) or clock_counter > to_unsigned(196,9)) then 
		
			SCL_int 					<= not SCL_enable;
			
		end if;
		
		if (clock_counter = to_unsigned(271,9)) then 
		
			clock_counter 			<= (others => '0');
			SCL_counter 			<= SCL_counter +1;
			SDA_counter 			<= SDA_counter -1;
			
		end if;
		
		--- buffering inputs when send rising edge is occured --- 
		
		if (send_int = '1' and send_int_pre = '0' and busy_int = '0') then 
		
			busy_int										<= '1';
			instruction_buff							<= instruction_in_int; 
			instruction_sender_FSM					<= to_unsigned (1,4);
			start_stop_counter						<= (others => '0');
			Reading_result_FSM						<= (others => '0');	

		end if;
		
		
		--- Instruction sender state machine --- 
		
		case instruction_sender_FSM is 
		
			when "0000" => 
			
			when "0001" => 
				

				-- waiting for 1.31 us (Tbuff) 1.3 us
				
				if (start_stop_counter = to_unsigned(130,8)) then

					instruction_sender_FSM 				<=  to_unsigned (2,4);
					start_stop_counter					<= (others => '0');
				
				end if;
				
			when "0010" =>
				
				-- wating for  (Thdsta)  0.61 us to create start condition and 0.75 us to start sending data 
				
				SDA_out_int 			<= '0';
				
				if (start_stop_counter > to_unsigned (61,8)) then 
				
					SCL_int 					<= '0';
					
				end if;
				
				if (start_stop_counter = to_unsigned(135,8)) then 
				
					instruction_sender_FSM 				<=  to_unsigned (3,4);
					clock_counter 							<= (others => '0');
					SCL_enable								<= '1';
					SDA_counter								<= to_unsigned(6,4); --- 7 bits are dedicated to slave address and it is MSB first!! 
					SCL_counter 							<= (others => '0');
					
				end if;
				
				
			when "0011" =>
			
				--sending module address
				
				SDA_out_int					<= module_address(to_integer(SDA_counter));
				
				if (SCL_counter = to_unsigned(7,17)) then 
				
					instruction_sender_FSM 	<=  to_unsigned (4,4);
					
				end if;
				
				
			when "0100" =>
			
				--- sending RW 
				SDA_out_int 			<= '0';
				
				if (SCL_counter = to_unsigned (8,17)) then 
				
					instruction_sender_FSM 		<=  to_unsigned (5,4);

				end if;
					
					
			when "0101" =>
				
				--- reciving ack --- 
				--- no need to read acknowledge cause we got only one slave hare---
				IObuff_RW_mode					<= '1';

				if (SCL_counter = to_unsigned (9,17)) then 
									
					instruction_sender_FSM 				<= to_unsigned(6,4);
					SDA_counter								<= to_unsigned(7,4);

				end if;
				
			
			when "0110" =>
			
				-- sending instruction 
				
				SDA_out_int 								<= instruction_buff(to_integer(SDA_counter));
				
			
				
				if (SCL_counter = to_unsigned (17,17)) then 
					
					instruction_sender_FSM 	<= to_unsigned(7,4);
				
				end if;
				
			
			when "0111" =>
			
				---reciving ack
				IObuff_RW_mode					<= '1';



				if (SCL_counter = to_unsigned (18,17)) then 
									
					instruction_sender_FSM 				<= to_unsigned(8,4);
					SDA_counter								<= to_unsigned(7,4);
					start_stop_counter					<= (others => '0');

					
				end if;
				
				
			when "1000" =>
			
				--- Stop condition --- 
				
				SDA_out_int 					<= '0';
				
				if (start_stop_counter = to_unsigned(135,8)) then 
				
					instruction_sender_FSM 				<= to_unsigned(9,4);
					SCL_enable 								<= '0';
					
				end if;
				
				
			when "1001" =>
				
				Reading_result_FSM				<= to_unsigned(1,4);
				clock_counter 						<= (others => '0');
				start_stop_counter				<= (others => '0');
				SCL_counter 						<= (others => '0');
				SDA_counter 						<= (others => '0');
				instruction_sender_FSM			<= (others => '0');

			
			when others =>
			
			end case;
	
	
	
	
	----- Reading result state machine -----   		
			
		
		
		case Reading_result_FSM is 
		
			when "0000"=> 
			
			
			when "0001"=> 
				
				--- waiting for 180 ms --- 
				
				if (SCL_counter = to_unsigned(66177,17)) then ---66177
					
					Reading_result_FSM		<= to_unsigned(2,4);
					SCL_counter 				<= (others => '0');
					start_stop_counter		<= (others => '0');

				end if;
				
			
			when "0010" => 
			
				-- wating for  (Thdsta)  0.61 us to create start condition and 0.75 us to start sending data 

				SDA_out_int 			<= '0';
				
				if (start_stop_counter > to_unsigned (61,8)) then 
				
					SCL_int 					<= '0';
					
				end if;
				
				if (start_stop_counter = to_unsigned(135,8)) then 
				
					Reading_result_FSM 					<=  to_unsigned (3,4);
					clock_counter 							<= (others => '0');
					SCL_enable								<= '1';
					SDA_counter								<= to_unsigned(6,4); --- 7 bits are dedicated to slave address bit and it is MSB first!! 
					SCL_counter 							<= (others => '0');
					
				end if;
			
			when "0011" =>
			
				--sending module address
				
				SDA_out_int					<= module_address(to_integer(SDA_counter));
				
				if (SCL_counter = to_unsigned(7,17)) then 
				
					Reading_result_FSM 	<=  to_unsigned (4,4);
					
				end if;
				
				
			when "0100" =>
			
				--- sending RW 
				SDA_out_int 			<= '1';
				
				if (SCL_counter = to_unsigned (8,17)) then 
				
					Reading_result_FSM 	<=  to_unsigned (5,4);
					
				end if;
				
			when "0101" =>
				
				--- reciving ack --- 
				--- no need to read acknowledge cause we got only one slave hare---
				IObuff_RW_mode					<= '1';
				USER_LED_int					<= not SDA_in_int;


				
				if (SCL_counter = to_unsigned (9,17)) then 
									
					Reading_result_FSM 				<= to_unsigned(6,4);
					SDA_counter							<= to_unsigned(15,4);

				end if;

			when "0110" =>
			
				-- recieving  High byte 
				IObuff_RW_mode					<= '1';

				if (clock_counter = to_unsigned(136,9)) then

					Data_out_int(to_integer(SDA_counter)) 								<= SDA_in_int;
				
				end if;				
				
				if (SCL_counter = to_unsigned (17,17)) then 
					
					Reading_result_FSM 					<= to_unsigned(7,4);

				end if;
				
				
			when "0111" =>
				
				-- sending ack -- 
			
				SDA_out_int 							<= '0';
				
				if (SCL_counter = to_unsigned (18,17)) then 
									
					Reading_result_FSM 					<= to_unsigned(8,4);
					SDA_counter								<= to_unsigned(7,4);


				end if;
				
				
			when "1000" =>
			
				-- recieving  Low byte 
				IObuff_RW_mode					<= '1';
					
				if (clock_counter = to_unsigned(136,9)) then

					Data_out_int(to_integer(SDA_counter)) 								<= SDA_in_int;
				
				end if;
				
				if (SCL_counter = to_unsigned (26,17)) then 
					
					Reading_result_FSM 	<= to_unsigned(9,4);
				
				end if;
				
			when "1001" =>
				
				-- sending nack  (we dont wanna recieve anything else)-- 
			
				SDA_out_int 							<= '1';
				Data_out_valid_int					<= '1';
				
				if (SCL_counter = to_unsigned (27,17)) then 
									
					Reading_result_FSM 					<= to_unsigned(10,4);
					start_stop_counter					<= (others => '0');


				end if;
				
				
			when "1010" =>
			
				--- Stop condition --- 
				
				SDA_out_int 					<= '0';
				
				if (start_stop_counter = to_unsigned(135,8)) then 
				
					Reading_result_FSM 					<= to_unsigned(11,4);
					SCL_enable 								<= '0';
					busy_int 								<= '0';
					
				end if;
				
				
			when "1011" =>
				
				Reading_result_FSM				<= to_unsigned(1,4);
				clock_counter 						<= (others => '0');
				start_stop_counter				<= (others => '0');
				SCL_counter 						<= (others => '0');
				SDA_counter 						<= (others => '0');
				USER_LED_int						<=  '0';

			when others =>
			
			end case;
		end if;
	
end process;
		
		
end Behavioral;

