library ieee;
use ieee.std_logic_1164.all;

entity alu_tst is
end alu_tst;

architecture alu_arch of alu_tst is

  signal nrst     : std_logic;
  signal X        : std_logic_vector(15 downto 0);  -- first var.
  signal Y        : std_logic_vector(15 downto 0);  -- second num
  signal sel      : std_logic_vector(1 downto 0);   -- operation
  signal output   : std_logic_vector(15 downto 0);  -- result
  signal overflow : std_logic;

  component ALU
    port (nrst     : in  std_logic;
          X        : in  std_logic_vector(15 downto 0);  -- first var.
          Y        : in  std_logic_vector(15 downto 0);  -- second num
          sel      : in  std_logic_vector(1 downto 0);   -- operation
          output   : out std_logic_vector(15 downto 0);  -- result
          overflow : out std_logic);
  end component;

begin
  i1 : ALU
    port map (
-- list connections between master ports and signals
      nrst     => nrst,
      X        => X,
      Y        => Y,
      sel      => sel,
      output   => output,
      overflow => overflow
      );

  always : process
  begin
    output <= (others => '0');
    nrst   <= '1';
    X      <= (others => '0');
    Y      <= (others => '0');
    sel    <= "00";
    wait for 20ns;
  -- sel <= "01";
  -- wait for 20 ns;
  -- sel <= "10";
  -- wait for 20 ns;
  -- sel <= "11";
  -- wait for 20 ns;
  end process always;
end alu_arch;
