#! /usr/bin/vvp
:ivl_version "12.0 (stable)";
:ivl_delay_selection "TYPICAL";
:vpi_time_precision + 0;
:vpi_module "/usr/lib/x86_64-linux-gnu/ivl/system.vpi";
:vpi_module "/usr/lib/x86_64-linux-gnu/ivl/vhdl_sys.vpi";
:vpi_module "/usr/lib/x86_64-linux-gnu/ivl/vhdl_textio.vpi";
:vpi_module "/usr/lib/x86_64-linux-gnu/ivl/v2005_math.vpi";
:vpi_module "/usr/lib/x86_64-linux-gnu/ivl/va_math.vpi";
S_0x5ed28da7f510 .scope module, "halfadder" "halfadder" 2 1;
 .timescale 0 0;
    .port_info 0 /INPUT 1 "a";
    .port_info 1 /INPUT 1 "b";
    .port_info 2 /OUTPUT 1 "sum";
    .port_info 3 /OUTPUT 1 "carry";
o0x76eed8eb7018 .functor BUFZ 1, C4<z>; HiZ drive
o0x76eed8eb7048 .functor BUFZ 1, C4<z>; HiZ drive
L_0x5ed28dac6350 .functor XOR 1, o0x76eed8eb7018, o0x76eed8eb7048, C4<0>, C4<0>;
L_0x5ed28dac6440 .functor AND 1, o0x76eed8eb7018, o0x76eed8eb7048, C4<1>, C4<1>;
v0x5ed28da7f710_0 .net "a", 0 0, o0x76eed8eb7018;  0 drivers
v0x5ed28dac6050_0 .net "b", 0 0, o0x76eed8eb7048;  0 drivers
v0x5ed28dac6110_0 .net "carry", 0 0, L_0x5ed28dac6440;  1 drivers
v0x5ed28dac61e0_0 .net "sum", 0 0, L_0x5ed28dac6350;  1 drivers
# The file index is used to find the file name in the following table.
:file_names 3;
    "N/A";
    "<interactive>";
    "halfadder.v";
