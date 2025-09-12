class test;

    int din = 0;
    logic [7:0] opcode = 8'hFF;

    function test copy();
        copy = new();
        copy.din = din;
        copy.opcode = opcode;
    endfunction

endclass

module class_custom_copy_tb;

    test t1;
    test t2;

    initial begin
        t1 = new();
        t2 = new();

        t2 = t1.copy(); // using custom copy method
        $display("t2.din = %0d, t2.opcode = %0h", t2.din, t2.opcode);
        t2.din = 200;
        t2.opcode = 8'hAA;
        $display("After changing t2.din = %0d, t2.opcode = %0h", t2.din, t2.opcode);
        $display("t1.din = %0d, t1.opcode = %0h", t1.din, t1.opcode); // t1.din and t1.opcode should
                                                                      // remain unchanged

    end

endmodule

//VIVADO Output:
// t2.din = 0, t2.opcode = ff
// After changing t2.din = 200, t2.opcode = aa
// t1.din = 0, t1.opcode = ff
