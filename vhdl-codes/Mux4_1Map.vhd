library ieee;
use ieee.std_logic_1164.all;

entity Mux4_1Map is
	port(
	input:	in	std_logic_vector(3 downto 0);
	sel:	in 	std_logic_vector(1 downto 0);
	output:	out	std_logic
	);
end entity;

architecture simple of Mux4_1Map is
component Mux2_1 is
	port(
		I0, I1: 	in 		std_logic; --Tenemos los 9 estados lógicos para cada entrada	   
		sel: 		in 		std_logic;
		Output: 	out	 	std_logic
	);
end component;

signal x, y: std_logic;

begin 				   
	bloque0: Mux2_1 port map(input(0),input(1),sel(0),x);
	bloque1: Mux2_1 port map(input(2),input(3),sel(0),y);
	bloque3: Mux2_1 port map(x,y,sel(1),output);
end architecture;

