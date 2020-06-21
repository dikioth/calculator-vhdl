-- Frequency devider
library ieee;
use ieee. std_logic_1164.all;
use ieee. std_logic_arith.all;
use ieee. std_logic_unsigned.all;

entity sevenSegment is
  port(coded    : in  std_logic_vector(15 downto 0);
       clk      : in  std_logic;
       pressed  : in  std_logic;
       decoded0 : out std_logic_vector(6 downto 0);
       decoded1 : out std_logic_vector(6 downto 0);
       decoded2 : out std_logic_vector(6 downto 0);
       decoded3 : out std_logic_vector(6 downto 0));
end sevenSegment;

architecture behavioral of sevenSegment is
  signal temp0, temp1, temp2, temp3 : std_logic_vector(6 downto 0);
begin
  process (coded)
  begin

    case coded(3 downto 0) is
      when x"0"   => temp0 <= "0000001";
      when x"1"   => temp0 <= "1001111";
      when x"2"   => temp0 <= "0010010";
      when x"3"   => temp0 <= "0000110";
      when x"4"   => temp0 <= "1001100";
      when x"5"   => temp0 <= "0100100";
      when x"6"   => temp0 <= "0100000";
      when x"7"   => temp0 <= "0001111";
      when x"8"   => temp0 <= "0000000";
      when x"9"   => temp0 <= "0000100";
      when others => temp0 <= "1111111";
    end case;


    case coded(7 downto 4) is
      when x"0"   => temp1 <= "0000001";
      when x"1"   => temp1 <= "1001111";
      when x"2"   => temp1 <= "0010010";
      when x"3"   => temp1 <= "0000110";
      when x"4"   => temp1 <= "1001100";
      when x"5"   => temp1 <= "0100100";
      when x"6"   => temp1 <= "0100000";
      when x"7"   => temp1 <= "0001111";
      when x"8"   => temp1 <= "0000000";
      when x"9"   => temp1 <= "0000100";
      when others => temp1 <= "1111111";
    end case;

    case coded(11 downto 8) is
      when x"0"   => temp2 <= "0000001";
      when x"1"   => temp2 <= "1001111";
      when x"2"   => temp2 <= "0010010";
      when x"3"   => temp2 <= "0000110";
      when x"4"   => temp2 <= "1001100";
      when x"5"   => temp2 <= "0100100";
      when x"6"   => temp2 <= "0100000";
      when x"7"   => temp2 <= "0001111";
      when x"8"   => temp2 <= "0000000";
      when x"9"   => temp2 <= "0000100";
      when others => temp2 <= "1111111";
    end case;

    case coded(15 downto 12) is
      when x"0"   => temp3 <= "0000001";
      when x"1"   => temp3 <= "1001111";
      when x"2"   => temp3 <= "0010010";
      when x"3"   => temp3 <= "0000110";
      when x"4"   => temp3 <= "1001100";
      when x"5"   => temp3 <= "0100100";
      when x"6"   => temp3 <= "0100000";
      when x"7"   => temp3 <= "0001111";
      when x"8"   => temp3 <= "0000000";
      when x"9"   => temp3 <= "0000100";
      when others => temp3 <= "1111111";
    end case;
  end process;

  decoded0 <= temp0;
  decoded1 <= temp1;
  decoded2 <= temp2;
  decoded3 <= temp3;

end behavioral;
