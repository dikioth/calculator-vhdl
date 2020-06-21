-- Frequency devider
library ieee;
use ieee. std_logic_1164.all;
use ieee. std_logic_arith.all;
use ieee. std_logic_unsigned.all;

entity sevenSegment is
  port(coded   : in  std_logic_vector(3 downto 0);
       clk     : in  std_logic;
       decoded : out std_logic_vector(6 downto 0));
end sevenSegment;

architecture behavioral of sevenSegment is
  
end behavioral;
