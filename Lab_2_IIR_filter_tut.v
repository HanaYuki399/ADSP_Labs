// -------------------------------------------------------------
//
// Module: Lab_2_IIR_filter_tut
// Generated by MATLAB(R) 8.1 and the Filter Design HDL Coder 2.9.3.
// Generated on: 2022-03-31 16:08:21
// e Tutorial - IIR Filter
//
// -------------------------------------------------------------

// -------------------------------------------------------------
// HDL Code Generation Options:
//
// AddInputRegister: off
// Name: Lab_2_IIR_filter_tut
// UserComment:  User data, length 23
// DateComment: off
// TargetLanguage: Verilog
// TestBenchName: Lab_2_IIR_filter_tb
// TestBenchStimulus: step ramp chirp 

// Filter Specifications:
//
// Sampling Frequency : N/A (normalized frequency)
// Response           : Highpass
// Specification      : N,F3dB
// Filter Order       : 5
// 3-dB Point         : 0.45
// -------------------------------------------------------------

// -------------------------------------------------------------
// HDL Implementation    : Fully parallel
// Multipliers           : 8
// Folding Factor        : 1
// -------------------------------------------------------------
// Filter Settings:
//
// Discrete-Time IIR Filter (real)
// -------------------------------
// Filter Structure    : Direct-Form II, Second-Order Sections
// Number of Sections  : 3
// Stable              : Yes
// Linear Phase        : No
// Arithmetic          : fixed
// Numerator           : s16,14 -> [-2 2)
// Denominator         : s16,14 -> [-2 2)
// Scale Values        : s16,15 -> [-1 1)
// Input               : s16,15 -> [-1 1)
// Section Input       : s16,10 -> [-32 32)
// Section Output      : s16,11 -> [-16 16)
// Output              : s16,11 -> [-16 16)
// State               : s16,15 -> [-1 1)
// Numerator Prod      : s32,29 -> [-4 4)
// Denominator Prod    : s32,29 -> [-4 4)
// Numerator Accum     : s40,29 -> [-1024 1024)
// Denominator Accum   : s40,29 -> [-1024 1024)
// Round Mode          : floor
// Overflow Mode       : saturate
// Cast Before Sum     : true
// -------------------------------------------------------------

