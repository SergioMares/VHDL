library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;	--La necesitamos para el counter
use ieee.std_logic_unsigned.all;--tenemos que especificar que no tienen signo

entity Disp7segMultiplexor is 
	port(
	clkIn	:	in	std_logic;
	tempo	:	out	std_logic_vector(3 downto 0);
	display : 	out std_logic_vector(3 downto 0)
	);
end entity;

architecture simple of Disp7SegMultiplexor is

signal guarismos	:	std_logic_vector(15 downto 0) := "1010101111001101";
signal cnt			: 	std_logic_vector(1 downto 0):="00";

begin												 
	process(clkIn)
	begin
		if (clkIn 'event and clkIn = '1') then
			
			if(cnt = "11") then	--Evitamos que se desborde y reiniciamos 
				cnt <= "00";	--la cuenta
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
		
	
end architecture;
