
-- VHDL Instantiation Created from source file fuzzifier.vhd -- 09:29:53 07/09/2022
--
-- Notes: 
-- 1) This instantiation template has been automatically generated using types
-- std_logic and std_logic_vector for the ports of the instantiated module
-- 2) To use this template to instantiate this entity, cut-and-paste and then edit

	COMPONENT fuzzifier
	PORT(
		clock : IN std_logic;
		config_params : IN std_logic;
		lux_error : IN std_logic_vector(10 downto 0);
		level_1_a : IN std_logic_vector(10 downto 0);
		level_1_b : IN std_logic_vector(10 downto 0);
		level_1_c : IN std_logic_vector(10 downto 0);
		level_2_a : IN std_logic_vector(10 downto 0);
		level_2_b : IN std_logic_vector(10 downto 0);
		level_2_c : IN std_logic_vector(10 downto 0);
		level_3_a : IN std_logic_vector(10 downto 0);
		level_3_b : IN std_logic_vector(10 downto 0);
		level_3_c : IN std_logic_vector(10 downto 0);
		level_4_a : IN std_logic_vector(10 downto 0);
		level_4_b : IN std_logic_vector(10 downto 0);
		level_4_c : IN std_logic_vector(10 downto 0);
		z1 : IN std_logic_vector(7 downto 0);
		z2 : IN std_logic_vector(7 downto 0);
		z3 : IN std_logic_vector(7 downto 0);
		z4 : IN std_logic_vector(7 downto 0);          
		change_in_DC : OUT std_logic_vector(7 downto 0);
		data_valid : OUT std_logic
		);
	END COMPONENT;

	Inst_fuzzifier: fuzzifier PORT MAP(
		clock => ,
		config_params => ,
		lux_error => ,
		level_1_a => ,
		level_1_b => ,
		level_1_c => ,
		level_2_a => ,
		level_2_b => ,
		level_2_c => ,
		level_3_a => ,
		level_3_b => ,
		level_3_c => ,
		level_4_a => ,
		level_4_b => ,
		level_4_c => ,
		z1 => ,
		z2 => ,
		z3 => ,
		z4 => ,
		change_in_DC => ,
		data_valid => 
	);


