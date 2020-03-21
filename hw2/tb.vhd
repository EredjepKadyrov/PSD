entity tb is
end tb;

architecture test of tb is
	
component t_bird is
port(	rhl : in bit_vector(2 downto 0);
		clk : in bit;
		rl	 : out bit_vector(5 downto 0));
end component;

for all : t_bird use entity work.t_bird(state_machine);

signal r : bit_vector(1 to 30) := "011110000000000011110110001100";
signal h : bit_vector(1 to 30) := "000000111100000000000000000010";
signal l	: bit_vector(1 to 30) := "000000000001111011110001101100";
signal clk : bit :='1'; 
signal rhl : bit_vector(2 downto 0);
signal rl : bit_vector(5 downto 0);

constant half_period : time := 10 ns;
constant finished : time := 600 ns;


begin
tbrd : t_bird port map(rhl, clk, rl);

process
	begin
		clk <= not clk;
		wait for 5 ns;
end process;

process
	begin
		wait for 1 ns;
		for i in 1 to 30 loop
			rhl <= l(i) & h(i) & r(i);
			wait for 10 ns;
		end loop;
		wait for 10 ns;
		wait;
end process;

end test;