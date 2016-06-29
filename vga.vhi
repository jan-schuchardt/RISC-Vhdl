
-- VHDL Instantiation Created from source file vga.vhd -- 11:52:07 04/20/2016
--
-- Notes: 
-- 1) This instantiation template has been automatically generated using types
-- std_logic and std_logic_vector for the ports of the instantiated module
-- 2) To use this template to instantiate this entity, cut-and-paste and then edit

	COMPONENT vga
	PORT(
		clk : IN std_logic;
		rst : IN std_logic;
		rgb : IN std_logic_vector(11 downto 0);          
		x : OUT std_logic_vector(9 downto 0);
		y : OUT std_logic_vector(9 downto 0);
		offs : OUT std_logic;
		r : OUT std_logic_vector(3 downto 0);
		g : OUT std_logic_vector(3 downto 0);
		b : OUT std_logic_vector(3 downto 0);
		h : OUT std_logic;
		v : OUT std_logic
		);
	END COMPONENT;

	Inst_vga: vga PORT MAP(
		clk => ,
		rst => ,
		rgb => ,
		x => ,
		y => ,
		offs => ,
		r => ,
		g => ,
		b => ,
		h => ,
		v => 
	);


