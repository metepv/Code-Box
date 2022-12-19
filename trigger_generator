library IEEE;
use IEEE.std_logic_1164.all;

entity trigger_module is
    port(clk: in std_logic;
         Trigger_out: out std_logic);
end entity;

architecture structure of trigger_module is

component counter is
 generic(n: positive:= 10);
    port(clk: in std_logic;
         enable: in std_logic;
         Reset: in std_logic;
         Q: out std_logic_vector(n-1 downto 0));
end component;

signal reset_counter: std_logic;
signal counter_out: std_logic_vector(24 downto 0);

constant low_part: std_logic_vector(24 downto 0):="1011111010111100001000000";
constant full_cycle: std_logic_vector(24 downto 0):="1011111010111110000101000";
begin

P1: counter generic map(25) port map(clk => clk,
                                     enable => '1',
                                     Reset => reset_counter,
                                     Q => counter_out);

Signal_generating: PROCESS(clk, counter_out)
                        begin
                        if (counter_out > low_part and counter_out < full_cycle) then
                            Trigger_out <= '1';
                        
                        else
                            Trigger_out <= '0';
                        
                        end if;
                        
                        if (counter_out = full_cycle or counter_out = "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXX") then
                            reset_counter <= '1';
                        
                        else
                            reset_counter <= '0';
                        
                        end if;
                                         
                        end PROCESS;


end structure;
