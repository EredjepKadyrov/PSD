LIBRARY ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
USE ieee.numeric_std.ALL;


entity VM_RAM is
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
end VM_RAM;

architecture vm of VM_RAM is
	constant sidlest : STD_LOGIC_vector(4 downto 0) := "00000";
	constant sunavail: STD_LOGIC_vector(4 downto 0) := "00001";
	constant scancel : STD_LOGIC_vector(4 downto 0) := "00010";
	constant sselect : STD_LOGIC_vector(4 downto 0) := "00011";
	constant lowmoney: STD_LOGIC_vector(4 downto 0) := "00100";
	constant soutrng : STD_LOGIC_vector(4 downto 0) := "00101";
	constant thanks  : STD_LOGIC_vector(4 downto 0) := "00110";
	constant datastr : STD_LOGIC_vector(4 downto 0) := "00111";
	type state_type is (idle, get_data,get_data1,get_data2,get_data3, assign_str, disp_money, select_product, grab, set_ram, load_str);
	signal state, next_state, dump_state : state_type;
	
	signal lsel : integer;
	signal ram_out : std_logic_vector(7 downto 0);
	signal ram_in  : std_logic_vector(7 downto 0);
	signal ram_inv : std_logic_vector(7 downto 0);
	signal ram_add : std_logic_vector(8 downto 0);
	signal ram_addv: std_logic_vector(8 downto 0);
	signal ram_addt: std_logic_vector(8 downto 0);
	signal str_buf : string(1 to 16);
	signal str_str : integer := 0;
	signal ram_set : std_logic := '0';
	signal last_val: std_logic_vector(7 downto 0);
	signal last_mon: integer := -1;
	signal maxval : integer;
	COMPONENT RAM IS
		PORT
		(
			address		: IN STD_LOGIC_VECTOR (8 DOWNTO 0);
			clock		: IN STD_LOGIC  := '1';
			data		: IN STD_LOGIC_VECTOR (7 DOWNTO 0);
			wren		: IN STD_LOGIC ;
			q		: OUT STD_LOGIC_VECTOR (7 DOWNTO 0)
		);
	END COMPONENT;
	
	function CONV (SLV8 :STD_LOGIC_VECTOR (7 downto 0)) return CHARACTER is
	 constant XMAP :INTEGER :=0;
	 variable TEMP :INTEGER :=0;
	begin
	 for i in SLV8'range loop
		TEMP:=TEMP*2;
		case SLV8(i) is
		  when '0' | 'L'  => null;
		  when '1' | 'H'  => TEMP :=TEMP+1;
		  when others     => TEMP :=TEMP+XMAP;
		end case;
	 end loop;
	 return CHARACTER'VAL(TEMP);
	end CONV;
begin
	
	VMRAM : RAM port map(ram_add, clk, ram_in, ram_set, ram_out);
	
	first : process(clk, rst, set)
	begin
		if(rst = '1') then
			state <= idle;
		elsif(set = '1')then
			state <= set_ram;
		elsif(clk'event and clk = '1')then
			state <= next_state;
		end if;
	end process first;
	
	second : process(choice, moneyin, cancel, enter, state)
	begin
		case state is
			when load_str=>
				if(cancel = '0' and enter = '0')then
					ram_set <= '0';
					str_str <= str_str + 1;
					next_state <= assign_str;
				end if;
			when assign_str=>
				ram_set <= '0';
				if(str_str <= 16) then
					str_buf(str_str) <= CONV(ram_out);
					next_state<=load_str;
					ram_Addv <= ram_Addv + 1;
				else
					str_str <= 0;
					lcd <= str_buf;
					next_state<=dump_state;
				end if;
			when set_ram =>
				next_state <= idle;
				ram_set <= '1';
			when idle =>
				ram_Set <= '0';
				ram_addv <= (others => '1');
				lsel <= -1;
				if(cancel = '1' or enter = '1')then
					next_state <= idle;
				elsif(moneyin > 0 and rst = '0') then
					next_state <= select_product;
					maxval <= to_integer(unsigned(ram_out));
				elsif(moneyin /= last_mon) then
					last_mon <= moneyin;
					dump_state <= idle;
					next_state <= load_str;
					ram_addv <= sidlest & "0000";
				end if;
			when select_product=>
				if(lsel /= choice)then
					lsel <= choice;
					if(choice = 0) then
						ram_addv	<= sselect & "0000";
						dump_state <= select_product;
					elsif(choice > 0 and choice <= maxval)then
						ram_addv <= (datastr & "0000") + (18*(choice-1));
						dump_state <= get_data;
					else
						ram_addv <= soutrng & "0000";
						dump_state <= select_product;
					end if;
					next_state <= load_str;
				end if;
				if(cancel = '1') then
					str_str <= 0;
					dump_state <= grab;
					next_state <= load_str;
					ram_addv <= scancel & "0000";
					moneyout <= moneyin;
				elsif(enter = '1') then
					if(choice <= 0 or choice > maxval) then
						next_state <= select_product;
					else
						next_state <= disp_money;
					end if;
				end if;
			when get_data=>
				ram_set <= '0';
				ram_addv <= ((datastr + 1) & "0000") + (18*(choice-1)); --get price
				
				next_state <= get_data1;
			when get_data1=>
				ram_addv <= ram_addv + 1; --get stock
				ram_addt <= ram_addv + 1; --set stock
				next_state <= get_data2;
			when get_data2=>
				price <= to_integer(unsigned(ram_out)) * 1000;
				next_state <= get_data3;
			when get_data3=>
				stock <= to_integer(unsigned(ram_out));
				last_val <= ram_out;
				next_state <= select_product;
			when disp_money=>
				if(moneyin < (price)) then
					dump_state <= select_product;
					ram_Addv <= lowmoney & "0000";
					next_state <= load_str;
				else
					if(stock <= 0) then
						last_val  <= ram_out;
						dump_state <= select_product;
						next_state <= load_str;
						ram_Addv <= sunavail & "0000";
					else
						dump_state <= grab;
						next_state <= load_str;
						ram_Addv <= thanks & "0000";
						moneyout <= moneyin - price;
					end if;
				end if;
			when grab=>
				if((cancel = '1' or enter = '1') and moneyin = 0)then
					next_state <= idle;
					moneyout <= 0;
					last_mon <= -1;
					if(stock>0) then
						next_state <= set_ram;
						ram_set <= '1';
						ram_inv <= last_val - 1;
						ram_addv <= ram_Addt;
					end if;
				else next_state <= grab;
				end if;
		end case;
	end process second;
	
	with set select ram_in  <= ram_data  	when '1',
										ram_inv 		when others;
	with set select ram_add <= ram_str 		when '1',
										ram_addv  	when others;
	
end vm;
