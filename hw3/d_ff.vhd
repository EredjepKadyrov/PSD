library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity d_ff is
port(	clk, ce, d : in std_logic;
		q, nq 	  : out std_logic);
end d_ff;

architecture bdff of d_ff is

begin
process(clk, ce)
	begin
		if(ce = '1')then
			q <= '0';
			nq <= '1';
		elsif(clk'event and clk = '1') then
			if(d = '1') then
				q <= '1';
				nq <= '0';
			else 
				q <= '0';
				nq <= '1';
			end if;
		end if;
end process;

end bdff;