library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity myregister is
	generic(N : integer := 4);
	port( en : in STD_LOGIC; i : in STD_LOGIC_VECTOR(N-1  downto 0);
			clk : in STD_LOGIC; rst : in STD_LOGIC; o :out STD_LOGIC_VECTOR(N-1  downto 0));
end myregister;

architecture reg of myregister is
begin
	process(clk, rst)
	begin
		if rst = '1' then
			o <= (others=> '0');
		elsif clk'event  and clk = '1' then
			if en= '1' then
					o<= i;
			end if;
		end if;
	end process;
end reg;