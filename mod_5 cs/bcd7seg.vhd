library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
 
entity bcd7seg is

Port (IB : in STD_LOGIC_VECTOR (3 downto 0);
		OB : out STD_LOGIC_VECTOR (6 downto 0));
end bcd7seg;
 
architecture seg of bcd7seg is
 
begin
 
process(IB) begin
	case IB is
		when "0000" => OB <= "0000001"; ---0
		when "0001" => OB <= "1001111"; ---1
		when "0010" => OB <= "0010010"; ---2
		when "0011" => OB <= "0000110"; ---3
		when "0100" => OB <= "1001100"; ---4
		when "0101" => OB <= "0100100"; ---5
		when "0110" => OB <= "0100000"; ---6
		when "0111" => OB <= "0001111"; ---7
		when "1000" => OB <= "0000000"; ---8
		when "1001" => OB <= "0000100"; ---9
		when others => OB <= "1111111"; ---null
	end case;
end process;
 
end seg;
