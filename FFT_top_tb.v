`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   12:26:23 04/07/2016
// Design Name:   FFT_top
// Module Name:   C:/Users/SUTD/codes/ISE_FFT_16Radix4/FFT_top_tb.v
// Project Name:  ISE_FFT_16Radix4
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: FFT_top
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module FFT_top_tb;

	// Inputs
	reg clk;
	reg reset;
	reg [3:0] address;

	// Outputs
	wire [15:0] 		out_r1,out_r2,out_r3,out_r4,out_r5,out_r6,out_r7,out_r8,out_r9,out_r10,out_r11,out_r12,out_r13,out_r14,out_r15,out_r16;
	wire [15:0] 		out_i1,out_i2,out_i3,out_i4,out_i5,out_i6,out_i7,out_i8,out_i9,out_i10,out_i11,out_i12,out_i13,out_i14,out_i15,out_i16;


	// Instantiate the Unit Under Test (UUT)
	FFT_top uut (
		.clk(clk), 
		.reset(reset), 
		.address(address), 
		.out_re0(out_r1),
		.out_re1(out_r2),
		.out_re2(out_r3),
		.out_re3(out_r4),
		.out_re4(out_r5),
		.out_re5(out_r6),
		.out_re6(out_r7),
		.out_re7(out_r8),
		.out_re8(out_r9),
		.out_re9(out_r10),
		.out_re10(out_r11),
		.out_re11(out_r12),
		.out_re12(out_r13),
		.out_re13(out_r14),
		.out_re14(out_r15),
		.out_re15(out_r16),
		.out_im0(out_i1),
		.out_im1(out_i2),
		.out_im2(out_i3),
		.out_im3(out_i4),
		.out_im4(out_i5),
		.out_im5(out_i6),
		.out_im6(out_i7),
		.out_im7(out_i8),
		.out_im8(out_i9),
		.out_im9(out_i10),
		.out_im10(out_i11),
		.out_im11(out_i12),
		.out_im12(out_i13),
		.out_im13(out_i14),
		.out_im14(out_i15),
		.out_im15(out_i16)
		
				
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		reset = 1'b1;
		address = 4'd0;

		// Wait 100 ns for global reset to finish
		#25;
      reset = 1'b0;
			
		// Add stimulus here

	end
	
	always
	begin	
		#10 clk =~clk;
	end
	
	always @ (negedge clk or negedge reset)
	begin
		if(!reset)
		begin
		if(address!=4'd15)
			address = address+4'd1;
		else
			address = 4'd0;
		end
		else
			address = 4'd0;
	end
	
	always @ (posedge clk)
	begin
		$display("real %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d /n " ,out_r1,out_r2,out_r3,out_r4,out_r5,out_r6,out_r7,out_r8,out_r9,out_r10,out_r11,out_r12,out_r13,out_r14,out_r15,out_r16);
		$display("imaginary %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d  /n ", out_i1,out_i2,out_i3,out_i4,out_i5,out_i6,out_i7,out_i8,out_i9,out_i10,out_i11,out_i12,out_i13,out_i14,out_i15,out_i16);
		$display("%d " ,address);
	end

      
endmodule

