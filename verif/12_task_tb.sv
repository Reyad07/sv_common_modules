module task_tb;


    bit clk = 0;

    always #5 clk =~clk;   // 20ns -> 50MHz

    // default direction of task: input
    task add(input bit [3:0]a,input bit [3:0]b, output bit [4:0]y);
        y = a + b;
        $display("Value ofa: %0d and b: %0d and m: %0d",a,b,m);
    endtask

    bit [3:0] a,b;
    bit [4:0] y;
    bit [7:0] m;

    task mul();
        m = a * b;
        $display("Value ofa: %0d and b: %0d and m: %0d",a,b,m);
    endtask

    task stim_a_b;
        a = 1;
        b = 2;
        mul();
        #10;
        a = 3;
        b = 2;
        mul();
        #10;
        a = 4;
        b = 5;
        mul();
        #10;
    endtask


    task stim_clk;
        @(posedge clk); //wait
        a = $urandom();
        b = $urandom();
        add();
    endtask

    initial begin
        $display("------------stim_clk call begin----------------");
        for(int i = 0;i<11; i++) begin
            stim_clk();
        end
        $display("------------stim_clk call end----------------");
    end

    initial begin
        a = 3;
        b = 3;
        add(a,b);
        mul();
        stim_a_b();

    end

    initial begin
        #110;
        $finish;
    end


endmodule
