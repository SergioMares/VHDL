library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity PWM is
	port(
	clkin	:	in 	std_logic;	--Reloj de entrada
	dc		:	in 	std_logic_vector(2 downto 0); --Ciclo de trabajo (duty Cycle)
	pwm		:	out std_logic	--Señal PWM
	);
end entity;

architecture simple of PWM is

signal cntGnrl	:	std_logic_vector(2 downto 0):= "000";	--necesitamos contar 8 bits para un periodo del PWM

begin
	process(clkin)
	begin		
		if(clkin 'event and clkin='1') then
			if(dc >= cntGnrl) then
				PWM <= '1';
			else
				PWM <= '0';
			end if;										
			
			if(cntGnrl >= "111") then
				cntGnrl <= "000";
			end if;
						
			cntGnrl <= cntGnrl+"001";						
		end if;				
	end process;		
end architecture;