`timescale 1 ns / 1 ns

module Lab_2_IIR_filter_tut
               (
                clk,
                clk_enable,
                reset,
                filter_in,
                filter_out
                );

  input   clk; 
  input   clk_enable; 
  input   reset; 
  input   signed [15:0] filter_in; //sfix16_En15
  output  signed [15:0] filter_out; //sfix16_En11

////////////////////////////////////////////////////////////////
//Module Architecture: Lab_2_IIR_filter_tut
////////////////////////////////////////////////////////////////
  // Local Functions
  // Type Definitions
  // Constants
  parameter signed [15:0] scaleconst1 = 16'b0011100010110100; //sfix16_En15
  parameter signed [15:0] coeff_b1_section1 = 16'b0100000000000000; //sfix16_En14
  parameter signed [15:0] coeff_b2_section1 = 16'b1000000000000000; //sfix16_En14
  parameter signed [15:0] coeff_b3_section1 = 16'b0100000000000000; //sfix16_En14
  parameter signed [15:0] coeff_a2_section1 = 16'b1111000010101001; //sfix16_En14
  parameter signed [15:0] coeff_a3_section1 = 16'b0010001000010001; //sfix16_En14
  parameter signed [15:0] scaleconst2 = 16'b0010100100100100; //sfix16_En15
  parameter signed [15:0] coeff_b1_section2 = 16'b0100000000000000; //sfix16_En14
  parameter signed [15:0] coeff_b2_section2 = 16'b1000000000000000; //sfix16_En14
  parameter signed [15:0] coeff_b3_section2 = 16'b0100000000000000; //sfix16_En14
  parameter signed [15:0] coeff_a2_section2 = 16'b1111010011011111; //sfix16_En14
  parameter signed [15:0] coeff_a3_section2 = 16'b0000011100100110; //sfix16_En14
  parameter signed [15:0] scaleconst3 = 16'b0100010100001001; //sfix16_En15
  parameter signed [15:0] coeff_b1_section3 = 16'b0100000000000000; //sfix16_En14
  parameter signed [15:0] coeff_b2_section3 = 16'b1100000000000000; //sfix16_En14
  parameter signed [15:0] coeff_b3_section3 = 16'b0000000000000000; //sfix16_En14
  parameter signed [15:0] coeff_a2_section3 = 16'b1111101011110111; //sfix16_En14
  parameter signed [15:0] coeff_a3_section3 = 16'b0000000000000000; //sfix16_En14
  // Signals
  wire signed [15:0] input_typeconvert; // sfix16_En15
  wire signed [35:0] scale1; // sfix36_En30
  wire signed [31:0] mul_temp; // sfix32_En30
  wire signed [15:0] scaletypeconvert1; // sfix16_En10
  // Section 1 Signals 
  wire signed [39:0] a1sum1; // sfix40_En29
  wire signed [39:0] a2sum1; // sfix40_En29
  wire signed [39:0] b1sum1; // sfix40_En29
  wire signed [39:0] b2sum1; // sfix40_En29
  wire signed [15:0] typeconvert1; // sfix16_En15
  reg  signed [15:0] delay_section1 [0:1] ; // sfix16_En15
  wire signed [15:0] inputconv1; // sfix16_En10
  wire signed [31:0] a2mul1; // sfix32_En29
  wire signed [31:0] a3mul1; // sfix32_En29
  wire signed [31:0] b1mul1; // sfix32_En29
  wire signed [31:0] b2mul1; // sfix32_En29
  wire signed [31:0] b3mul1; // sfix32_En29
  wire signed [16:0] mulpwr2_temp; // sfix17_En15
  wire signed [39:0] sub_cast; // sfix40_En29
  wire signed [39:0] sub_cast_1; // sfix40_En29
  wire signed [40:0] sub_temp; // sfix41_En29
  wire signed [39:0] sub_cast_2; // sfix40_En29
  wire signed [39:0] sub_cast_3; // sfix40_En29
  wire signed [40:0] sub_temp_1; // sfix41_En29
  wire signed [39:0] b1multypeconvert1; // sfix40_En29
  wire signed [39:0] add_cast; // sfix40_En29
  wire signed [39:0] add_cast_1; // sfix40_En29
  wire signed [40:0] add_temp; // sfix41_En29
  wire signed [39:0] add_cast_2; // sfix40_En29
  wire signed [39:0] add_cast_3; // sfix40_En29
  wire signed [40:0] add_temp_1; // sfix41_En29
  wire signed [15:0] section_result1; // sfix16_En11
  wire signed [35:0] scale2; // sfix36_En30
  wire signed [31:0] mul_temp_1; // sfix32_En26
  wire signed [15:0] scaletypeconvert2; // sfix16_En10
  // Section 2 Signals 
  wire signed [39:0] a1sum2; // sfix40_En29
  wire signed [39:0] a2sum2; // sfix40_En29
  wire signed [39:0] b1sum2; // sfix40_En29
  wire signed [39:0] b2sum2; // sfix40_En29
  wire signed [15:0] typeconvert2; // sfix16_En15
  reg  signed [15:0] delay_section2 [0:1] ; // sfix16_En15
  wire signed [15:0] inputconv2; // sfix16_En10
  wire signed [31:0] a2mul2; // sfix32_En29
  wire signed [31:0] a3mul2; // sfix32_En29
  wire signed [31:0] b1mul2; // sfix32_En29
  wire signed [31:0] b2mul2; // sfix32_En29
  wire signed [31:0] b3mul2; // sfix32_En29
  wire signed [16:0] mulpwr2_temp_1; // sfix17_En15
  wire signed [39:0] sub_cast_4; // sfix40_En29
  wire signed [39:0] sub_cast_5; // sfix40_En29
  wire signed [40:0] sub_temp_2; // sfix41_En29
  wire signed [39:0] sub_cast_6; // sfix40_En29
  wire signed [39:0] sub_cast_7; // sfix40_En29
  wire signed [40:0] sub_temp_3; // sfix41_En29
  wire signed [39:0] b1multypeconvert2; // sfix40_En29
  wire signed [39:0] add_cast_4; // sfix40_En29
  wire signed [39:0] add_cast_5; // sfix40_En29
  wire signed [40:0] add_temp_2; // sfix41_En29
  wire signed [39:0] add_cast_6; // sfix40_En29
  wire signed [39:0] add_cast_7; // sfix40_En29
  wire signed [40:0] add_temp_3; // sfix41_En29
  wire signed [15:0] section_result2; // sfix16_En11
  wire signed [35:0] scale3; // sfix36_En30
  wire signed [31:0] mul_temp_2; // sfix32_En26
  wire signed [15:0] scaletypeconvert3; // sfix16_En10
  //   -- Section 3 Signals 
  wire signed [39:0] a1sum3; // sfix40_En29
  wire signed [39:0] b1sum3; // sfix40_En29
  wire signed [15:0] a1sumtypeconvert3; // sfix16_En15
  reg  signed [15:0] delay_section3; // sfix16_En15
  wire signed [39:0] inputconv3; // sfix40_En29
  wire signed [31:0] a2mul3; // sfix32_En29
  wire signed [31:0] b1mul3; // sfix32_En29
  wire signed [31:0] b2mul3; // sfix32_En29
  wire signed [16:0] unaryminus_temp; // sfix17_En15
  wire signed [39:0] sub_cast_8; // sfix40_En29
  wire signed [39:0] sub_cast_9; // sfix40_En29
  wire signed [40:0] sub_temp_4; // sfix41_En29
  wire signed [39:0] b1multypeconvert3; // sfix40_En29
  wire signed [39:0] add_cast_8; // sfix40_En29
  wire signed [39:0] add_cast_9; // sfix40_En29
  wire signed [40:0] add_temp_4; // sfix41_En29
  wire signed [15:0] output_typeconvert; // sfix16_En11
  reg  signed [15:0] output_register; // sfix16_En11

  // Block Statements
  assign input_typeconvert = filter_in;

  assign mul_temp = input_typeconvert * scaleconst1;
  assign scale1 = $signed({{4{mul_temp[31]}}, mul_temp});

  assign scaletypeconvert1 = scale1[35:20];

  //   ------------------ Section 1 ------------------

  assign typeconvert1 = (a1sum1[39] == 1'b0 & a1sum1[38:29] != 10'b0000000000) ? 16'b0111111111111111 : 
      (a1sum1[39] == 1'b1 && a1sum1[38:29] != 10'b1111111111) ? 16'b1000000000000000 : a1sum1[29:14];

  always @ (posedge clk or posedge reset)
    begin: delay_process_section1
      if (reset == 1'b1) begin
        delay_section1[0] <= 16'b0000000000000000;
        delay_section1[1] <= 16'b0000000000000000;
      end
      else begin
        if (clk_enable == 1'b1) begin
          delay_section1[1] <= delay_section1[0];
          delay_section1[0] <= typeconvert1;
        end
      end
    end // delay_process_section1

  assign inputconv1 = scaletypeconvert1;

  assign a2mul1 = delay_section1[0] * coeff_a2_section1;

  assign a3mul1 = delay_section1[1] * coeff_a3_section1;

  assign b1mul1 = $signed({typeconvert1, 14'b00000000000000});

  assign mulpwr2_temp = (delay_section1[0]==16'b1000000000000000) ? $signed({1'b0, delay_section1[0]}) : -delay_section1[0];

  assign b2mul1 = $signed({mulpwr2_temp, 15'b000000000000000});

  assign b3mul1 = $signed({delay_section1[1], 14'b00000000000000});

  assign sub_cast = $signed({inputconv1, 19'b0000000000000000000});
  assign sub_cast_1 = $signed({{8{a2mul1[31]}}, a2mul1});
  assign sub_temp = sub_cast - sub_cast_1;
  assign a2sum1 = (sub_temp[40] == 1'b0 & sub_temp[39] != 1'b0) ? 40'b0111111111111111111111111111111111111111 : 
      (sub_temp[40] == 1'b1 && sub_temp[39] != 1'b1) ? 40'b1000000000000000000000000000000000000000 : sub_temp[39:0];

  assign sub_cast_2 = a2sum1;
  assign sub_cast_3 = $signed({{8{a3mul1[31]}}, a3mul1});
  assign sub_temp_1 = sub_cast_2 - sub_cast_3;
  assign a1sum1 = (sub_temp_1[40] == 1'b0 & sub_temp_1[39] != 1'b0) ? 40'b0111111111111111111111111111111111111111 : 
      (sub_temp_1[40] == 1'b1 && sub_temp_1[39] != 1'b1) ? 40'b1000000000000000000000000000000000000000 : sub_temp_1[39:0];

  assign b1multypeconvert1 = $signed({{8{b1mul1[31]}}, b1mul1});

  assign add_cast = b1multypeconvert1;
  assign add_cast_1 = $signed({{8{b2mul1[31]}}, b2mul1});
  assign add_temp = add_cast + add_cast_1;
  assign b2sum1 = (add_temp[40] == 1'b0 & add_temp[39] != 1'b0) ? 40'b0111111111111111111111111111111111111111 : 
      (add_temp[40] == 1'b1 && add_temp[39] != 1'b1) ? 40'b1000000000000000000000000000000000000000 : add_temp[39:0];

  assign add_cast_2 = b2sum1;
  assign add_cast_3 = $signed({{8{b3mul1[31]}}, b3mul1});
  assign add_temp_1 = add_cast_2 + add_cast_3;
  assign b1sum1 = (add_temp_1[40] == 1'b0 & add_temp_1[39] != 1'b0) ? 40'b0111111111111111111111111111111111111111 : 
      (add_temp_1[40] == 1'b1 && add_temp_1[39] != 1'b1) ? 40'b1000000000000000000000000000000000000000 : add_temp_1[39:0];

  assign section_result1 = (b1sum1[39] == 1'b0 & b1sum1[38:33] != 6'b000000) ? 16'b0111111111111111 : 
      (b1sum1[39] == 1'b1 && b1sum1[38:33] != 6'b111111) ? 16'b1000000000000000 : b1sum1[33:18];

  assign mul_temp_1 = section_result1 * scaleconst2;
  assign scale2 = $signed({mul_temp_1, 4'b0000});

  assign scaletypeconvert2 = scale2[35:20];

  //   ------------------ Section 2 ------------------

  assign typeconvert2 = (a1sum2[39] == 1'b0 & a1sum2[38:29] != 10'b0000000000) ? 16'b0111111111111111 : 
      (a1sum2[39] == 1'b1 && a1sum2[38:29] != 10'b1111111111) ? 16'b1000000000000000 : a1sum2[29:14];

  always @ (posedge clk or posedge reset)
    begin: delay_process_section2
      if (reset == 1'b1) begin
        delay_section2[0] <= 16'b0000000000000000;
        delay_section2[1] <= 16'b0000000000000000;
      end
      else begin
        if (clk_enable == 1'b1) begin
          delay_section2[1] <= delay_section2[0];
          delay_section2[0] <= typeconvert2;
        end
      end
    end // delay_process_section2

  assign inputconv2 = scaletypeconvert2;

  assign a2mul2 = delay_section2[0] * coeff_a2_section2;

  assign a3mul2 = delay_section2[1] * coeff_a3_section2;

  assign b1mul2 = $signed({typeconvert2, 14'b00000000000000});

  assign mulpwr2_temp_1 = (delay_section2[0]==16'b1000000000000000) ? $signed({1'b0, delay_section2[0]}) : -delay_section2[0];

  assign b2mul2 = $signed({mulpwr2_temp_1, 15'b000000000000000});

  assign b3mul2 = $signed({delay_section2[1], 14'b00000000000000});

  assign sub_cast_4 = $signed({inputconv2, 19'b0000000000000000000});
  assign sub_cast_5 = $signed({{8{a2mul2[31]}}, a2mul2});
  assign sub_temp_2 = sub_cast_4 - sub_cast_5;
  assign a2sum2 = (sub_temp_2[40] == 1'b0 & sub_temp_2[39] != 1'b0) ? 40'b0111111111111111111111111111111111111111 : 
      (sub_temp_2[40] == 1'b1 && sub_temp_2[39] != 1'b1) ? 40'b1000000000000000000000000000000000000000 : sub_temp_2[39:0];

  assign sub_cast_6 = a2sum2;
  assign sub_cast_7 = $signed({{8{a3mul2[31]}}, a3mul2});
  assign sub_temp_3 = sub_cast_6 - sub_cast_7;
  assign a1sum2 = (sub_temp_3[40] == 1'b0 & sub_temp_3[39] != 1'b0) ? 40'b0111111111111111111111111111111111111111 : 
      (sub_temp_3[40] == 1'b1 && sub_temp_3[39] != 1'b1) ? 40'b1000000000000000000000000000000000000000 : sub_temp_3[39:0];

  assign b1multypeconvert2 = $signed({{8{b1mul2[31]}}, b1mul2});

  assign add_cast_4 = b1multypeconvert2;
  assign add_cast_5 = $signed({{8{b2mul2[31]}}, b2mul2});
  assign add_temp_2 = add_cast_4 + add_cast_5;
  assign b2sum2 = (add_temp_2[40] == 1'b0 & add_temp_2[39] != 1'b0) ? 40'b0111111111111111111111111111111111111111 : 
      (add_temp_2[40] == 1'b1 && add_temp_2[39] != 1'b1) ? 40'b1000000000000000000000000000000000000000 : add_temp_2[39:0];

  assign add_cast_6 = b2sum2;
  assign add_cast_7 = $signed({{8{b3mul2[31]}}, b3mul2});
  assign add_temp_3 = add_cast_6 + add_cast_7;
  assign b1sum2 = (add_temp_3[40] == 1'b0 & add_temp_3[39] != 1'b0) ? 40'b0111111111111111111111111111111111111111 : 
      (add_temp_3[40] == 1'b1 && add_temp_3[39] != 1'b1) ? 40'b1000000000000000000000000000000000000000 : add_temp_3[39:0];

  assign section_result2 = (b1sum2[39] == 1'b0 & b1sum2[38:33] != 6'b000000) ? 16'b0111111111111111 : 
      (b1sum2[39] == 1'b1 && b1sum2[38:33] != 6'b111111) ? 16'b1000000000000000 : b1sum2[33:18];

  assign mul_temp_2 = section_result2 * scaleconst3;
  assign scale3 = $signed({mul_temp_2, 4'b0000});

  assign scaletypeconvert3 = scale3[35:20];

  //   ------------------ Section 3 (First Order) ------------------

  assign a1sumtypeconvert3 = (a1sum3[39] == 1'b0 & a1sum3[38:29] != 10'b0000000000) ? 16'b0111111111111111 : 
      (a1sum3[39] == 1'b1 && a1sum3[38:29] != 10'b1111111111) ? 16'b1000000000000000 : a1sum3[29:14];

  always @ (posedge clk or posedge reset)
    begin: delay_process_section3
      if (reset == 1'b1) begin
        delay_section3 <= 0;
      end
      else begin
        if (clk_enable == 1'b1) begin
          delay_section3 <= a1sumtypeconvert3;
        end
      end
    end // delay_process_section3

  assign inputconv3 = $signed({scaletypeconvert3, 19'b0000000000000000000});

  assign a2mul3 = delay_section3 * coeff_a2_section3;

  assign b1mul3 = $signed({a1sumtypeconvert3, 14'b00000000000000});

  assign unaryminus_temp = (delay_section3==16'b1000000000000000) ? $signed({1'b0, delay_section3}) : -delay_section3;
  assign b2mul3 = $signed({unaryminus_temp, 14'b00000000000000});

  assign sub_cast_8 = inputconv3;
  assign sub_cast_9 = $signed({{8{a2mul3[31]}}, a2mul3});
  assign sub_temp_4 = sub_cast_8 - sub_cast_9;
  assign a1sum3 = (sub_temp_4[40] == 1'b0 & sub_temp_4[39] != 1'b0) ? 40'b0111111111111111111111111111111111111111 : 
      (sub_temp_4[40] == 1'b1 && sub_temp_4[39] != 1'b1) ? 40'b1000000000000000000000000000000000000000 : sub_temp_4[39:0];

  assign b1multypeconvert3 = $signed({{8{b1mul3[31]}}, b1mul3});

  assign add_cast_8 = b1multypeconvert3;
  assign add_cast_9 = $signed({{8{b2mul3[31]}}, b2mul3});
  assign add_temp_4 = add_cast_8 + add_cast_9;
  assign b1sum3 = (add_temp_4[40] == 1'b0 & add_temp_4[39] != 1'b0) ? 40'b0111111111111111111111111111111111111111 : 
      (add_temp_4[40] == 1'b1 && add_temp_4[39] != 1'b1) ? 40'b1000000000000000000000000000000000000000 : add_temp_4[39:0];

  assign output_typeconvert = (b1sum3[39] == 1'b0 & b1sum3[38:33] != 6'b000000) ? 16'b0111111111111111 : 
      (b1sum3[39] == 1'b1 && b1sum3[38:33] != 6'b111111) ? 16'b1000000000000000 : b1sum3[33:18];

  always @ (posedge clk or posedge reset)
    begin: Output_Register_process
      if (reset == 1'b1) begin
        output_register <= 0;
      end
      else begin
        if (clk_enable == 1'b1) begin
          output_register <= output_typeconvert;
        end
      end
    end // Output_Register_process

  // Assignment Statements
  assign filter_out = output_register;
endmodule  // Lab_2_IIR_filter_tut
