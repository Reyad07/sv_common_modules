class a;
    int data = 11;

    function void display();
        $display("data = %0d", data);
    endfunction
endclass

class b extends a;
    int pulse = 22;

    function void add();
        $display("After addition, data = %0d", pulse + data);
    endfunction
endclass

module class_inheritance_tb;

    b obj;

    initial begin
        obj = new();
        $display("obj.data = %0d, obj.pulse = %0d", obj.data, obj.pulse);
        obj.display();
        obj.add();
    end
endmodule

//VIVADO Output:
// obj.data = 11, obj.pulse = 22
// data = 11
// After addition, data = 33
