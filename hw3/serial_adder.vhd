library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity serial_adder is
	generic(	countsize: integer := 2);
	port(	input : in  std_logic_vector((2 ** countsize)-1 downto 0) := (others => '0');
			output: inout std_logic_vector((2 ** countsize)-1 downto 0);
			clk, rst, n: in 	std_logic;
			done : out std_logic);
end serial_adder;

architecture sadd32 of serial_adder is

component myregister is
	generic(N : integer := 4);
		port(i : in STD_LOGIC_VECTOR(N-1  downto 0);
			sh_i : in std_logic;
			o : inout STD_LOGIC_VECTOR(N-1  downto 0):= (others => '0');
			sh_o : out std_logic;
			shr,clk, rst, en : in STD_LOGIC);
end component;

component full_adder is
  port (
	 i_carry : in std_logic;
    i_bit1  : in std_logic;
    i_bit2  : in std_logic;
    o_sum   : out std_logic;
    o_carry : out std_logic
    );
end component;

component up_counter is
	generic(n:integer :=4);
    port (
        cout   :out std_logic_vector (n-1 downto 0);  -- Output of the counter
        enable :in  std_logic;                      -- Enable counting
        clk    :in  std_logic;                      -- Input clock
        reset  :in  std_logic                       -- Input reset
    );
end component;

component d_ff is
port(	clk, ce, d : in std_logic;
		q, nq 	  : out std_logic);
end component;

constant bitsize : integer := 2 ** countsize;

signal lsbadd, lsbacc, sumfa, qen, cein, cout, cin, crst, nclk: std_logic;
signal count		: std_logic_vector(countsize-1 downto 0);
signal wire			: std_logic_vector(countsize-1 downto 0);

type state_type is (idle, enc, check, finish);
signal state, next_state : state_type;

begin

cein <= n or rst;
wire(0) <= count(0);
nclk <= not clk;
crst <= not qen;

COG : for i in 1 to countsize-1 generate
	wire(i) <= count(i) or wire(i-1);
end generate COG;

addreg : myregister generic map(bitsize) port map(input, lsbadd, open, lsbadd, qen, clk, rst, crst);
accreg : myregister generic map(bitsize) port map((others => '0'), sumfa, output, lsbacc, qen, clk, rst, '0');
dffadd : d_ff		  port map(clk, cein, cout, cin, open);
adder1 : full_adder port map(cin, lsbadd, lsbacc, sumfa, cout);
count1 : up_counter generic map(countsize) port map(count, qen, nclk, crst);

first : process(clk)
begin
	if(clk ='1' and clk'event) then
		state <= next_state;
	end if;
end process first;

second : process(state, n, rst, wire(countsize-1))
begin
	case state is
		when idle =>
			if(n = '1') then
				next_state <= enc;
				done <= '0';
			else next_state <= idle;
			end if;
		when enc => next_state <= check;
		when check  =>
			if(wire(countsize-1) = '0') then
				next_state <= finish;
			elsif(rst = '1') then next_state <= idle;
			else next_state <= check;
			end if;
		when finish =>
			done <= '1';
			if(n = '0') then next_state <= idle;
			else next_state <= finish;
			end if;
	end case;
end process second;

third : process(state)
begin
	case state is
		when idle =>
			qen <= '0';
		when enc =>
			qen <= '1';
		when check  =>
		when finish =>
			qen <= '0';
	end case;
end process third;

end sadd32;