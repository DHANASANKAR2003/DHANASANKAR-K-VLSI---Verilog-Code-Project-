//Design code
module full_adder(input a,b,c_in, output s,c_out);
  assign s = a ^ b ^ c_in;
  assign c_out = (a & b)|(a % c_in)|(a & c_out);
endmodule  

//Testbench code
module tb_top;
  reg a,b,c_in;
  wire s,c_out;
  
  full_adder fa(a,b,c_in,s,c_out);
  
  initial begin
    $monitor("At Time %0t: a = %b b = %b c_in = %b, sum = %b c_out = %b",$time, a,b,c_in,s,c_out);
    
    
    a = 0; b = 0; c_in = 0;
    #10;
    a = 0; b = 0; c_in = 1;
    #10;
    a = 0; b = 1; c_in = 0;
    #10;
    a = 0; b = 1; c_in = 1;
    #10;
    a = 1; b = 0; c_in = 0;
    #10;
    a = 1; b = 0; c_in = 1;
    #10;
    a = 1; b = 1; c_in = 0;
    #10;
    a = 1; b = 1; c_in = 1;
  end
endmodule
