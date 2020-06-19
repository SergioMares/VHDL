library ieee;
use ieee.std_logic_1164.all;

entity demuxALU is 
	port(
	inL, inA	: 	in 	std_logic_vector(2 downto 0);
	inS			: 	in 	std_logic_vector(2 downto 0);
	outALU		:	out	std_logic_vector(2 downto 0)
	);
end entity;

architecture simple of demuxALU is 
begin
	process(inS)
	begin
		if(inS(2) = '1') then
			outALU <= inL;
		else
			outALU <= inA;
		end if;
		
	end process;
	
end architecture;
