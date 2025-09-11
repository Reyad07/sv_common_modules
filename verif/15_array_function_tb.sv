module array_function_tb;

    bit [3:0] res[16];

    //array initialization
    //to use array in a function without using a lot of memory use ref
    //ref goes with automatic
    function automatic void init_array(ref bit[3:0] a[16]);
        for (int i=0; i<16; i++) begin
            a[i] = i;
        end
    endfunction

    initial begin
        init_array(res);

        for (int i=0; i<16; i++) begin
           $display("res[%0d]: %0d",i,res[i]);
        end
        $display("array contains: %0p",res);
    end
endmodule

//VIVADO output:
// res[0]: 0
// res[1]: 1
// res[2]: 2
// res[3]: 3
// res[4]: 4
// res[5]: 5
// res[6]: 6
// res[7]: 7
// res[8]: 8
// res[9]: 9
// res[10]: 10
// res[11]: 11
// res[12]: 12
// res[13]: 13
// res[14]: 14
// res[15]: 15
// array contains: '{0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15}
