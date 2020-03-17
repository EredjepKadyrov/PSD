library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
 
entity bcd7seg is

Port (I : in STD_LOGIC_VECTOR (3 downto 0);
		O : out STD_LOGIC_VECTOR (6 downto 0));
end bcd7seg;
 
architecture seg of bcd7seg is
begin
process(I) begin
	case I is
		when "0000" => O <= "0000001"; ---0
		when "0001" => O <= "1001111"; ---1
		when "0010" => O <= "0010010"; ---2
		when "0011" => O <= "0000110"; ---3
		when "0100" => O <= "1001100"; ---4
		when "0101" => O <= "0100100"; ---5
		when "0110" => O <= "0100000"; ---6
		when "0111" => O <= "0001111"; ---7
		when "1000" => O <= "0000000"; ---8
		when "1001" => O <= "0000100"; ---9
		when others => O <= "1111111"; ---null
	end case;
end process;
end seg;
