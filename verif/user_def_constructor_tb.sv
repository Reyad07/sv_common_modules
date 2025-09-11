class test;

    bit [31:0] data;

    function new();
        data = 10;
    endfunction

endclass

// new constructor expecting an argument
// by default it is set to a specific value
class test_2;

    bit [31:0] data;

    function new(input bit [31:0] din = 0);
        data = din;
    endfunction

endclass

// multiple arguments in a constructor with same name
class test_3;

    bit [31:0] data1;
    bit [5:0] data2;
    shortint data3;

    function new(input bit [31:0] data1 = '0, bit [5:0] data2 = '0, shortint data3 = '0);
        this.data1 = data1; // this refers to data1 declaredin this class not in this function
        this.data2 = data2;
        this.data3 = data3;
    endfunction

    task display;
        $display("Inside the Class- test_3: data1 = %0d, data2 = %0d, data3 = %0d", data1, data2,
                     data3);
    endtask

endclass

module user_def_constructor_tb;

    test t;
    test_2 t2;
    test_2 t3;
    test_3 t4;
    test_3 t5;

    initial begin
        t = new();
        t2 = new(17);
        t3 = new();
        t4 = new(299,63,16);    // assign value by position
        t5 = new(.data1(12), .data3(7), .data2());    // assign value by name
        $display("Data from test: %0d", t.data);
        $display("Data from test_2 t2: %0d", t2.data);
        $display("Data from test_2 t3: %0d", t3.data);
        $display("Data from test_3 t4 data1 = %0d, data2 = %0d, data3 = %0d", t4.data1, t4.data2,
                t4.data3);
        $display("Data from test_3 t5 data1 = %0d, data2 = %0d, data3 = %0d", t5.data1, t5.data2,
                t5.data3);
        t5.display; // calling the task from the class

    end


endmodule

// VIVADO Output:
// Data from test: 10
// Data from test_2 t2: 17
// Data from test_2 t3: 0
// Data from test_3 t4 data1 = 299, data2 = 63, data3 = 16
// Data from test_3 t5 data1 = 12, data2 = 0, data3 = 7
// Inside the Class- test_3: data1 = 12, data2 = 0, data3 = 7
