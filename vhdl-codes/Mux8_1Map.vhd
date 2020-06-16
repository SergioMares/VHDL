library IEEE;
use ieee.std_logic_1164.all;

entity Mux8_1Map is 
	port(
	input:	in	std_logic_vector(7 downto 0);
	sel: 	in	std_logic_vector(2 downto 0);
	output: out std_logic
	);
end entity;

architecture simple of Mux8_1Map is

--para hacer magia llamando a otros modulos 	  
component Mux2_1 is
	port(
		I0, I1: 	in 		std_logic; --Tenemos los 9 estados lógicos para cada entrada	   
		sel: 		in 		std_logic;
		Output: 	out	 	std_logic
	);
	end component;

component Mux4_1 is
	port(
	A, B, C, D: 	in 	std_logic;
	Sel:			in 	std_logic_vector(1 downto 0);
	Output:			out std_logic
	);
end component;

signal x, y:	std_logic;
signal selector: std_logic_vector(1 downto 0);

begin 
	
	--sintaxis
	--label: component port map(signal)
		selector <= sel(2)&sel(1);
		bloque0: Mux4_1 port map(input(0),input(1),input(2),input(3),sel(2 downto 1),x);--literal aquí ponemos las variables del component
																				 --pero ahora con el nombre de las de este módulo
		bloque1: Mux4_1 port map(input(4),input(5),input(6),input(7),selector,y);
		bolque3: Mux2_1 port map(x,y,sel(0),output);
																					 
end architecture;
