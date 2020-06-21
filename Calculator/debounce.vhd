library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity debounce is
  generic(
    counter_size : integer := 0);       --counter size
  port(
    clk    : in  std_logic;             --input clock
    button : in  std_logic;             --input signal to be debounced
	 --outp 	: out std_logic;
    result : out std_logic;            --debounced signal
	 rst : in std_logic);
end debounce;

architecture logic of debounce is
  signal flipflops   : std_logic_vector(1 downto 0);  --input flip flops
  signal counter_set : std_logic;       --sync reset to zero
  signal counter_out : std_logic_vector(counter_size downto 0) := (others => '0');  --counter output
  signal  tmp 		: std_logic;
 
 	type state_type is (a,b,c,d,e,f,g);
	signal state : state_type :=a;
 
begin

--  counter_set <= flipflops(0) xor flipflops(1);  --determine when to start/reset counter
--
--  process(button)
--  begin
--  
--  
--    if(clk'event and clk = '1') then
--      flipflops(0) <= button;
--      flipflops(1) <= flipflops(0);
--      if(counter_set = '1') then  --reset counter because input is changing
--        counter_out <= (others => '0');
--      elsif(counter_out(counter_size) = '0') then  --stable input time is not yet met
--        counter_out <= counter_out + 1;
--      else                              --stable input time is met
--        result <= flipflops(1);
--      end if;	   
--	 end if;
--
--  end process;


	process(rst, button)
	begin
	
	
		
		
	if rising_edge(clk) then
	
		if (rst = '0') then
			state <= a;
			tmp <= '0';
		end if;
		
		
		case state is
			when a =>
			if (button = '1') then
				state <= b;
				tmp <='1';
				end if;
		when b =>
			if (button = '0') then
				state <= c;
			else 
				state <=a;
			end if;
		when c =>
			if (button ='0') then
				state <= d;
			else 
				state <=a;
			end if;
		when d =>
			if (button='0') then
				state <= e;
			else
				state <=a;
			end if;
		when e =>
		if (button ='1') then -- då har man hållt inne knappen
			state <=b;
		else
			tmp <= '0';
			state <= a;
			end if;
			when others =>
			end case;
			
			
		
		
		
		
		
		end if;
end process;
  result <= tmp;
end logic;



--	process(rst, button)
--	begin
--if rising_edge(button) then
--	
--		if (rst = '0') then
--			state <= a;
--			tmp <= '0';
--		end if;
--		
--		case state is
--			when a =>		
--				state <= b;
--			when b =>
--				tmp <= '1';
--				state <= c;
--			when c =>			
--				state <= d;
--			when d =>
--				state <= e;
--			when e =>
--				state <= f;			
--			when f =>			
--				state <= g;
--			when g =>
--				state<=a;
--				tmp<= '0';
--		end case;
--	end if;