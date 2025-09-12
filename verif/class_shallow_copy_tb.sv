class one;
    int din = 12;
endclass

class two;
    int dm = 87;
    one o;

    function new();
        o = new();
    endfunction
endclass

module class_shallow_copy_tb;

    two t1,t2;

    initial begin
        t1 = new();
        t1.o.din = 45;
        t1.dm = 99;
        t2 = new t1; // using default shallow copy
        $display("t2.dm = %0d, t2.o.din = %0d", t2.dm, t2.o.din);
        t2.dm = 100;    // changing t2.dm should not affect t1.dm
        t2.o.din = 200; // changing t2.o.din should affect t1.o.din as it is a handler of class one
        $display("After changing t2.dm = %0d, t2.o.din = %0d", t2.dm, t2.o.din);
        $display("t1.dm = %0d, t1.o.din = %0d", t1.dm, t1.o.din); // t1.o.din should change as well
                                                               // since it is a shallow copy
    end

endmodule

//VIVADO Output:
// t2.dm = 99, t2.o.din = 45
// After changing t2.dm = 100, t2.o.din = 200
// t1.dm = 99, t1.o.din = 200
