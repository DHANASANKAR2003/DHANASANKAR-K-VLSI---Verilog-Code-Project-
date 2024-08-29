//Design code
module half_sub(input a,b, output diff,borr);
  assign diff = a^b;
  assign borr = ~a&b;
endmodule

//Testbench code
module tb_top;
  reg a,b;
  wire diff, borr;
  
  half_sub hs(a,b,diff,borr);
  
  initial begin
    
    $monitor("At Time %0t: a = %b b = %b, diff = %b borr = %b",$time, a,b,diff,borr);
    
    
    a = 0; b = 0;
    #10;
    a = 0; b = 1;
    #10;
    a = 1; b = 0;
    #10;
    a = 1; b = 1;
   
  end
endmodule
