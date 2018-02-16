module hex_counter(input Clock,Reset,Enable,Stp,output reg [31:0] Q);
	initial @(posedge Clock)
		begin
			Q <= 32'b0;
		end
	always @(posedge Clock)
		begin
			if (Enable) Q <= Q + 32'b1;
			if (Stp) Q <= Q;
			if (Reset) Q <= 32'b0;
		end
endmodule