module bitwiseor(out, in1, in2);
	input[31:0] in1, in2;
	output[31:0] out;
	
	genvar i;
	generate
		for(i=0; i<32; i = i+1) begin : ander
			or oi (out[i],in1[i],in2[i]);
		end
	endgenerate 
endmodule 