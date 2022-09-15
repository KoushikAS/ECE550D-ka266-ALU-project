module fulladder(c, out,in1, in2);
	input in1,in2;
	output c,out;
	
	xor(out,in1,in2);
	and(c,in1,in2);
	
endmodule 