///////////////////////////////////////////////////////////////////
         //////                                    //////
///////////////////////////////////////////////////////////////////
///                                                             ///
/// This file is generated by Viterbi HDL Code Generator(VHCG)  ///
/// which is written by Mike Johnson at OpenCores.org  and      ///
/// distributed under GPL license.                              ///
///                                                             ///
/// If you have any advice,                                     ///
/// please email to jhonson.zhu@gmail.com                       ///
///                                                             ///
///////////////////////////////////////////////////////////////////

///////////////////////////////////////////////////////////////////



`include "glb_def.v"

module pe
(
	mclk, 
	rst, 
	valid, 
	slice, 
	shift_cnt, 
	adr0_shift, 
	adr1_shift, 
	symbol0, 
	symbol1, 
	pattern, 
	in_sm0, 
	in_sm1, 
	out_sm0, 
	out_sm1, 
	dec0, 
	dec1
);
parameter PE_ID=0;
input mclk;
input rst, valid;
input[`U-1:0] slice;
input[`V-1:0] shift_cnt;      ///////// 
input[`U-1:0] adr0_shift, adr1_shift;             /////////////////////////////
input[`Bit_Width-1:0] symbol0, symbol1;
input[`SYMBOLS_NUM-1:0] pattern;           //////////////////////////////////////////////
input[`SM_Width-1:0] in_sm0, in_sm1;    //////////////////////////////////////////////
output[`SM_Width-1:0] out_sm0, out_sm1;   ////////////////////////////////////////////////
output[`V-1:0] dec0, dec1;              //////////////////////////////////////////////
reg[`V-1:0] dec0, dec1;                 //////////////////////////////////////////////

wire[`W-1:0] pe_id = PE_ID;
wire[`V-1:0] wire_dec0, wire_dec1;
wire[`SM_Width-1:0] wr_sm0, wr_sm1;
butfly2 butfly2_0(.old_sm0(in_sm0), .old_sm1(in_sm1), .state_cluster({slice,pe_id}), .symbol0(symbol0), .symbol1(symbol1), .pattern(pattern), .new_sm0(wr_sm0), .new_sm1(wr_sm1), .dec0(wire_dec0), .dec1(wire_dec1));
smu smu_i
(
	.mclk(mclk), 
	.rst(rst), 
	.valid(valid), 
	.shift_cnt(shift_cnt), 
	.adr0_shift(adr0_shift), .adr1_shift(adr1_shift), .wr_sm0(wr_sm0), .wr_sm1(wr_sm1), .rd_sm0(out_sm0), .rd_sm1(out_sm1)
);

always @(posedge mclk or posedge rst)
begin
    if(rst)
		begin
		dec0<=0;        ///////////////////////////////////
		dec1<=0;        ///////////////////////////////////
		end
    else if(valid)
		begin
		dec0<=wire_dec0;
		dec1<=wire_dec1;		
		end
end
endmodule