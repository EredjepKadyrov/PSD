library ieee;
use ieee.std_logic_1164.all;

entity sr3 is
	port( res: in std_logic;
	sin: in std_logic;
	clk: in std_logic;
	pout: out std_logic_vector(2 downto 0));
end sr3;

architecture beh of sr3 is
signal temp: std_logic_vector( 2 downto 0);
begin
	process( clk, res)
		begin
			if(res='1') then
			temp<=(others => '0');
			elsif (clk'event and clk ='1') then
				temp(2)<=sin;
				temp(1)<=temp(2);
				temp(0)<=temp(1);
		end if;
	end process;
	pout<=temp;
end beh;