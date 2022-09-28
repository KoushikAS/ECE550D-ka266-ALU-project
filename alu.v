module alu(data_operandA, data_operandB, ctrl_ALUopcode, ctrl_shiftamt, data_result, isNotEqual, isLessThan, overflow);

   input [31:0] data_operandA, data_operandB;
   input [4:0] ctrl_ALUopcode, ctrl_shiftamt;

   output [31:0] data_result;
   output isNotEqual, isLessThan, overflow;
	
   // YOUR CODE HERE //
	
	wire[31:0] w1,w2,w3,w4,w5,w6;
	wire cout1,cout2;
	wire o1,o2;

	adder r1 (o1, cout1, w1, data_operandA, data_operandB, 1'b0);
	subtractor r2 (o2, cout2, w2, data_operandA, data_operandB);
	bitwiseand r3 (w3, data_operandA, data_operandB);
	bitwiseor r4 (w4, data_operandA, data_operandB);
	leftshifter r5 (w5, data_operandA, ctrl_shiftamt);
	rightshifter r6 (w6, data_operandA, ctrl_shiftamt);
	
	
	islessthan l (isLessThan, w2,o2);
	isne in (isNotEqual,w2);
	
	mux16_4_32bit m1 (data_result,ctrl_ALUopcode[3:0], w1, w2,w3,w4,w5,w6,32'd0,32'd0, 32'd0,32'd0,32'd0, 32'd0,32'd0,32'd0,32'd0,32'd0 );
	mux1bit m2 (overflow,ctrl_ALUopcode[0],o1,o2);
	
endmodule
