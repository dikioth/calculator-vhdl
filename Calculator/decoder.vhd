library ieee;
use ieee. std_logic_1164.all;
use ieee. std_logic_arith.all;
use ieee. std_logic_unsigned.all;

entity decoder is
  port(row     : in  std_logic_vector(3 downto 0);
       col     : in  std_logic_vector(3 downto 0);
       rst     : in  std_logic;
       clk     : in  std_logic;
       decoded : out std_logic_vector(3 downto 0);
       pressed : out std_logic);
end decoder;

architecture behavioral of decoder is
  type t_state is (s_pressed, s_released);
  type t_seq is (Z, A, B, C, D);
  signal state       : t_state                      := s_released;
  signal binstate    : t_seq                        := Z;
  signal tempDecoded : std_logic_vector(3 downto 0) := "0000";
  signal tempCol     : std_logic_vector(3 downto 0) := "1111";
  signal tempPressed : std_logic                    := '0';

begin
  process (clk)
  begin

    if (rst = '0') then
      binstate <= Z;
      state    <= s_released;
    elsif rising_edge(clk) then

      if binstate = Z and col /= "1111" then
        binstate <= A;
      elsif binstate = A and col = "1111" then
        binstate <= B;
      elsif binstate = B and col = "1111" then
        binstate <= C;
      elsif binstate = C and col = "1111" then
        binstate <= D;
      elsif binstate = D and col /= "1111" then
        binstate <= A;
      elsif binstate <= D and col = "1111" then
        binstate <= Z;
      end if;


      case binstate is

        when Z =>
          tempPressed <= '0';
        when A =>
          tempPressed <= '1';

        when B =>
          tempPressed <= '1';
        when C =>
          tempPressed <= '1';
        when D =>
          case row is
            when "0111" =>
              case col is
                when "0111" => tempDecoded <= x"1";
                when "1011" => tempDecoded <= x"2";
                when "1101" => tempDecoded <= x"3";
                when others => tempDecoded <= x"A";
              end case;


            when "1011" =>
              case col is
                when "0111" => tempDecoded <= x"4";
                when "1011" => tempDecoded <= x"5";
                when "1101" => tempDecoded <= x"6";
                when others => tempDecoded <= x"B";
              end case;
              --tempPressed <= '1';
              --tempCol <= col;

            when "1101" =>
              case col is
                when "0111" => tempDecoded <= x"7";
                when "1011" => tempDecoded <= x"8";
                when "1101" => tempDecoded <= x"9";
                when others => tempDecoded <= x"C";
              end case;
              --tempPressed <= '1';
              --tempCol <= col;

            when others =>              --"1110"
              case col is
                when "0111" => tempDecoded <= x"F";
                when "1011" => tempDecoded <= x"0";
                when "1101" => tempDecoded <= x"E";
                when others => tempDecoded <= x"D";
              end case;

          --when others =>
          --null;
          end case;
          if col = "1111" then
            tempPressed <= '0';
          else
            tempPressed <= '1';
          end if;
        when others =>
          null;

      end case;
    end if;
  end process;

  decoded <= tempDecoded;
  pressed <= tempPressed;

end behavioral;






















--library ieee;
--use ieee. std_logic_1164.all;
--use ieee. std_logic_arith.all;
--use ieee. std_logic_unsigned.all;
--
--entity decoder is
--  port(row     : in  std_logic_vector(3 downto 0);
--       col     : in  std_logic_vector(3 downto 0);
--       rst     : in  std_logic;
--       clk     : in  std_logic;
--       decoded : out std_logic_vector(3 downto 0);
--       pressed : out std_logic);
--              -- feedback : in std_logic);
--end decoder;
--
--architecture behavioral of decoder is
--  signal tempDecoded : std_logic_vector(3 downto 0) := "0000";
--  signal tempPressed : std_logic                    := '0';
--   signal prevPressed : std_logic                    := '0';
--    signal prevDecoded : std_logic_vector(3 downto 0) := "0000";
--       type state_type is (a,b);
--      signal state : state_type;
--
--
--
--
--begin
--  process (clk,rst)
--
--  begin
--  if (rst = '0') then
--                      tempDecoded <= "0000";
--                      tempPressed <= '0';
--                      state<=a;
--
--
--  elsif (rising_edge(clk)) then
--
--
--
--
--                              case col is
--                                when "0111" =>
--                                       case row is
--                                              when "0111" =>
--                                                      tempDecoded <= x"D";
--                                              when "1011" =>
--                                                      tempDecoded <= x"C";
--                                              when "1101" =>
--                                                      tempDecoded <= x"B";
--                                              when others =>
--                                                      tempDecoded <= x"A";
--
--                                       end case;
--                                       tempPressed <= '1';
--                                when "1011" =>
--                                       case row is
--                                              when "0111" => tempDecoded <= x"E";
--                                              when "1011" => tempDecoded <= x"9";
--                                              when "1101" => tempDecoded <= x"6";
--                                              when others => tempDecoded <= x"3";
--                                       end case;
--                                       tempPressed <= '1';
--                                when "1101" =>
--                                       case row is
--                                              when "0111" => tempDecoded <= x"0";
--                                              when "1011" => tempDecoded <= x"8";
--                                              when "1101" => tempDecoded <= x"5";
--                                              when others => tempDecoded <= x"2";
--                                       end case;
--                                       tempPressed <= '1';
--                                when "1110" =>
--                                       case row is
--                                              when "0111" => tempDecoded <= x"F";
--                                              when "1011" => tempDecoded <= x"7";
--                                              when "1101" => tempDecoded <= x"4";
--                                              when others => tempDecoded <= x"1";
--                                       end case;
--                                       tempPressed <= '1';
--                              when others =>
--                                      tempPressed <= '0';
--                        end case;
--
--                        if (tempDecoded(0) /= '1' and tempDecoded(1) /= '1' and tempDecoded(2) /= '1' and tempDecoded(3) /= '1') then
--                       state <= b;
--                      end if;
--
--
--               prevDecoded <= tempDecoded;
--               prevPressed <= tempPressed;
--
--
--
--      end if;
--
--
--
--  end process;
--
--
--
--  decoded <= prevDecoded;
--
--  pressed <= prevPressed;
--
--end behavioral;
--
--
--
----      case col is
----        when "0111" =>
----          case row is
----            when "0111" => tempDecoded <= x"D";
----            when "1011" => tempDecoded <= x"C";
----            when "1101" => tempDecoded <= x"B";
----            when others => tempDecoded <= x"A";
----          end case;
----          tempPressed <= '1';
----
----        when "1011" =>
----          case row is
----            when "0111" => tempDecoded <= x"E";
----            when "1011" => tempDecoded <= x"9";
----            when "1101" => tempDecoded <= x"6";
----            when others => tempDecoded <= x"3";
----          end case;
----          tempPressed <= '1';
----
----        when "1101" =>
----          case row is
----            when "0111" => tempDecoded <= x"0";
----            when "1011" => tempDecoded <= x"8";
----            when "1101" => tempDecoded <= x"5";
----            when others => tempDecoded <= x"2";
----          end case;
----          tempPressed <= '1';
----
----        when "1110" =>
----          case row is
----            when "0111" => tempDecoded <= x"F";
----            when "1011" => tempDecoded <= x"7";
----            when "1101" => tempDecoded <= x"4";
----            when others => tempDecoded <= x"1";
----          end case;
