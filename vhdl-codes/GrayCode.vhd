library ieee;
use ieee.std_logic_1164.all;

entity GrayCode is
	port(
	input:	in	std_logic_vector(2 downto 0);
	gray:	out std_logic_vector(2 downto 0)
	);
end entity;

architecture simple of GrayCode is
begin 
	--Conditional assignaments
--gray <= "000" when(input="000") else
--		"001" when(input="001") else
--		"011" when(input="010") else
--		"010" when(input="011") else
--		"110" when(input="100") else
--		"111" when(input="101") else
--		"101" when(input="110") else
--		"100s" when(input="111") else
			
			
	
end architecture;
