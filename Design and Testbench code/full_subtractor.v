//Design code
module full_sub(input a,b, b_in, output diff,b_out);
  assign diff = a^b^b_in;
  assign b_out = (~a&b)|(~(a^b)&b_in);
endmodule

//Testbench code
module tb_top;
  reg a,b,b_in;
  wire diff,b_out;
  
  full_sub fs(a,b,b_in,diff,b_out);
  
  initial begin
    
    $monitor("At Time %0t: a = %b b = %b b_in = %b, diff = %b b_out = %b",$time, a,b,b_in,diff,b_out);
    
    
    a = 0; b = 0; b_in = 0;
    #10;
    a = 0; b = 0; b_in = 1;
    #10;
    a = 0; b = 1; b_in = 0;
    #10;
    a = 0; b = 1; b_in = 1;
    #10;
    a = 1; b = 0; b_in = 0;
    #10;
    a = 1; b = 0; b_in = 1;
    #10;
    a = 1; b = 1; b_in = 0;
    #10
    a = 1; b = 1; b_in = 1;
   
    
   
  end
endmodule
