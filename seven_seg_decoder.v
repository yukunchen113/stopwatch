module seven_seg_decoder (input [3:0] x, output[6:0] hex_LEDs);
	reg [6:2] top_5_segments;

	assign hex_LEDs[0] = (~x[3]&~x[2]&~x[1]&x[0]) | (~x[3]&x[2]&~x[1]&~x[0]) | (x[3]&~x[2]&x[1]&x[0]) |
							(x[3]&x[2]&~x[1]&x[0]) | (x[3]&x[2]&x[1]&x[0]);
	assign hex_LEDs[1] = (~x[3]&x[2]&~x[1]&x[0]) | (~x[3]&x[2]&x[1]&~x[0]) | (x[3]&~x[2]&x[1]&~x[0])
								 | (x[3]&x[2]&~x[1]&x[0]) | (x[3]&x[2]&x[1]&~x[0]) | (x[3]&x[2]&x[1]&x[0]);
	assign hex_LEDs[6:2] = top_5_segments[6:2];

	always@(x)
	begin
		case(x)
			4'b0000: top_5_segments=5'b10000;
			4'b0001: top_5_segments=5'b11110;
			4'b0010: top_5_segments=5'b01001;
			4'b0011: top_5_segments=5'b01100;
			4'b0100: top_5_segments=5'b00110;
			4'b0101: top_5_segments=5'b00100;
			4'b0110: top_5_segments=5'b00000;
			4'b0111: top_5_segments=5'b11110;
			4'b1000: top_5_segments=5'b00000;
			4'b1001: top_5_segments=5'b00100;
			4'b1010: top_5_segments=5'b10001;
			4'b1011: top_5_segments=5'b00010;
			4'b1100: top_5_segments=5'b00010;
			4'b1101: top_5_segments=5'b10011;
			4'b1110: top_5_segments=5'b00100;
			4'b1111: top_5_segments=5'b00011;
		endcase
	end

endmodule