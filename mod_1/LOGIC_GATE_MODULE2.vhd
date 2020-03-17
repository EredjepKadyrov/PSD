library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
-- AND OR NOT NAND NOR XOR
entity LOGIC_GATE_MODULE2 is
    Port ( 
				not_in : in STD_LOGIC;
				not_out: out STD_LOGIC;
				and_in_1 : in STD_LOGIC;
				and_in_2 : in STD_LOGIC;
				and_out : out STD_LOGIC;
				or_in_1 : in STD_LOGIC;
				or_in_2 : in STD_LOGIC;
				or_out : out STD_LOGIC;
				nand_in_1 : in  STD_LOGIC;
				nand_in_2 : in  STD_LOGIC;
				nand_out : out  STD_LOGIC;
				nor_in_1 : in  STD_LOGIC;
				nor_in_2 : in  STD_LOGIC;
				nor_out : out  STD_LOGIC;
				xor_in_1 : in STD_LOGIC;
				xor_in_2 : in STD_LOGIC;
				xor_out : STD_LOGIC;
			  );
			  
end LOGIC_GATE_NAND_NOR;

architecture Behavioral of LOGIC_GATE_MODULE2 is
begin
X1 <= A1 nand A2;    -- 2 input NAND gate
Y1 <= B1 nor B2;     -- 2 input NOR gate

end Behavioral;