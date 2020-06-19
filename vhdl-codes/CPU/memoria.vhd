library ieee;
use ieee.std_logic_1164.all;

entity memoria is 
	port(
	CntProg:	in	std_logic_vector(3 downto 0);
	Reg:		out std_logic_vector(5 downto 0)
	);
	
end entity;

architecture simple of memoria is
begin					   
	--15 * 3 + 12 - 7 = 15+15+15+12-7
	with CntProg select
	Reg	<=	"100000" when "0000",--carga A
			"001111" when "0001",		  --15
			"100000" when "0010",--carga A
			"001111" when "0011",		  --15
			"001001" when "0100",--suma A + B
			"001111" when "0101",		  --15
			"001001" when "0110",--suma A + B
			"001100" when "0111",		  --12
			"001001" when "1000",--suma A + B
			"000111" when "1001",		  --7
			"100001" when "1010",--resta B - A
			"011010" when others;
			
--				with CntProg select
--	Reg	<=	"001111" when "0000",		  --15
--			"001001" when "0001",--suma A + B
--			"001111" when "0010",		  --15
--			"001001" when "0011",--suma A + B
--			"001111" when "0100",		  --15
--			"001001" when "0101",--suma A + B
--			"001100" when "0110",		  --12
--			"001001" when "0111",--suma A + B
--			"000111" when "1000",		  --7
--			"100001" when "1001",--resta B - A
--			"011010" when others;

end architecture;
