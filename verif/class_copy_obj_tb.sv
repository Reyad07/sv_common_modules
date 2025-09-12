class test;

    int din = 0;

endclass

module class_copy_obj_tb;

    test t1;
    test t2;

    initial begin
        t1 = new();
        t1.din = 100;
        $display("t1.din = %0d", t1.din);

        t2 = new t1;
        $display("t2.din = %0d", t2.din);
        t2.din = 200;
        $display("After changing t2.din = %0d", t2.din);
        $display("t1.din = %0d", t1.din); // t1.din should remain unchanged
    end

endmodule
