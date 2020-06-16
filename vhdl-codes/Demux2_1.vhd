library ieee;
use ieee.std_logic_1164.all;

entity Demux2_1 is
	port(					 
		input:	in	std_logic;
		sel:	in	std_logic;
		output:	out	std_logic_vector(1 downto 0)
	);
end entity;

architecture simple of Demux2_1 is
begin 
--  Section assignaments
--	with sel select
--		output(0) <= input when('0'),
--		'Z' when others;	 
--	with sel select
--		output(1) <= input when('1'),
--			'Z' when others;

--  Conditional assignaments
--output(0) <= input when(sel='0')else
--	'Z';
--output(1) <= input when(sel='1')else
--	'Z';
output(0)<=input and (not(sel));
output(1)<=input and sel;

end architecture;