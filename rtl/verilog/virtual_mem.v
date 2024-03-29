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


 
//`define NOMEMORY

module sync_mem(clk, wr_data, wr_adr, wr_en, rd_adr, rd_en, rd_data);
    // Hints:
    // the output data of the async_mem should be unregistered
    // sync_mem is not
    parameter DATA_WIDTH=`RAM_BYTE_WIDTH;
    parameter ADDRESS_WIDTH=`RAM_ADR_WIDTH;
    
    input clk;
    input [DATA_WIDTH - 1:0] wr_data;
    input [ADDRESS_WIDTH - 1:0] wr_adr;
	
    input [ADDRESS_WIDTH - 1:0] rd_adr;
    input wr_en;
    input rd_en; 
    output [DATA_WIDTH - 1:0] rd_data;
    
    reg [DATA_WIDTH - 1:0] rd_data;
`ifdef NOMEMORY
    reg[DATA_WIDTH-1:0] mem[0:0];
    always @(posedge clk )
    begin 
		if (rd_en) 
			rd_data<=mem[0];
		else 
			rd_data<='bx;
		
		if(wr_en&&wr_adr==0&&rd_adr==0)
			begin
				mem[0]<=wr_data;
			end
		else
			mem[0]<=1;
    end
`else
    reg [DATA_WIDTH - 1:0] mem0[95:0];
    //integer temp;
    //initial 
    //begin
    //    for(temp=0;temp<1024;temp=temp+1)
    //    begin
    //        mem[temp]=0;
    //    end
    //end
    
    always @(posedge clk)
    begin  
    	if (rd_en)
			begin
				rd_data<=mem0[rd_adr];
			end
    	else 
			rd_data<='bx;
			
	    if(wr_en)
			begin
				mem0[wr_adr]<=wr_data;	
			end
    end
`endif
endmodule
