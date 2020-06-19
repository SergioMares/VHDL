library ieee;
use ieee.std_logic_1164.all;

entity Procesador6bits is
	port(
	clk:		in	std_logic;
	dataOut:	out	std_logic_vector(5 downto 0)	
	);
end entity;

architecture simple of Procesador6bits is

--componentes  
component GCM is
	port(
		clkin:			in		std_logic;	-- 50 MHz Clock
		--A,B,C,D,E:		out		std_logic
		ABCDE:			out		std_logic_vector(4 downto 0)
	);
end component;

component ContProg is									
	port(	 
		clk:		in		std_logic;
		addr:		out		std_logic_vector(3 downto 0):=(others =>'0')		
	);
end component;

component FlipFlopD6bits is 	
	port(
	clk	:	in	std_logic; --Clock
	rst	:	in	std_logic; --reset
	LD	:	in	std_logic; --load
	D	:	in	std_logic_vector(5 downto 0); --Estado siguiente
	Q	:	out	std_logic_vector(5 downto 0); --Estado presente
	Qn	:	out	std_logic_vector(5 downto 0) --estado presente negado
	);
end component;

component memoria is 
	port(
	CntProg:	in	std_logic_vector(3 downto 0);
	Reg:		out std_logic_vector(5 downto 0)
	);
end component;

component ALU is	
	port(										--	| sel(5)| sel(4)|		...	   |sel(0)	|
	sel:	in	std_logic_vector(5 downto 0);	--	| 	Cn	|   M 	| S3 | S2 | S1 |   S0 	|
	A,B:	in	std_logic_vector(5 downto 0);
	O:		out std_logic_vector(5 downto 0)
	);
end component;
--signals	 

signal gcmSig:	std_logic_vector(4 downto 0):=(others => '0');
signal CPaddr:	std_logic_vector(3 downto 0):=(others => '0');
signal MPout, RegInst, RegData, ALUout, Temp1, Temp2:	std_logic_vector(5 downto 0):=(others => '0');

begin	 	 
	
	--bloques-> bloque0: <nombreComponente> port map(a,b,c,d);
	bloque0: GCM 			port map(clk, gcmSig);
	bloque1: FlipFlopD6bits port map(gcmSig(2),'1','1',MPout,RegInst, open);
	bloque2: ContProg 		port map(gcmSig(4),CPaddr);
	bloque3: memoria		port map(CPaddr, MPout);
	bloque4: FlipFlopD6bits port map(gcmSig(3),'1','1',MPout,RegData, open);
	bloque5: FlipFlopD6bits port map(gcmSig(1),'1','1',ALUout,Temp1, open);
	bloque6: FlipFlopD6bits port map(gcmSig(0),'1','1',Temp1,Temp2, open);
	bloque7: ALU			port map(RegInst,RegData,Temp2,ALUout);
	
	dataOut <= Temp1;
	
end architecture;			
