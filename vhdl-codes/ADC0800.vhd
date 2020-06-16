library ieee;
use ieee.std_logic_1164.all;		 
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity ADC0800 is 
	port(
	clkIn		: 	in 	std_logic;
	OutputEna	:	in	std_logic;
	EOC			:	in std_logic;
	
	startConv 	: 	out 	std_logic;
	clkOut		: 	out std_logic
	);					  
end entity;	
architecture behaviour of ADC0800 is						  

signal cnt: std_logic_vector(6 downto 0) := "0000000";

begin
	
process(clkIn)
		begin 
		if (clkin 'event and clkin='1') then --Verificar si ha sucesido algún cambio, rising_edge(clkIn)
			--contamos pulsos 
			cnt<=cnt+"0000001";	   --si no tienen la librería unsigned dará error, porque no sabe si está o no manejando signos
			if(cnt<"0110010") then --[0,500]
				clkout <='1';
			elsif(cnt<"1100100") then --[500, 1000]
				clkout <= '0';
			else
				cnt <= "0000000"; --reiniciamos el counter
			end if;
		end if;
	end process;

	
end architecture;
