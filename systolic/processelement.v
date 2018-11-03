//========================================================================
// Datapath Components for Projectdesign_Systolic_V_datapath
//========================================================================
`define data_size 8
`ifndef processelement_V
`define processelement_V


 
module processelement
(
  input  wire clk,
  input  wire [`data_size-1:0] MUL_A_in,
  input  wire [`data_size-1:0] MUL_B_in,
  //input  wire logic [1:0] porcess_type_in,
  input  wire reset,
  input  wire clear,
  output reg [2*`data_size-1:0] MUL_C_out,
  output reg [2*`data_size-1:0] MUL_A_out,
  output reg [2*`data_size-1:0] MUL_B_out
);

  wire [63:0] RESULT;
  wire [63:0] NEXT_RESULT;
  assign RESULT = MUL_A_in * MUL_B_in;
  assign NEXT_RESULT = clear ? RESULT : RESULT + MUL_C_out;

  always @( posedge clk ) begin
    if ( reset ) begin
      MUL_C_out <= 64'b0;
      MUL_A_out <= 64'b0;
      MUL_B_out <= 64'b0;
	 end
    else begin
      MUL_C_out <= NEXT_RESULT;
      MUL_A_out <= MUL_A_in;
      MUL_B_out <= MUL_B_in;
	 end
   end

endmodule
`endif




