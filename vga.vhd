library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity vga is
    port(   clk     : in std_logic;
            rst     : in std_logic;

            rgb    : in std_logic_vector(11 downto 0);
				reg : in std_logic_vector(31 downto 0);

            x        : out std_logic_vector(9 downto 0);
            y        : out std_logic_vector(9 downto 0);
            offs    : out std_logic;

            r        : out std_logic_vector(3 downto 0);
            g        : out std_logic_vector(3 downto 0);
            b        : out std_logic_vector(3 downto 0);
            h        : out std_logic;
            v        : out std_logic
         );
end vga;


architecture behaviour of vga is

signal x_cnt : unsigned(9 downto 0) := (others => '0');
signal y_cnt : unsigned(9 downto 0) := (others => '0');

signal offs_intX : std_logic := '0';
signal offs_intY : std_logic := '0';
signal offs_int  : std_logic;
signal pattern: std_logic_vector(31 downto 0);
signal currentValue: std_logic;

begin

pattern <= reg;

offs_int <= offs_intX or offs_intY;
offs <= offs_int;

currentValue <= pattern(to_integer(x_cnt(6 downto 2)));

x <=     std_logic_vector(x_cnt) when offs_int = '0' else
        (others => '0');
y <=  std_logic_vector(y_cnt) when offs_int = '0' else
        (others => '0');

r <=     "0000" ;--std_logic_vector(x_cnt(9 downto 6)) when offs_int = '0' else
        --(others => '0');
g <=    "0000"; -- std_logic_vector(x_cnt(8 downto 5)) when offs_int = '0' else
        --(others => '0');
b <=    -- std_logic_vector(x_cnt(7 downto 4)) when offs_int = '0' else
             x"F" when offs_int = '0' and currentValue = '1' else

		  (others => '0');


sync_proc_x : process(clk, rst)
begin

    if rising_edge(clk) then

        if rst = '1' then
            x_cnt <= (others => '0');

            offs_intX <= '0';

            h <= '1';

        else
            x_cnt <= x_cnt + 1;

            case to_integer(x_cnt) is

                when 639 =>
                    offs_intX <= '1';

                when 655 =>
                    h <= '0';

                when 751 =>
                    h <= '1';

                when 799 =>
                    x_cnt <= (others => '0');
                    offs_intX <= '0';

                when others => NULL;

            end case;
        end if;
    end if;
end process;


sync_proc_y : process(clk, rst)
begin

    if rising_edge(clk) then

        if rst = '1' then
            y_cnt <= (others => '0');

            offs_intY <= '0';

            v <= '1';

        elsif x_cnt = to_unsigned(799, x_cnt'length) then
            y_cnt <= y_cnt + 1;

            case to_integer(y_cnt) is

                when 479 =>
                    offs_intY <= '1';

                when 481 =>
                    v <= '0';

                when 491 =>
                    v <= '1';

                when 520 =>
						  y_cnt <= (others => '0');
                    offs_intY <= '0';

                when others => NULL;

            end case;
        end if;
    end if;
end process;


end behaviour;