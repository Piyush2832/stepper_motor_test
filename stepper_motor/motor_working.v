
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:55:47 05/15/2023 
// Design Name: 
// Module Name:    motor_working 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module motor_working(
   
  input clk,
  input dir_ip,
  output reg square_wave, 
  output reg pin1,
  output  reg pin2
 
);
reg [23:0] distZ = 1500;
reg [23:0] counter = 0;
reg toggle = 1;
wire [23:0] store;
wire [15:0] distA;
reg [15:0] distB =0;
reg stop =0;

reg [23:0] rpm = 300;

assign distA =40*distZ;
assign store = (18 * 100000)/ rpm;



always @(posedge clk)



if (stop==0)
begin
counter <= counter + 1;
    if (counter == store )
  begin
   toggle=~ toggle;
		counter<=0;
		if (dir_ip == 1)
begin
pin1 = 0;
pin2 = 1;
end
else
begin
pin1 = 1;
pin2 = 0;
end
	
	   if (toggle==0)
	begin
   distB <= distB +1;

	 end
	 end
  
  if (distB ==distA)
  begin
  stop = 1;
	 
	 
	 
	end
	else
	
	begin
	square_wave <= toggle;
	
end
	end

      endmodule


