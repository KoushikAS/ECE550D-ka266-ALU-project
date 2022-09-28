module leftshifter(out, in, shift_amt);
	input[31:0] in;
	input[4:0] shift_amt;
	output[31:0] out;
	
	wire[31:0] w1,w2,w3,w4;

	genvar i;
	generate
		for(i=31; i>0; i = i-1) begin : mux1
			mux1bit mi (w1[i],shift_amt[0],in[i],in[i-1]);
		end
	endgenerate 
	
	mux1bit mil (w1[0],shift_amt[0], in[0], 1'b0);
	
	genvar j;
	generate
		for(j=31; j>1; j = j-1) begin : mux2
			mux1bit mj (w2[j],shift_amt[1],w1[j],w1[j-2]);
		end
	endgenerate 
	
	mux1bit mjl1 (w2[1],shift_amt[1],w1[1],1'b0);
	mux1bit mjl2 (w2[0],shift_amt[1],w1[0],1'b0);
	
	genvar k;
	generate
		for(k=31; k>3; k = k-1) begin : mux3
			mux1bit mk (w3[k],shift_amt[2],w2[k],w2[k-4]);
		end
	endgenerate 

	mux1bit mkl3 (w3[3],shift_amt[2],w2[3],1'b0);
	mux1bit mkl2 (w3[2],shift_amt[2],w2[2],1'b0);
	mux1bit mkl1 (w3[1],shift_amt[2],w2[1],1'b0);
	mux1bit mkl0 (w3[0],shift_amt[2],w2[0],1'b0);
	
	genvar l;
	generate
		for(l=31; l>7; l = l-1) begin : mux4
			mux1bit ml (w4[l],shift_amt[3],w3[l],w3[l-8]);
		end
	endgenerate 

	mux1bit mll7 (w4[7],shift_amt[3],w3[7],1'b0);
	mux1bit mll6 (w4[6],shift_amt[3],w3[6],1'b0);
	mux1bit mll5 (w4[5],shift_amt[3],w3[5],1'b0);
	mux1bit mll4 (w4[4],shift_amt[3],w3[4],1'b0);
	mux1bit mll3 (w4[3],shift_amt[3],w3[3],1'b0);
	mux1bit mll2 (w4[2],shift_amt[3],w3[2],1'b0);
	mux1bit mll1 (w4[1],shift_amt[3],w3[1],1'b0);
	mux1bit mll0 (w4[0],shift_amt[3],w3[0],1'b0);
	
	genvar m;
	generate
		for(m=31; m>15; m = m-1) begin : mux5
			mux1bit mm (out[m],shift_amt[4],w4[m],w4[m-16]);
		end
	endgenerate 
	
	
	mux1bit mm15 (out[15],shift_amt[4],w4[15],1'b0);
	mux1bit mml4 (out[14],shift_amt[4],w4[14],1'b0);
	mux1bit mml3 (out[13],shift_amt[4],w4[13],1'b0);
	mux1bit mml2 (out[12],shift_amt[4],w4[12],1'b0);
	mux1bit mml1 (out[11],shift_amt[4],w4[11],1'b0);
	mux1bit mml0 (out[10],shift_amt[4],w4[10],1'b0);
	mux1bit mm9 (out[9],shift_amt[4],w4[9],1'b0);
	mux1bit mm8 (out[8],shift_amt[4],w4[8],1'b0);
	
	mux1bit mm7 (out[7],shift_amt[4],w4[7],1'b0);
	mux1bit mm6 (out[6],shift_amt[4],w4[6],1'b0);
	mux1bit mm5 (out[5],shift_amt[4],w4[5],1'b0);
	mux1bit mm4 (out[4],shift_amt[4],w4[4],1'b0);
	mux1bit mm3 (out[3],shift_amt[4],w4[3],1'b0);
	mux1bit mm2 (out[2],shift_amt[4],w4[2],1'b0);
	mux1bit mm1 (out[1],shift_amt[4],w4[1],1'b0);
	mux1bit mm0 (out[0],shift_amt[4],w4[0],1'b0);
	
endmodule 