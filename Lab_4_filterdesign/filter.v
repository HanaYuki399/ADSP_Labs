// ------------------------------------------------------------
// 
// File Name: hdlsrc\Lab_4_upd\filter
// Created: 2022-05-30 22:53:54
// Generated by MATLAB 8.1 and HDL Coder 3.2
// 
// ------------------------------------------------------------
// 
// 
// ------------------------------------------------------------
// 
// Module: filter
// Source Path: /filter
// 
// ------------------------------------------------------------
// 
// HDL Implementation    : Fully parallel
// Multipliers           : 12
// Folding Factor        : 1



`timescale 1 ns / 1 ns

module filter
               (
                clk,
                enb,
                reset,
                filter_in,
                filter_out
                );

  input   clk; 
  input   enb; 
  input   reset; 
  input   signed [15:0] filter_in; //sfix16_En15
  output  signed [17:0] filter_out; //sfix18_En13

////////////////////////////////////////////////////////////////
//Module Architecture: filter
////////////////////////////////////////////////////////////////
  // Local Functions
  // Type Definitions
  // Constants
  parameter signed [15:0] scaleconst1 = 16'b0100111100111001; //sfix16_En21
  parameter signed [15:0] coeff_b1_section1 = 16'b0100000000000000; //sfix16_En14
  parameter signed [15:0] coeff_b2_section1 = 16'b0000000000000000; //sfix16_En14
  parameter signed [15:0] coeff_b3_section1 = 16'b1100000000000000; //sfix16_En14
  parameter signed [15:0] coeff_a2_section1 = 16'b1001100110000011; //sfix16_En14
  parameter signed [15:0] coeff_a3_section1 = 16'b0011111110000101; //sfix16_En14
  parameter signed [15:0] scaleconst2 = 16'b0100111100111001; //sfix16_En21
  parameter signed [15:0] coeff_b1_section2 = 16'b0100000000000000; //sfix16_En14
  parameter signed [15:0] coeff_b2_section2 = 16'b0000000000000000; //sfix16_En14
  parameter signed [15:0] coeff_b3_section2 = 16'b1100000000000000; //sfix16_En14
  parameter signed [15:0] coeff_a2_section2 = 16'b1001100000101001; //sfix16_En14
  parameter signed [15:0] coeff_a3_section2 = 16'b0011111110001000; //sfix16_En14
  parameter signed [15:0] scaleconst3 = 16'b0100111011010000; //sfix16_En21
  parameter signed [15:0] coeff_b1_section3 = 16'b0100000000000000; //sfix16_En14
  parameter signed [15:0] coeff_b2_section3 = 16'b0000000000000000; //sfix16_En14
  parameter signed [15:0] coeff_b3_section3 = 16'b1100000000000000; //sfix16_En14
  parameter signed [15:0] coeff_a2_section3 = 16'b1001100110100110; //sfix16_En14
  parameter signed [15:0] coeff_a3_section3 = 16'b0011111011011011; //sfix16_En14
  parameter signed [15:0] scaleconst4 = 16'b0100111011010000; //sfix16_En21
  parameter signed [15:0] coeff_b1_section4 = 16'b0100000000000000; //sfix16_En14
  parameter signed [15:0] coeff_b2_section4 = 16'b0000000000000000; //sfix16_En14
  parameter signed [15:0] coeff_b3_section4 = 16'b1100000000000000; //sfix16_En14
  parameter signed [15:0] coeff_a2_section4 = 16'b1001100100010101; //sfix16_En14
  parameter signed [15:0] coeff_a3_section4 = 16'b0011111011011110; //sfix16_En14
  // Signals
  wire signed [15:0] input_typeconvert; // sfix16_En15
  wire signed [35:0] scale1; // sfix36_En36
  wire signed [31:0] mul_temp; // sfix32_En36
  wire signed [15:0] scaletypeconvert1; // sfix16_En16
  // Section 1 Signals 
  wire signed [39:0] a1sum1; // sfix40_En29
  wire signed [39:0] a2sum1; // sfix40_En29
  wire signed [39:0] b1sum1; // sfix40_En29
  wire signed [15:0] typeconvert1; // sfix16_En15
  reg  signed [15:0] delay_section1 [0:1] ; // sfix16_En15
  wire signed [15:0] inputconv1; // sfix16_En16
  wire signed [31:0] a2mul1; // sfix32_En29
  wire signed [31:0] a3mul1; // sfix32_En29
  wire signed [31:0] b1mul1; // sfix32_En29
  wire signed [31:0] b3mul1; // sfix32_En29
  wire signed [16:0] unaryminus_temp; // sfix17_En15
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
  wire signed [17:0] section_result1; // sfix18_En13
  wire signed [35:0] scale2; // sfix36_En36
  wire signed [33:0] mul_temp_1; // sfix34_En34
  wire signed [15:0] scaletypeconvert2; // sfix16_En16
  // Section 2 Signals 
  wire signed [39:0] a1sum2; // sfix40_En29
  wire signed [39:0] a2sum2; // sfix40_En29
  wire signed [39:0] b1sum2; // sfix40_En29
  wire signed [15:0] typeconvert2; // sfix16_En15
  reg  signed [15:0] delay_section2 [0:1] ; // sfix16_En15
  wire signed [15:0] inputconv2; // sfix16_En16
  wire signed [31:0] a2mul2; // sfix32_En29
  wire signed [31:0] a3mul2; // sfix32_En29
  wire signed [31:0] b1mul2; // sfix32_En29
  wire signed [31:0] b3mul2; // sfix32_En29
  wire signed [16:0] unaryminus_temp_1; // sfix17_En15
  wire signed [39:0] sub_cast_4; // sfix40_En29
  wire signed [39:0] sub_cast_5; // sfix40_En29
  wire signed [40:0] sub_temp_2; // sfix41_En29
  wire signed [39:0] sub_cast_6; // sfix40_En29
  wire signed [39:0] sub_cast_7; // sfix40_En29
  wire signed [40:0] sub_temp_3; // sfix41_En29
  wire signed [39:0] b1multypeconvert2; // sfix40_En29
  wire signed [39:0] add_cast_2; // sfix40_En29
  wire signed [39:0] add_cast_3; // sfix40_En29
  wire signed [40:0] add_temp_1; // sfix41_En29
  wire signed [17:0] section_result2; // sfix18_En13
  wire signed [35:0] scale3; // sfix36_En36
  wire signed [33:0] mul_temp_2; // sfix34_En34
  wire signed [15:0] scaletypeconvert3; // sfix16_En16
  // Section 3 Signals 
  wire signed [39:0] a1sum3; // sfix40_En29
  wire signed [39:0] a2sum3; // sfix40_En29
  wire signed [39:0] b1sum3; // sfix40_En29
  wire signed [15:0] typeconvert3; // sfix16_En15
  reg  signed [15:0] delay_section3 [0:1] ; // sfix16_En15
  wire signed [15:0] inputconv3; // sfix16_En16
  wire signed [31:0] a2mul3; // sfix32_En29
  wire signed [31:0] a3mul3; // sfix32_En29
  wire signed [31:0] b1mul3; // sfix32_En29
  wire signed [31:0] b3mul3; // sfix32_En29
  wire signed [16:0] unaryminus_temp_2; // sfix17_En15
  wire signed [39:0] sub_cast_8; // sfix40_En29
  wire signed [39:0] sub_cast_9; // sfix40_En29
  wire signed [40:0] sub_temp_4; // sfix41_En29
  wire signed [39:0] sub_cast_10; // sfix40_En29
  wire signed [39:0] sub_cast_11; // sfix40_En29
  wire signed [40:0] sub_temp_5; // sfix41_En29
  wire signed [39:0] b1multypeconvert3; // sfix40_En29
  wire signed [39:0] add_cast_4; // sfix40_En29
  wire signed [39:0] add_cast_5; // sfix40_En29
  wire signed [40:0] add_temp_2; // sfix41_En29
  wire signed [17:0] section_result3; // sfix18_En13
  wire signed [35:0] scale4; // sfix36_En36
  wire signed [33:0] mul_temp_3; // sfix34_En34
  wire signed [15:0] scaletypeconvert4; // sfix16_En16
  // Section 4 Signals 
  wire signed [39:0] a1sum4; // sfix40_En29
  wire signed [39:0] a2sum4; // sfix40_En29
  wire signed [39:0] b1sum4; // sfix40_En29
  wire signed [15:0] typeconvert4; // sfix16_En15
  reg  signed [15:0] delay_section4 [0:1] ; // sfix16_En15
  wire signed [15:0] inputconv4; // sfix16_En16
  wire signed [31:0] a2mul4; // sfix32_En29
  wire signed [31:0] a3mul4; // sfix32_En29
  wire signed [31:0] b1mul4; // sfix32_En29
  wire signed [31:0] b3mul4; // sfix32_En29
  wire signed [16:0] unaryminus_temp_3; // sfix17_En15
  wire signed [39:0] sub_cast_12; // sfix40_En29
  wire signed [39:0] sub_cast_13; // sfix40_En29
  wire signed [40:0] sub_temp_6; // sfix41_En29
  wire signed [39:0] sub_cast_14; // sfix40_En29
  wire signed [39:0] sub_cast_15; // sfix40_En29
  wire signed [40:0] sub_temp_7; // sfix41_En29
  wire signed [39:0] b1multypeconvert4; // sfix40_En29
  wire signed [39:0] add_cast_6; // sfix40_En29
  wire signed [39:0] add_cast_7; // sfix40_En29
  wire signed [40:0] add_temp_3; // sfix41_En29
  wire signed [17:0] output_typeconvert; // sfix18_En13

  // Block Statements
  assign input_typeconvert = filter_in;

  assign mul_temp = input_typeconvert * scaleconst1;
  assign scale1 = $signed({{4{mul_temp[31]}}, mul_temp});

  assign scaletypeconvert1 = (scale1[35:0] + {scale1[20], {19{~scale1[20]}}})>>>20;

  //   ------------------ Section 1 ------------------

  assign typeconvert1 = (a1sum1[29:0] + {a1sum1[14], {13{~a1sum1[14]}}})>>>14;

  always @ (posedge clk)
    begin: delay_process_section1
      if (reset == 1'b1) begin
        delay_section1[0] <= 16'b0000000000000000;
        delay_section1[1] <= 16'b0000000000000000;
      end
      else begin
        if (enb == 1'b1) begin
          delay_section1[1] <= delay_section1[0];
          delay_section1[0] <= typeconvert1;
        end
      end
    end // delay_process_section1

  assign inputconv1 = scaletypeconvert1;

  assign a2mul1 = delay_section1[0] * coeff_a2_section1;

  assign a3mul1 = delay_section1[1] * coeff_a3_section1;

  assign b1mul1 = $signed({typeconvert1[15:0], 14'b00000000000000});

  assign unaryminus_temp = (delay_section1[1]==16'b1000000000000000) ? $signed({1'b0, delay_section1[1]}) : -delay_section1[1];
  assign b3mul1 = $signed({unaryminus_temp[16:0], 14'b00000000000000});

  assign sub_cast = $signed({inputconv1[15:0], 13'b0000000000000});
  assign sub_cast_1 = $signed({{8{a2mul1[31]}}, a2mul1});
  assign sub_temp = sub_cast - sub_cast_1;
  assign a2sum1 = sub_temp[39:0];

  assign sub_cast_2 = a2sum1;
  assign sub_cast_3 = $signed({{8{a3mul1[31]}}, a3mul1});
  assign sub_temp_1 = sub_cast_2 - sub_cast_3;
  assign a1sum1 = sub_temp_1[39:0];

  assign b1multypeconvert1 = $signed({{8{b1mul1[31]}}, b1mul1});

  assign add_cast = b1multypeconvert1;
  assign add_cast_1 = $signed({{8{b3mul1[31]}}, b3mul1});
  assign add_temp = add_cast + add_cast_1;
  assign b1sum1 = add_temp[39:0];

  assign section_result1 = (b1sum1[33:0] + {b1sum1[16], {15{~b1sum1[16]}}})>>>16;

  assign mul_temp_1 = section_result1 * scaleconst2;
  assign scale2 = $signed({mul_temp_1[33:0], 2'b00});

  assign scaletypeconvert2 = (scale2[35:0] + {scale2[20], {19{~scale2[20]}}})>>>20;

  //   ------------------ Section 2 ------------------

  assign typeconvert2 = (a1sum2[29:0] + {a1sum2[14], {13{~a1sum2[14]}}})>>>14;

  always @ (posedge clk)
    begin: delay_process_section2
      if (reset == 1'b1) begin
        delay_section2[0] <= 16'b0000000000000000;
        delay_section2[1] <= 16'b0000000000000000;
      end
      else begin
        if (enb == 1'b1) begin
          delay_section2[1] <= delay_section2[0];
          delay_section2[0] <= typeconvert2;
        end
      end
    end // delay_process_section2

  assign inputconv2 = scaletypeconvert2;

  assign a2mul2 = delay_section2[0] * coeff_a2_section2;

  assign a3mul2 = delay_section2[1] * coeff_a3_section2;

  assign b1mul2 = $signed({typeconvert2[15:0], 14'b00000000000000});

  assign unaryminus_temp_1 = (delay_section2[1]==16'b1000000000000000) ? $signed({1'b0, delay_section2[1]}) : -delay_section2[1];
  assign b3mul2 = $signed({unaryminus_temp_1[16:0], 14'b00000000000000});

  assign sub_cast_4 = $signed({inputconv2[15:0], 13'b0000000000000});
  assign sub_cast_5 = $signed({{8{a2mul2[31]}}, a2mul2});
  assign sub_temp_2 = sub_cast_4 - sub_cast_5;
  assign a2sum2 = sub_temp_2[39:0];

  assign sub_cast_6 = a2sum2;
  assign sub_cast_7 = $signed({{8{a3mul2[31]}}, a3mul2});
  assign sub_temp_3 = sub_cast_6 - sub_cast_7;
  assign a1sum2 = sub_temp_3[39:0];

  assign b1multypeconvert2 = $signed({{8{b1mul2[31]}}, b1mul2});

  assign add_cast_2 = b1multypeconvert2;
  assign add_cast_3 = $signed({{8{b3mul2[31]}}, b3mul2});
  assign add_temp_1 = add_cast_2 + add_cast_3;
  assign b1sum2 = add_temp_1[39:0];

  assign section_result2 = (b1sum2[33:0] + {b1sum2[16], {15{~b1sum2[16]}}})>>>16;

  assign mul_temp_2 = section_result2 * scaleconst3;
  assign scale3 = $signed({mul_temp_2[33:0], 2'b00});

  assign scaletypeconvert3 = (scale3[35:0] + {scale3[20], {19{~scale3[20]}}})>>>20;

  //   ------------------ Section 3 ------------------

  assign typeconvert3 = (a1sum3[29:0] + {a1sum3[14], {13{~a1sum3[14]}}})>>>14;

  always @ (posedge clk)
    begin: delay_process_section3
      if (reset == 1'b1) begin
        delay_section3[0] <= 16'b0000000000000000;
        delay_section3[1] <= 16'b0000000000000000;
      end
      else begin
        if (enb == 1'b1) begin
          delay_section3[1] <= delay_section3[0];
          delay_section3[0] <= typeconvert3;
        end
      end
    end // delay_process_section3

  assign inputconv3 = scaletypeconvert3;

  assign a2mul3 = delay_section3[0] * coeff_a2_section3;

  assign a3mul3 = delay_section3[1] * coeff_a3_section3;

  assign b1mul3 = $signed({typeconvert3[15:0], 14'b00000000000000});

  assign unaryminus_temp_2 = (delay_section3[1]==16'b1000000000000000) ? $signed({1'b0, delay_section3[1]}) : -delay_section3[1];
  assign b3mul3 = $signed({unaryminus_temp_2[16:0], 14'b00000000000000});

  assign sub_cast_8 = $signed({inputconv3[15:0], 13'b0000000000000});
  assign sub_cast_9 = $signed({{8{a2mul3[31]}}, a2mul3});
  assign sub_temp_4 = sub_cast_8 - sub_cast_9;
  assign a2sum3 = sub_temp_4[39:0];

  assign sub_cast_10 = a2sum3;
  assign sub_cast_11 = $signed({{8{a3mul3[31]}}, a3mul3});
  assign sub_temp_5 = sub_cast_10 - sub_cast_11;
  assign a1sum3 = sub_temp_5[39:0];

  assign b1multypeconvert3 = $signed({{8{b1mul3[31]}}, b1mul3});

  assign add_cast_4 = b1multypeconvert3;
  assign add_cast_5 = $signed({{8{b3mul3[31]}}, b3mul3});
  assign add_temp_2 = add_cast_4 + add_cast_5;
  assign b1sum3 = add_temp_2[39:0];

  assign section_result3 = (b1sum3[33:0] + {b1sum3[16], {15{~b1sum3[16]}}})>>>16;

  assign mul_temp_3 = section_result3 * scaleconst4;
  assign scale4 = $signed({mul_temp_3[33:0], 2'b00});

  assign scaletypeconvert4 = (scale4[35:0] + {scale4[20], {19{~scale4[20]}}})>>>20;

  //   ------------------ Section 4 ------------------

  assign typeconvert4 = (a1sum4[29:0] + {a1sum4[14], {13{~a1sum4[14]}}})>>>14;

  always @ (posedge clk)
    begin: delay_process_section4
      if (reset == 1'b1) begin
        delay_section4[0] <= 16'b0000000000000000;
        delay_section4[1] <= 16'b0000000000000000;
      end
      else begin
        if (enb == 1'b1) begin
          delay_section4[1] <= delay_section4[0];
          delay_section4[0] <= typeconvert4;
        end
      end
    end // delay_process_section4

  assign inputconv4 = scaletypeconvert4;

  assign a2mul4 = delay_section4[0] * coeff_a2_section4;

  assign a3mul4 = delay_section4[1] * coeff_a3_section4;

  assign b1mul4 = $signed({typeconvert4[15:0], 14'b00000000000000});

  assign unaryminus_temp_3 = (delay_section4[1]==16'b1000000000000000) ? $signed({1'b0, delay_section4[1]}) : -delay_section4[1];
  assign b3mul4 = $signed({unaryminus_temp_3[16:0], 14'b00000000000000});

  assign sub_cast_12 = $signed({inputconv4[15:0], 13'b0000000000000});
  assign sub_cast_13 = $signed({{8{a2mul4[31]}}, a2mul4});
  assign sub_temp_6 = sub_cast_12 - sub_cast_13;
  assign a2sum4 = sub_temp_6[39:0];

  assign sub_cast_14 = a2sum4;
  assign sub_cast_15 = $signed({{8{a3mul4[31]}}, a3mul4});
  assign sub_temp_7 = sub_cast_14 - sub_cast_15;
  assign a1sum4 = sub_temp_7[39:0];

  assign b1multypeconvert4 = $signed({{8{b1mul4[31]}}, b1mul4});

  assign add_cast_6 = b1multypeconvert4;
  assign add_cast_7 = $signed({{8{b3mul4[31]}}, b3mul4});
  assign add_temp_3 = add_cast_6 + add_cast_7;
  assign b1sum4 = add_temp_3[39:0];

  assign output_typeconvert = (b1sum4[33:0] + {b1sum4[16], {15{~b1sum4[16]}}})>>>16;

  // Assignment Statements
  assign filter_out = output_typeconvert;
endmodule  // filter