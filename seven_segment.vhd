library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;
use IEEE.numeric_std.all;

entity seven_segment is
    port(clk: in std_logic;
         Distance_input: in std_logic_vector(8 downto 0);
         LED_Anode_Activate: out std_logic_vector(3 downto 0);
         LED_Out: out std_logic_vector(6 downto 0));
end entity;

architecture structure of seven_segment is

component counter is
 generic(n: positive:= 10);
    port(clk: in std_logic;
         enable: in std_logic;
         Reset: in std_logic;
         Q: out std_logic_vector(n-1 downto 0));
end component;

signal number: integer;

constant enable_counter: std_logic:='1';
constant reset_counter: std_logic:='0';

signal mux_sel: std_logic_vector(1 downto 0);
signal counter_out: std_logic_vector(13 downto 0);

signal Digit0: std_logic_vector(3 downto 0);
signal Digit1: std_logic_vector(3 downto 0);
signal Digit2: std_logic_vector(3 downto 0);

signal Led_Digit0: std_logic_vector(6 downto 0);
signal Led_Digit1: std_logic_vector(6 downto 0);
signal Led_Digit2: std_logic_vector(6 downto 0);


begin 

P1: counter generic map(14) port map(clk => clk,
                                     enable => enable_counter,
                                     Reset => reset_counter,
                                     Q => counter_out);

    number <= to_integer(unsigned(Distance_input));
    
    Digit0 <= std_logic_vector(to_unsigned((number mod 10),4));
    Digit1 <= std_logic_vector(to_unsigned(((number/10) mod 10),4));
    Digit2 <= std_logic_vector(to_unsigned(((number/100) mod 10),4));
    
Decoding_digit0: PROCESS(Digit0)
                    begin
                    
                    case Digit0 is
                    when "0000" =>
                        Led_Digit0 <= "0000001";

                    when "0001" =>
                        Led_Digit0 <= "1001111";

                    when "0010" =>
                        Led_Digit0 <= "0010010";

                    when "0011" =>
                        Led_Digit0 <= "0000110";

                    when "0100" =>
                        Led_Digit0<= "1001100";

                    when "0101" =>
                        Led_Digit0 <= "0100100";

                    when "0110" =>
                        Led_Digit0 <= "0100000";

                    when "0111" =>
                        Led_Digit0 <= "0001111";

                    when "1000" =>
                        Led_Digit0 <= "0000000";

                    when "1001" =>
                        Led_Digit0 <= "0000100";
                    
                    when others =>
                        null;
                    
                    end case;
                    
                    end PROCESS;

Decoding_digit1: PROCESS(Digit1)
                    begin
                    
                    case Digit1 is
                    when "0000" =>
                        Led_Digit1 <= "0000001";

                    when "0001" =>
                        Led_Digit1 <= "1001111";

                    when "0010" =>
                        Led_Digit1 <= "0010010";

                    when "0011" =>
                        Led_Digit1 <= "0000110";

                    when "0100" =>
                        Led_Digit1 <= "1001100";

                    when "0101" =>
                        Led_Digit1 <= "0100100";

                    when "0110" =>
                        Led_Digit1 <= "0100000";

                    when "0111" =>
                        Led_Digit1 <= "0001111";

                    when "1000" =>
                        Led_Digit1 <= "0000000";

                    when "1001" =>
                        Led_Digit1 <= "0000100";
                    
                    when others =>
                        null;
                    
                    end case;
                    
                    end PROCESS;


Decoding_digit2: PROCESS(Digit2)
                    begin
                    
                    case Digit2 is
                    when "0000" =>
                        Led_Digit2 <= "0000001";

                    when "0001" =>
                        Led_Digit2 <= "1001111";

                    when "0010" =>
                        Led_Digit2 <= "0010010";

                    when "0011" =>
                        Led_Digit2 <= "0000110";

                    when "0100" =>
                        Led_Digit2 <= "1001100";

                    when "0101" =>
                        Led_Digit2 <= "0100100";

                    when "0110" =>
                        Led_Digit2 <= "0100000";

                    when "0111" =>
                        Led_Digit2 <= "0001111";

                    when "1000" =>
                        Led_Digit2 <= "0000000";

                    when "1001" =>
                        Led_Digit2 <= "0000100";
                    
                    when others =>
                        null;
                    
                    end case;
                    
                    end PROCESS;


    mux_sel <= counter_out(13 downto 12);
    
    with mux_sel select
    LED_Anode_Activate <= "0111" when "00",
                          "1011" when "01",
                          "1101" when "10",
                          "1110" when others;

    with mux_sel select
    LED_Out <= "0000001" when "00",
               Led_Digit2 when "01",
               Led_Digit1 when "10",
               Led_Digit0 when others;


end structure;

