module gray2bin #(
    parameter WIDTH = 3
) (
    input logic [WIDTH-1:0] gray,
    output logic [WIDTH-1:0] binary
);

    always_comb begin : xor_block
        binary[WIDTH-1] = gray[WIDTH-1];    //MSB bit remains same as gray
        
        for (int i = WIDTH-2; i>=0; i--)
        begin
            binary[i] = binary[i+1] ^ gray [i];
        end
    end
    
endmodule