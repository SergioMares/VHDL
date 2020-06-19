library ieee;
use ieee.std_logic_1164.all;

entity RestadorCompleto1bit is 
	port(
	A 		:	in	std_logic; --Palabras binarias de 1 bit	
	B 		:	in	std_logic; --Palabras binarias de 1 bit
	BetaI	:	in	std_logic; --Bit prestado de resta anterior
	R		: 	out	std_logic; --Resultado de la operaci�n binaria resta
	BetaO	:	out	std_logic  --Indica si se lleva pretado alg�n bit
	);
end entity;

architecture simple of RestadorCompleto1bit is
begin
	R		<= BetaI xor A xor B;
	BetaO 	<= ((not A and B) or (BetaI and not A) or (BetaI and B));
end architecture;			  
