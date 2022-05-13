// -------------------------------------------------------------
//
// Module: filter_iir_2
// Generated by MATLAB(R) 9.8 and Filter Design HDL Coder 3.1.7.
// Generated on: 2022-05-14 01:08:10
// iir filter task
//
// -------------------------------------------------------------

// -------------------------------------------------------------
// HDL Code Generation Options:
//
// UseRisingEdge: on
// TargetDirectory: D:\Ruhma_dsp_lab3\Task
// Name: filter_iir_2
// UserComment:  User data, length 15
// TargetLanguage: Verilog
// TestBenchName: iir_filter_tb
// TestBenchStimulus: step ramp chirp 

// Filter Specifications:
//
// Sample Rate     : N/A (normalized frequency)
// Response        : Lowpass
// Specification   : Fp,Fst,Ap,Ast
// Stopband Atten. : 80 dB
// Passband Ripple : 1 dB
// Stopband Edge   : 0.6
// Passband Edge   : 0.2
// -------------------------------------------------------------

// -------------------------------------------------------------
// HDL Implementation    : Fully parallel
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
// Scale Values        : s16,16 -> [-5.000000e-01 5.000000e-01)
// Input               : s16,15 -> [-1 1)
// Section Input       : s16,11 -> [-16 16)
// Section Output      : s31,26 -> [-16 16)
// Output              : s32,27 -> [-16 16)
// State               : s16,15 -> [-1 1)
// Numerator Prod      : s32,29 -> [-4 4)
// Denominator Prod    : s32,29 -> [-4 4)
// Numerator Accum     : s40,29 -> [-1024 1024)
// Denominator Accum   : s40,29 -> [-1024 1024)
// Round Mode          : floor
// Overflow Mode       : wrap
// Cast Before Sum     : true
// -------------------------------------------------------------




