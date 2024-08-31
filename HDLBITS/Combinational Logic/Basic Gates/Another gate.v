module top_module (
    input in1,
    input in2,
    output out);
    
    wire wire1;
    assign wire1 = ~in2;
    assign out = in1 & wire1; 

endmodule
