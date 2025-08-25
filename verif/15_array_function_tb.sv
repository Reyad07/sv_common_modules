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
           $display("res[%0d]: %0d",i,res[i]; 
        end
    endfunction

    end
endmodule
