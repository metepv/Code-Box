library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;
use IEEE.numeric_std.all;

entity distance_calculator is
    port(clk: in std_logic;
         reset_calculator: in std_logic;
         Echo_signal: in std_logic;
         Distance: out std_logic_vector(8 downto 0));
end entity;

architecture structure of distance_calculator is

component counter is
 generic(n: positive:= 10);
    port(clk: in std_logic;
         enable: in std_logic;
         Reset: in std_logic;
         Q: out std_logic_vector(n-1 downto 0));
end component;

signal echo_signal_width: std_logic_vector(21 downto 0);
signal elapsed_time: integer;
begin

P1: counter generic map(22) port map(clk => clk,
                                     Reset => reset_calculator,
                                     enable => Echo_signal,
                                     Q => echo_signal_width);

        
   elapsed_time <= to_integer(unsigned(echo_signal_width));
    
   Distance <= std_logic_vector(to_unsigned(elapsed_time/(5800),9));

   
end structure;
