library ieee;
use ieee.std_logic_1164.all;

entity LCD is port(
	clk:	in		std_logic;
	ms:		in 		std_logic; -- 0 es 4 bits: 1 es 8 bits
	rs, rw:	out 	std_logic;
	DB:		inout	std_logic_vector(7 downto 0)	
	);
end entity;

architecture behaviorual of LCD is

type estados is (CLEARED, RETURNH, ENTRYMS, DISPLAYC, CURSORDS, FUNCTIONS, SETCGRAM, WRITECGRAM, READBF);
signal epres, esig, euins:	estados;  
signal flag: std_logic:='0'; --dirá que nibble enviar(0: MSN, 1_LSN)
begin
	
	Comb: process(clk)
	begin
		if clk'event and clk='1' then
			epres <= esig;
		end if;
	end process;
	
	Sseq: process(epres)
	begin
		case epres is 
			when CLEARED =>
				rs <= '0';		
				rw <= '0';
				
				if ms = '1' then	--8 bits	
					DB <= X"01"; 
					esig <= RETURNH;
				else			 	--4 bits
					euins <= CLEARED;
					if flag='0' then --nibble nibble					
						DB <= X"00"; -- 0000 XXXX
						esig <= READBF;
					else 
						DB <= X"10";
						esig <= RETURNH;
					end if;
				end if;
				
			when RETURNH =>
				rs <= '0';		
				rw <= '0';
				
				if ms = '1' then	--8 bits	
					DB <= X"02"; 
					esig <= ENTRYMS;
				else			 	--4 bits
					euins <= RETURNH;
					if flag='0' then --nibble nibble					
						DB <= X"00"; -- 0000 XXXX
						esig <= READBF;
					else 
						DB <= X"20";
						esig <= ENTRYMS;
					end if;
				end if;
				
			when ENTRYMS =>
				rs <= '0';		
				rw <= '0';
				
				if ms = '1' then	--8 bits	
					DB <= X"03"; 
					esig <= DISPLAYC;
				else			 	--4 bits
					euins <= ENTRYMS;
					if flag='0' then --nibble nibble					
						DB <= X"00"; -- 0000 XXXX
						esig <= READBF;
					else 
						DB <= X"30";
						esig <= DISPLAYC;
					end if;
				end if;
			
			when DISPLAYC =>
				rs <= '0';		
				rw <= '0';
				
				if ms = '1' then	--8 bits	
					DB <= X"04"; 
					esig <= CURSORDS;
				else			 	--4 bits
					euins <= DISPLAYC;
					if flag='0' then --nibble nibble					
						DB <= X"00"; -- 0000 XXXX
						esig <= READBF;
					else 
						DB <= X"40";
						esig <= CURSORDS;
					end if;
				end if;	
			
			when CURSORDS =>
				rs <= '0';		
				rw <= '0';
				
				if ms = '1' then	--8 bits	
					DB <= X"04"; 
					esig <= FUNCTIONS;
				else			 	--4 bits
					euins <= CURSORDS;
					if flag='0' then --nibble nibble					
						DB <= X"00"; -- 0000 XXXX
						esig <= READBF;
					else 
						DB <= X"40";
						esig <= FUNCTIONS;
					end if;
				end if;
				
			when FUNCTIONS =>
				rs <= '0';		
				rw <= '0';
				
				if ms = '1' then	--8 bits	
					DB <= X"05"; 
					esig <= SETCGRAM;
				else			 	--4 bits
					euins <= FUNCTIONS;
					if flag='0' then --nibble nibble					
						DB <= X"00"; -- 0000 XXXX
						esig <= READBF;
					else 
						DB <= X"50";
						esig <= SETCGRAM;
					end if;
				end if;	
				
			when SETCGRAM =>
				rs <= '0';		
				rw <= '0';
				
				if ms = '1' then	--8 bits	
					DB <= X"06"; 
					esig <= WRITECGRAM;
				else			 	--4 bits
					euins <= SETCGRAM;
					if flag='0' then --nibble nibble					
						DB <= X"00"; -- 0000 XXXX
						esig <= READBF;
					else 
						DB <= X"60";
						esig <= WRITECGRAM;
					end if;
				end if;
				
			when WRITECGRAM =>
				rs <= '0';		
				rw <= '0';
				
				if ms = '1' then	--8 bits	
					DB <= X"07"; 
					esig <= READBF;
				else			 	--4 bits
					euins <= WRITECGRAM;
					if flag='0' then --nibble nibble					
						DB <= X"00"; -- 0000 XXXX
						esig <= READBF;
					else 
						DB <= X"70";
						esig <= READBF;
					end if;
				end if;	
				
			when others =>
			if DB(7) ='0' then
				esig <= euins;
			else
				esig <= READBF;
			end if;	   
			end case;
		end process;
end architecture;

