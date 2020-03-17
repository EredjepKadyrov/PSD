library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity T_FF is
	port(	T 	: in  STD_LOGIC;
			CLK: in  STD_LOGIC;
			Q	: out STD_LOGIC);
end T_FF;

architecture aT_FF of T_FF is

signal tmp: std_logic := '0';

begin
process(CLK)
	begin
			if clk'event and clk = '1' then
				if T = '0' then
					tmp <= tmp;
				elsif T='1' then
					tmp <= not(tmp);
				end if;
			end if;
	end process;
	Q<=tmp;
end aT_FF;