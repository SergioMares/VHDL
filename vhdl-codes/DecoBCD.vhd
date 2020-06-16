library ieee;
use ieee.std_logic_1164.all;

entity DecoBCD is
	port(
	input: 	in	std_logic_vector(3 downto 0);
	output:	out	std_logic_vector(7 downto 0)
	);
end entity;

architecture simple of DecoBCD is
begin 
output<= X"C0" when(input=X"0") else
		 X"F9" when(input=X"1") else
		 X"A4" when(input=X"2") else
		 X"B0" when(input=X"3") else
		 X"99" when(input=X"4") else
		 X"92" when(input=X"5") else
		 X"82" when(input=X"6") else
	 	 X"F8" when(input=X"7") else
		 X"80" when(input=X"8") else
		 X"90" when(input=X"9") else
		 X"88" when(input=X"A") else
		 X"83" when(input=X"B") else
		 X"C6" when(input=X"C") else
		 X"A1" when(input=X"D") else
		 X"86" when(input=X"E") else
	     X"8E";	
end architecture;