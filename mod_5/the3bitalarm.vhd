library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity the3bitalarm is
	port(	en, set, stop, clk , rst: in STD_LOGIC := '0';
			setbit : in std_logic_vector(2 downto 0) := "111" ;
			beep : out std_logic := '0';
			output : out std_logic_vector(2 downto 0));
end the3bitalarm;

architecture t3ba of the3bitalarm is
	component counterbit is
		generic(n : integer := 3);
		port(	clk, rst, ud : in std_logic;
			q : out std_logic_vector(n-1 downto 0) := (others => '0');
			lower  : in std_logic_vector(n-1 downto 0) := (others =>'0');
			higher : in std_logic_vector(n-1 downto 0) := (others =>'1'));
	end component;
	
	Signal buf : std_logic_vector(2 downto 0);
	Signal Alarm : std_logic_vector(2 downto 0) := "000";
	Signal state : std_logic := '0';
	
	begin
	cb : counterbit generic map(n => 3) port map(clk=>clk, rst=>rst, ud=>'1', q=>buf, lower=>"000", higher =>"111");
	
	process(buf, clk, en, set, stop, rst, Alarm)
	begin
		if(en ='1') then
			if(rst ='1') then
				beep <= '0';
				Alarm <= "000";
			elsif(stop = '1' and state = '1') then
				beep <= '0';
				state <= '0';
			elsif(set = '1') then
				Alarm <= setbit;
			elsif(Alarm = buf) then
				beep <= '1';
				output <= Alarm;
				state <= '1';
			elsif(clk'event and clk = '1') then
				if(state = '0') then
					output <= buf;
				end if;
			end if;
		end if;
	end process;
end t3ba;