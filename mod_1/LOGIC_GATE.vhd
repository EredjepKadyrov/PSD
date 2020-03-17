library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity STATISTIC is

	port
	(
		-- Input ports
		clk	: in  STD_LOGIC;
		reset	: in  STD_LOGIC;
		din	: in  STD_LOGIC_VECTOR(3 downto 0)
		go		: in  STD_LOGIC

		-- Output ports
		done	: out STD_LOGIC
		dout	: out STD_LOGIC_VECTOR(3 downto 0)
		dout_mode	: oute STD_LOGIC_VECTOR(1 downto 0)
	);
end STATISTIC;

architecture BEHAVIOUR of STATISTIC is
begin

	C <= A AND B;

end BEHAVIOUR;
