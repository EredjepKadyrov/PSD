library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity clock is
	port(HH, HL, MH, ML, SH, SL: out std_logic_vector(6 downto 0);
		  clk, rst: in std_logic);
end  clock;

architecture myclock of clock is

component bcd7seg is
Port (IB : in STD_LOGIC_VECTOR (3 downto 0);
		OB : out STD_LOGIC_VECTOR (6 downto 0));
end component;

signal HHB	: std_logic_vector(3 downto 0) := "0000";
signal HLB 	: std_logic_vector(3 downto 0) := "1001";
signal MHB	: std_logic_vector(3 downto 0) := "0001";
signal MLB	: std_logic_vector(3 downto 0) := "0011";
signal SHB	: std_logic_vector(3 downto 0) := "0001";
signal SLB	: std_logic_vector(3 downto 0) := "0111";

begin

seghh : bcd7seg port map(IB => HHB, OB =>HH);
seghl : bcd7seg port map(IB => HLB, OB =>HL);
segmh : bcd7seg port map(IB => MHB, OB =>MH);
segml : bcd7seg port map(IB => MLB, OB =>ML);
segsh : bcd7seg port map(IB => SHB, OB =>SH);
segsl : bcd7seg port map(IB => SLB, OB =>SL);

process(HHB, HLB, MHB, MLB, SHB, SLB, clk, rst)
	begin
	if(rst = '1') then
		HHB <= "0000";
		HLB <= "0000";
		MHB <= "0000";
		HLB <= "0000";
		SHB <= "0000";
		SLB <= "0000";
	elsif(clk'event and clk = '1')then
		SLB <= SLB + '1';
		if(SLB = "1001") then
			SLB <= "0000";
			SHB <= SHB + '1';
			if(SHB = "0101") then
				SHB <= "0000";
				MLB <= MLB +'1';
				if(MLB = "1001") then
					MLB <= "0000";
					MHB <= MHB + '1';
					if(MHB = "0101") then
						MHB <= "0000";
						HLB <= HLB + '1';
						if(HLB = "1001") then
							HLB <= "0000";
							HHB <= HHB + '1';
						elsif(HHB = "0010" and HLB = "0011") then
							HHB <= "0000";
							HLB <= "0000";
						end if;
					end if;
				end if;
			end if;
		end if;
	end if;
end process;

end myclock;