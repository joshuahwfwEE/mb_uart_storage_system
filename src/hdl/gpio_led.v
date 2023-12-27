`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/07/29 13:50:18
// Design Name: 
// Module Name: gpio
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module gpio_led(
    input clk,
    input rstn,
//    output [7:0] pmod,
    output [2:0] led,
    input [2:0] uart_rx,
    output [2:0] uart_tx
    );

reg [25:0] cnt;
    
assign uart_tx[0] = uart_rx[0];  
assign uart_tx[1] = uart_rx[1];  
assign uart_tx[2] = uart_rx[2];  

//assign pmod = {8{cnt[25]}};
assign led = {3{cnt[25]}};

always@(posedge clk or negedge rstn) begin
    if(~rstn)
        cnt <= 0;
    else
        cnt <= cnt + 1;
end
    
endmodule
