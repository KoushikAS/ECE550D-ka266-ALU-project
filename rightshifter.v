module rightshifter(out,in,shift_amt);
	input[31:0] in;
	input[4:0] shift_amt;
	output[31:0] out;
	
	wire[31:0] w1,w2,w3,w4;
	
	mux1bit mi31 (w1[31],shift_amt[0],in[31],in[31]);
	
	genvar i;
	generate
		for(i=30; i>-1; i = i-1) begin : mux1
			mux1bit mi (w1[i],shift_amt[0],in[i],in[i+1]);
		end
	endgenerate 
	
	mux1bit mj31 (w2[31],shift_amt[1],w1[31],w1[31]);
	mux1bit mj30 (w2[30],shift_amt[1],w1[31],w1[31]);
	
	genvar j;
	generate
		for(j=29; j>-1; j = j-1) begin : mux2
			mux1bit mj (w2[j],shift_amt[1],w1[j],w1[j+2]);
		end
	endgenerate 

	mux1bit mk31 (w3[31],shift_amt[2],w2[31],w2[31]);
	mux1bit mk30 (w3[30],shift_amt[2],w2[31],w2[31]);
	mux1bit mk29 (w3[29],shift_amt[2],w2[31],w2[31]);
	mux1bit mk28 (w3[28],shift_amt[2],w2[31],w2[31]);
	
	genvar k;
	generate
		for(k=27; k>-1; k = k-1) begin : mux3
			mux1bit mk (w3[k],shift_amt[2],w2[k],w2[k+4]);
		end
	endgenerate 	
	

	mux1bit ml31 (w4[31],shift_amt[3],w3[31],w3[31]);
	mux1bit ml30 (w4[30],shift_amt[3],w3[31],w3[31]);
	mux1bit ml29 (w4[29],shift_amt[3],w3[31],w3[31]);
	mux1bit ml28 (w4[28],shift_amt[3],w3[31],w3[31]);
	mux1bit ml27 (w4[27],shift_amt[3],w3[31],w3[31]);
	mux1bit ml26 (w4[26],shift_amt[3],w3[31],w3[31]);
	mux1bit ml25 (w4[25],shift_amt[3],w3[31],w3[31]);
	mux1bit ml24 (w4[24],shift_amt[3],w3[31],w3[31]);
	
	genvar l;
	generate
		for(l=23; l>-1; l = l-1) begin : mux4
			mux1bit ml (w4[l],shift_amt[3],w3[l],w3[l+8]);
		end
	endgenerate 

	mux1bit mm31 (out[31],shift_amt[4],w4[31],w4[31]);
	mux1bit mm30 (out[30],shift_amt[4],w4[31],w4[31]);
	mux1bit mm29 (out[29],shift_amt[4],w4[31],w4[31]);
	mux1bit mm28 (out[28],shift_amt[4],w4[31],w4[31]);
	mux1bit mm27 (out[27],shift_amt[4],w4[31],w4[31]);
	mux1bit mm26 (out[26],shift_amt[4],w4[31],w4[31]);
	mux1bit mm25 (out[25],shift_amt[4],w4[31],w4[31]);
	mux1bit mm24 (out[24],shift_amt[4],w4[31],w4[31]);
	mux1bit mm23 (out[23],shift_amt[4],w4[31],w4[31]);
	mux1bit mm22 (out[22],shift_amt[4],w4[31],w4[31]);
	mux1bit mm21 (out[21],shift_amt[4],w4[31],w4[31]);
	mux1bit mm20 (out[20],shift_amt[4],w4[31],w4[31]);
	mux1bit mm19 (out[19],shift_amt[4],w4[31],w4[31]);
	mux1bit mm18 (out[18],shift_amt[4],w4[31],w4[31]);
	mux1bit mm17 (out[17],shift_amt[4],w4[31],w4[31]);
	mux1bit mm16 (out[16],shift_amt[4],w4[31],w4[31]);
	
	genvar m;
	generate
		for(m=15; m>-1; m = m-1) begin : mux5
			mux1bit mm (out[m],shift_amt[4],w4[m],w4[m+16]);
		end
	endgenerate 	
	
endmodule
	