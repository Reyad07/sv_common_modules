module tb_gray2bin;
    parameter WIDTH = 3;
    logic [WIDTH-1:0] gray;
    logic [WIDTH-1:0] binary;

    gray2bin # (
        .WIDTH(WIDTH)) 
    u_gray2bin 
        (.gray(gray),
         .binary(binary)
        );

    initial 
    begin

        for (int i = 0; i<2**WIDTH ; i++) begin
            gray = i;
            #10;
            $display("Input gray = 0b%0b \t output binary = 0b%0b",gray,binary);
        end
        #30;
        $finish;
    end
endmodule