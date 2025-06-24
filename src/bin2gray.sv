module bin2gray #(
    parameter N = 3;    //default input size
)(
    input logic [N-1:0] binary,
    output logic [N-1:0] gray
);

    logic [N-1:0] temp_gray;

    always_comb begin : xor_block

        for (int n = N; n>0 ; n-- ) begin
            temp_gray[N-1] = binary[N-1] ^ binary[N-2];
        end
        
        gray = {binary[N],temp_gray};

    end

    
endmodule