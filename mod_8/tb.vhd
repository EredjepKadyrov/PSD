LIBRARY ieee;
use ieee.std_logic_1164.all;
USE ieee.numeric_std.ALL;
use ieee.std_logic_unsigned.all;

entity tb is
end tb;

architecture t_b of tb is

type state_type is (load_ram, auto_test, idle);
signal state: state_type;

type arrstr 	is array (1 to 10) of string(1 to 16);
type arrstr0 	is array (1 to 7) of string(1 to 16);
type arrint 	is array (1 to 10) of integer;
type arrtest 	is array (1 to 14) of integer;

-- 1 Input Money
-- 2 Input Choice
-- 3 Enter Click
-- 4 Cancle Click

constant atsdata : arrtest :=(10000,2,0,0,0,5000,6,0,2,0,0,0,0,0);
constant atstest : arrtest :=(1,2,3,5,4,1,2,3,2,3,4,5,4,0);

constant str : arrstr0 :=(	"VM_TEKKOM_ALFIAN",
									"Kosong          ",
									"Batal           ",
									"Pilih           ",
									"Tidak Cukup     ",
									"Not Found       ",
									"Terimakasih     ");
constant cstored : arrstr
	:=(	"CocaCola    4,0k",	
			"Sprite      3,0k",
			"Fanta       3,0k",
			"YouC1000    6,0k",
			"Oronamin    5,0k",
			"Pocari      7,0k",
			"Equil     200,0k",
			"Tequilla  500,0k",
			"OrangTua  150,0k",
			"Aqua1,5L    6,0k");
constant cpackval: arrint
	:=(4,3,3,6,5,7,200,500,150,6);
signal cstock  : arrint
	:=(2,1,10,0,3,7,6,9,7,10);
	
component VM_RAM is
port(	moneyin 	: in  integer := 0;
		moneyout	: out integer := 0;
		choice 	: in  integer := 0;
		stock		: inout integer := 0;
		price		: inout integer := 0;
		lcd		: out string(1 to 16);
		ram_data	: in std_logic_vector(7 downto 0);
		ram_str	: in std_logic_vector(8 downto 0);
		cancel, enter : in STD_LOGIC := '0';
		clk, rst, set : STD_LOGIC := '1');
end component;

signal stock	: integer := 0;
signal price	: integer := 0;
signal moneyin : integer := 0;
signal moneyout: integer := 0;
signal choice 	: integer := 0;
signal lcd: string(1 to 16);
signal ram_data: std_logic_vector(7 downto 0) := (others => '0');
signal ram_str	: std_logic_vector(8 downto 0) := (others => '0');
signal cancel, enter : STD_LOGIC := '0';
signal clk, rst, set : STD_LOGIC := '1';
signal str_c : string(1 to 16);

function CONV (CHAR :CHARACTER) return STD_LOGIC_VECTOR is
 variable SLV8 :STD_LOGIC_VECTOR (7 downto 0);
 variable TEMP :INTEGER :=CHARACTER'POS(CHAR);
begin
 for i in SLV8'reverse_range loop
	case TEMP mod 2 is
	  when 0 => SLV8(i):='0';
	  when 1 => SLV8(i):='1';
	  when others => null;
	end case;
	TEMP:=TEMP/2;
 end loop;
 return SLV8;
end CONV;

begin
	VM : VM_RAM port map(moneyin, moneyout, choice, stock, price, lcd, ram_data, ram_str, cancel, enter, clk, rst, set);
	process
	begin
		clk <= not clk;
		wait for 10 ps;
	end process;
	
	process
	begin
		set <= '1';
		rst <= '1';
		wait for 20 ps;
		rst <= '0';
		ram_str <= (others => '0');
		state <= load_ram;
		wait until rising_edge(clk);
		for i in 1 to 7 loop
			str_c <= str(i);
			for j in 1 to 16 loop
				wait for 1 ps;
				ram_data <= conv(str_c(j));
				wait until rising_edge(clk);
				ram_str <= ram_str + 1;
			end loop;
		end loop;
		for i in 1 to 10 loop
			str_c <= cstored(i);
			for j in 1 to 16 loop
				wait for 1 ps;
				ram_data <= conv(str_c(j));
				wait until rising_edge(clk);
				ram_str <= ram_str + 1;
			end loop;
			ram_data <= std_logic_vector(to_unsigned(cpackval(i), ram_data'length));
			wait until rising_edge(clk);
			wait for 1 ps;
			ram_str <= ram_str + 1;
			ram_data <= std_logic_vector(to_unsigned(cstock(i), ram_data'length));
			wait until rising_edge(clk);
			wait for 1 ps;
			ram_str <= ram_str + 1;
		end loop;
		wait for 20 ps;
		wait until rising_edge(clk);
		ram_str <= (others => '1');
		ram_data <= "00001010";
		wait for 20 ps;
		wait until rising_edge(clk);
		rst <= '1';
		set <= '0';
		wait until rising_edge(clk);
		rst <= '0';
		wait until rising_edge(clk);
		wait for 1 ns;
		state <= auto_test;
		wait until rising_edge(clk);
		for i in atstest'range loop
			wait for 5 ps;
			case atstest(i) is
				when 1 => --Input Money
					moneyin <= atsdata(i); 
				when 2 => --Input Choice
					choice  <= atsdata(i);
				when 3 => --Click enter
					enter <= '1';
					wait for 20 ps;
					enter <= '0';
				when 4 => --Click Cancel
					cancel <= '1';
					wait for 20 ps;
					cancel <= '0';
				when others => --Others
					moneyin <= 0;
					choice <= 0;
			end case;
			wait for 2 ns;
			wait until rising_edge(clk);
		end loop;
		wait until rising_edge(clk);
		state <= idle;
		wait;
	end process;

end t_b;