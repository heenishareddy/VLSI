module alu_tb;
reg c; //Clock
reg r; //Reset
reg [3:0] s; //Select
reg [15:0] X; //Input
reg [15:0] Y; //Input
wire [31:0] Z; //Output
// Instantiating the unit under test
alu uut (
.c(c),
.r(r),
.s(s),
.X(X),
.Y(Y),
.Z(Z)
);
initial begin
c=0; r=0; s=4'h0; X=16'h0; Y=16'h0; #100; // Reset and wait for 100ns
r=1; s=4'h0; X=16'h28; Y=16'h14; #100; // Performing addition and waiting for 100ns
r=1; s=4'h1; X=16'h28; Y=16'h14; #100; // Performing subtraction and waiting for 100ns
r=1; s=4'h2; X=16'h28; Y=16'h14; #100; // Performing multiplication and waiting for 100ns
r=1; s=4'h3; X=16'h28; Y=16'h14; #100; // Performing division and waiting for 100ns
r=1; s=4'h4; X=16'h28; Y=16'h14; #100; // Shifting to the left by one bit and waiting for 100ns
r=1; s=4'h5; X=16'h28; Y=16'h14; #100; // Shifting to the right by one bit and waiting for 100ns
r=1; s=4'h6; X=16'h28; Y=16'h14; #100; // Rotating to the left by one bit and waiting for 100ns
r=1; s=4'h7; X=16'h28; Y=16'h14; #100; // Rotating to the right by one bit and waiting for 100ns
r=1; s=4'h8; X=16'h28; Y=16'h14; #100; // Performing logical AND operation and waiting for 100ns
r=1; s=4'h9; X=16'h28; Y=16'h14; #100; // Performing logical OR operation and waiting for 100ns
r=1; s=4'ha; X=16'h28; Y=16'h14; #100; // Performing logical NOR operation and waiting for 100ns
r=1; s=4'hb; X=16'h28; Y=16'h14; #100; // Performing logical NAND operation and waiting for 100ns
r=1; s=4'hc; X=16'h28; Y=16'h14; #100; // Performing logical XOR operation and waiting for 100ns
r=1; s=4'hd; X=16'h28; Y=16'h14; #100; // Performing logical XNOR operation and waiting for 100ns
r=1; s=4'he; X=16'h28; Y=16'h14; #100; // Setting the output to 1 if "X" is less than "Y", or setting the
output to 0 and waiting for 100ns
r=1; s=4'hf; X=16'h28; Y=16'h14; #100; // Setting the output to 1 if "X" is equal to "Y", or setting the
output to 0 and waiting for 100ns
#100; // delay
$finish; // end of simulation
end
always #50 c = ~c; // generating the clock signal every 50ns by toggling
endmodule