module dynamic_array_tb;

    int arr[];
    int farr[10];

    initial begin
        arr = new[5];   //dynamically specifying the size using new

        for(int i=0;i<5; i++) begin
            arr[i] = i+1;
        end

        $display("arr: %0p",arr);

        //arr.delete();   //delete all the elements of the array

        // we will get error for the following code because we did not
        // allocate the size of the array using the new method after deleting
        // the array(using delete())
        //for(int i=0;i<5; i++) begin
        //    arr[i]=i*2;
        //end

        arr = new[10](arr); // this will keep the previous data at the begining of the array
        $display("after calling new method and keeping old elements arr: %0p new size: %0d",arr,
                $size(arr));
        farr=arr;   // size is same for both array
        $display("farr: %0p",farr );

        arr = new[10]; // all the previous elements will be deleted
        $display("after calling new method again with arr is %0p new size arr: %0d",arr,
                $size(arr));
    end

endmodule

// VIVADO Output:
// arr: '{1,2,3,4,5}
// after calling new method and keeping old elements arr: '{1,2,3,4,5,0,0,0,0,0} new size: 10
// farr: '{1,2,3,4,5,0,0,0,0,0}
// after calling new method again with arr is '{0,0,0,0,0,0,0,0,0,0} new size arr: 10
