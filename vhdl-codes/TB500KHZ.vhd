library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity TB50KHZ is
	port(
	clkin:	in	std_logic;
	clkout:	out	std_logic
	);
end entity;

architecture behavioural of TB50KHZ is

-- 1111101000 -> 1000 -> necesitamos contar 1000 bits para llegar a la frecuencia que queremos (50khz)
-- 0111110100 -> 500

signal cnt: std_logic_vector(9 downto 0) := "0000000000";

begin 
	process(clkIn)
		begin 
		if (clkin 'event and clkin='1') then --Verificar si ha sucesido algún cambio, rising_edge(clkIn)
			--contamos pulsos 
			cnt<=cnt+"0000000001";	   --si no tienen la librería unsigned dará error, porque no sabe si está o no manejando signos
			if(cnt<"0111110100") then --[0,500]
				clkout <='1';
			elsif(cnt<"1111101000") then --[500, 1000]
				clkout <= '0';
			else
				cnt <= "0000000000"; --reiniciamos el counter
			end if;
		end if;
	end process;
end architecture;
