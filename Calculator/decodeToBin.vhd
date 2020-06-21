--takes the input from the decoder and outputs binary outputs corresponing to which button is pressed

library ieee;
use ieee. std_logic_1164.all;
use ieee. std_logic_arith.all;
use ieee. std_logic_unsigned.all;

entity decodeToBin is
  port(input   : in  std_logic_vector(3 downto 0);
       clk     : in  std_logic;
       output : out std_logic_vector(6 downto 0));
end decodeToBin;

architecture behavioral of decodeToBin is
  signal temp : std_logic_vector(6 downto 0);
begin
  process (input)
  begin

    case input is
      when x"0"   => temp <= "0000000";--0
      when x"1"   => temp <= "0000001";--1
      when x"2"   => temp <= "0000010";--2
      when x"3"   => temp <= "0000011";--3
      when x"4"   => temp <= "0000100";--4
      when x"5"   => temp <= "0000101";--5
      when x"6"   => temp <= "0000111";--6
      when x"7"   => temp <= "0001000";--7
      when x"8"   => temp <= "0001001";--8
      when x"9"   => temp <= "0001010";--9
      when x"A"   => temp <= "0001011"; --pus
      when x"B"   => temp <= "0001100";-- minus
      when x"C"   => temp <= "0001101";-- multiply
      when x"D"   => temp <= "0001110";-- division?
      when x"E"   => temp <= "0001111";-- ??
      when x"F"   => temp <= "0010000";-- ??
      when others => temp <= "0010001"; --nothing
    end case;
  --    end if;
  end process;
  output <= temp;
end behavioral;