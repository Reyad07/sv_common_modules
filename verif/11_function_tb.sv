module function_tb;

    function bit [4:0] add(input bit [3:0]a=4'b0000,b=4'b0000);
        return a+b;
    endfunction

    bit [4:0] result=0;
    bit [4:0] result1=0;
    bit [3:0] ain =4'b0100;
    bit [3:0] bin =4'b1010;

    function bit [7:0] mul();
        return ain*bin; //will work
    endfunction

    function void display_ain_bin();    //no return function: used for display
        //#10;  //ERROR: timing is not allowed
        $display("Value of ain: %0d and bin: %0d",ain,bin);
    endfunction

    initial begin
        result = add(ain,bin);
        result1= mul(); //will work as ain and bin is defined before the function is created.
        display_ain_bin();
        $display("Value of addition: %0d",result);
    end

endmodule
