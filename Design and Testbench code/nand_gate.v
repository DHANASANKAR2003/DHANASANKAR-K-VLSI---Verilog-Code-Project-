data flow modeling
module nand_gate(A,B,Y);
	input A,B;
	output Y;
	assign Y = ~(A&B);
endmodule	

testbench code
module and_gate_tb;
reg A,B;
wire Y;
nand_gate nandgate(.A(A),.B(B),.Y(Y));
initial begin

	#10 A =1 'b0;B =1 'b0;
	#10 A =1 'b0;B =1 'b1;
	#10 A =1 'b1;B =1 'b0;
	#10 A =1 'b1;B =1 'b1;
$finish;
end
always@(Y)
	$monitor("time=%0t\tINPUT VALUES: \t A=%b B=%b \t output values Y =%b",$time,A,B,Y);
endmodule
