`timescale 1ns / 1ps
module key_expand(clk,temp_key,m_key,rcon, out_key,ad_key);

input clk;

input [0:127] temp_key;//prototype key
input [0:127] m_key;//w[i-Nk]
input [0:31] rcon;

output reg [0:127] out_key;//out_key: use for creating subkeys
output reg [0:127] ad_key;//ad_key: use for creating input for new loop (result from AddRoundKey())

wire [0:127] key,key2;

//shifting operation

assign key[0:95]    = temp_key[0:95];
assign key[96:103]  = temp_key[104:111];
assign key[104:111] = temp_key[112:119];
assign key[112:119] = temp_key[120:127];
assign key[120:127] = temp_key[96:103];

//subtituting bytes operation

s_box sb16(key[96:99],key[100:103],key2[96:103]);
s_box sb17(key[104:107],key[108:111],key2[104:111]);
s_box sb18(key[112:115],key[116:119],key2[112:119]);
s_box sb19(key[120:123],key[124:127],key2[120:127]);

always @(posedge clk)
 begin
	//out_key = w[i] = sub_key xor rcon xor temp 

	out_key[0:31]  = key2[96:127]^key[0:31]^rcon[0:31]; 
	out_key[32:63]  = key2[96:127]^key[0:31]^key[32:63]^rcon[0:31]; 
	out_key[64:95]  = key2[96:127]^key[0:31]^key[32:63]^key[64:95]^rcon[0:31]; 
	out_key[96:127]  = key2[96:127]^key[0:31]^key[32:63]^key[64:95]^temp_key[96:127]^rcon[0:31]; 

	//add round operation

	ad_key[0:127] = m_key[0:127]^out_key[0:127];

 end
endmodule
