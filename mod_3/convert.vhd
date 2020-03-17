library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all;

entity convert is
generic(size : integer := 4);
port(
  signal IC : in std_logic_vector(size-1 downto 0);
  signal OC : out integer
  );
end convert;

architecture behave of convert is
	
  -- declarative part: empty
begin
conv : process(IC)
begin
  OC <= to_integer(unsigned(IC));
end process conv;
end behave;
