library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.numeric_std.all;
entity freqdiv is
  port (clk           : in  std_logic;
        nrst          : in  std_logic;
        clk_out       : out std_logic;
        clk_signalTap : out std_logic;
		  clk_deb :out std_logic);
end freqdiv;
architecture Behavioral of freqdiv is
  signal count  : integer   := 1;
  signal count2 : integer   := 1;       --for signal tap
  signal count3 : integer 	 :=1;
  signal tmp    : std_logic := '0';
  signal tmp2   : std_logic := '0';     --for signal tap
  signal tmp3 	 : std_logic :='0';
begin
  frequency_divider : process (nrst, clk)
  begin

    if rising_edge(clk) then
      count  <= count + 1;
      count2 <= count2 +1;
      if (count = 25000) then
        tmp   <= not(tmp);
        count <= 1;
      end if;
      if (count2 = 2500) then
        tmp2   <= not (tmp2);
        count2 <= 1;
      end if;
		
		if (count3 = 10000) then
		tmp3   <= not (tmp2);
		count3 <= 1;
      end if;
    end if;
    clk_out       <= tmp;
    clk_signalTap <= tmp2;
	 clk_deb <= tmp3;
  end process;
end Behavioral;
