library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity ALU is	
	port(										--	| sel(5)| sel(4)|		...	   |sel(0)	|
	sel:	in	std_logic_vector(5 downto 0);	--	| 	Cn	|   M 	| S3 | S2 | S1 |   S0 	|
	A,B:	in	std_logic_vector(5 downto 0);
	O:		out std_logic_vector(5 downto 0)
	
	);
end entity;


architecture simple of ALU is
begin			
	
	with sel select
	O<=		
			--Aritméticas Cn = 'L' M ='L' Tabla 2
			A - 1 																when("000000"),
			A(2 downto 0)*B(2 downto 0) - 1 									when("000001"),
			A(2 downto 0)*not(B(2 downto 0)) - 1								when("000010"),
			(others => '1')	 													when("000011"),	--así representamos el -1
			A + (A + not(B)) 													when("000100"),
			A(2 downto 0)*B(2 downto 0) + (A(2 downto 0) + not(B(2 downto 0)))	when("000101"),
			A - B - 1															when("000110"),
			A + not(B)															when("000111"),
			A + (A + B)															when("001000"),
			A + B  																when("001001"),
			A(1 downto 0) * not(B(1 downto 0)) * (A(1 downto 0)+B(1 downto 0))	when("001010"),
			A + B 																when("001011"),
			A + A																when("001100"),
			A(2 downto 0) * B(2 downto 0) + A(2 downto 0)						when("001101"),
			A(2 downto 0) * not(B(2 downto 0)) + A(2 downto 0)					when("001110"),
			A 																	when("001111"),
			
			--Lógicas Cn = 'L' M = 'H' Tabla 2
			not(A) 				when("010000"),
			not(A and B)		when("010001"),
			not(A) or B			when("010010"),
			"000001" 			when("010011"),	
			not (A or B)	 	when("010100"),
			not(B)				when("010101"),
			not(A xor B)		when("010110"),
			A or not(B)			when("010111"),
			not(A) and B		when("011000"),
			not(A xor B)  		when("011001"),
			B					when("011010"),
			A or B				when("011011"),
			(others => '0')		when("011100"),
			A and not(B)		when("011101"),
			A and B				when("011110"),
			A 					when("011111"),
			
			--Aritméticas Cn = 'H' M ='L' Tabla 1
			A	 																when("100000"),
			B-A		 															when("100001"),
			A+not(b)															when("100010"),
			"111111"		 													when("100011"),	
			A + (A + not(B)) 													when("100100"),
			A(2 downto 0)*B(2 downto 0) + (A(2 downto 0) + not(B(2 downto 0)))	when("100101"),
			A - B - 1															when("100110"),
			A(2 downto 0) * B(2 downto 0) - 1									when("100111"),
			A(2 downto 0) + (A(2 downto 0) * B(2 downto 0))						when("101000"),
			A + B  																when("101001"),
			A(2 downto 0) * not(B(2 downto 0)) + (A(2 downto 0)*B(2 downto 0))	when("101010"),
			A(2 downto 0) * B(2 downto 0) - 1									when("101011"),
			A + A																when("101100"),
			A + B + A															when("101101"),
			A(2 downto 0) * not(B(2 downto 0)) + A(2 downto 0)					when("101110"),
			A - 1																when("101111"),			
			
			--Logicas Cn = 'H' M = 'H' Tabla 1
			not(A) 				when("110000"),
			not(A or B) 		when("110001"),
			((not(A)) and B)	when("110010"),
			(others => '0')		when("110011"),
			not(A and B)		when("110100"),
			not(B)				when("110101"),
			A xor B				when("110110"),
			A and (not(B))		when("110111"),
			not(A) or B			when("111000"),
			B					when("111001"),
			A and B				when("111010"),
			"000001"			when("111011"),
			A or (not(B))		when("111100"),
			A or B				when("111101"),
			A					when others;   --111111
	
	
end architecture;

--dudas--
--Para evitar desbordes en una operación ¿podemos utilizar una cantidad menor de bits? por ejemplo:
--A y B siendo de 6 bits, en una multiplicación, para no tener perdida, necesitariamos 12 bits para la salida. 
--Para tener una salida de 6 bits, máximo podemos hacer multiplicaciones de 3bits * 3bits
--Así, aaunque la multiplicación está limitada, no hay perdida de información 