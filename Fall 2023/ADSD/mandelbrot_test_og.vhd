library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use std.textio.all;

library work;
--library ads;
use work.ads_fixed.all;
use work.ads_complex_pkg.all;

--library work;
use work.pipeline_rec_pkg.all;

use work.vga_data.all;

entity mandelbrot_test is
end entity mandelbrot_test;

architecture test of mandelbrot_test is

	component mandelbrot_gen is 
	generic (
        pipeline_length  : natural := 16;
		  threshold   : ads_sfixed := to_ads_sfixed(2)
	);
	port (
		
		  clock:  in  std_logic;
        reset:  in  std_logic;
		  c		:	in ads_complex := (to_ads_sfixed(0), to_ads_sfixed(0));
		  z_start: 	in ads_complex := (to_ads_sfixed(0), to_ads_sfixed(0));
		  
		  color: out RGB_array
	);
	end component mandelbrot_gen;
	
	signal clock: std_logic := '0';
   signal test_done: boolean := false;
	signal colors_signals : RGB_array;
	signal reset : std_logic;
	
	constant vga_res:	vga_timing	:= vga_res_640x480;
	constant max_number : natural := 427220; -- horizontal (active + fp + bp + sync) * vertical
	
begin
   clock <= not clock after 5 ns when not test_done else '0';
	
	dut : mandelbrot_gen
		generic map (
			pipeline_length => 16,
			threshold => to_ads_sfixed(2)
		)
		port map (
			clock => clock,
			reset => reset,
			--c		:	in ads_complex := (to_ads_sfixed(0), to_ads_sfixed(0)),
			--z_start: 	in ads_complex := (to_ads_sfixed(0), to_ads_sfixed(0)),
			color => colors_signals
	);

   stimulus: process is
      variable red, green, blue : natural := 0;
		variable output_line: line;
		file out_file : text open write_mode is "my_generated_file.pbm";
		variable out_line : line;
		variable iterator : natural := 0;
		-- variable idx: natural;
	begin
		-- header information
		write(output_line, string'("P3"));
		writeline(output, output_line);
		-- resolution
		write(output_line,
				integer'image(vga_res.horizontal.active)
					& string'(" ")
					& integer'image(vga_res.vertical.active));
		writeline(output, output_line);
		-- maximum value
		write(output_line, integer'image(15));
		writeline(output, output_line);
		
		write(out_file, "P3" & LF);
      write(out_file, "16 16" & LF);
      write(out_file, "15" & LF);

		-- make image
		while iterator < max_number loop
			-- reset dut
			--reset <= '1'; 
			-- commented this out b/c reset doesn't do anything in our pipeline
			wait until rising_edge(clock);
				--reset <= '0';
				-- pass color data to signals
				red := colors_signals(0);
				blue := colors_signals(1);
				green := colors_signals(2);
						
				write(output_line,
								integer'image(red) & string'(" ")
									& integer'image(green) & string'(" ")
									& integer'image(blue) & string'(" "));
				write(out_line, integer'image(red) & " " &
											 integer'image(green) & " " &
											 integer'image(blue));
				writeline(output, output_line);
				writeline(out_file, out_line);
				iterator := iterator + 1;
				wait;
			end loop;
			test_done <= true;
      wait; --- waiting forever finishes the process
   end process stimulus;
end architecture test;

