library IEEE;
use ieee.std_logic_1164.all;

entity Mux8_1 is
	port(
	A, B, C, D:				in 	std_logic;
	E, F, G, H:				in	std_logic;
	sel0, sel1, sel2:		in	std_logic;
	Z:						out std_logic		
	);
end entity;

architecture simple of Mux8_1 is 
begin 
	--concurrence
	Z <= (A and not(sel0) and not(sel1) and not(sel2)) 	or
		 (B and not(sel0) and not(sel1) and (sel2))	   	or
		 (C and not(sel0) and (sel1) and not(sel2))	   	or
		 (D and not(sel0) and (sel1) and (sel2))		or
		 (E and (sel0) and not(sel1) and not(sel2))		or
		 (F and (sel0) and not(sel1) and (sel2))		or 
		 (G and (sel0) and (sel1) and not(sel2))		or
		 (H and (sel0) and (sel1) and (sel2)) 			or
		 'Z';
	
	
end architecture;





