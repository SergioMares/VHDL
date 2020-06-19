library ieee;
use ieee.std_logic_1164.all;

entity FlipFlopD6bits is 	
	port(
	clk	:	in	std_logic; --Clock
	rst	:	in	std_logic; --reset
	LD	:	in	std_logic; --load
	D	:	in	std_logic_vector(5 downto 0); --Estado siguiente
	Q	:	out	std_logic_vector(5 downto 0); --Estado presente
	Qn	:	out	std_logic_vector(5 downto 0) --estado presente negado
	);
end entity;

architecture behavioural of FlipFlopD6bits is 
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
			Q	<=(others => 'Z');
			Qn	<=(others => 'Z');
		end if;	
	end process;
end architecture;