																			 library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity ALU3bits is	
	port(										--	| sel(5)| sel(4)|		...	   |sel(0)	|
	sel:	in	std_logic_vector(2 downto 0);	--	| 	Cn	|   M 	| S3 | S2 | S1 |   S0 	|
	A,B:	in	std_logic_vector(2 downto 0);
	O:		out std_logic_vector(2 downto 0)
	
	);
end entity;


architecture simple of ALU3bits is
begin			
	
	with sel select
	O<=		
			--ALU Lógica
			A and B		when("000"),
			A or B		when("001"),
			A xor B		when("010"),
			A xnor B	when("011"),
			
			--ALU Aritmética
			A + B		when("100"),
			A - B		when("101"),
			A + 1		when("110"),
			B + 1		when others;
			
end architecture;