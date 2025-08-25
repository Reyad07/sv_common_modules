module pass_by_ref_task_swap_tb;
    
    // automatic is required to use with ref
    //const ref: no changing data is allowed
    //ref: data changing is allowed
    task automatic swap(const ref bit [3:0]a,ref bit[3:0] b);   //function automatic bit [3:0] swap(arg)
        int temp;
        temp = a;
        //a = b;    //ERROR: because we are trying to change const ref value 
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
