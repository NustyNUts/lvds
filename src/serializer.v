module serializer(
input wire clk,
input wire[6:0] data,
output reg p,
output reg n);
reg [2:0] i;
always@(posedge clk)
begin
 p = data[i];
 n = ~data[i];
 i=i+1; 
end
endmodule
