library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity calc is
	generic(n : integer := 4);
	port(	
			in1, in2: in  std_logic_vector(n-1 downto 0);
			outb	 : out std_logic_vector((n*2)-1 downto 0) := (others => '0');
			control : in  std_logic_vector(1 downto 0));
end calc;

architecture cc of calc is

component adder_bits_n is
generic(n:integer:=4);
PORT ( S, Cin : IN STD_LOGIC;
	A, B : IN STD_LOGIC_VECTOR (n-1 DOWNTO 0);
	Sout : OUT STD_LOGIC_VECTOR (n DOWNTO 0);
	over : out std_logic);
end component;

component multpx is
generic(n : integer := 1);
port(	IA, IB : in std_logic_vector(n-1 downto 0);
	S:	in std_logic;
	O:	out std_logic_vector(n-1 downto 0)
);
end component;  

--Control
signal sel : std_logic; --Selector
signal asc : std_logic; --Adder/Substractor

--Wire Special
signal inx : std_logic_vector(((n+1)*(n))-1 downto 0) := (others => '0');
signal iny : std_logic_vector((n*(n-1))-1 downto 0);

--Wire
signal w_3 : std_logic_vector((n*2)-1 downto 0);
signal w_4 : std_logic_vector((n*2)-1 downto 0);
signal w_1 : std_logic_vector((n*2)-1 downto 0);
signal w_o : std_logic_vector(n-2 downto 0);
signal w_5 : std_logic_vector(n-1 downto 0);
signal w_6 : std_logic_vector(n-1 downto 0);
signal w	  : std_logic_vector(n-2 downto 0);

begin

w_3 <= in1 & in2;
w_4 <= w_5 & '0' & w_6(n-1 downto 1);
w_o(0) <= w_6(0);
inx(n downto 1) <= w_1(n-1 downto 0);
iny(n-1 downto 0) <= w_1((n*2)-1 downto n);

quad : for i in 0 to n-1 generate
	w_6(i) <= in2(0) and in1(i);
	w_5(i) <= in2(1) and in1(i);
end generate;

trip : for i in 0 to n-2 generate
	ADD_i : adder_bits_n generic map(n)
				port map(asc, '0', iny(((i+1)*n)-1 downto n*i), inx(((i+1)*(n+1))-1 downto (i*(n+1))+1), inx(((i+2)*(n+1))-1 downto (i+1)*(n+1)), w(i));
end generate;

dual : for i in 1 to n-2 generate
	w_o(i) <= inx((i*(n+1)));
	andq : for j in 0 to n-1 generate
		iny((i*n)+j) <= in2(i+1) and in1(j);
	end generate;
end generate;
				
MUX_I : multpx generic map(8)
				port map(w_3, w_4, sel, w_1);
				
process(inx, iny, w, w_o, control)
begin
	case(control) is
		when "01"  =>
			asc <= '0';
			sel <= '0'; --add
			outb(n downto 0) <= inx(((n+1)*2)-1 downto n+1);
			outb(n*2-1 downto n+1) <= (others => '0'); --sign
		when "10"  =>
			asc <= '1';
			sel <= '0'; --sub
			outb(n-1 downto 0) <= inx(((n+1)*2)-2 downto n+1);
			outb(n*2-1 downto n) <= (others => w(0)); --sign
		when "11"  =>
			asc <= '0';
			sel <= '1'; --mul
			outb <= inx(((n+1)*4)-1 downto ((n+1)*3)) & w_o;
		when others => outb <= (others => '0');
	end case;
end process;

end cc;
