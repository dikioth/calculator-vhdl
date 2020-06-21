-- CONTROLLER

library ieee;
use ieee. std_logic_1164.all;
use ieee. std_logic_arith.all;
use ieee. std_logic_unsigned.all;
use ieee.numeric_std.all;

entity controller is
  port(rst     : in  std_logic;
       clk     : in  std_logic;
       pressed : in  std_logic;
       inBCD   : in  std_logic_vector(3 downto 0);
       X       : out std_logic_vector(15 downto 0);
       Y       : out std_logic_vector(15 downto 0);
       outBCD  : out std_logic_vector(15 downto 0);
       arith   : out std_logic_vector(1 downto 0));
end controller;

architecture behavioral of controller is

  signal num0      : std_logic_vector(3 downto 0)  := (others => '1');
  signal num1      : std_logic_vector(3 downto 0)  := (others => '1');
  signal num2      : std_logic_vector(3 downto 0)  := (others => '1');
  signal num3      : std_logic_vector(3 downto 0)  := (others => '1');
  signal tempBCD   : std_logic_vector(15 downto 0) := (others => '1');
  signal tempnum   : std_logic_vector(15 downto 0) := (others => '0');
  signal tempx     : std_logic_vector(15 downto 0) := (others => '1');
  signal tempy     : std_logic_vector(15 downto 0) := (others => '1');
  signal temparith : std_logic_vector(1 downto 0)  := (others => '0');

  type numstate_type is (XNUM, YNUM);
  type state_type is (ZERO, A, B, C, D, EQ);
  type opstate_type is (NUMBER, CLEAR, OPERATION, EQUAL);

  signal numstate : numstate_type := XNUM;
  signal state    : state_type    := ZERO;
  signal opstate  : opstate_type  := NUMBER;

begin

  process (pressed, rst)
  begin

    if (rst = '0') then
      state    <= ZERO;
      numstate <= XNUM;
      opstate  <= NUMBER;

    elsif rising_edge(pressed) then

      if inBCD = x"C" then
        opstate <= CLEAR;
      elsif inBCD = x"A" or inBCD = x"B" or inBCD = x"D" or inBCD = x"F" then
        opstate <= OPERATION;
      elsif inBCD = x"D" then
        opstate <= EQUAL;
      else
        opstate <= NUMBER;
      end if;

      -- JUMP OF STATES
      if state = ZERO and opstate = NUMBER then
        state <= A;

      elsif state = A and opstate = NUMBER then
        state <= B;

      elsif state = A and opstate = OPERATION and numstate = XNUM then
        state    <= ZERO;
        numstate <= YNUM;

      elsif state = A and opstate = EQUAL and numstate = YNUM then
        state    <= EQ;
        numstate <= XNUM;

      elsif state = B and opstate = NUMBER then
        state <= C;

      elsif state = B and opstate = OPERATION and numstate = XNUM then
        state    <= ZERO;
        numstate <= YNUM;

      elsif state = B and opstate = EQUAL and numstate = YNUM then
        state    <= EQ;
        numstate <= XNUM;


      elsif state = C and opstate = NUMBER then
        state <= D;

      elsif state = C and opstate = OPERATION and numstate = XNUM then
        state    <= ZERO;
        numstate <= YNUM;

      elsif state = C and opstate = EQUAL and numstate = YNUM then
        state    <= EQ;
        numstate <= XNUM;

      elsif state = D and opstate = OPERATION and numstate = XNUM then
        state    <= ZERO;
        numstate <= YNUM;

      elsif state = D and opstate = EQUAL and numstate = YNUM then
        state    <= EQ;
        numstate <= XNUM;
      end if;
    end if;
    case state is

      when ZERO =>
        tempBCD <= (others => '1');

      when A =>
        num0                 <= inBCD;
        tempBCD(3 downto 0)  <= num0;
        tempBCD(15 downto 4) <= (others => '1');
      when B =>
        num1                 <= inBCD;
        tempBCD(3 downto 0)  <= num1;
        tempBCD(7 downto 4)  <= num0;
        tempBCD(15 downto 8) <= (others => '1');
      when C =>
        num2                  <= inBCD;
        tempBCD(3 downto 0)   <= num2;
        tempBCD(7 downto 4)   <= num1;
        tempBCD(11 downto 8)  <= num0;
        tempBCD(15 downto 12) <= (others => '1');

      when D =>
        num3                  <= inBCD;
        tempBCD(3 downto 0)   <= num3;
        tempBCD(7 downto 4)   <= num2;
        tempBCD(11 downto 8)  <= num1;
        tempBCD(15 downto 12) <= num0;

      when EQ =>

        if inBCD = x"A" then
          temparith <= "01";
        elsif inBCD = x"B" then
          temparith <= "10";
        elsif inBCD = x"F" then
          temparith <= "11";
        end if;
        state <= ZERO;

      when others =>
        null;
    end case;
  end process;
  
  outBCD <= tempBCD;
  X      <= tempx;
  Y      <= tempy;
  arith  <= temparith;

end behavioral;
