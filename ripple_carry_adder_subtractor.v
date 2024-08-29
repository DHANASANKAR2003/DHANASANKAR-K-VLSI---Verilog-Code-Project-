//Design Code
module full_adder(
  input a,b,cin,
  output s,cout
);
  assign {s, cout} = {a^b^cin, ((a & b) | (b & cin) | (a & cin))};
endmodule

module ripple_carry_adder_subtractor #(parameter SIZE = 4)(
   
  input [SIZE-1:0]A,B,
  input CTRL,
  output [SIZE-1:0]S,Cout);
  bit [SIZE-1:0] Bc;
  genvar g;
  
  assign Bc[0] = B[0] ^ CTRL;
  
  full_adder fa0(A[0],Bc[0],CTRL,S[0],Cout[0]);
  generate
    for(g = 1;g<SIZE;g++)begin
      assign Bc[g] = B[g] ^ CTRL;
      full_adder fa(A[g],Bc[g],Cout[g-1],S[g],Cout[g]);
    end
  endgenerate
endmodule


//Testbench code
module RCAS_tb;
  wire [3:0]S,Cout;
  reg [3:0]A,B;
  reg ctrl;
  
  ripple_carry_adder_subtractor rcas(A,B,ctrl,S,Cout);
  
  initial begin
    $monitor("CTRL=%b: A = %b, B = %b --> S = %b, Cout[3] = %b", ctrl, A, B, S, Cout[3]);
    ctrl = 0;
       A = 1; B = 0;
    #3 A = 2; B = 4;
    #3 A = 4'hb; B = 4'h6;
    #3 A = 5; B = 3;
    ctrl = 1;
    A = 1; B = 0;
    #3 A = 2; B = 4;
    #3 A = 4'hb; B = 4'h6;
    #3 A = 5; B = 3;
    #3 $finish;
  end
    initial begin
      $dumpfile("full_adder.vcd");
      $dumpvars;
    end
endmodule
