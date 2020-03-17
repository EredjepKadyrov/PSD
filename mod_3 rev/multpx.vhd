library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
 
entity multpx is
port(	IA, IB : in std_logic_vector(1 downto 0);
	S:	in std_logic;
	O:	out std_logic_vector(1 downto 0)
);
end multpx;  
 
architecture behv1 of multpx is
begin
    process(IA, IB,S)
    begin
        case S is
	    when '0' => O <= IA;
	    when '1' => O <= IB;
		 when others => O <= "00";
	end case;

    end process;
end behv1;
