library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity lfsr_tb is
end lfsr_tb;

architecture behaviour of lfsr_tb is

  -- more: lfsr.vhd
  component lfsr is
    port(
      clk: in std_logic;
      q : inout std_logic_vector(15 downto 0) := (others => '0')
    );
  end component;

  -- input signal
  signal clk: std_logic := '0';

  -- i/o signal
  signal q : std_logic_vector(15 downto 0);

  -- clock period
  constant clk_period: time := 20 ns;

begin   

  uut: lfsr port map(
    clk => clk,
    q => q
  );

  clk_process: process
  begin

  -- temporary loop: set in order to display first 20 numbers
  for i in 0 to 20 loop
  
    clk <= '0';
    wait for clk_period/2;
    clk <= '1';
    wait for clk_period/2;
  
  end loop;
  
  wait;
  end process;
end;
