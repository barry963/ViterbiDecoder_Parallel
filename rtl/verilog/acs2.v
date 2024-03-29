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


module acs2(
old_sm0, old_sm1, 
old_tf0, old_tf1,
bm00, bm01, bm10, bm11, 
new_sm0, new_sm1, 
new_tf0, new_tf1,
dec0, dec1
);
//branch_M0 is the metric of cross branchs, branch_M1 is the parallel
//branchs.
    parameter  SM_Width=`SM_Width;
    parameter BM_Width=`BM_Width;
    
    input signed [SM_Width-1:0] old_sm0, old_sm1;
	input[`W+`V+`U-1:0] old_tf0, old_tf1;
    input [BM_Width-1:0] bm00, bm01, bm10, bm11;
//    input ready;
    
    output [SM_Width-1:0] new_sm0, new_sm1;
    output[`W+`V+`U-1:0] new_tf0, new_tf1;
	output dec0,dec1;
    
    reg signed [SM_Width-1:0] sum00, sum01, sum10, sum11;
    //reg [SM_Width-1:0] result0, result1;
    reg signed [SM_Width-1:0] new_sm0, new_sm1;
	reg [`W+`V+`U-1:0] new_tf0_temp, new_tf1_temp;
	reg [`W+`V+`U-1:0] new_tf0, new_tf1;
    reg dec0, dec1;
    
	//reg comp0, comp1;
	
    always @(old_sm0 or  old_sm1 or bm00 or bm01 or bm10 or bm11)
	begin//bmXY inset Z -> bmYZ
	    sum00 = old_sm0+bm00;
	    sum10 = old_sm1+bm10;
	    sum01 = old_sm0+bm01;
	    sum11 = old_sm1+bm11;
		
		new_tf0_temp=old_tf0;
		new_tf1_temp=old_tf1;
	    //To prevent the overflow of the surviver metric, the rule of
	    //decision is not as simple as usually.It must be changed.
	    //result0 = sum00 - sum10;
	    //result1 = sum01 - sum11;
		
		//comp0 = sum00[SM_Width-1]^sum10[SM_Width-1]^((sum00[SM_Width-2:0]<sum10[SM_Width-2:0])?1:0);
		//comp1 = sum01[SM_Width-1]^sum11[SM_Width-1]^((sum01[SM_Width-2:0]<sum11[SM_Width-2:0])?1:0);
	    
		//select smaller
		if(sum00[SM_Width-1]^sum10[SM_Width-1]^((sum00[SM_Width-2:0]<sum10[SM_Width-2:0])))
	    //if(result0[SM_Width-1]==1) // sum00<sum10		
		//if(sum00<sum10) // sum00<sum10
			begin
			new_sm0=sum00;
			dec0=0;
			new_tf0=new_tf0_temp;
			end
	    else
			begin
			new_sm0=sum10;
			dec0=1;
			new_tf0=new_tf1_temp;
			end
		if(sum01[SM_Width-1]^sum11[SM_Width-1]^(sum01[SM_Width-2:0]<sum11[SM_Width-2:0]))	
	    //if(result1[SM_Width-1]==1) // sum01<sum11
		//if(sum01<sum11) // sum01<sum11
			begin
			new_sm1=sum01;
			dec1=0;
			new_tf1=new_tf0_temp;
			end
	    else
			begin
			new_sm1=sum11;
			dec1=1;
			new_tf1=new_tf1_temp;
			end		
    end
endmodule   

