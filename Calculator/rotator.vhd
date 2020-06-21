-- Frequency devider
library ieee;
use ieee. std_logic_1164.all;
use ieee. std_logic_arith.all;
use ieee. std_logic_unsigned.all;
use ieee.numeric_std.all;               -- Needed for shifts
entity rotator is
  port(clk : in  std_logic;
       row : out std_logic_vector(3 downto 0));
end rotator;

architecture behavioral of rotator is
  signal temp : std_logic_vector(3 downto 0) := "1110";
  signal lsd  : std_logic;
begin
  process (clk)
  begin
    if rising_edge(clk) then
      temp(0) <= temp(3);
      temp(1) <= temp(0);
      temp(2) <= temp(1);
      temp(3) <= temp(2);
    end if;
  end process;
  row <= temp;
end behavioral;
