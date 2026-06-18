module dp_ram (
    output reg [7:0] rdata_a,
    output reg [7:0] rdata_b,

    input clk, 

    input wen_a,
    input [7:0] addr_a,
    input [7:0] wdata_a,
    
    input wen_b,
    input [7:0] addr_b,
    input [7:0] wdata_b
);

reg [7:0] mem [0:255];

always @(posedge clk) begin
    if(wen_a) mem[addr_a] <= wdata_a;
    else rdata_a <= mem[addr_a];
end

always @(posedge clk) begin
    if(wen_a) mem[addr_b] <= wdata_b;
    else rdata_b <= mem[addr_b];
end

endmodule