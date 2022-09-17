module mux1bit(out,s,in0,in1);
	output out;
	input s,in0,in1;
	
	wire snot;
	wire w1,w2;
	
	not(snot,s);
		
		
	// First And Gate for 0th poistion

	and(w1,in0,snot);

	
	// Second And Gate for 1st poistion	

	and(w2,in1, s);

	
	
	//Final Or Gate

	or(out,w1,w2);

	
endmodule 