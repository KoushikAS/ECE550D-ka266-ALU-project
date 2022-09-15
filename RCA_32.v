module RCA_32(cout,out,in0,in1,cin);
	input[31:0] in0,in1;
	input cin;
	output[31:0] out;
	output cout;
	
	wire[31:0] w;
	
	fulladder(w[0],out[0],in0[0],in1[0],cin);
	
	genvar i;
	generate
		for(i=1; i<32; i = i+1) begin : fulladder
			fulladder(w[i],out[i],in0[i],in1[i],w[i-1]);
		end
	endgenerate 
	
	assign cout = w[31];
endmodule 