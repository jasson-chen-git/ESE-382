library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity design2 is
    port(
    pqrs : in std_logic_vector(3 downto 0);
    dcba : out std_logic_vector(3 downto 0)
    );
end entity;

architecture Behavior of design2 is
begin

    p1 : process(pqrs)
    begin
        case pqrs is
            when "0011" => dcba <= "0000";
            when "0100" => dcba <= "0001";
            when "0101" => dcba <= "0010";
            when "0110" => dcba <= "0011";
            when "0111" => dcba <= "0100";
            when "1000" => dcba <= "0101";
            when "1001" => dcba <= "0110";
            when "1010" => dcba <= "0111";
            when "1011" => dcba <= "1000";
            when "1100" => dcba <= "1001";
            when others => dcba <= "----";
        end case;
    end process;
    
end Behavior;