class test0;
    bit [4:0] din = 0;

    task display;
        $display("Inside class din: %0d",din);
    endtask
endclass

class test1;

    test0 f;

    function new();
        f = new();
    endfunction

endclass

module class_class_tb;

    test1 t;

    initial begin
        t = new();
        $display("Value of din is: %0d", t.f.din);
        t.f.din = 24;
        t.f.display;
        $display("Value of din is: %0d", t.f.din);
    end

endmodule

// VIVADO Output:
// Value of din is: 0
// Inside class din: 24
