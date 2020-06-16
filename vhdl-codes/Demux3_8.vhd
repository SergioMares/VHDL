library ieee;
use ieee.std_logic_1164.all;

entity Demux3_8 is
	port(
	input:	in	std_logic;
	sel:	in	std_logic_vector(2 downto 0);
	output:	out	std_logic_vector(7 downto 0)
	);
end entity;

architecture simple of Demux3_8 is
begin 
--conditional asignment//nel, es concurrencia xD 
--output(0) <= input and not(sel(2)) and not(sel(1)) and not(sel(0));
--output(1) <= input and not(sel(2)) and not(sel(1)) and (sel(0));
--output(2) <= input and not(sel(2)) and (sel(1)) and not(sel(0));
--output(3) <= input and not(sel(2)) and (sel(1)) and (sel(0));
--output(4) <= input and (sel(2)) and not(sel(1)) and not(sel(0));
--output(5) <= input and (sel(2)) and not(sel(1)) and (sel(0));
--output(6) <= input and (sel(2)) and (sel(1)) and not(sel(0));
--output(7) <= input and (sel(2)) and (sel(1)) and (sel(0));

--Section assignaments
--with sel select
--output(0) <= input when ("000"),
--'Z' when others;
--with sel select
--output(1) <= input when ("001"),
--'Z' when others;
--with sel select
--output(2) <= input when ("010"),
--'Z' when others;
--with sel select
--output(3) <= input when ("011"),
--'Z' when others;
--with sel select
--output(4) <= input when ("100"),
--'Z' when others;
--with sel select
--output(5) <= input when ("101"),
--'Z' when others;
--with sel select
--output(6) <= input when ("110"),
--'Z' when others;
--with sel select
--output(7) <= input when ("111"),
--'Z' when others;				 

process(input) is
begin 
	if sel = "111" then
		output <= input&"0000000";
	elsif sel = "110" then
		output <= '0'&input&"000000";
	elsif sel ="101" then
		output <= "00"&input&"00000";
	elsif sel ="100" then
		output <= "000"&input&"0000";
	elsif sel ="011" then
		output <= "0000"&input&"000";
	elsif sel ="010" then
		output <= "00000"&input&"00";
	elsif sel ="001" then
		output <= "000000"&input&'0';
	elsif sel ="000" then
		output <= "0000000"&input;
	end if;
	
	end process;
	
end architecture;


