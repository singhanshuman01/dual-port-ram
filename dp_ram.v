module dp_ram(
    output reg [7:0] rdata_a,
    output reg [7:0] rdata_b,
    input clk_a,
    input rst_a,
    input ren_a,
    input [7:0] raddr_a,
    input wen_a,
    input [7:0] waddr_a,
    input [7:0] wdata_a,
    input clk_b,
    input rst_b,
    input ren_b,
    input [7:0] raddr_b,
    input wen_b,
    input [7:0] waddr_b,
    input [7:0] wdata_b
);

reg [7:0] mem [0:255];

always @(posedge clk_a or negedge rst_a) begin
    if(!rst_a) rdata_a <= 8'bx;
    else begin
        if(wen_a) begin
            mem[waddr_a] <= wdata_a;
        end
        if (ren_a) begin
            rdata_a <= mem[raddr_a];
        end
    end
end

always @(posedge clk_b or negedge rst_b) begin
    if(!rst_b) rdata_b <= 8'bx;
    else begin
        if(wen_b && !(wen_a && (waddr_a==waddr_b))) mem[waddr_b] <= wdata_b;
        if (ren_b) begin
            rdata_b <= mem[raddr_b];
        end
    end
end

endmodule