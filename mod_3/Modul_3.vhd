library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity modul_3 is
Port(
	signal I  	: in std_logic_vector(3 downto 0);
	signal S	 	: in std_logic_vector(1 downto 0);
	signal O 		: out std_logic_vector(6 downto 0);
	signal O_INT	: out integer
);
end modul_3;

architecture behave of modul_3 is
	component mux2bit is
		port (
			signal SM	: in STD_LOGIC;
			signal IM	: in STD_LOGIC_VECTOR(1 downto 0);
			signal OM	: out STD_LOGIC
		);
	end component;
	
	component convert is
		generic(size : integer);
		port(
			signal IC	: in STD_LOGIC_VECTOR(size-1 downto 0);
			signal OC 	: out INTEGER
		);
	end component;
	
	component bcd7seg is
		port(
			signal IB : in std_logic_vector(3 downto 0);
			signal OB : out std_logic_vector(6 downto 0)
		);
	end component;
	
	signal Seg7 : std_logic_vector(6 downto 0);
	signal muxsig : std_logic_vector(3 downto 0);
	begin
	MUX1	: mux2bit port map (	SM => S(0),
									IM => I(3 downto 2),
									OM => muxsig(0));
	MUX2	: mux2bit port map (	SM => S(1),
									IM => I(1 downto 0),
									OM => muxsig(1));
	muxsig(2) <= '0';
	muxsig(3) <= '0';
	DEC	: bcd7seg port map (IB => muxsig,
										OB => O);
	CONV	: convert	generic map(size => 4)
							port map (	IC => muxsig,
											OC => O_INT);
	
end behave;