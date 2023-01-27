----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    22:39:02 02/27/2022 
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

entity FIS is
    Port ( 
	 
				Clock 	: in  STD_LOGIC;
				lux 		: in  signed (10 downto 0);
				PWM_out	: out  signed (7 downto 0)
				
				
			);
end FIS;

architecture Behavioral of FIS is

--subtype levels_length is signed (6 downto 0);
--	
--	signal 	level_1	: levels_length;
--	signal 	level_2	: levels_length;
--	signal 	level_3	: levels_length;
--	signal 	level_4	: levels_length;

	--- internal signals --- 

	signal 	level_1	: signed (6 downto 0) := (others=> '0');
	signal 	level_2	: signed (6 downto 0) := (others=> '0');
	signal 	level_3	: signed (6 downto 0) := (others=> '0');
	signal 	level_4	: signed (6 downto 0) := (others=> '0');
	

begin

	--- fuzzifier --- 

fuzzifier_module: entity work.fuzzifier 
PORT MAP

(
		clock 	=> clock,
		lux 		=> lux,
		level_1 	=> level_1,
		level_2 	=> level_2,
		level_3 	=> level_3,
		level_4 	=> level_4
);


	--- implication_module --- 
	
sugeno_implication_module: entity work.sugeno_implication 
	
	PORT MAP
	(
		clock 	=> clock,
		w1 		=> level_1,
		w2 		=> level_2,
		w3 		=> level_3,
		w4 		=> level_4,
		output 	=> PWM_out
	);
	

end Behavioral;



