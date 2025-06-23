module tb_bin2gray;

    parameter WIDTH = 3;
    logic [WIDTH-1:0] binary;
    logic [WIDTH-1:0] gray;

    bin2gray u_bin2gray #(.N(WIDTH)) (.binary(binary),
                                      .gray(gray));
    
    initial begin
        binary = 101;
        $display("gray of binary code 0b%0b is = 0b%0b",binary,gray);

        #10;
        $finish;
    end
endmodule