module bin2gray #(
    parameter N = 3    //default input size
)(
    input logic [N-1:0] binary,
    output logic [N-1:0] gray
);

    always_comb begin : xor_block
        gray[N-1] = binary[N-1];    //MSB bit of binary remains same
        for (int n = N-2; n>=0 ; n-- ) begin
            gray[n] = binary[n+1] ^ binary[n];
        end
    end  
endmodule