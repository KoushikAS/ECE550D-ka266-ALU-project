module adder(cout, out, in1, in2, cin);
	input[63:0] in1, in2;
	input cin;
	output[63:0] out;
	output cout;
	
	wire c1,c2,c3;
	wire[31:0] in1_half1, in1_half2, in2_half1, in2_half2;
	wire[31:0] op1,op2,op3,op4;
	
	
	generate
		genvar i0;
		for(i0=0; i0<32; i0 = i0+1) begin : in1_half1loop
			assign in1_half1[i0] = in1[i0];
		end
	endgenerate
	
	generate
		genvar i1;
		for(i1=0; i1<32; i1 = i1+1) begin : in1_half2loop
			assign in1_half2[i1] = in1[i1 +32];
		end
	endgenerate
	
	generate
		genvar i2;
		for(i2=0; i2<32; i2 = i2+1) begin : in2_half1loop
			assign in2_half1[i2] = in2[i2];
		end
	endgenerate
	
	generate
		genvar i3;
		for(i3=0; i3<32; i3 = i3+1) begin : in2_half2loop
			assign in2_half2[i3] = in2[i3 +32];
		end
	endgenerate
	
	RCA_32(c1,op1, in1_half1, in2_half1, cin);
	
	RCA_32(c2,op2, in1_half2, in2_half2, 1'b0);	
	RCA_32(c3,op3, in1_half2, in2_half2, 1'b1);	
	
	mux2_1(op4,c1, op2,op3);
	
	// To Do for overfflow u need 2_1 mux but with 1 bit
	
	generate
		genvar i4;
		for(i4=0; i4<32; i4 = i4+1) begin : out_half1
			assign out[i4] = op1[i4];
		end
	endgenerate
	
	generate
		genvar i5;
		for(i5=0; i5<32; i5 = i5+1) begin : out_half2
			assign out[i5+32] = op4[i5 +32];
		end
	endgenerate 

endmodule 