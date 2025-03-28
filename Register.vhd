library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
entity registerFile is 
    port (
        read_reg_1 : in std_logic_vector(4 downto 0);
        read_reg_2 : in std_logic_vector(4 downto 0);
        write_register : in std_logic_vector(4 downto 0);
        read_data_1 : out std_logic_vector(31 downto 0);
        read_data_2 : out std_logic_vector(31 downto 0);
        write_data_register : in  std_logic_vector(31 downto 0);
        reg_write : in std_logic;
        clock : in std_logic
    );
end  registerFile;
    architecture Behaviour of registerFile is    
        type RegisterArray is array (0 to 31) of std_logic_vector(31 downto 0);
        signal Registers : RegisterArray := (others => (others => '0'));    
        begin
                read_data_1 <= Registers(to_integer(unsigned(read_reg_1)));
                read_data_2 <= Registers(to_integer(unsigned(read_reg_2)));
        reg_process: process(clock)
	begin
            if falling_edge(clock) and reg_write = '1' then
		if (to_integer(unsigned(write_register))) /= 0 then 
                    Registers(to_integer(unsigned(write_register))) <= write_data_register;
		end if;
            end if;
	end process;

 	end Behaviour;
 