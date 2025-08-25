//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Reyad 
// 
// Create Date: 08/06/2025 03:13:41 PM
// Design Name: 
// Module Name: array_initialization_tb 
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: array initialization systems 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

`timescale 1ns / 1ps    // 10^3 -> 3 precision

module array_initialization_tb; 

    // uninitalized array
    bit     arr1[]; // default value 0 since bit is 2 state
    logic   arr2[]; // default value X since logic 4 state

    initial begin
        $display("arr1: %0p", arr1);
        $display("arr2: %0p", arr2);
    end
    
    // Unique value array
    int arr3[5] = '{2,4,5,6,8};
    // int arr3[5] = '{2,6,7,8}; // compiler error: array size not matched

    initial begin
        $display("arr3: %0p", arr3);
    end

    // Repetitive value array
    int arr4[5] = '{5{6}}; // all the elements are 0

    initial begin
        $display("arr4: %0p", arr4);
    end

    // default value array
    int arr5[8] = '{default:3}; // all the elements are 3

    initial begin
        $display("arr5: %0p", arr5);
    end

    initial begin
        #200;
        $finish();
    end


endmodule
