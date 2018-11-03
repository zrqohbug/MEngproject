//========================================================================
// Datapath Components for Projectdesign_Systolic_V_datapath
//========================================================================
`define data_size 8
`define axis_num 3




module systolicCU
(
 input wire clk,reset,
 input wire [`data_size-1:0] a1,a2,b1,b2,
 input wire [`axis_num-1:0] i,j,
 output reg [1:0] v,
 output reg [`axis_num-1:0] x,y,
 output reg clear1,clear2,clear3,clear4
);
localparam
	s0 = 0,
	s1 = 1,
	s2 = 2,
	s3 = 3,
	s4 = 4,
	s5 = 5,
	s6 = 6,
	s7 = 7,
	s8 = 8,
	s9 = 9,
	s10= 10;

	reg [4:0] state_reg,state_next;
always @(posedge clk, posedge reset) begin
    if (reset) begin
        state_reg <= s0;
    end
    else begin
        state_reg <= state_next;
    end
end 

always @(state_reg or a1) begin 
    case (state_reg)
        s0 : begin
            if ( a1 != 0) begin  // if (input1 = 2'b01) then
                state_next = s1; 
            end
            else begin // remain in current state
                state_next = s0; 
            end
        end
        s1 : begin
                state_next = s2; 
            end

        s2 : begin
                state_next = s3; 
            end

        s3 : begin
                state_next = s4; 
            end

        s4 : begin
                state_next = s5; 
            end

        s5 : begin
                state_next = s6; 
            end

        s6 : begin
                state_next = s7; 
            end

		  s7 : begin
                state_next = s8; 
            end

		  s8 : begin
                state_next = s9; 
            end
		  s9 : begin
                state_next = s10; 
            end
		  s10 : begin
                state_next = s3; 
            end

    endcase
end 
    
// combination output logic
// This part contains the output of the design
// no if-else statement is used in this part
// include all signals and input in sensitive-list except state_next
always @(state_reg) begin
    case (state_reg)  
        s0 : begin
				x = 0;
				y = 0;
				v = 0;
				clear1 = 0;
				clear2 = 0;
				clear3 = 0;
				clear4 = 0;
        end
        s3 : begin
				x = 0;
				y = 0;
				v = 0;
				clear1 = 0;
				clear2 = 0;
				clear3 = 0;
				clear4 = 0;
        end
        s8 : begin
				x = i;
				y = j;
				v = 1;
				clear1 = 1;
				clear2 = 0;
				clear3 = 0;
				clear4 = 0;
        end
		  s9 : begin
				v = 2;
				clear1 = 0;
				clear2 = 1;
				clear3 = 1;
				clear4 = 0;
        end
		  s10 : begin
				v = 3;
				clear1 = 0;
				clear2 = 0;
				clear3 = 0;
				clear4 = 1;
        end
		  default: begin
				x = 0;
				y = 0;
				v = 0;
				clear1 = 0;
				clear2 = 0;
				clear3 = 0;
				clear4 = 0;
		   end
    endcase
end 
    
endmodule


