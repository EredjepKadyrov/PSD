entity simpleadder is
	port( inS : in bit_vector(1 downto 0);
			outS: out bit;
			en  : in bit;
			rst, clk : in bit := '1');
end simpleadder;

architecture sad of simpleadder is
	type state_type is (stop, carry, ncarry);
	signal state, next_state : state_type;
	begin
	first : process(rst, clk)
		begin
		if(rst = '1') then
			state <= stop;
		elsif (clk'event and clk = '1')then
			state <= next_state;
		end if;
	end process first;
	
	second : process(state, en, ins)
		begin
		case state is
			when stop =>
				if(en = '1') then
					next_state <= ncarry;
				else
					next_state <= stop;
				end if;
			when carry =>
				if(inS = "00") then
					next_state <= ncarry;
				elsif(en = '0')then
					next_state <= stop;
				else
					next_state <= carry;
				end if;
			when ncarry =>
				if(inS = "11") then
					next_state <= carry;
				elsif(en = '0') then
					next_state <= stop;
				else
					next_state <= ncarry;
				end if;
		end case;
	end process second;
	third : process(clk, rst, en)
		begin
		if(clk'event and clk = '1')then
		case state is
			when stop =>
				outS <= '0';
			when carry =>
				outS <= inS(0) xnor inS(1);
			when ncarry =>
				outS <= inS(0) xor inS(1);
		end case;
		end if;
	end process third;
end sad;