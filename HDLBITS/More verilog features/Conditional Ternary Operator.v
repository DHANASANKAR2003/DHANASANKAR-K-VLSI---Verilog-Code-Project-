module top_module (
    input [7:0] a, b, c, d,
    output [7:0] min);//
    
    wire [7:0]wire1,wire2;
    
    assign wire1 = (a<b) ? a:b;
    assign wire2 = (wire1<c) ? wire1:c;
    assign min = (wire2<d) ? wire2:d;

    // assign intermediate_result1 = compare? true: false;

endmodule
