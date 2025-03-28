
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
entity registerFile_Testbench is
end registerFile_Testbench;
architecture reg_testbench of registerFile_Testbench is
	component registerFile is 
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
	end  component;
signal write_enable: std_logic := '0';
signal clock_signal: std_logic := '1';
signal data_in : std_logic_vector (31 downto 0) := (others => '0');
signal reg1_out :  std_logic_vector (31 downto 0) := (others => '0');
signal reg2_out :  std_logic_vector (31 downto 0) := (others => '0');
signal reg1_in : std_logic_vector(4 downto 0) := (others => '0');
signal reg2_in : std_logic_vector(4 downto 0) := (others => '0');
signal reg3_in : std_logic_vector(4 downto 0) := (others => '0');

begin
	regtester : registerFile port map(reg1_in, reg2_in, reg3_in, reg1_out, reg2_out, data_in, write_enable, clock_signal);
	process 
		begin
		write_enable <= '1';
		data_in(5) <= '1';
		reg3_in <= "11110";
		reg1_in <= "00100";
		reg2_in <= "00001";
		wait for 2 ns;

		data_in(3) <= '1';
		reg3_in <= "01110";
		reg1_in <= "11110";
		reg2_in <= "00000";
		wait for 2 ns;

		data_in(10) <= '1';
		reg3_in <= "00000";
		reg1_in <= "01110";
		reg2_in <= "10000";
		wait for 2 ns;

		data_in(15) <= '1';
		reg3_in <= "00011";
		reg1_in <= "00011";
		reg2_in <= "00000";
		wait for 2 ns;

		write_enable <= '0';
		data_in(12) <= '1';
		reg3_in <= "01011";
		reg1_in <= "01011";
		reg2_in <= "00011";
		wait for 2 ns;
		
	
		end process;
	process
		begin
		while true loop
			clock_signal <= '1';
			wait for 1 ns;
			clock_signal <= '0';
			wait for 1 ns;
			end loop;
	end process;
end reg_testbench;