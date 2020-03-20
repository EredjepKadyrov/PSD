-----------------------------------------
--													--
--  Nama 	: Alfian Badrul Isnan		--
--  NPM	: 1806148643					 	--
--  Kelas : PSD-2							 	--
--  Berkas proyek ini hanya merupakan 	--
--  bagian dari datapath saja	dlm soal --
--													--
-----------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

entity test_datapath is
	generic(	n, k 	: integer := 4;
				m 		: integer := 2);
	port(	din 	: in std_logic_vector(n-1 downto 0);
			dout 	: out std_logic_vector(n-1 downto 0);
			dout_mode : in std_logic_vector(1 downto 0);
			s2,s3,clk,rst : in std_logic;
			zi : out std_logic := '0';
			en : in std_logic_vector(4 downto 0);
			gt : out std_logic_vector(2 downto 0) := "000");
end test_datapath;

architecture behv of test_datapath is
	
	component up_counter is
	generic(n: integer := 4);
	port (
        cout   :out std_logic_vector (n-1 downto 0);
        enable :in  std_logic;
        clk    :in  std_logic;
        reset  :in  std_logic);
	end component;
	
	component myregister is
	generic(N : integer := 4);
	port( en : in STD_LOGIC; i : in STD_LOGIC_VECTOR(N-1  downto 0);
			clk : in STD_LOGIC; rst : in STD_LOGIC; o :out STD_LOGIC_VECTOR(N-1  downto 0));
	end component;
	
	component adder_bits_n is
	generic(n : integer := 4);
	port(	cin: in std_logic;
			a, b: in std_logic_vector(n-1 downto 0);
			s : out std_logic_vector(n-1 downto 0);
			cout: out std_logic);
	end component;

	signal no_1 : std_logic_vector(n-1 downto 0);
	signal no_2 : std_logic_vector(n-1 downto 0);
	signal no_3 : std_logic_vector(n-1 downto 0);
	signal avr : std_logic_vector(n-1 downto 0);
	signal no_1mux : std_logic_vector(n-1 downto 0);
	signal no_2mux : std_logic_vector(n-1 downto 0);
	signal cout : std_logic;
	signal sum : std_logic_vector(n+m-1 downto 0);
	signal out_Reg : std_logic_vector(n+m-1 downto 0);
	signal dinm : std_logic_vector(n+m-1 downto 0);
	signal mwire: std_logic_vector(m-1 downto 0);
	signal i : std_logic_vector(m downto 0);
	
begin

	mwire<= (others => '0');
	dinm <= mwire & din;
	avr <= out_Reg(n+m-1 downto m);
	
	mux1 : entity work.muxsel(mux4sel) port map(I1=>avr, I2=>no_1, I3=>no_2, I4=>no_3, O=>dout, s4=>dout_mode);
	mux2 : entity work.muxsel(mux2sel) port map(I1=>no_1, I2=>din, O=>no_1mux, s2=>s2);
	mux3 : entity work.muxsel(mux2sel) port map(I1=>no_2, I2=>din, O=>no_2mux, s2=>s3);
	reg1 : myregister port map(en=> en(0), clk => clk, rst=>rst, i=> din, o=>no_1);
	reg2 : myregister port map(en=> en(1), clk => clk, rst=>rst, i=> no_1mux, o=>no_2);
	reg3 : myregister port map(en=> en(2), clk => clk, rst=>rst, i=> no_2mux, o=>no_3);
	sumr  : adder_bits_n generic map(n=>(n+m)) port map(cin=>'0', cout=>cout, a=>out_Reg, b=>dinm, s=>sum);
	reg4 : myregister generic map(n => (n+m)) port map(en=> en(3), clk=>clk, rst=>rst, i=>sum, o=>out_Reg);
	upc  : up_counter generic map(n => m+1) port map(i,'1',en(4),rst);
	
	
	process(din, no_1, no_2, no_3, i)
		begin
			if din > no_1 then gt(0) <= '1';
			else gt(0) <= '0';
			end if;
			if din > no_2 then gt(1) <= '1';
			else gt(1) <= '0';
			end if;
			if din > no_3 then gt(2) <= '1';
			else gt(2) <= '0';
			end if;
			
			if (to_integer(unsigned(i)) = (k-1)) then zi <= '1';
				else zi <= '0';
			end if;
	end process;
	
end behv;