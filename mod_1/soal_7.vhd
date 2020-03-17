library ieee;
use ieee.std_logic_1164.all;

entity soal_7 is
    port (
        LEDR:        out std_logic_vector(1 downto 0)
    );
end soal_7;

architecture switch_me_on of soal_7 is
        begin
						assert false report "Hello world!" severity note;
                LEDR(0) <= '1';
                LEDR(1) <= '1';
end architecture switch_me_on;