library ieee;
use ieee.std_logic_1164.all;

entity MedioSumador is
	port(
	a, b:	in 	std_logic;
	s	:	out std_logic	
	);
end entity;

architecture simple of MedioSumador is
begin
	s <= a xor b;		  		   
end architecture;
