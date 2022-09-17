module RCA_16(overflow, cout,out,in0,in1,cin);
	input[15:0] in0,in1;
	input cin;
	output[15:0] out;
	output cout,overflow;
	
	wire[14:0] w;
	
	fulladder fa1 (w[0],out[0],in0[0],in1[0],cin);
	
	genvar i;
	generate
		for(i=1; i<15; i = i+1) begin : fulladder
			fulladder f1i (w[i],out[i],in0[i],in1[i],w[i-1]);
		end
	endgenerate 
	
	fulladder fal (cout,out[15],in0[15],in1[15],w[14]);
	
	xor x1 (overflow, cout, w[14]);
	
endmodule 