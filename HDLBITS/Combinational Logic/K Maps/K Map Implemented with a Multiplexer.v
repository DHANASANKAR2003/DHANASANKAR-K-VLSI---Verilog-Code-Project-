module top_module (
    input c,
    input d,
    output [3:0] mux_in
); 
    assign out_sop = (c&d)|(~a&~b&c);
    assign out_pos = c&(~b|~c|d)&(~a|~c|d);

endmodule
