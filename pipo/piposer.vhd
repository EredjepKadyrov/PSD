library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity piposer is

	generic(n : integer := 4);
	port(	inA, inB, inC, inD : in std_logic_vector(n-1 downto 0) := (others => '0');
			output : out std_logic_vector(n-1 downto 0) := (others => '0');
			inSel, outsel : in std_logic_vector(1 downto 0) := (others => '0');
			inEn, outEn, clk, rst : in std_logic := '0'
			);

end piposer;

architecture apiposer of piposer is

component myregister is
	generic(N : integer := 4);
	port( en : in STD_LOGIC; i : in STD_LOGIC_VECTOR(N-1  downto 0);
			clk : in STD_LOGIC; rst : in STD_LOGIC; o :out STD_LOGIC_VECTOR(N-1  downto 0));
end component;

signal oregA, oregB, oregC, oregD, outputb : std_logic_vector(n-1 downto 0);
signal clkb, en_A, en_B, en_C, en_D : std_logic;

begin

reg1 : myregister generic map (n => n) port map (clk=>clkb, i=>inA, rst=>rst, o=> oregA, en=>en_A);
reg2 : myregister generic map (n => n) port map (clk=>clkb, i=>inB, rst=>rst, o=> oregB, en=>en_B);
reg3 : myregister generic map (n => n) port map (clk=>clkb, i=>inC, rst=>rst, o=> oregC, en=>en_C);
reg4 : myregister generic map (n => n) port map (clk=>clkb, i=>inD, rst=>rst, o=> oregD, en=>en_D);
muxselector : entity work.muxsel(mux4sel) generic map(n => n) port map(I1=>oregA, I2=>oregB, I3=>oregC, I4=>oregD, O=>outputb, s4=>outSel);

process(inSel, inEn, outEn, clk, outputb)
	begin
		if outen = '1' then output <= outputb;
		else output <= (others => '0');
		end if;
		if inen = '1' then clkb <= clk;
		else clkb <= '0';
		end if;
		en_A <= inSel(1) nor insel(0);
		en_B <= (not inSel(1)) and inSel(0);
		en_C <= inSel(1) and (not inSel(0));
		en_D <= inSel(1) and inSel(0);
	end process;

end apiposer;
