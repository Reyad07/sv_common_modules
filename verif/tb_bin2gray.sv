module tb_bin2gray;

    parameter WIDTH = 4;
    logic [WIDTH-1:0] binary;
    logic [WIDTH-1:0] gray;

    bin2gray #(.N(WIDTH)) u_bin2gray (.binary(binary),
                                      .gray(gray));
    
    initial begin
      $dumpfile("wave.vcd");
      $dumpvars;
        for (int i = 0; i<2**WIDTH; i++)
        begin
            binary = i;
            #50;                                                          
            $display("gray of binary code 0b%0b is = 0b%0b",binary,gray);
        end 

        #50;
        $finish;
    end
endmodule