library IEEE;
use IEEE.std_logic_1164.all;

entity top_module is
    port(Echo: in std_logic;
         clk: in std_logic;
         Right: in std_logic;
         Left: in std_logic;
         Motor_out1: out std_logic;
         Motor_out2:out std_logic;
         Trigger: out std_logic;
         Led_Anode: out std_logic_vector(3 downto 0);
         Led_Cathode: out std_logic_vector(6 downto 0));

end entity;

architecture structure of top_module is

component distance_calculator is
    port(clk: in std_logic;
         reset_calculator: in std_logic;
         Echo_signal: in std_logic;
         Distance: out std_logic_vector(8 downto 0));
end component;

component trigger_module is
    port(clk: in std_logic;
         Trigger_out: out std_logic);
end component;

component seven_segment is
    port(clk: in std_logic;
         Distance_input: in std_logic_vector(8 downto 0);
         LED_Anode_Activate: out std_logic_vector(3 downto 0);
         LED_Out: out std_logic_vector(6 downto 0));
end component;

component control is
    port(right_in: in std_logic;
         left_in: in std_logic;
         motor_out1: out std_logic;
         motor_out2: out std_logic
     );
end component;

signal distance_sig: std_logic_vector(8 downto 0);
signal trigger_out_sig: std_logic;

begin

P1: distance_calculator port map(clk => clk,
                                 reset_calculator => trigger_out_sig,
                                 Echo_signal => Echo,
                                 Distance => distance_sig);

P2: trigger_module port map(clk => clk,
                            Trigger_out => trigger_out_sig);
                            
P3: seven_segment port map(clk => clk,
                           Distance_input => distance_sig,
                           LED_Anode_Activate => Led_Anode,
                           LED_Out => Led_Cathode);

P4: control port map(right_in => Right,
                     left_in => Left,
                     motor_out1 => Motor_out1,
                     motor_out2 => Motor_out2);
                     
    Trigger <= trigger_out_sig;

end structure;
