`timescale 1ns / 1ps
 
// Matrix for MixColumb():
// 02 03 01 01
// 01 02 03 01
// 01 01 02 03
// 03 01 01 02
/////////////////////
//mixing columns between input and key
module mix_col(i_shift,i_mix);

input [0:127]i_shift;//S(row,col)
output [0:127]i_mix;//S'(row,col)
//Column0
assign i_mix[0:7] = xtime(i_shift[0:7])^(xtime(i_shift[8:15])^i_shift[8:15])^i_shift[16:23]^i_shift[24:31];//S'(0,0)
assign i_mix[8:15] = i_shift[0:7]^xtime(i_shift[8:15])^(xtime(i_shift[16:23])^i_shift[16:23])^i_shift[24:31];//S'(1,0)
assign i_mix[16:23] = i_shift[0:7]^i_shift[8:15]^xtime(i_shift[16:23])^(xtime(i_shift[24:31])^i_shift[24:31]);//S'(2,0)
assign i_mix[24:31] = (xtime(i_shift[0:7])^i_shift[0:7])^i_shift[8:15]^i_shift[16:23]^xtime(i_shift[24:31]);//S'(3,0)
//Column1
assign i_mix[32:39] = xtime(i_shift[32:39])^(xtime(i_shift[40:47])^i_shift[40:47])^i_shift[48:55]^i_shift[56:63];
assign i_mix[40:47] = i_shift[32:39]^xtime(i_shift[40:47])^(xtime(i_shift[48:55])^i_shift[48:55])^i_shift[56:63];
assign i_mix[48:55] = i_shift[32:39]^i_shift[40:47]^xtime(i_shift[48:55])^(xtime(i_shift[56:63])^i_shift[56:63]);
assign i_mix[56:63] = (xtime(i_shift[32:39])^i_shift[32:39])^i_shift[40:47]^i_shift[48:55]^xtime(i_shift[56:63]);
//Column2
assign i_mix[64:71] = xtime(i_shift[64:71])^(xtime(i_shift[72:79])^i_shift[72:79])^i_shift[80:87]^i_shift[88:95];
assign i_mix[72:79] = i_shift[64:71]^xtime(i_shift[72:79])^(xtime(i_shift[80:87])^i_shift[80:87])^i_shift[88:95];
assign i_mix[80:87] = i_shift[64:71]^i_shift[72:79]^xtime(i_shift[80:87])^(xtime(i_shift[88:95])^i_shift[88:95]);
assign i_mix[88:95] = (xtime(i_shift[64:71])^i_shift[64:71])^i_shift[72:79]^i_shift[80:87]^xtime(i_shift[88:95]);
//Column3
assign i_mix[96:103] = xtime(i_shift[96:103])^(xtime(i_shift[104:111])^i_shift[104:111])^i_shift[112:119]^i_shift[120:127];
assign i_mix[104:111] = i_shift[96:103]^xtime(i_shift[104:111])^(xtime(i_shift[112:119])^i_shift[112:119])^i_shift[120:127];
assign i_mix[112:119] = i_shift[96:103]^i_shift[104:111]^xtime(i_shift[112:119])^(xtime(i_shift[120:127])^i_shift[120:127]);
assign i_mix[120:127] = (xtime(i_shift[96:103])^i_shift[96:103])^i_shift[104:111]^i_shift[112:119]^xtime(i_shift[120:127]);

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
function [0:7] xtime;//Bit string is 1-bit-left-shift and xor with itself
input [0:7] i;
	begin
		if(i[0] == 0)
			xtime = {i[1:7],1'b0};
		else
			xtime = {i[1:7],1'b0}^8'h1b;
	end
endfunction

endmodule
