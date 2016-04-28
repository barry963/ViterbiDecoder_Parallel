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




//This is a head

`include "glb_def.v"
///////////////////////////////////////////////////////////////////

module butfly2
(old_sm0, old_sm1,
 old_tf0, old_tf1,
state_cluster, 
symbol0, symbol1, 
pattern, 
new_sm0, new_sm1, 
new_tf0, new_tf1,
dec0, dec1
);

    parameter SM_Width=`SM_Width;
   	parameter BM_Width=`BM_Width; 
	parameter Bit_Width=`Bit_Width;
    
	input[SM_Width-1:0] old_sm0, old_sm1;
	input[`W+`V+`U-1:0] old_tf0, old_tf1;
	input[4:0] state_cluster;
	input[Bit_Width-1:0] symbol0, symbol1;
input[`SYMBOLS_NUM-1:0] pattern;
output[SM_Width-1:0] new_sm0, new_sm1;
output[`W+`V+`U-1:0] new_tf0, new_tf1;
output dec0, dec1;

wire[BM_Width-1:0] wire_bm00, wire_bm01, wire_bm10, wire_bm11;

acs2 unit_acs2(  .old_sm0(old_sm0), .old_sm1(old_sm1),.old_tf0(old_tf0), .old_tf1(old_tf1), .bm00(wire_bm00), .bm01(wire_bm01), .bm10(wire_bm10), .bm11(wire_bm11), .new_sm0(new_sm0), .new_sm1(new_sm1), .new_tf0(new_tf0), .new_tf1(new_tf1), .dec0(dec0), .dec1(dec1));

brameter2 unit_brameter2( .state_cluster(state_cluster),  .symbol0(symbol0), .symbol1(symbol1), .pattern(pattern), .bm00(wire_bm00), .bm01(wire_bm01), .bm10(wire_bm10), .bm11(wire_bm11));

endmodule
