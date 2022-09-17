module adder(overflow,cout, out, in1, in2, cin);
	input[31:0] in1, in2;
	input cin;
	output[31:0] out;
	output cout,overflow;
	
	wire c1,c2,c3, o1,o2,o3;
	wire[15:0] op2,op3;
	
		
	RCA_16 r1 (o1,c1,out[15:0], in1[15:0], in2[15:0], cin);
	
	RCA_16 r2 (o2,c2,op2, in1[31:16], in2[31:16], 1'b0);	
	RCA_16 r3 (o3, c3,op3, in1[31:16], in2[31:16], 1'b1);		
	mux2_1 m1 (out[31:16],c1, op2,op3);
	
	// To Do for overfflow u need 2_1 mux but with 1 bit
	mux1bit m2 (overflow,c1, o2, o3);
	mux1bit m3 (cout,c1,c2,c3);

endmodule 