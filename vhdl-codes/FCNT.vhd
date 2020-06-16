-------------------------------------------------------------------------------
--
-- Title       : FCNT
-- Design      : clase2020
-- Author      : Sergio Mares Martínez
-- Company     : UAQ
--
-------------------------------------------------------------------------------
--
-- File        : c:\My_Designs\DispProg2020\clase2020\src\FCNT.vhd
-- Generated   : Tue Jan 28 08:26:12 2020
-- From        : interface description file
-- By          : Itf2Vhdl ver. 1.22
--
-------------------------------------------------------------------------------
--
-- Description : 
--
-------------------------------------------------------------------------------

--{{ Section below this comment is automatically maintained
--   and may be overwritten
--{entity {FCNT} architecture {simpleFlujo}}

library IEEE;
use IEEE.std_logic_1164.all;
--use IEEE.std_logic_1164.bit;
--use IEEE.std_logic_1164.entity;
	
entity FCNT is
	--Aqui pueden existir otros tipos de variables 
	
	 port(
		 A, B, C : in STD_LOGIC := '0';
		 --B : in STD_LOGIC;
		 --C : in STD_LOGIC;
		 Y : out STD_LOGIC -- en la úlltima no se pone ; 
	     );
end FCNT;
--tambien es válido 
--end entity;
--end entity FCNT;

--}} End of automatically maintained section

architecture simpleFlujo of FCNT is
begin

	-- enter your statements here --
	Y <= B or ((not C) and (not A));

end simpleFlujo;	 
--también es válido
--entity architecture 

