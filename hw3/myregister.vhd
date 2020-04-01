library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity myregister is
	generic(N : integer := 4);
		port(i : in STD_LOGIC_VECTOR(N-1  downto 0);
			sh_i : in std_logic;
			o : inout STD_LOGIC_VECTOR(N-1  downto 0):= (others => '0');
			sh_o : out std_logic;
			shr,clk, rst, en : in STD_LOGIC);
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
			elsif shr ='1' then
					o(n-2 downto 0) <= o(n-1 downto 1);
					o(n-1) <= sh_i;
			end if;
		end if;
	end process;
	sh_o <= o(0);
end reg;