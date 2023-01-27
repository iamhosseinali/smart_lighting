----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    22:48:54 02/27/2022 
-- Design Name: 
-- Module Name:    sugeno_implication - Behavioral 
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

entity sugeno_implication is
    Port ( 
	 
				clock 	: in  STD_LOGIC;
				w1 		: in  signed (6 downto 0);
				w2 		: in  signed (6 downto 0);
				w3 		: in  signed (6 downto 0);
				w4 		: in  signed (6 downto 0);
				output 	: out  signed (7 downto 0)
			  
			  
			  );
end sugeno_implication;

architecture Behavioral of sugeno_implication is

constant 	z1					: signed (7 downto 0) := to_signed(100,8);
constant 	z2					: signed (7 downto 0) := to_signed(50,8);
constant 	INVdenumerator	: signed (11 downto 0) := to_signed(2008,12);  --- 1/1.02

signal numerator : signed (14 downto 0) := (others => '0');
signal product	  : signed (26 downto 0) := (others => '0');

begin

process(clock)
begin
	if rising_edge(clock) then
	
		numerator		<= (w1 * z1) + (w2 * z2) + (w3 * z2);
		product 			<= numerator * INVdenumerator;
		output			<= product(23 downto 16);
	
	end if;
end process;


end Behavioral;

