class one;
    int a = 21;

    function one copy();
        copy = new();
        copy.a = a;
    endfunction
endclass

class two;
    int b = 22;
    one o;

    function new();
        o = new();
    endfunction

    function two copy();
        copy = new();
        copy.b = b;
        copy.o = o.copy(); // using custom copy method of class one
    endfunction

endclass

module class_deep_copy_tb;

    two t1, t2;

    initial begin
        t1 = new();
        t2 = new();
        t1.b = 50;
        t2 = t1.copy(); // using custom copy method
        $display("t2.b = %0d", t2.b);
        t2.b = 100;     // changing t2.b should not affect t1.b
        $display("After changing t1.b = %0d", t1.b);
        t2.o.a = 200;   // changing t2.o.a should not affect t1.o.a as deep copy is used
        $display("After changing t2.o.a = %0d", t2.o.a);
        $display("t1.o.a = %0d", t1.o.a); // t1.o.a should remain unchanged
    end

endmodule

//VIVADO Output:
// t2.b = 50
// After changing t1.b = 50
// After changing t2.o.a = 200
// t1.o.a = 21
