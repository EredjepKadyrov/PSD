library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity counterbit is
	generic(n : integer := 4);
	port(	clk, rst, ud : in std_logic;
			q : out std_logic_vector(n-1 downto 0) := (others => '0');
			lower  : in std_logic_vector(n-1 downto 0) := (others =>'0');
			higher : in std_logic_vector(n-1 downto 0) := (others =>'1'));
end counterbit;

architecture cbit of counterbit is

signal vale : std_logic_vector(n-1 downto 0) := (others => '0');

begin
	process(clk, rst, vale, ud, lower, higher)
		begin
			if(rst='1') then
				if (ud = '0') then
					vale <= higher;
				else vale <= lower;
				end if;
			elsif (clk'event and clk = '1') then
				if(ud ='1') then
					if(vale = higher) then
						vale <= lower;
					else
						vale <= vale + 1;
					end if;
				else
					if(vale = lower) then
						vale <= higher;
					else
						vale <= vale - 1;
					end if;
				end if;
			end if;
	end process;
	Q <= vale;
end cbit;