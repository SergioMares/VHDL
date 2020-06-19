library ieee;
use ieee.std_logic_1164.all;

entity GCM is
	port(
		clkin:			in		std_logic;	-- 50 MHz Clock
		--A,B,C,D,E:		out		std_logic
		ABCDE:			out		std_logic_vector(4 downto 0)
	);
end entity;


architecture behavioral of 	GCM is	 

type estados is (T0,T1,T2,T3,T4,T5,T6,T7,T8,T9,T10,T11);  
signal Qp, Qn: 	estados;   -- Qp: estado actual, Qn: estado siguiente

begin	
	
	P1: process(clkin)
	begin
		if clkin 'event and clkin ='1' then
			Qp <= Qn;
		end if;
	end process;

	
	P2: process(Qp)
	begin  
		case Qp is
			when T0 =>	
				ABCDE <= "01000"; 
				Qn <= T1; 
			when T1 =>	
				ABCDE <= "00000"; 
				Qn <= T2; 
			when T2 =>	
				ABCDE <= "10000"; 
				Qn <= T3; 
			when T3 =>	
				ABCDE <= "00000"; 
				Qn <= T4;
			when T4 =>	
				ABCDE <= "00100"; 
				Qn <= T5;
			when T5 =>	
				ABCDE <= "00000"; 
				Qn <= T6;
			when T6 =>	
				ABCDE <= "00010"; 
				Qn <= T7;
			when T7 =>	
				ABCDE <= "00000"; 
				Qn <= T8; 
			when T8 =>	
				ABCDE <= "00001"; 
				Qn <= T9;
			when T9 =>	
				ABCDE <= "00000"; 
				Qn <= T10;	
			when T10 =>
				ABCDE <= "10000"; 
				Qn <= T11;
			when T11 =>	
				ABCDE <= "00000"; 
				Qn <= T0;	
		end case;	
		
	end process;
end architecture;
