class one;

    local int data = 40;

    // task for setting data since data is local to this class
    task set(input int data);
        this.data = data;
    endtask

    // function that will return the value of data
    function int get();
        return data;
    endfunction

    task display;
        $display("Inside class one- data: %0d",data);
    endtask

endclass

class two;

    one o;

    function new();
        o = new();
    endfunction

endclass

module class_scope_tb;

    two t;

    initial begin
        t = new();
        // the following display will return compile error since accessing local data
        // $display("value of data from class 0ne is %0d", t.o.data);
        $display("value of data from class 0ne is %0d", t.o.get()); // get function can be called
                                                                    // to get the value of data

        t.o.display;    // valid output

        // to change the data inside class one:
        t.o.set(111);
        t.o.display;

    end

endmodule

// VIVADO Output:
// value of data from class 0ne is 40
// Inside class one- data: 40
// Inside class one- data: 111
