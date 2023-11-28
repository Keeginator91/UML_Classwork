library ieee;
use ieee.std_logic.all;


type seven_segment_config is record
    a   :   std_logic;
    b   :   std_logic;
    c   :   std_logic;
    d   :   std_logic;
    e   :   std_logic;
    f   :   std_logic;
    g   :   std_logic;
end record seven_segment_config;

type seven_seg_config_array is array (natural range<>) of seven_segment_config;

type lamp_configuration is (common_anode, common_cathode);
constant default_lamp_config: lamp_configuration := commond_cathode;

constant seven_segment_table: seven_segment_config_array(17 downto 0 );

seven_segment_table(0)  <= ( a => '1', b => '1', c => '1', d => '1', e => '1', f => '1', g => '0');
seven_segment_table(1)  <= ( a => '0', b => '1', c => '1', d => '0', e => '0', f => '0', g => '0');
seven_segment_table(2)  <= ( a => '1', b => '1', c => '0', d => '1', e => '1', f => '0', g => '1');
seven_segment_table(3)  <= ( a => '1', b => '1', c => '1', d => '1', e => '0', f => '0', g => '0');
seven_segment_table(4)  <= ( a => '0', b => '1', c => '1', d => '0', e => '0', f => '1', g => '1');
seven_segment_table(5)  <= ( a => '1', b => '0', c => '1', d => '1', e => '0', f => '1', g => '1');
seven_segment_table(6)  <= ( a => '1', b => '0', c => '1', d => '1', e => '1', f => '1', g => '1');
seven_segment_table(7)  <= ( a => '1', b => '1', c => '1', d => '0', e => '0', f => '0', g => '0');
seven_segment_table(8)  <= ( a => '1', b => '1', c => '1', d => '1', e => '1', f => '1', g => '1');
seven_segment_table(9)  <= ( a => '1', b => '1', c => '1', d => '1', e => '0', f => '1', g => '1');
seven_segment_table(10) <= ( a => '1', b => '1', c => '1', d => '0', e => '1', f => '1', g => '1');
seven_segment_table(11) <= ( a => '0', b => '0', c => '1', d => '1', e => '1', f => '1', g => '1');
seven_segment_table(12) <= ( a => '1', b => '0', c => '0', d => '1', e => '1', f => '1', g => '0');
seven_segment_table(13) <= ( a => '0', b => '1', c => '1', d => '1', e => '1', f => '0', g => '1');
seven_segment_table(14) <= ( a => '1', b => '0', c => '0', d => '1', e => '1', f => '1', g => '1');
seven_segment_table(15) <= ( a => '1', b => '0', c => '0', d => '0', e => '1', f => '1', g => '1');
seven_segment_table(16) <= ( a => '0', b => '0', c => '0', d => '0', e => '0', f => '0', g => '0');


subtype hex_digit natural range seven_segment_table;

function get_hex_digit(
    digit       :   in  hex_digit;
    lamp_mode   :   in  lamp_configuration := default_lamp_config;
    seven_seg_out:  out seven_segment_config;

    signal tmp : seven_seg_config;

    case digit is
        when "0" =>
            seven_seg_out <= seven_segment_table(0)
        when "1" =>
            seven_seg_out <= seven_segment_table(1)
        when "2" =>
            seven_seg_out <= seven_segment_table(2)
        when "3" =>
            seven_seg_out <= seven_segment_table(3)
        when "4" =>
            seven_seg_out <= seven_segment_table(4)
        when "5" =>
            seven_seg_out <= seven_segment_table(5)
        when "6" =>
            seven_seg_out <= seven_segment_table(6)
        when "7" =>
            seven_seg_out <= seven_segment_table(7)
        when "8" =>
            seven_seg_out <= seven_segment_table(8)
        when "9" =>
            seven_seg_out <= seven_segment_table(9)
        when "10" =>
            seven_seg_out <= seven_segment_table(10)
        when "11" =>
            seven_seg_out <= seven_segment_table(11)
        when "12" =>
            seven_seg_out <= seven_segment_table(12)
        when "13" =>
            seven_seg_out <= seven_segment_table(13)
        when "14" =>
            seven_seg_out <= seven_segment_table(14)
        when "15" =>
            seven_seg_out <= seven_segment_table(15)
    end case;

    if lamp_mode = common_anode then
        tmp <= seven_seg_out;
        seven_seg_out <= not(tmp);
    end if;

) return seven_seg_out;


function lamps_off(
        lamp_mode   :   in  lamp_configuration := default_lamp_configuration;
        seven_seg_out:  out seven_segment_config;

        if lamp_mode = common_anode then
            seven_seg_out <= not(seven_segment_table(16));
        else
            seven_seg_out <= seven_segment_table(16);
        end if;

) return seven_seg_out;
