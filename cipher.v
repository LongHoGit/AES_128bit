`timescale 1ns / 1ps
`define rcon1 32'h01000000
`define rcon2 32'h02000000
`define rcon3 32'h04000000
`define rcon4 32'h08000000
`define rcon5 32'h10000000
`define rcon6 32'h20000000
`define rcon7 32'h40000000
`define rcon8 32'h80000000
`define rcon9 32'h1b000000
`define rcon10 32'h36000000

//main module for encrypting
module cipher(plaintext,key,
ad_key0,ad_key1,ad_key2,ad_key3,ad_key4,ad_key5,ad_key6,ad_key7,ad_key8,ad_key9,
s_key1,s_key2,s_key3,s_key4,s_key5,s_key6,s_key7,s_key8,s_key9,s_key10,
sh_key1,sh_key2,sh_key3,sh_key4,sh_key5,sh_key6,sh_key7,sh_key8,sh_key9,sh_key10,
m_key1,m_key2,m_key3,m_key4,m_key5,m_key6,m_key7,m_key8,m_key9,
out_key1,out_key2,out_key3,out_key4,out_key5,out_key6,out_key7,out_key8,out_key9,out_key10,
ciphertext);

input [0:127] plaintext;
input [0:127] key;

output [0:127] ad_key0,ad_key1,ad_key2,ad_key3,ad_key4,ad_key5,ad_key6,ad_key7,ad_key8,ad_key9;
output [0:127] s_key1,s_key2,s_key3,s_key4,s_key5,s_key6,s_key7,s_key8,s_key9,s_key10;
output [0:127] sh_key1,sh_key2,sh_key3,sh_key4,sh_key5,sh_key6,sh_key7,sh_key8,sh_key9,sh_key10;
output [0:127] m_key1,m_key2,m_key3,m_key4,m_key5,m_key6,m_key7,m_key8,m_key9;
output [0:127] out_key1,out_key2,out_key3,out_key4,out_key5,out_key6,out_key7,out_key8,out_key9,out_key10;
output [0:127] ciphertext;

wire [0:127] s_key1,s_key2,s_key3,s_key4,s_key5,s_key6,s_key7,s_key8,s_key9,s_key10;
wire [0:127] sh_key1,sh_key2,sh_key3,sh_key4,sh_key5,sh_key6,sh_key7,sh_key8,sh_key9,sh_key10;
wire [0:127] m_key1,m_key2,m_key3,m_key4,m_key5,m_key6,m_key7,m_key8,m_key9;
wire [0:127] ad_key0,ad_key1,ad_key2,ad_key3,ad_key4,ad_key5,ad_key6,ad_key7,ad_key8,ad_key9;

//*****************************ROUND0*****************************************

//add round key
assign ad_key0 = plaintext^key;

//*****************************ROUND1*****************************************

//sub bytes
sub_byte s0(ad_key0,s_key1);

//shift rows
shift_row sh1(s_key1,sh_key1);

//mix columns
mix_col m1(sh_key1,m_key1);

//add round key
key_expand k1(key,m_key1,`rcon1,out_key1,ad_key1);

//*****************************ROUND2*****************************************

//sub bytes
sub_byte s1(ad_key1,s_key2);

//shift rows
shift_row sh2(s_key2,sh_key2);

//mix columns
mix_col m2(sh_key2,m_key2);

//add round key
key_expand k2(out_key1,m_key2,`rcon2,out_key2,ad_key2);

//*****************************ROUND3*****************************************

//sub bytes
sub_byte s2(ad_key2,s_key3);

//shift rows
shift_row sh3(s_key3,sh_key3);

//mix columns
mix_col m3(sh_key3,m_key3);

//add round key
key_expand k3(out_key2,m_key3,`rcon3,out_key3,ad_key3);

//*****************************ROUND4*****************************************

//sub bytes
sub_byte s3(ad_key3,s_key4);

//shift rows
shift_row sh4(s_key4,sh_key4);

//mix columns
mix_col m4(sh_key4,m_key4);

//add round key
key_expand k4(out_key3,m_key4,`rcon4,out_key4,ad_key4);

//*****************************ROUND5*****************************************

//sub bytes
sub_byte s4(ad_key4,s_key5);

//shift rows
shift_row sh5(s_key5,sh_key5);

//mix columns
mix_col m5(sh_key5,m_key5);

//add round key
key_expand k5(out_key4,m_key5,`rcon5,out_key5,ad_key5);

//*****************************ROUND6*****************************************

//sub bytes
sub_byte s5(ad_key5,s_key6);

//shift rows
shift_row sh6(s_key6,sh_key6);

//mix columns
mix_col m6(sh_key6,m_key6);

//add round key
key_expand k6(out_key5,m_key6,`rcon6,out_key6,ad_key6);

//*****************************ROUND7*****************************************

//sub bytes
sub_byte s6(ad_key6,s_key7);

//shift rows
shift_row sh7(s_key7,sh_key7);

//mix columns
mix_col m7(sh_key7,m_key7);

//add round key
key_expand k7(out_key6,m_key7,`rcon7,out_key7,ad_key7);

//*****************************ROUND8*****************************************

//sub bytes
sub_byte s7(ad_key7,s_key8);

//shift rows
shift_row sh8(s_key8,sh_key8);

//mix columns
mix_col m8(sh_key8,m_key8);

//add round key
key_expand k8(out_key7,m_key8,`rcon8,out_key8,ad_key8);

//*****************************ROUND9*****************************************

//sub bytes
sub_byte s8(ad_key8,s_key9);

//shift rows
shift_row sh9(s_key9,sh_key9);

//mix columns
mix_col m9(sh_key9,m_key9);

//add round key
key_expand k9(out_key8,m_key9,`rcon9,out_key9,ad_key9);

//*****************************ROUND10*****************************************

//sub bytes
sub_byte s9(ad_key9,s_key10);

//shift rows
shift_row sh10(s_key10,sh_key10);

//no mix columns

//add round key
key_expand k10(out_key9,sh_key10,`rcon10,out_key10,ciphertext);


endmodule
