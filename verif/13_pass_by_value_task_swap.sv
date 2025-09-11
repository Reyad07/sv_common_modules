module pass_by_value_task_swap_tb;

    task swap(input bit [3:0]a, input bit [3:0] b);
        int temp;
        temp = a;
        a = b;
        b = temp;
        $display("Task: Value of a:%0d and b: %0d",a,b);
    endtask

    bit [3:0] a,b;

    initial begin
        a = 2;
        b = 5;
        swap();
        $display("Initial block: a = %0d and b: %0d",a,b);
    end

endmodule
