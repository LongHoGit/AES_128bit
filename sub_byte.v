`timescale 1ns / 1ps

//sub byte operation
module sub_byte(in_key,out_key);

input [0:127] in_key;
output [0:127] out_key;

s_box sb0(in_key[0:3],in_key[4:7],out_key[0:7]);
s_box sb1(in_key[40:43],in_key[44:47],out_key[40:47]);
s_box sb2(in_key[80:83],in_key[84:87],out_key[80:87]);
s_box sb3(in_key[120:123],in_key[124:127],out_key[120:127]);

s_box sb4(in_key[32:35],in_key[36:39],out_key[32:39]);
s_box sb5(in_key[72:75],in_key[76:79],out_key[72:79]);
s_box sb6(in_key[112:115],in_key[116:119],out_key[112:119]);
s_box sb7(in_key[24:27],in_key[28:31],out_key[24:31]);

s_box sb8(in_key[64:67],in_key[68:71],out_key[64:71]);
s_box sb9(in_key[104:107],in_key[108:111],out_key[104:111]);
s_box sb10(in_key[16:19],in_key[20:23],out_key[16:23]);
s_box sb11(in_key[56:59],in_key[60:63],out_key[56:63]);

s_box sb12(in_key[96:99],in_key[100:103],out_key[96:103]);
s_box sb13(in_key[8:11],in_key[12:15],out_key[8:15]);
s_box sb14(in_key[48:51],in_key[52:55],out_key[48:55]);
s_box sb15(in_key[88:91],in_key[92:95],out_key[88:95]);

endmodule