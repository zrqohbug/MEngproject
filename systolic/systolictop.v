//========================================================================
// Datapath Components for Projectdesign_Systolic_V_datapath
//========================================================================
`define data_size 8
`define axis_num 3




module systolictop
(
 input wire clk,reset,
 input wire [`data_size-1:0] a1,a2,b1,b2,
 input wire [`axis_num-1:0] i,j,
 output wire [2*`data_size-1:0] c1,c2,c3,c4
);

 wire [`data_size-1:0] a12,a34,b13,b24;
 wire [`axis_num-1:0] x,y;
 wire clear1,clear2,clear3,clear4;
 wire [1:0] v;
 systolicCU ctrl1(.clk(clk), .reset(reset), .v(v), .x(x), .y(y), .i(i), .j(j), .clear1(clear1), .clear2(clear2), .clear3(clear3), .clear4(clear4), .a1(a1), .a2(a2), .b1(b1), .b2(b2));
 processelement pe1 (.clk(clk), .reset(reset), .MUL_A_in(a1),  .MUL_B_in(b1),  .MUL_A_out(a12), .MUL_B_out(b13), .MUL_C_out(c1), .clear(clear1));
 processelement pe2 (.clk(clk), .reset(reset), .MUL_A_in(a12), .MUL_B_in(b2),  .MUL_A_out(),    .MUL_B_out(b24), .MUL_C_out(c2), .clear(clear2));
 processelement pe3 (.clk(clk), .reset(reset), .MUL_A_in(a2),  .MUL_B_in(b13), .MUL_A_out(a34), .MUL_B_out(),    .MUL_C_out(c3), .clear(clear3));
 processelement pe4 (.clk(clk), .reset(reset), .MUL_A_in(a34), .MUL_B_in(b24), .MUL_A_out(),    .MUL_B_out(),    .MUL_C_out(c4), .clear(clear4));
 systolicmemory mem1(.clk(clk), .reset(reset), .c1(c1), .c2(c2), .c3(c3), .c4(c4), .mem_sel(v), .x(x), .y(y) );

endmodule