`timescale 1 ns / 1 ns

module filter_iir_2
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
  output  signed [31:0] filter_out; //sfix32_En27

////////////////////////////////////////////////////////////////
//Module Architecture: filter_iir_2
////////////////////////////////////////////////////////////////
  // Local Functions
  // Type Definitions
  // Constants
  parameter signed [15:0] scaleconst1 = 16'b0001000011001111; //sfix16_En16
  parameter signed [15:0] coeff_b1_section1 = 16'b0100000000000000; //sfix16_En14
  parameter signed [15:0] coeff_b2_section1 = 16'b1110101011011111; //sfix16_En14
  parameter signed [15:0] coeff_b3_section1 = 16'b0100000000000000; //sfix16_En14
  parameter signed [15:0] coeff_a2_section1 = 16'b1001110100000100; //sfix16_En14
  parameter signed [15:0] coeff_a3_section1 = 16'b0011101000011011; //sfix16_En14
  parameter signed [15:0] scaleconst2 = 16'b0000111111111111; //sfix16_En16
  parameter signed [15:0] coeff_b1_section2 = 16'b0100000000000000; //sfix16_En14
  parameter signed [15:0] coeff_b2_section2 = 16'b0010010000101001; //sfix16_En14
  parameter signed [15:0] coeff_b3_section2 = 16'b0100000000000000; //sfix16_En14
  parameter signed [15:0] coeff_a2_section2 = 16'b1001101001101110; //sfix16_En14
  parameter signed [15:0] coeff_a3_section2 = 16'b0010111111010100; //sfix16_En14
  parameter signed [15:0] scaleconst3 = 16'b0100101110110110; //sfix16_En16
  parameter signed [15:0] coeff_b1_section3 = 16'b0100000000000000; //sfix16_En14
  parameter signed [15:0] coeff_b2_section3 = 16'b0100000000000000; //sfix16_En14
  parameter signed [15:0] coeff_b3_section3 = 16'b0000000000000000; //sfix16_En14
  parameter signed [15:0] coeff_a2_section3 = 16'b1100101101111101; //sfix16_En14
  parameter signed [15:0] coeff_a3_section3 = 16'b0000000000000000; //sfix16_En14
  // Signals
  reg  signed [15:0] input_register; // sfix16_En15
  wire signed [46:0] scale1; // sfix47_En42
  wire signed [31:0] mul_temp; // sfix32_En31
  wire signed [15:0] scaletypeconvert1; // sfix16_En11
  // Section 1 Signals 
  wire signed [39:0] a1sum1; // sfix40_En29
  wire signed [39:0] a2sum1; // sfix40_En29
  wire signed [39:0] b1sum1; // sfix40_En29
  wire signed [39:0] b2sum1; // sfix40_En29
  wire signed [15:0] typeconvert1; // sfix16_En15
  reg  signed [15:0] delay_section1 [0:1] ; // sfix16_En15
  wire signed [39:0] inputconv1; // sfix40_En29
  wire signed [31:0] a2mul1; // sfix32_En29
  wire signed [31:0] a3mul1; // sfix32_En29
  wire signed [31:0] b1mul1; // sfix32_En29
  wire signed [31:0] b2mul1; // sfix32_En29
  wire signed [31:0] b3mul1; // sfix32_En29
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
  wire signed [30:0] section_result1; // sfix31_En26
  wire signed [46:0] scale2; // sfix47_En42
  wire signed [15:0] scaletypeconvert2; // sfix16_En11
  // Section 2 Signals 
  wire signed [39:0] a1sum2; // sfix40_En29
  wire signed [39:0] a2sum2; // sfix40_En29
  wire signed [39:0] b1sum2; // sfix40_En29
  wire signed [39:0] b2sum2; // sfix40_En29
  wire signed [15:0] typeconvert2; // sfix16_En15
  reg  signed [15:0] delay_section2 [0:1] ; // sfix16_En15
  wire signed [39:0] inputconv2; // sfix40_En29
  wire signed [31:0] a2mul2; // sfix32_En29
  wire signed [31:0] a3mul2; // sfix32_En29
  wire signed [31:0] b1mul2; // sfix32_En29
  wire signed [31:0] b2mul2; // sfix32_En29
  wire signed [31:0] b3mul2; // sfix32_En29
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
  wire signed [30:0] section_result2; // sfix31_En26
  wire signed [46:0] scale3; // sfix47_En42
  wire signed [15:0] scaletypeconvert3; // sfix16_En11
  //   -- Section 3 Signals 
  wire signed [39:0] a1sum3; // sfix40_En29
  wire signed [39:0] b1sum3; // sfix40_En29
  wire signed [15:0] a1sumtypeconvert3; // sfix16_En15
  reg  signed [15:0] delay_section3; // sfix16_En15
  wire signed [39:0] inputconv3; // sfix40_En29
  wire signed [31:0] a2mul3; // sfix32_En29
  wire signed [31:0] b1mul3; // sfix32_En29
  wire signed [31:0] b2mul3; // sfix32_En29
  wire signed [39:0] sub_cast_8; // sfix40_En29
  wire signed [39:0] sub_cast_9; // sfix40_En29
  wire signed [40:0] sub_temp_4; // sfix41_En29
  wire signed [39:0] b1multypeconvert3; // sfix40_En29
  wire signed [39:0] add_cast_8; // sfix40_En29
  wire signed [39:0] add_cast_9; // sfix40_En29
  wire signed [40:0] add_temp_4; // sfix41_En29
  wire signed [31:0] output_typeconvert; // sfix32_En27
  reg  signed [31:0] output_register; // sfix32_En27

  // Block Statements
  always @ (posedge clk or posedge reset)
    begin: input_reg_process
      if (reset == 1'b1) begin
        input_register <= 0;
      end
      else begin
        if (clk_enable == 1'b1) begin
          input_register <= filter_in;
        end
      end
    end // input_reg_process

  assign mul_temp = input_register * scaleconst1;
  assign scale1 = $signed({mul_temp[31:0], 11'b00000000000});

  assign scaletypeconvert1 = scale1[46:31];

  //   ------------------ Section 1 ------------------

  assign typeconvert1 = a1sum1[29:14];

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

  assign inputconv1 = $signed({scaletypeconvert1[15:0], 18'b000000000000000000});

  assign a2mul1 = delay_section1[0] * coeff_a2_section1;

  assign a3mul1 = delay_section1[1] * coeff_a3_section1;

  assign b1mul1 = $signed({typeconvert1[15:0], 14'b00000000000000});

  assign b2mul1 = delay_section1[0] * coeff_b2_section1;

  assign b3mul1 = $signed({delay_section1[1][15:0], 14'b00000000000000});

  assign sub_cast = inputconv1;
  assign sub_cast_1 = $signed({{8{a2mul1[31]}}, a2mul1});
  assign sub_temp = sub_cast - sub_cast_1;
  assign a2sum1 = sub_temp[39:0];

  assign sub_cast_2 = a2sum1;
  assign sub_cast_3 = $signed({{8{a3mul1[31]}}, a3mul1});
  assign sub_temp_1 = sub_cast_2 - sub_cast_3;
  assign a1sum1 = sub_temp_1[39:0];

  assign b1multypeconvert1 = $signed({{8{b1mul1[31]}}, b1mul1});

  assign add_cast = b1multypeconvert1;
  assign add_cast_1 = $signed({{8{b2mul1[31]}}, b2mul1});
  assign add_temp = add_cast + add_cast_1;
  assign b2sum1 = add_temp[39:0];

  assign add_cast_2 = b2sum1;
  assign add_cast_3 = $signed({{8{b3mul1[31]}}, b3mul1});
  assign add_temp_1 = add_cast_2 + add_cast_3;
  assign b1sum1 = add_temp_1[39:0];

  assign section_result1 = b1sum1[33:3];

  assign scale2 = section_result1 * scaleconst2;

  assign scaletypeconvert2 = scale2[46:31];

  //   ------------------ Section 2 ------------------

  assign typeconvert2 = a1sum2[29:14];

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

  assign inputconv2 = $signed({scaletypeconvert2[15:0], 18'b000000000000000000});

  assign a2mul2 = delay_section2[0] * coeff_a2_section2;

  assign a3mul2 = delay_section2[1] * coeff_a3_section2;

  assign b1mul2 = $signed({typeconvert2[15:0], 14'b00000000000000});

  assign b2mul2 = delay_section2[0] * coeff_b2_section2;

  assign b3mul2 = $signed({delay_section2[1][15:0], 14'b00000000000000});

  assign sub_cast_4 = inputconv2;
  assign sub_cast_5 = $signed({{8{a2mul2[31]}}, a2mul2});
  assign sub_temp_2 = sub_cast_4 - sub_cast_5;
  assign a2sum2 = sub_temp_2[39:0];

  assign sub_cast_6 = a2sum2;
  assign sub_cast_7 = $signed({{8{a3mul2[31]}}, a3mul2});
  assign sub_temp_3 = sub_cast_6 - sub_cast_7;
  assign a1sum2 = sub_temp_3[39:0];

  assign b1multypeconvert2 = $signed({{8{b1mul2[31]}}, b1mul2});

  assign add_cast_4 = b1multypeconvert2;
  assign add_cast_5 = $signed({{8{b2mul2[31]}}, b2mul2});
  assign add_temp_2 = add_cast_4 + add_cast_5;
  assign b2sum2 = add_temp_2[39:0];

  assign add_cast_6 = b2sum2;
  assign add_cast_7 = $signed({{8{b3mul2[31]}}, b3mul2});
  assign add_temp_3 = add_cast_6 + add_cast_7;
  assign b1sum2 = add_temp_3[39:0];

  assign section_result2 = b1sum2[33:3];

  assign scale3 = section_result2 * scaleconst3;

  assign scaletypeconvert3 = scale3[46:31];

  //   ------------------ Section 3 (First Order) ------------------

  assign a1sumtypeconvert3 = a1sum3[29:14];

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

  assign inputconv3 = $signed({scaletypeconvert3[15:0], 18'b000000000000000000});

  assign a2mul3 = delay_section3 * coeff_a2_section3;

  assign b1mul3 = $signed({a1sumtypeconvert3[15:0], 14'b00000000000000});

  assign b2mul3 = $signed({delay_section3[15:0], 14'b00000000000000});

  assign sub_cast_8 = inputconv3;
  assign sub_cast_9 = $signed({{8{a2mul3[31]}}, a2mul3});
  assign sub_temp_4 = sub_cast_8 - sub_cast_9;
  assign a1sum3 = sub_temp_4[39:0];

  assign b1multypeconvert3 = $signed({{8{b1mul3[31]}}, b1mul3});

  assign add_cast_8 = b1multypeconvert3;
  assign add_cast_9 = $signed({{8{b2mul3[31]}}, b2mul3});
  assign add_temp_4 = add_cast_8 + add_cast_9;
  assign b1sum3 = add_temp_4[39:0];

  assign output_typeconvert = b1sum3[33:2];

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
endmodule  // filter_iir_2