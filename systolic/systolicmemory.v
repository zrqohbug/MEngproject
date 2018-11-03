//========================================================================
// Components for Projectdesign_Systolicmemory
//========================================================================
`define data_size 8
`define axis_num 3
`ifndef systolictop
`define systolictop



module systolicmemory
(
 input wire clk,reset,
 input wire [2*`data_size-1:0] c1,c2,c3,c4,
 input wire [`axis_num-1:0] x,y,
 input wire [1:0] mem_sel
 //output wire [2*`data_size-1:0] c1,c2,c3,c4
);


reg [7:0] matrix [0:7] [0:7];
//wire [2*`data_size:0] q;
//assign q = ( mem_sel == 0 )? c1 : ( mem_sel == 1 )? c2 : ( mem_sel == 2 )? c3 : c4;

always @( posedge clk ) begin
   if ( reset ) begin
    	matrix[x][y] = 8'b0;
	end
	else begin
	if (mem_sel == 1) begin
		matrix[x][y] = c1;
	end
	else if (mem_sel == 2) begin
		matrix[x][y+1] = c2;
		matrix[x+1][y] = c3;
	end
	else if (mem_sel == 3) begin
		matrix[x+1][y+1] = c4;
	end
	end
end

endmodule



`endif
