library ieee;

library ads;
use ads.ads_complex.all;


type pipe_rec is record
    z   :   ads_complex;
    c   :   ads_complex;
    stage_data      :   natural;
    stage_overflow  :   boolean;
    stage_valid     :   boolean;
end record pipe_rec;


entity pipeline_stage is
    generic(
        threshold   : ads_sfixed;
        stage_number: natural := 0;
    );

    port(
        clock:  in  std_logic;
        reset:  in  std_logic;
        stage_input :   in  pipe_rec;
        stage_output:   out pipe_rec;
    );
end entity pipeline_stage;


architecture rtl of pipeline_stage is
    -- add signals here
    signal a:   integer
    signal b:   integer
    signal ab:  integer
    signal z_mag_sqr:   integer;
    signal t_mag_sqr:   integer;

begin

    --input to output assignment
    stage_output.stage_data <= stage_input.stage_data when stage_input.stage_overflow = true
        else 
            stage_output.stage_data <= stage_number + 1; --increment stage if no overflow

    --computations
    stage_output.c <= stage_input.c;
    a <= stage_input.z.re * stage_input.z.re; -- a^2
    b <= stage_input.z.im * stage_input.z.im; -- b^2
    ab <= shift_left((stage_input.z.re * stage_input.z.im), 2); -- 2ab

    stage_output.z.re <= (a - b) + stage_input.c.re;
    stage_output.z.im <= ab + stage_input.c.im;

    z_mag_sqr <= a + b;
    t_mag_sqr <= threshold * threshold;

    --overflow logic
    stage_output.stage_overflow <= stage_input.stage_overflow when (stage_input.stage_overflow 
            or (z_mag_sqr > t_mag_sqr) )
        else
            stage_output.stage_overflow <= false; 

end architecture rtl;
    


