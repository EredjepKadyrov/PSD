library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_unsigned.all;
use IEEE.numeric_std.all;

entity tb is
end tb;

architecture testbench of tb is

component serial_adder is
	generic(countsize : integer := 2);
	port(	input : in  std_logic_vector((2**countsize)-1 downto 0);
			output: inout std_logic_vector((2**countsize)-1 downto 0);
			clk, rst, n: in 	std_logic;
			done : inout std_logic);
end component;

constant countsize : integer := 5;
constant bitsize : integer := 2**countsize;
signal reset : boolean := true;
signal auto	 : boolean := true;
signal input : integer := 0;
signal output: integer;
signal clk 	 : std_logic := '1';
signal rst	 : std_logic := '1';
signal done  : std_logic;
signal inbit, outbit : std_logic_vector(bitsize-1 downto 0) := (others => '0');
signal n		: std_logic := '0';
signal inreg: integer := 0;

type int_array is array(0 to 4) of integer;
signal int : int_array := (75 & 1200 & 45730 & 87400 & 28493);

begin

test_serial_adder : serial_adder generic map(countsize) port map(inbit, outbit, clk, rst, n, done);

process
begin
	clk <= not clk;
	wait for 5 ps;
end process;

process
begin
	wait for 1 ps;
	if(reset = true) then
		rst <= '1';
		n <= '0';
		wait for 10 ps;
		rst <= '0';
		reset <= false;
	elsif(auto = true)then
		AUSEC : for i in 0 to 4 loop
			input <= int(i);
			inbit <= std_logic_vector(to_unsigned(int(i), inbit'length));
			wait for 5 ps;
			n <= '1';
			wait for 10 ps;
			n <= '0';
			wait until done = '1';
			output <= to_integer(unsigned(outbit));
			wait for 5 ps;
		end loop AUSEC;
		auto <= false;
		rst <= '1';
		inbit <= (others => '0');
		input <= 0;
		n <= '0';
		wait for 10 ps;
		rst <= '0';
		reset <= false;
	elsif((input /= inreg) and reset = false and done /= '0' and auto = false)then
		inreg <= input;
		inbit <= std_logic_vector(to_unsigned(input, inbit'length));
		wait for 5 ps;
		n <= '1';
		wait for 10 ps;
		n <= '0';
	elsif(done = '1') then output <= to_integer(unsigned(outbit));
	end if;
end process;

end testbench;