-------------------------------------------------------------------------------
--
-- Title       : FCNT
-- Design      : clase2020
-- Author      : Sergio Mares Martínez
-- Company     : UAQ
--
-------------------------------------------------------------------------------
--
-- File        : c:\My_Designs\DispProg2020\clase2020\src\Mux2_1.vhd
-- Generated   : Tue Jan 06 08:26:12 2020
-- From        : interface description file
-- By          : Itf2Vhdl ver. 1.22
--
-------------------------------------------------------------------------------
--
-- Description : Este archivo contiene un multiplexor; de 2 entradas y una salida
--				 I0 y I1: son entradas lógicas 
--				 Output:  es una salida lógica
--				 sel: es el selector que permite conectar a I0 e I1 con Output
-------------------------------------------------------------------------------

library IEEE;
use ieee.std_logic_1164.all;

entity Mux2_1 is
	port(
		I0, I1: 	in 		std_logic; --Tenemos los 9 estados lógicos para cada entrada	   
		sel: 		in 		std_logic;
		Output: 	out	 	std_logic
	);
	end entity;

architecture flujo of Mux2_1 is
begin 
	--Concurrence
	--Output <= (sel and I1) or ((not(sel)) and I0);
	
	--Conditional assignment 
--	Output <= I0 when (sel='0') else
--			  I1;
	Output <= I0 when (sel='0') else
			  I1 when (sel='1') else
			  'Z';
			  
end architecture;


















