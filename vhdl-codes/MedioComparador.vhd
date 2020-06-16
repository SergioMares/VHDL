library ieee;
use ieee.std_logic_1164.all;

entity MedioComparador is 
	port(
	A, B	:	in	std_logic;
	G, E, L	:	out std_logic
	);									  
end entity;
	
architecture simple of MedioComparador is 
begin
	G <= A and not(B);
	E <= A xnor B;
	L <= not(A) and B;	
end architecture;
