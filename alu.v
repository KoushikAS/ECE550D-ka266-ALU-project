module alu(data_operandA, data_operandB, ctrl_ALUopcode, ctrl_shiftamt, data_result, isNotEqual, isLessThan, overflow);

   input [31:0] data_operandA, data_operandB;
   input [4:0] ctrl_ALUopcode, ctrl_shiftamt;

   output [31:0] data_result;
   output isNotEqual, isLessThan, overflow;
	
   // YOUR CODE HERE //
	
	wire[31:0] w1,w2;
	wire cout1,cout2;
	wire o1,o2;

	adder(o1, cout1, w1, data_operandA, data_operandB, 1'b0);
	subtractor(o2, cout2, w2, data_operandA, data_operandB);
	
	mux2_1_32bit(data_result,ctrl_ALUopcode[0], w1, w2 );
	mux1bit(overflow,ctrl_ALUopcode[0],o1,o2);
	
endmodule
