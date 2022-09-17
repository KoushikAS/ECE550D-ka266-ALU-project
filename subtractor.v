module subtractor(overflow, cout, out, in1, in2);
	input[31:0] in1, in2;
	output[31:0] out;
	output cout, overflow;
	
	wire[31:0] w;
	
	genvar i;
	generate
		for(i=0; i<32; i = i+1) begin : negate
			not ni (w[i], in2[i]);
		end
	endgenerate 
	
	adder a1 (overflow, cout, out, in1, w, 1'b1);

endmodule 