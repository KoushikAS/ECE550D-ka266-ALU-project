module fulladder(cout, out,in1, in2,cin);
	input in1,in2,cin;
	output cout,out;
	wire w1, w2, w3;
	
	xor(w1,in1,in2);
	xor(out, w1, cin);
	
	and(w2,w1,cin);
	and(w3,in1,in2);
	or(cout,w2,w3);
	
endmodule 