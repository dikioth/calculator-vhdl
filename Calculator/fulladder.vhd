library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity fulladder is
  port (A    : in  std_logic;
        B    : in  std_logic;
        cin  : in  std_logic;
        sum  : out std_logic;
        cout : out std_logic);
end fulladder;

architecture Behavioral of fulladder is
begin
  sum  <= A xor B xor cin;
  cout <= (A and B) or (cin and A) or (cin and B);
end Behavioral;