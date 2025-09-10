module loopy_tb;

    int loopy [6];  // uninitialized array
    int loopy2 [16];  // uninitialized array
    int loopy3 [10];  // uninitialized array

    // procedural block for for loop
    initial begin
        for (int i = 0; i<6; i++) begin
            loopy[i] = i;
        end
        $display("my loopy contains: %0p and size of loopy is %0d",loopy, $size(loopy));
    end

    // foreach loop
    initial begin
        foreach(loopy2[j]) begin
            loopy2[j]=j;
        end
        $display("my loopy2 contains: %0p and size of loopy2 is %0d",loopy2, $size(loopy2));
    end

    // repeat
    initial begin
        int i = 0;
        repeat (10) begin
            loopy3[i] = i;
            i++;
        end
        $display("my loopy3 contains: %0p and size of loopy3 is %0d",loopy3, $size(loopy3));
    end

endmodule

// VIVADO Output:
// my loopy contains: '{0,1,2,3,4,5} and size of loopy is 6
// my loopy2 contains: '{0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15} and size of loopy2 is 16
// my loopy3 contains: '{0,1,2,3,4,5,6,7,8,9} and size of loopy3 is 10
