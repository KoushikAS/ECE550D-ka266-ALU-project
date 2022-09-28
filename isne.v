module isne(out,in);		
	output out;
	input[31:0] in;
	
	wire[31:0] w;
	
	and a0 (w[0], 1'b0, 1'b0);
	
	genvar i;
	generate
		for(i=0; i<31; i = i+1) begin : reducer
			or o (w[i+1],w[i],in[i]);
		end
	endgenerate 
	
	or o2 (out,w[31],in[31]);
	
endmodule
	