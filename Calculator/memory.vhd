--memory

library ieee;
use ieee. std_logic_1164.all;
use ieee. std_logic_arith.all;
use ieee. std_logic_unsigned.all;
use ieee.numeric_std.ALL;

entity memory is
  port(input   : in  std_logic_vector(3 downto 0);
       --clk     : in  std_logic;
		 pressed : in std_logic;
		 rst 		: in std_logic;
		 feedback  : out std_logic;
       output_d0 : out std_logic_vector(6 downto 0);
		 output_d1 : out std_logic_vector(6 downto 0);
		 output_d2 : out std_logic_vector(6 downto 0);
		 output_d3 : out std_logic_vector(6 downto 0);
		 clk : in std_logic;
		 arith : out std_logic_vector(1 downto 0));
		-- output_operator : out std_logic_vector(6 downto 0));
end memory;

architecture behavioral of memory is
  signal temp : std_logic_vector(6 downto 0) := "0000001";
  signal test : std_logic_vector(3 downto 0) := "0001";
  signal buffer0 : std_logic_vector(6 downto 0) := "0000001";
  signal buffer1 : std_logic_vector(6 downto 0):= "0000001";
  signal buffer2 : std_logic_vector(6 downto 0):= "0000001";
  signal buffer3 : std_logic_vector(6 downto 0):= "0000001";
  
  --signal buffer4 : std_logic_vector(6 downto 0);
  --signal con : std_logic_vector(1 downto 0) := "00";
 -- variable con : integer := 0;
	type state_type is (a,b,c,d);
	signal state : state_type := a;
begin

  process (pressed, rst)

  begin
  
   if (rst='0') then  -- = '0') then
			
		buffer0 <= "0000001";
		buffer1 <= "0000001";
		buffer2 <= "0000001";
		buffer3 <= "0000001";
		state <= a;
		feedback <= '1';
		--buffer0 <= temp;
		--con <= 0;	

  
  
  elsif rising_edge(clk) then
		
		case input is
			when x"0"   => temp <= "0000001"; 
			when x"1"   => temp <= "1001111";
			when x"2"   => temp <= "0010010"; 
			when x"3"   => temp <= "0000110"; 
			when x"4"   => temp <= "1001100"; 
			when x"5"   => temp <= "0100100";
			when x"6"   => temp <= "0100000"; 
			when x"7"   => temp <= "0001111";
			when x"8"   => temp <= "0000000"; 
			when x"9"   => temp <= "0000100"; 
			when x"A"   => temp <= "0001000";
			when x"B"   => temp <= "1100000"; 
			when x"C"   => temp <= "0110001"; 
			when x"D"   => temp <= "1000010"; 
			when x"E"   => temp <= "0110000"; 
			when x"F"   => temp <= "0111000"; 
			when others => temp <= "1111111";
			
		end case;
	
		case state is
			when a =>
		
				if (pressed = '1') then
					state <=b;
				end if;
			when b =>
				if (pressed ='0') then							
					if (temp = "0001000") then --PLUS
						buffer0 <= "1111111";
						buffer1 <= "1111111";
						buffer2 <= "1111111";
						buffer3 <= "0011000"; --write P						
						arith <= "01"; --plus identity
						state <= a;						
					elsif (temp = "1100000") then --minus
						buffer0 <= "1111111";
						buffer1 <= "1111111";
						buffer2 <= "1111111";
						buffer3 <= "1111110"; --write -
						arith <= "10";
						state <= a;
					elsif (temp ="0111000") then --gÃ¥nger
						buffer0 <= "1111111";
						buffer1 <= "1111111";
						buffer2 <= "1101110";
						buffer3 <= "1101110"; --write -
						arith <= "11";
						state <= a;						
					elsif (temp = "0110001") then --clear all
						temp <= "0000001";
						buffer0 <= "1111111";
						buffer1 <= "1111111";
						buffer2 <= "1111111";
						buffer3 <= "1111111";
						
						state <= a;		
					else						
						buffer3 <= buffer2; -- move digits left
						buffer2 <= buffer1; -- move digits left
						buffer1 <= buffer0;					
						buffer0 <= temp;
						state <= a;
					end if;
				end if;
					
					when others =>
					null;

				
	end case;	 
		
	end if;	
		
  end process;
     output_d0 <= buffer0;
	  output_d1 <= buffer1;
	  output_d2 <= buffer2;
	  output_d3 <= buffer3;
	  --feedback <= '0';
	  --test2<=test;
end behavioral;

