library ieee;
use ieee.std_logic_1164.all;   
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;


entity ContProg is									
	port(	 
		clk:		in		std_logic;
		addr:		out		std_logic_vector(3 downto 0):=(others =>'0')		
	);
end entity;	


architecture behavioral of ContProg is	

signal cntP,cntS:		std_logic_vector(3 downto 0):=(others =>'0');

begin		
	process(clk)
	begin	  
		if clk 'event and clk='1' then	-- rising_edge(clk) 			
			addr <=  cntP;
			cntP <= cntP+1;
		end if;
	end process;	
	
--	p2: process(cntP)
--	begin
--		cntS <= cntS+1;
--		--if cntS = 7 then 
--		--	cntS <= (others =>'0');
--		--end if;
--	end process; 	
end architecture;

