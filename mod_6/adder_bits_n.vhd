LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY adder_bits_n IS
generic(n:integer:=4);
PORT ( S, Cin : IN STD_LOGIC;
	A, B : IN STD_LOGIC_VECTOR (n-1 DOWNTO 0);
	Sout : OUT STD_LOGIC_VECTOR (n DOWNTO 0);
	over : out std_logic);
END adder_bits_n;

ARCHITECTURE structural OF adder_bits_n IS

COMPONENT full_adder
	PORT (i_carry, i_bit1, i_bit2: IN std_logic; o_sum, o_carry: OUT std_logic);
END COMPONENT;

SIGNAL C : STD_LOGIC_VECTOR (n downto 0);
SIGNAL B_comp : STD_LOGIC_VECTOR (n-1 downto 0);

begin

C(0) <= S or Cin;
adders: FOR i IN 0 to n-1 GENERATE
	B_comp(i) <= B(i) xor S;
	adder: full_adder PORT MAP (C(I),A(i),B_comp(i),Sout(i),C(i+1));
END GENERATE;
Sout(n) <= C(n);
process(A, B)
begin
	if(A < B)then
		over <= '1';
	else over <= '0';
	end if;
end process;
END structural;