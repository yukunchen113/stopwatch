module stopwatch(input CLOCK_50, input [3:0] KEY, output reg [17:0] LEDR, output [31:0] time_ms,output run, output [6:0] HEX0, HEX1,HEX2,HEX3,HEX4,HEX5,HEX6,HEX7);
	//test flip flop
	//control_ff (.Clock(CLOCK_50), .ff_in(KEY[0]), .Set(KEY[1]), .Clear(KEY[2]), .Q(LEDR[0]));
	//parameter start = KEY[0];
	//parameter stop = KEY[1];
	//parameter reset = KEY[2];
	///clock divider--------------------------
	reg zzz;
	reg [15:0] item;
	always @(posedge CLOCK_50)//clock divider
	begin
		if (item == 4'hC350) 
			begin
				item <= 0;
				zzz<=1;
			end
		else 
		begin
			item <= item+1;
			zzz<=0;
		end
	end
	// ---------------------------------------
	
	//-------start and stop button------------
	//wire run;
	reg ff_past2;
	control_ff (.Clock(CLOCK_50), .ff_in(ff_past2), .Set(~KEY[1]), .Clear(~KEY[2]),.Reset(~KEY[0]), .Q(run));//new clock
	always @(posedge CLOCK_50)
	begin
		ff_past2 <= run;
	end
	//-----------------------------------------
	
	//-------Counter in hex--------------------
	//wire [31:0] time_ms;
	hex_counter(.Clock(zzz),.Reset(~KEY[0]),.Enable(run),.Stp(~run),.Q(time_ms[31:0]));//needs new clock

	//-----------------------------------------
	
	//-------Hex to BCD converter--------------
	wire[3:0] bcd_digit[7:0];
	hex_to_bcd_converter(.clk(zzz), .hex_number(time_ms[31:0]), .bcd_digit_0(bcd_digit[0]),.bcd_digit_1(bcd_digit[1]),.bcd_digit_2(bcd_digit[2]),.bcd_digit_3(bcd_digit[3]),.bcd_digit_4(bcd_digit[4]), .bcd_digit_5(bcd_digit[5]), .bcd_digit_6(bcd_digit[6]), .bcd_digit_7(bcd_digit[7]));
	//-----------------------------------------
	
	//-------7 segment display-----------------
	seven_seg_decoder (.x(bcd_digit[0]), .hex_LEDs(HEX0[6:0]));
	seven_seg_decoder (.x(bcd_digit[1]), .hex_LEDs(HEX1[6:0]));
	seven_seg_decoder (.x(bcd_digit[2]), .hex_LEDs(HEX2[6:0]));
	seven_seg_decoder (.x(bcd_digit[3]), .hex_LEDs(HEX3[6:0]));
	seven_seg_decoder (.x(bcd_digit[4]), .hex_LEDs(HEX4[6:0]));
	seven_seg_decoder (.x(bcd_digit[5]), .hex_LEDs(HEX5[6:0]));
	seven_seg_decoder (.x(bcd_digit[6]), .hex_LEDs(HEX6[6:0]));
	seven_seg_decoder (.x(bcd_digit[7]), .hex_LEDs(HEX7[6:0]));
	
endmodule