library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity muxsel is
	generic(n : integer := 4;
			  d_val : std_logic := '0');
			  
	port(	I1 : in std_logic_vector(n-1 downto 0) := (others => d_val);
			I2 : in std_logic_vector(n-1 downto 0) := (others => d_val);
			I3 : in std_logic_vector(n-1 downto 0) := (others => d_val);
			I4 : in std_logic_vector(n-1 downto 0)	:= (others => d_val);
			S2	: in std_logic := d_val;
			S4 : in std_logic_vector(1 downto 0) := (others => d_val);
			O	: out std_logic_vector(n-1 downto 0));
			
end muxsel;

architecture mux2sel of muxsel is
begin
	O <= I1 when s2 = '0' else I2 when s2 = '1';
end mux2sel;

architecture mux4sel of muxsel is
begin
	with s4 select
		O <= I1 when "00", 
			  I2 when "01",
			  I3 when "10",
			  I4 when others;
end mux4sel;