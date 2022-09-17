module mux4_2_32bit(out, s, in0, in1,in2,in3);
	input[31:0] in0, in1,in2, in3;
	output[31:0] out;
	input[1:0] s;
	
	wire[31:0] w1,w2;
	
	mux2_1_32bit(s[0], w1, in0,in1);
	mux2_1_32bit(s[0], w2, in2,in3);
	
	mux2_1_32bit(s[1], out, w1, w2);
	
endmodule 