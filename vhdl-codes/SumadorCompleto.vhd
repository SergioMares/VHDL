library ieee;
use ieee.std_logic_1164.all;

entity SumadorCompleto is 
	port(
	a, b	:	in	std_logic;--palabras a sumar
	Ci		:	in	std_logic;--Acarreos anteriores
	s		:	out std_logic;--Resultado de la suma
	Co		:	out std_logic--Acarreo actual
	);
	
end entity;

architecture simple of SumadorCompleto is
begin
	s <= Ci xor a xor b;
	Co <=(Ci and (a or b)) or (a and b);
end architecture; 