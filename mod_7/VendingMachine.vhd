entity vendingmachine is
	port(	moneyin 	: in  integer := 0;
			moneyout	: out integer := 0;
			choice 	: in  integer := 0;
			lcd		: out string(1 to 16)	 := "VM Tekkom       ";
			cancel, enter : inout bit := '0';
			clk, rst : bit := '1');
end vendingmachine;

architecture vm of vendingmachine is
	constant sunavail: string(1 to 16) := "Kosong          ";
	constant scancel : string(1 to 16) := "Batal           ";
	constant sidlest : string(1 to 16) := "VM Tekkom       ";
	constant sselect : string(1 to 16) := "Pilih           ";
	constant lowmoney: string(1 to 16) := "Tdk Cukup       ";
	constant soutrng : string(1 to 16) := "Out of Range    ";
	constant stimeout: string(1 to 16) := "Waktu Habis     ";
	
	type arrstr 	is array (1 to 10) of string(1 to 16);
	type arrint 	is array (1 to 10) of integer;
	
	constant cstored : arrstr
		:=(	"CocaCola    4,5k",	
				"Sprite      3,0k",
				"Fanta       3,5k",
				"YouC1000    6,0k",
				"Oronamin    5,5k",
				"Pocari      7,5k",
				"Equil     200,0k",
				"Tequilla  500,0k",
				"OrangTua  150,0k",
				"Aqua1,5L    6,0k");
	constant cpackval: arrint
		:=(4500,3000,3500,6000,5500,7500,200000,500000,150000,6000);
	signal cstock  : arrint
		:=(2,5,10,1,3,7,6,9,0,10);
		
	type state_type is (idle, check_money, select_product, grab);
	
	signal state, next_state : state_type;
	signal lsel : integer;
begin

	first : process(clk)
	begin
		if(rst = '1') then
			state <= idle;
		elsif(clk'event and clk = '1')then
			state <= next_state;
		end if;
	end process first;
	
	second : process(choice, moneyin, cancel, enter, state)
	begin
		case state is
			when idle =>
				if(cancel = '1' or enter = '1')then
					next_state <= idle;
				elsif(moneyin > 0 and rst = '0') then
					next_state <= select_product;
					lcd <= sselect;
				else
					next_state <= idle;
					lcd <= sidlest;
				end if;
			when select_product=>
				if(lsel /= choice)then
					lsel <= choice;
					if(choice = 0) then
						lcd <= sselect;
					elsif(choice > 0 and choice <= 10)then
						lcd <= cstored(choice);
					else
						lcd <= soutrng;
					end if;
				end if;
				if(cancel = '1') then
					next_state <= grab;
					lcd <= scancel;
					moneyout <= moneyin;
				elsif(enter = '1') then
					if(choice <= 0 or choice > 10) then
						next_state <= select_product;
					else
						next_state <= check_money;
					end if;
				end if;
			when check_money=>
				if(moneyin < cpackval(choice)) then
					next_state <= select_product;
					lcd <= lowmoney;
				else
					if(cstock(choice) < 0) then
						next_state <= select_product;
						lcd <= sunavail;
					else
						next_state <= grab;
						lcd <= cstored(choice);
						cstock(choice) <= cstock(choice) - 1;
						moneyout <= moneyin - cpackval(choice);
					end if;
				end if;
			when grab=>
				if((cancel = '1' or enter = '1') and moneyin = 0)then
					next_state <= idle;
					lcd <= sidlest;
					moneyout <= 0;
				else next_state <= grab;
				end if;
		end case;
	end process second;
end vm;
