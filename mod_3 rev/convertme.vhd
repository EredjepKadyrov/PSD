library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all;

entity convertme is
generic(size : integer := 4);
port(	I : in std_logic_vector(size-1 downto 0);
		O : out integer);
end convertme;

architecture behv of convertme is
begin
	process(I)
		begin
			O <= to_integer(unsigned(I));
		end process;
end behv;
