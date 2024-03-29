module alu(c, s, r, X, Y, Z);
input c,r; // inputs- clock and reset
input [3:0] s; // select line for operations
input [15:0] X,Y; // 16-bit inputs
output reg [31:0] Z; // 32-bit output
reg [31:0] out; //output register
wire [31:0] w; //output wire 
parameter Add= 4'd0, Substract=4'd1, Multiply= 4'd2, Divide=4'd3, //Arthematic Operations
Shift_left =4'd4, Shift_right= 4'd5,Rotate_left=4'd6, Rotate_right = 4'd7, //Shift & Rotate
AND = 4'd8, OR = 4'd9, NOR = 4'd10, NAND = 4'd11, XOR = 4'd12, XNOR = 4'd13, //Logic Operations
Set_less_than = 4'd14, set_if_equal=4'd15; //less than & equal to
always @ (negedge c ) // Triggers the block on the positive edge of a clock signal only Begin
 
 if (r==1'b0)
out<=32'b0; // active low reset
else
case (s) //Based on the select line
Add : out <= X + Y ; // Addition between two inputs
Substract : out <= X - Y ; // Subtraction between two inputs
Multiply : out <= X * Y ; // Multiplication between two inputs
Divide : out <= X / Y ; // Division between two inputs
Shift_left : out <= X << 1; // Input is shifted to the left by 1 bit
Shift_right : out <= X >> 1; // Input is shifted to left by 1 bit
Rotate_left : out <= {X [14:0], X[15]}; // Input is rotated to the left by 1 bit Rotate_right : out <= {X [0], X[15:1]}; // Input is rotated to the right by 1 bit
AND : out <= X & Y; // Logical AND function is performed between two inputs
OR : out <= X | Y; // Logical OR function is performed between two inputs
NOR : out <= ~ (X | Y); // Logical NOR function is performed between two inputs NAND : out <= ~ (X & Y); // Logical NAND function is performed between two inputs XOR : out <= X ^ Y; // Logical XOR function is performed between two inputs
XNOR : out <= ~ (X ^ Y) ; // Logical XNOR function is performed between two inputs
Set_less_than : out <= (X < Y)? 32'b1 : 32'b0; // Output is set to 1 if first input is less than second input
set_if_equal : out <= (X == Y)? 32'b1 : 32'b0; // Output is set to 1 if first input is equal to second input
default : out <= 32'd0; // For any other values, the output is reset Endcase

end
//D Flip-flop
d_ff d1(out,c,r,w); //D Flip-flop inputs and outputs
always@(negedge c) // Triggers the block on the negative edge of a clock signal only begin
Z<=w;
end
endmodule
module d_ff(d,c,r,w);
input c,r; // inputs- clock & reset
input [31:0]d; // 32-bit input
output reg[31:0]w; // 32-bit output register
always @( negedge c)
begin
if (r == 1'b0)
w<=64'b0; // active low reset
else
w<=d;
end
endmodule