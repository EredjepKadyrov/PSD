entity t_bird is
port(	rhl : in bit_vector(2 downto 0);
		clk : in bit;
		rl	 : out bit_vector(5 downto 0));
end t_bird;

architecture state_machine of t_bird is
type state_type is (idle, l1, l2, l3, r1, r2, r3, lr3);
signal state, next_state : state_type;

constant L : integer := 0;
constant H : integer := 1;
constant R : integer := 2;
constant LA: integer := 3;
constant LB: integer := 4;
constant LC: integer := 5;
constant RA: integer := 2;
constant RB: integer := 1;
constant RC: integer := 0;

begin

	first : process(clk)
	begin
		if(clk ='1' and clk'event) then
			state <= next_state;
		end if;
	end process first;
	
	second : process(state, rhl)
	begin
		case state is
			when idle =>
				if(rhl(H) = '1' or (rhl(L) = '1' and rhl(R) = '1'))
					then next_state <= lr3;
				elsif(rhl = "001")
					then next_state <= r1;
				elsif(rhl = "100")
					then next_state <= l1;
				else
					next_state <= idle;
				end if;
			when l1 => if(rhl(h)='1') then next_state <= lr3; else next_state <= l2; end if; 
			when l2 => if(rhl(h)='1') then next_state <= lr3; else next_state <= l3; end if; 
			when l3 => next_state <= idle;
			when r1 => if(rhl(h)='1') then next_state <= lr3; else next_state <= r2; end if; 
			when r2 => if(rhl(h)='1') then next_state <= lr3; else next_state <= r3; end if; 
			when r3 => next_state <= idle;
			when lr3=> next_state <= idle;
		end case;
	end process second;
	
	third : process(state)
	begin
		case state is
			when idle => rl <= (others => '0');
			when l1 => rl(LA) <= '1';
			when l2 => rl(LB) <= '1';
			when l3 => rl(LC) <= '1';
			when r1 => rl(RA) <= '1';
			when r2 => rl(RB) <= '1';
			when r3 => rl(RC) <= '1';
			when lr3=> rl <= (others => '1');
		end case;
	end process third;
	
end state_machine;