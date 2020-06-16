library ieee;
use ieee.std_logic_1164.all;

entity Comparador4bits is 
	port(
	 A, B		:	in	std_logic_vector(3 downto 0); 
	 G, E, L	:	out std_logic
	);
end entity;

architecture simple of Comparador4bits is 

component ComparadorCompleto is 
	 port(
	 A, B		:	in	std_logic; 
	 Gi, Ei, Li	:	in	std_logic;
	 Go, Eo, Lo	:	out std_logic
	 );
end component;

signal gel1, gel2, gel3:	std_logic_vector(2 downto 0);

begin
	
	bloque0: ComparadorCompleto port map(A(3),B(3),'0','1','0',gel1(2),gel1(1),gel1(0));
	bloque1: ComparadorCompleto port map(A(2),B(2),gel1(2),gel1(1),gel1(0),gel2(2),gel2(1),gel2(0));
	bloque2: ComparadorCompleto port map(A(1),B(1),gel2(2),gel2(1),gel2(0),gel3(2),gel3(1),gel3(0));
	bloque3: ComparadorCompleto port map(A(0),B(0),gel3(2),gel3(1),gel3(0),G,E,L);	
	
end architecture;
