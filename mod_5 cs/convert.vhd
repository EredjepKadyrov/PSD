library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity convert is
generic(
		dashc	: integer := 15;--Dash time
		dotc	: integer := 10;--Dot time
		sps	: integer := 2; --Space after sign
		spa	: integer := 5; --Space after Alphabet
		sp		: integer := 20; --space
		maxc	: integer := 10 --Maximum Char
);
port(	clk 	: in std_logic;
		sr	 	: in std_logic := '1';
		str	: in string(1 to maxc) := "RNA Alfian";
		idle	: out std_logic := '1';
		output: out std_logic := '0'
);
end convert;


architecture rumput of convert is

	signal   m		: std_logic_vector(4 downto 0);
	signal   Ticks : integer := 0; -- m counter
	signal	n		: integer := 1; -- char index
	signal	t		: integer := 0; -- timer writer

	procedure wr(		signal count	: inout integer;
							signal o			: out std_logic;
							signal timer	: inout integer;
							constant th		: in integer;
							constant tl		: in integer;
							constant space : in boolean)is
	begin
		if(timer <= 0)then
			timer <= th + tl + 1;
		else
			timer <= timer - 1;
			if(timer > tl + 1)then
				o <= '1';
			elsif(timer > 1)then
				o <= '0';
			else
				count <= count - 1;
			end if;
		end if;
	end procedure;
	
	procedure ws(		signal count	: inout integer;
							signal o			: out std_logic;
							signal timer	: inout integer;
							constant t		: in integer)is
	begin
		if(timer <= 0)then
			timer <= t + 1;
		else
			o <= '0';
			timer <= timer - 1;
			if(timer = 1) then
				count <= -1;
			end if;
		end if;
	end procedure;
	
	procedure trans(	constant ch    : in 	character;
							signal	morse : out std_logic_vector(4 downto 0);
							signal 	count : out integer) is
	begin
		if(ch = 'a' or ch = 'A') then 
			morse <= "00001";
			count <= 2;
		elsif(ch = 'b' or ch ='B') then 
			morse <= "01000";
			count <= 4;
		elsif(ch = 'c' or ch = 'C') then
			morse <= "01010";
			count <= 4;
		elsif(ch = 'd' or ch = 'D') then
			morse <= "00100";
			count <= 3;
		elsif(ch = 'e' or ch = 'E') then
			morse <= "00000";
			count <= 1;
		elsif(ch = 'f' or ch = 'F') then
			morse <= "00010";
			count <= 4;
		elsif(ch = 'g' or ch = 'G') then
			morse <= "00110";
			count <= 3;
		elsif(ch = 'h' or ch = 'H') then
			morse <= "00000";
			count <= 4;
		elsif(ch = 'i' or ch = 'I') then
			morse <= "00000";
			count <= 2;
		elsif(ch = 'j' or ch = 'J') then
			morse <= "00111";
			count <= 4;
		elsif(ch = 'k' or ch = 'K') then
			morse <= "00101";
			count <= 3;
		elsif(ch = 'l' or ch = 'L') then
			morse <= "00100";
			count <= 4;
		elsif(ch = 'm' or ch = 'M') then
			morse <= "00011";
			count <= 2;
		elsif(ch = 'n' or ch = 'N') then
			morse <= "00010";
			count <= 2;
		elsif(ch = 'o' or ch = 'O') then
			morse <= "00111";
			count <= 3;
		elsif(ch = 'p' or ch = 'P') then
			morse <= "00110";
			count <= 4;
		elsif(ch = 'q' or ch = 'Q') then
			morse <= "01101";
			count <= 4;
		elsif(ch = 'r' or ch = 'R') then
			morse <= "00010";
			count <= 3;
		elsif(ch = 's' or ch = 'S') then
			morse <= "00000";
			count <= 3;
		elsif(ch = 't' or ch = 'T') then
			morse <= "00001";
			count <= 1;
		elsif(ch = 'u' or ch = 'U') then
			morse <= "00001";
			count <= 3;
		elsif(ch = 'v' or ch = 'V') then
			morse <= "00001";
			count <= 4;
		elsif(ch = 'w' or ch = 'W') then
			morse <= "00011";
			count <= 3;
		elsif(ch = 'x' or ch = 'X') then
			morse <= "01001";
			count <= 4;
		elsif(ch = 'y' or ch = 'Y') then
			morse <= "01011";
			count <= 4;
		elsif(ch = 'z' or ch = 'Z') then
			morse <= "01100";
			count <= 4;
		elsif(ch = ' ') then
			count <= 10;
		elsif(ch = '0') then
			morse <= "11111";
			count <= 5;
		elsif(ch = '1') then
			morse <= "01111";
			count <= 5;
		elsif(ch = '2') then
			morse <= "00111";
			count <= 5;
		elsif(ch = '3') then
			morse <= "00011";
			count <= 5;
		elsif(ch = '4') then
			morse <= "00001";
			count <= 5;
		elsif(ch = '5') then
			morse <= "00000";
			count <= 5;
		elsif(ch = '6') then
			morse <= "10000";
			count <= 5;
		elsif(ch = '7') then
			morse <= "11000";
			count <= 5;
		elsif(ch = '8') then
			morse <= "11100";
			count <= 5;
		elsif(ch = '9') then
			morse <= "11110";
			count <= 5;
		else 
			count <= -1;
		end if;		
	end procedure;
	

	
begin

	process(clk, sr)
	
	begin
		if (sr = '1') then
			ticks <= -1;
			n		<= 1;
			idle	<= '0';
			t <= 0;
		elsif rising_edge(clk) then
			if(n > maxc) then
				idle <= '1';
			elsif(ticks = 10) then -- spasi
				ws(ticks, output, t, sp);
			elsif(ticks > 0) then -- normal
				if(m(ticks-1) = '0') then --dot
					wr(ticks, output, t, dotc,sps, false);
				else -- dash
					wr(ticks, output, t, dashc,sps, false);
				end if;
			elsif(ticks = 0) then -- spasi sehabis huruf
				ws(ticks, output, t, spa);
			else
				trans(str(n), m, ticks);
				n <= n + 1;
			end if;
		end if;
	end process;

end rumput;