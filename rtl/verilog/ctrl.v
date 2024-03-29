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

module ctrl
(
    mclk, 
    rst, 
    valid, 
    symbol0,
    symbol1, 
    pattern, 
    valid_slice, 
    reg_symbol0,
    reg_symbol1, 
    reg_pattern, 
    valid_decs
);

input mclk, rst, valid;
input[`Bit_Width-1:0] symbol0, symbol1;
input[`SYMBOLS_NUM-1:0] pattern;           //////////////////////////////////////////////

output[`Bit_Width-1:0] reg_symbol0, reg_symbol1;
output[`SYMBOLS_NUM-1:0] reg_pattern;           //////////////////////////////////////////////
output valid_slice, valid_decs;

reg valid_slice;

delayT #(`Bit_Width*`SYMBOLS_NUM+`SYMBOLS_NUM+1,1) delayT_symbols(.mclk(mclk), .rst(rst), .in({symbol0, symbol1, pattern, valid_slice}), .out({reg_symbol0, reg_symbol1, reg_pattern, valid_decs}));

always @(posedge mclk or posedge rst)
begin
    if(rst)
		begin
			valid_slice<=0;
		end
    else if(valid)
		begin
			valid_slice<=1;				
		end
	else
		begin
			valid_slice<=0;
		end

end

endmodule
