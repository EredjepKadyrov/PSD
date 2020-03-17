library ieee;
use ieee.std_logic_1164.all;
use work.all;

entity comb_ckt is
port(
	InputA  : in std_logic_vector(1 downto 0);
	InputB  : in std_logic_vector(1 downto 0);
	InputC  : in std_logic_vector(1 downto 0);
	InputD  : in std_logic_vector(1 downto 0);
	Sel	 : in std_logic_vector(1 downto 0);
	Out_int: out integer;
	Out_seg: out std_logic_vector(6 downto 0)
);
end comb_ckt;

architecture struct of comb_ckt is
	 
	 component convertme is
	 generic(size : integer := 4);
	 port(	I: in std_logic_vector(size-1 downto 0);
				O: out integer);
	 end component;
	 
	 component bcd7seg is
	 port(
				I: in std_logic_vector(3 downto 0);
				O: out std_logic_vector(6 downto 0));
	 end component;
	 
	 component multpx is
	 port(	IA, IB : in std_logic_vector(1 downto 0);
				S: in std_logic;
				O: out std_logic_vector(1 downto 0));
	 end component;

    signal wire: std_logic_vector(3 downto 0);

begin

    MUXA : multpx port map (IA => InputA, IB => InputB, S => Sel(1), O => wire(3 downto 2));
	 MUXB : multpx port map (IA => InputB, IB => InputD, S => Sel(0), O => wire(1 downto 0));
	 CONV : convertme generic map (size => 4) port map (I => wire, O => Out_int);
	 DECO : bcd7seg port map (I => wire, O => Out_seg);

end struct;