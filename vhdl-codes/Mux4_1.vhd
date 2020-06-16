library IEEE;
use ieee.std_logic_1164.all;

entity Mux4_1 is
	port(
	A, B, C, D: 	in 	std_logic;
	Sel:			in 	std_logic_vector(1 downto 0);
	Output:			out std_logic
	);
end entity;

architecture flujo of Mux4_1 is
begin 
--conditional asignment
--Output <= A when sel="00" else
--		  B when sel="01" else
--		  C when sel="10" else	 
--		  D when sel="11" else
--		  'Z';	  
		  
--concurrence
Output <= (A and not Sel(1) and not Sel(0)) or
		  (B and not Sel(1) and Sel(0)) or
		  (C and Sel(1) and not Sel(0)) or
		  (D and Sel(1) and Sel(0));
	
end architecture;

