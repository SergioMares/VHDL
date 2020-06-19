library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;	--La necesitamos para el counter
use ieee.std_logic_unsigned.all;--tenemos que especificar que no tienen signo

entity Disp7segMux is 
	port(
	clkIn		:	in	std_logic;						--Reloj interno a 50,MHz
	
	guarismos	:	in	std_logic_vector(15 downto 0); 	--Vector para los números
														--que queremos mostrar en 
														--el display(cada 4bits es 
														--para cada display)
	
	output		:	out	std_logic_vector(7 downto 0);	--Decodificación para
														--representar en el display
	
	display		:	out std_logic_vector(3 downto 0)	--elige que display activar
	);
end entity;

architecture simple of Disp7segMux is		 

signal cnt	: std_logic_vector(1 downto 0) := "00"; --Contador para saber que display activar
signal tempo: std_logic_vector(3 downto 0);	

begin 
	process(clkIn)
	begin
		if (clkIn 'event and clkIn = '1') then
			
			if(cnt = "11") then	--Evitamos que se desborde y reiniciamos 
				cnt <= "00";		--la cuenta
			end if;
			
			cnt<=cnt+"01";	--Cada flanco de subida aumentará uno hasta "11", 
							--para selecionar cada display
			
			if(cnt = "00") then
				--D0
				tempo 	<= 	guarismos(15 downto 12);
				display <=	"0001";
				
			elsif(cnt = "01") then
				--D1							  
				tempo 	<= guarismos(11 downto 8);
				display <=	"0010";
				
			elsif(cnt = "10") then
				--D2
				tempo 	<= guarismos(7 downto 4);
				display <=	"0100";
				
			else
				--D3						  
				tempo 	<= guarismos(3 downto 0);
				display <=	"1000";
			end if;
		end if;	 
	end process;		   
	
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