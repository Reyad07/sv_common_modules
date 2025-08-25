

//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Reyad 
// 
// Create Date: 08/06/2025 03:13:41 PM
// Design Name: 
// Module Name: fraction_clk 
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: generate clk using parameters like phase, ton, toff
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

`timescale 1ns / 1ps    // 10^3 -> 3 precision

module clk_gen_parameter_task; 

    reg clk   = 0;    // 100MHz
    reg clk50 = 0; 

    always #5 clk= ~clk;  
    
    task clk_gen(input real phase, input real ton, input real toff);
        #phase;
        while(1) begin
            clk50 = 1;
            #ton;
            clk50 = 0;
            #toff;
        end
    endtask

    initial begin
        clk_gen(7,5,5);
    end

    initial begin
        $dumpfile("dump.vcd");
        $dumpvars;
    end

    initial begin
        #200;
        $finish();
    end


endmodule
