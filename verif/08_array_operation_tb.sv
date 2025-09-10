module array_operation_tb;

    // array copy
    int arr0[10];
    int arr1[10];

    initial begin

        //array initialization
        foreach(arr0[i]) begin
            arr0[i] = i + 1;
        end

        $display("values of arr0 are %0p", arr0);
        arr1 = arr0;    //copying the contents of arr0 into arr1

        $display("values of arr1 are %0p", arr1);
    end

    //array comparison by each elements
    int arr2[5] = '{1,2,4,5,6};
    int arr3[5] = '{1,2,4,5,6};
    bit array_status = 0;

    initial begin
        array_status = (arr2 == arr3);  // use != to check for not equal
        $display("array_status %0d",array_status);
    end

endmodule

// VIVADO Output:
// values of arr0 are '{1,2,3,4,5,6,7,8,9,10}
// values of arr1 are '{1,2,3,4,5,6,7,8,9,10}
// array_status 1
