library ieee;
use ieee.std_logic_1164.all;

entity FlipFlopDmap is 
	port(
	clk	:	in	std_logic;--Clock
	rst	:	in	std_logic;
	LD	:	in	std_logic;	
	
	D	:	in	std_logic_vector(5 downto 0);
	Q	:	out	std_logic_vector(5 downto 0);
	Qn	:	out	std_logic_vector(5 downto 0)
	);
end entity;			   



architecture behavioural of FlipFlopDmap is	 
component FlipFlopD is 
	port(
	clk	:	in	std_logic; --Clock
	rst	:	in	std_logic; --reset
	LD	:	in	std_logic; --load
	D	:	in	std_logic; --Estado siguiente	 
	
	Q	:	out	std_logic; --Estado presente
	Qn	:	out	std_logic --estado presente negado
	);
end component;

begin 
	bloque0: FlipFlopD port map(clk,rst,LD,D(0),Q(0),Qn(0));
	bloque1: FlipFlopD port map(clk,rst,LD,D(1),Q(1),Qn(1));
	bloque2: FlipFlopD port map(clk,rst,LD,D(2),Q(2),Qn(2));
	bloque3: FlipFlopD port map(clk,rst,LD,D(3),Q(3),Qn(3));
	bloque4: FlipFlopD port map(clk,rst,LD,D(4),Q(4),Qn(4));
	bloque5: FlipFlopD port map(clk,rst,LD,D(5),Q(5),Qn(5));
	
	
	
end architecture;
