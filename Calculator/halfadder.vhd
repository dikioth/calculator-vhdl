library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity halfadder is
  port (A    : in  std_logic;
        B    : in  std_logic;
        sum  : in  std_logic;
        cout : out std_logic);
end halfadder;

architecture Behavioral of halfadder is
begin
  S    <= A xor B;
  cout <= A and B;
end Behavioral;
