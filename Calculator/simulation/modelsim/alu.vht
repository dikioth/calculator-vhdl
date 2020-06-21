library ieee;
use ieee.std_logic_1164.all;

entity calculator_vhd_tst is
end calculator_vhd_tst;

architecture alu_arch of calculator_vhd_tst is
-- constants
-- signals
  signal nrst     : in  std_logic;
  signal X        : in  std_logic_vector(15 downto 0);  -- first var.
  signal Y        : in  std_logic_vector(15 downto 0);  -- second num
  signal sel      : in  std_logic_vector(1 downto 0);   -- operation
  signal output   : out std_logic_vector(15 downto 0);  -- result
  signal overflow : out std_logic

    component alu
      port (nrst     : in  std_logic;
            X        : in  std_logic_vector(15 downto 0);  -- first var.
            Y        : in  std_logic_vector(15 downto 0);  -- second num
            sel      : in  std_logic_vector(1 downto 0);   -- operation
            output   : out std_logic_vector(15 downto 0);  -- result
            overflow : out std_logic);
    end component;
begin
  i1 : alu
    port map (
-- list connections between master ports and signals
      nrst     => nrst,
      X        => X,
      Y        => Y,
      sel      => sel,
      output   => output,
      overflow => overflow
      );

  init : process
  begin
    X        <= x"0";
    Y        <= x"0";
    sel      <= x"0";
    output   <= x"0";
    overflow <= x"0";
    wait;
  end process init;
  always : process
  begin
    X   <= x"10";
    Y   <= x"2";
    sel <= "01";
    wait 20ns;
    sel <= "10";
    wait 20ns;
    sel <= "11";
    wait;
  end process always;
end alu_arch;
