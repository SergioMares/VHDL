library ieee;
use ieee.std_logic_1164.all;

entity Sumador4bits is
	port(
	A, B	:	in std_logic_vector(3 downto 0);
	s		:	out std_logic_vector(3 downto 0)
	);
end entity;

architecture simple of Sumador4Bits is 

component SumadorCompleto is 
	port(
	a, b	:	in	std_logic;--palabras a sumar
	Ci		:	in	std_logic;--Acarreos anteriores
	s		:	out std_logic;--Resultado de la suma
	Co		:	out std_logic--Acarreo actual
	);
	
end component;

signal Co: std_logic_vector(3 downto 0);

begin
	
	bloque0: SumadorCompleto port map (A(0),B(0),'0',s(0),Co(0));
	bloque1: SumadorCompleto port map (A(1),B(1),Co(0),s(1),Co(1));
	bloque2: SumadorCompleto port map (A(2),B(2),Co(1),s(2),Co(2));
	bloque3: SumadorCompleto port map (A(3),B(3),Co(2),s(3),Co(3));
	
end architecture;
