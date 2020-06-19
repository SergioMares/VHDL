library ieee;
use ieee.std_logic_1164.all;

entity MedioRestador1bit is 
	port(
	A, B: 	in 	std_logic; --palabras binarias 1bit
	beta: 	out	std_logic; --Lo que se lleva prestado(borrow)
	R	:	out std_logic --Resulado de restar palabras binarias
	);
end entity;

architecture simple of MedioRestador1bit is
begin 
	R <=  A xor B;
	beta <= not(a) and B;
end architecture;