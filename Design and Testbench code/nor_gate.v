data flow modeling
module nor_gate(A,B,Y);
	input A,B;
	output Y;
	assign Y = ~(A|B);
endmodule	

testbench code
module nor_gate_tb;
reg A,B;
wire Y;
nor_gate norgate(.A(A),.B(B),.Y(Y));
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
