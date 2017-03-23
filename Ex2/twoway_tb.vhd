LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
 
ENTITY twoway_tb IS
END twoway_tb;
 
ARCHITECTURE behavior OF twoway_tb IS 
 
    -- UUT (Unit Under Test)
    COMPONENT twoway is
	generic(NBit: integer);
    PORT(
         clk : IN  std_logic;
         q : out  STD_LOGIC_VECTOR(NBit-1 downto 0)
        );
    END COMPONENT;
    
   -- input signals
   signal clk : std_logic := '0';

	constant nb: integer := 8;

   -- out signal
   signal q : STD_LOGIC_VECTOR (nb-1 downto 0);

   -- set clock period 
   constant clk_period : time := 20 ns;
 
BEGIN
	-- instantiate UUT
   uut: twoway GENERIC MAP(NBit => nb)
	PORT MAP (
          clk => clk,
          q   => q
        );
   
   -- clock management process
   -- no sensitivity list, but uses 'wait'
   clk_process :PROCESS
   BEGIN
		clk <= '0';
		WAIT FOR clk_period/2;
		clk <= '1';
		WAIT FOR clk_period/2;
   END PROCESS;
 

   -- stimulating process
   stim_proc: PROCESS
   BEGIN

      wait;

   END PROCESS;	
END;
