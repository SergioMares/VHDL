library ieee;
use ieee.std_logic_1164.all;							   

entity FlipFlopD is 
	port(
	clk	:	in	std_logic; --Clock
	rst	:	in	std_logic; --reset
	LD	:	in	std_logic; --load
	D	:	in	std_logic; --Estado siguiente	 
	
	Q	:	out	std_logic; --Estado presente
	Qn	:	out	std_logic --estado presente negado
	);
end entity;

architecture behavioural of FlipFlopD is 
begin
	process(clk)
	begin
		if rst='1'	then		
			if clk 'event and clk='1' then
				if ld='1' then
					Q 	<= D;
					Qn 	<= not(D);
				end if;
			end if;
		else
			Q	<='Z';
			Qn	<='Z';
		end if;	
	end process;
end architecture;
