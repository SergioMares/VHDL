library ieee;
use ieee.std_logic_1164.all;

entity RestadorCompleto4bit is 
	port(
	A,B		:	in	std_logic_vector(3 downto 0);
	R		: 	out	std_logic_vector(3 downto 0)
	);
end entity;

architecture simple of RestadorCompleto4bit is

component RestadorCompleto1bit is 
	port(
	A 		:	in	std_logic; --Palabras binarias de 1 bit	
	B 		:	in	std_logic; --Palabras binarias de 1 bit
	BetaI	:	in	std_logic; --Bit prestado de resta anterior
	R		: 	out	std_logic; --Resultado de la operación binaria resta
	BetaO	:	out	std_logic  --Indica si se lleva pretado algún bit
	);
end component;

signal BetaO:	std_logic_vector(3 downto 0);

begin

	bloque0: RestadorCompleto1bit port map (A(0),B(0),'0',R(0),BetaO(0));
	bloque1: RestadorCompleto1bit port map (A(1),B(1),BetaO(0),R(1),BetaO(1));
	bloque2: RestadorCompleto1bit port map (A(2),B(2),BetaO(1),R(2),BetaO(2));
	bloque3: RestadorCompleto1bit port map (A(3),B(3),BetaO(2),R(3),BetaO(3));
	
end architecture;