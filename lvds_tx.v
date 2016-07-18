module lvds_tx(
input wire [7:0] r,
input wire [7:0] g,
input wire [7:0] b,
input wire HSYNC,
input wire VSYNK,
input wire clk,

output wire tx0_p,
output wire tx0_n,

output wire tx1_p,
output wire tx1_n,

output wire tx2_p,
output wire tx2_n,

output wire tx3_p,
output wire tx3_n);
wire clkx7;
wire locked;
reg [7:0] red;
reg [7:0] green;
reg [7:0] blue;
pll uut_clkx7(reset,clk,clkx7,locked);

serializer pair0(clkx7,{green[2],red[7:2]},tx0_p,tx0_n);
serializer pair1(clkx7,{blue[3:2],green[7:3]},tx1_p,tx1_n);
serializer pair2(clkx7,{DEN,VSYNK,HSYNC,blue[7:4]},tx2_p,tx2_n);
serializer pair3(clkx7,{CTRL,blue[1:0],green[1:0],red[1:0]},tx3_p,tx3_n);

always@(posedge clk)
begin
	red = r;
	green = g;
	blue = b;
end
endmodule


