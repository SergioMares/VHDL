library ieee;
use ieee.std_logic_1164.all;

entity Demux2_4 is
	port(
	input:	in	std_logic;
	sel: 	in 	std_logic_vector(1 downto 0);
	output:	out	std_logic_vector(3 downto 0)
	);
end entity;

architecture comportamiento of Demux2_4 is
begin 
	--label:process( list )
	process(sel) is
begin 
	if sel="00" then 
		--output(0) <= input;
		output <= input&"000";
	elsif sel ="01" then 
		output <= '0'&input&"00";
	elsif sel ="10" then
		output <= "00"&input&'0';
	else
		output <= "000"&input;
	end if;
	

end process;
	
end architecture;
