library ieee;
use ieee.std_logic_1164.all;

entity Disp7segDecodificador is
	port(
	tempo	:	in	std_logic_vector(3 downto 0);
	output	:	out	std_logic_vector(7 downto 0)
	);
end entity;

architecture simple of Disp7segDecodificador is
begin 
	output <=X"C0" when(tempo = X"0") else
			 X"F9" when(tempo=X"1") else
			 X"A4" when(tempo=X"2") else
			 X"B0" when(tempo=X"3") else
			 X"99" when(tempo=X"4") else
			 X"92" when(tempo=X"5") else
			 X"82" when(tempo=X"6") else
		 	 X"F8" when(tempo=X"7") else
			 X"80" when(tempo=X"8") else
			 X"90" when(tempo=X"9") else
			 X"88" when(tempo=X"A") else
			 X"83" when(tempo=X"B") else
			 X"C6" when(tempo=X"C") else
			 X"A1" when(tempo=X"D") else
			 X"86" when(tempo=X"E") else
		     X"8E";
end architecture;
