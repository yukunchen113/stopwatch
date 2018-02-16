module hex_to_bcd_converter(input wire clk, input wire [31:0] hex_number, output reg [3:0] bcd_digit_0,bcd_digit_1,bcd_digit_2,bcd_digit_3,bcd_digit_4, bcd_digit_5, bcd_digit_6, bcd_digit_7) ;
	reg [3:0] bcd_digit[7:0];
	integer i,k;
	
	always @(*)
	begin
		for (i=7; i>=0; i=i-1) 
			begin
				bcd_digit[i]=4'b0000;
			end
		// check and shift
		for (i=31;i>=0;i=i-1)
			begin
				for(k=7;k>=0;k=k-1)
				begin
					if(bcd_digit[k]>=5) bcd_digit[k]=bcd_digit[k]+4'b0011;
				end
				for(k=7;k>=1;k=k-1)
				begin
					bcd_digit[k]=bcd_digit[k] << 1;
					bcd_digit[k][0]=bcd_digit[k-1][3];
				end
				bcd_digit[0]=bcd_digit[k]<<1;
				bcd_digit[0][0] = hex_number[i];
			end
		bcd_digit_0 = bcd_digit[0];
		bcd_digit_1 = bcd_digit[1];
		bcd_digit_2 = bcd_digit[2];
		bcd_digit_3 = bcd_digit[3];
		bcd_digit_4 = bcd_digit[4];
		bcd_digit_5 = bcd_digit[5];
		bcd_digit_6 = bcd_digit[6];
		bcd_digit_7 = bcd_digit[7];
	end
	
endmodule