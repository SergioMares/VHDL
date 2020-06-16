 library ieee;
 use ieee.std_logic_1164.all;
 
 entity ComparadorCompleto is 
	 port(
	 A, B		:	in	std_logic; 
	 Gi, Ei, Li	:	in	std_logic;
	 Go, Eo, Lo	:	out std_logic
	 );
 end entity;
 
	 
architecture simple of ComparadorCompleto is
begin
	Eo <= Ei and (A xnor B);
	Go <=(Ei and (A and not(B))) or Gi;
	Lo <=(Ei and not(a) and B) or Li;		
end architecture;
