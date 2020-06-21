-- Arithmetic Logic Unit
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity alu is
  port (nrst     : in  std_logic;
        X        : in  std_logic_vector(15 downto 0);  -- first var.
        Y        : in  std_logic_vector(15 downto 0);  -- second num
        sel      : in  std_logic_vector(1 downto 0);   -- operation
        output   : out std_logic_vector(15 downto 0);  -- result
        overflow : out std_logic);                     -- overflow
end alu;

architecture Behavioral of alu is

  signal result                                                               : std_logic_vector(15 downto 0) := (others => '0');
  signal c0, c1, c2, c3, c4, c5, c6, c7, c8, c9, c10, c11, c12, c13, c14, c15 : std_logic                     := '0';
  signal multtemp                                                             : std_logic_vector(31 downto 0) := (others => '0');
begin

  process(nrst, sel)
  begin

    if nrst = '0' then
      output <= (others => '0');
    else
      case sel is
        when "00" =>
          result <= (others => '0');
        when "01" =>
          -- Binary addition using Half and full adders.
          result(0) <= X(0) xor Y(0);
          c0        <= X(0) and Y(0);

          result(1) <= X(1) xor Y(1) xor c0;
          c1        <= (X(1) and Y(1)) or (c0 and X(1)) or (c0 and Y(1));

          result(2) <= X(2) xor Y(2) xor c1;
          c2        <= (X(2) and Y(2)) or (c1 and X(2)) or (c1 and Y(2));

          result(3) <= X(3) xor Y(3) xor c2;
          c3        <= (X(3) and Y(3)) or (c2 and X(3)) or (c2 and Y(3));

          result(4) <= X(4) xor Y(4) xor c3;
          c4        <= (X(4) and Y(4)) or (c3 and X(4)) or (c3 and Y(4));

          result(5) <= X(5) xor Y(5) xor c4;
          c5        <= (X(5) and Y(5)) or (c4 and X(5)) or (c4 and Y(5));

          result(6) <= X(6) xor Y(6) xor c5;
          c6        <= (X(6) and Y(6)) or (c5 and X(6)) or (c5 and Y(6));

          result(7) <= X(7) xor Y(7) xor c6;
          c7        <= (X(7) and Y(7)) or (c6 and X(7)) or (c6 and Y(7));

          result(8) <= X(8) xor Y(8) xor c7;
          c8        <= (X(8) and Y(8)) or (c7 and X(8)) or (c7 and Y(8));

          result(9) <= X(9) xor Y(9) xor c8;
          c9        <= (X(9) and Y(9)) or (c8 and X(9)) or (c8 and Y(9));

          result(10) <= X(10) xor Y(10) xor c9;
          c10        <= (X(10) and Y(10)) or (c9 and X(10)) or (c9 and Y(10));

          result(11) <= X(11) xor Y(11) xor c10;
          c11        <= (X(11) and Y(11)) or (c10 and X(10)) or (c10 and Y(11));

          result(12) <= X(12) xor Y(12) xor c11;
          c12        <= (X(12) and Y(12)) or (c11 and X(12)) or (c11 and Y(12));

          result(13) <= X(13) xor Y(13) xor c12;
          c13        <= (X(13) and Y(13)) or (c12 and X(13)) or (c12 and Y(13));

          result(14) <= X(14) xor Y(14) xor c13;
          c14        <= (X(14) and Y(14)) or (c13 and X(14)) or (c13 and Y(14));

          result(15) <= X(15) xor Y(15) xor c14;
          c15        <= (X(15) and Y(15)) or (c14 and X(15)) or (c14 and Y(15));

          if c14 = '1' then
            overflow <= '1';
          else
            overflow <= '0';
          end if;

        when "10" =>                    -- substraction
          result <= std_logic_vector(signed(X) - signed(Y));

        when "11" =>                    -- multiplication
          multtemp <= std_logic_vector(unsigned(X) * unsigned(Y));
          result   <= multtemp(15 downto 0);
        when others =>
          null;                         -- do nothing.
      end case;
    end if;
  end process;
  output <= result;
end Behavioral;
