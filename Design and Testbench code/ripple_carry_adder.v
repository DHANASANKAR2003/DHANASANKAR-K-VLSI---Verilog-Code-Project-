//Design code
module full_adder(
  input a,b,cin,
  output s,cout);
  
  assign {s,cout} = {a^b^cin,((a&b)|(a&cin)|(b&cin))};
endmodule

module ripple_carry_adder#(parameter SIZE = 4)(
  input [SIZE-1:0]A,B,
  input Cin,
  output [SIZE-1:0]S,Cout);
  
  genvar g;
  
  full_adder fa0(A[0],B[0],Cin,S[0],Cout[0]);
  generate
    for(g = 1;g<SIZE;g++)
      begin
        full_adder fa(A[g],B[g],Cout[g-1],S[g],Cout[g]);
      end
  endgenerate
endmodule


//Testbench code
module RCA_tb;
  wire [0:3]S,Cout;
  reg [0:3]A,B;
  reg Cin;
  wire [0:4]add;
  
  ripple_carry_adder RCA(A,B,Cin,S,Cout);
  assign add = {Cout[3],S};
  
  initial begin
    $monitor("A = %b: B = %b, Cin = %b --> S = %b, Cout[3] = %b, Addition = %0d", A, B, Cin, S, Cout[3], add);
    
    A = 1; B = 0; Cin = 0; #3;
    A = 2; B = 4; Cin = 1; #3;
    A = 4'hb; B = 4'h6; Cin = 0; #3;
    A = 5; B = 3; Cin = 1; #3;
    $finish;
  end
  
  initial begin
    $dumpfile("full_adder.vcd");
    $dumpvars;
  end
endmodule
  
  
