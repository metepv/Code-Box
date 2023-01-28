library IEEE;
use IEEE.std_logic_1164.all;

entity control is
    port(right_in: in std_logic;
         left_in: in std_logic;
         motor_out1: out std_logic;
         motor_out2: out std_logic
         );
end entity;

architecture behav of control is
begin


motor_process: PROCESS(right_in,left_in)
                    begin
                    
                    if right_in = '0' then
                        motor_out1 <= '1';
                        motor_out2 <= '0';
                    
                    elsif left_in = '0' then
                        motor_out1 <= '0';
                        motor_out2 <= '1';
                    
                    else
                        motor_out1 <= '0';
                        motor_out2 <= '0';
                    
                    end if;
                
                end PROCESS;
                        
    
end behav;
