
-- VHDL Instantiation Created from source file Optimizer.vhd -- 15:42:49 07/24/2022
--
-- Notes: 
-- 1) This instantiation template has been automatically generated using types
-- std_logic and std_logic_vector for the ports of the instantiated module
-- 2) To use this template to instantiate this entity, cut-and-paste and then edit

	COMPONENT Optimizer
	PORT(
		clock : IN std_logic;
		Result : IN std_logic_vector(10 downto 0);          
		param_1 : OUT std_logic_vector(7 downto 0);
		config_params : OUT std_logic
		);
	END COMPONENT;

	Inst_Optimizer: Optimizer PORT MAP(
		clock => ,
		Result => ,
		param_1 => ,
		config_params => 
	);


