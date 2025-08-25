
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Reyad 
// 
// Create Date: 08/06/2025 03:13:41 PM
// Design Name: 
// Module Name: clk gen calc_task 
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: generate clk using parameters like phase, ton, toff with task
// and autocalculation from the user provided frequency, duty cycle, phase.
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

`timescale 1ns / 1ps    // 10^3 -> 3 precision

module clk_gen_calc_task_tb; 

    reg clk   = 0;    // 100MHz
    reg clk2 = 0; 

    always #5 clk= ~clk;  
    
    task clk_calc(input real frequency, input real duty_cycle, input real phase,
        output real phase_out, output real ton, output real toff);
        automatic real Tp = (1/frequency)* (1000_000_000); //ns
        phase_out = phase;
        ton = (Tp * duty_cycle) ; 
        toff = Tp - ton;
    endtask

    task clk_gen(input real phase, input real ton, input real toff);
        @(posedge clk); // to generate the clk2 signal aligining with clk signal
        #phase;
        while(1) begin
            clk2 = 1;
            #ton;
            clk2 = 0;
            #toff;
        end
    endtask

    real phase, ton, toff;

    initial begin
        clk_calc(100_000_000, 0.3, 7, phase, ton, toff); //frequency 100MHz
        clk_gen(phase, ton, toff);
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
