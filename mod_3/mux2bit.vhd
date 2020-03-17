library IEEE;
use IEEE.std_logic_1164.all;
entity mux2bit is
port(
	signal SM	: in STD_LOGIC;
	signal IM	: in STD_LOGIC_VECTOR(1 downto 0);
	signal OM	: out STD_LOGIC);
end mux2bit;

architecture mux of mux2bit is
  -- declarative part: empty
begin
p_mux : process(SM,IM)
begin
  case SM is
    when '0' => OM <= IM(0) ;
    when '1' => OM <= IM(1) ;
  end case;
end process p_mux;
end mux;
