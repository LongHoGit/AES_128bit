`timescale 1ns / 1ps

//rows are left-shifting as follow:
//row0: not shift
//row1: 1 unit
//row2: 2 units
//row3: 3 units
/////////////////////////////////////
module shift_row(s_state,shifted_state);

input [0:127] s_state;
inout [0:127] shifted_state;
//Column0
assign shifted_state[0:7] = s_state[0:7];//Row0
assign shifted_state[8:15] = s_state[40:47];//Row1
assign shifted_state[16:23] = s_state[80:87];//Row2
assign shifted_state[24:31] = s_state[120:127];//Row3
//Column1
assign shifted_state[32:39] = s_state[32:39];//Row0
assign shifted_state[40:47] = s_state[72:79];//Row1
assign shifted_state[48:55] = s_state[112:119];//Row2
assign shifted_state[56:63] = s_state[24:31];//Row3
//Column2
assign shifted_state[64:71] = s_state[64:71];//Row0
assign shifted_state[72:79] = s_state[104:111];//Row1
assign shifted_state[80:87] = s_state[16:23];//Row2
assign shifted_state[88:95] = s_state[56:63];//Row3
//Column3
assign shifted_state[96:103] = s_state[96:103];//Row0
assign shifted_state[104:111] = s_state[8:15];//Row1
assign shifted_state[112:119] = s_state[48:55];//Row2
assign shifted_state[120:127] = s_state[88:95];//Row3

endmodule
