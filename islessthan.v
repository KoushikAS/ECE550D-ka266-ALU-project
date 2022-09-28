module islessthan(out, in, overflow);
	output out;
	input[31:0] in;
	input overflow;
	
	wire w;
	
	and a (w, in[31],in[31]);
	
	xor n(out,w,overflow);

endmodule
	