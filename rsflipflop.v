//timescale 1ns/100ps

module control_ff(Clock, ff_in, Set, Clear,Reset, Q);
	input Clock, ff_in, Set, Clear,Reset;
	output reg Q;
	always @(posedge Clock)
	begin
		if (Set^(Clear|Reset)) Q <= Set;
		else Q<=ff_in;
	end	
endmodule