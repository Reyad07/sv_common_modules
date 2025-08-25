module dynamic_array_tb;

    int arr[];
    int farr[10];

    initial begin
        arr = new[5];   //dynamically specifying the size using new

        for(int i=0;i<5; i++) begin
            arr[i]=i*2;
        end

        $display("arr: %0p",arr);

        //arr.delete();   //delete all the elements of the array

        // we will get error for the following code because we did not
        // allocate the size of the array using the new method after deleting
        // the array(using delete())
        //for(int i=0;i<5; i++) begin
        //    arr[i]=i*2;
        //end

        arr = new[10](arr); // this will keep the previous data
        $display("after calling new method, keeping old elements arr: %0p",arr);
        farr=arr;   // size is same for both array
        $display("farr: %0p",far 

        arr = new[10]; // all the previous elements will be deleted 
        $display("after calling new method again with new size arr: %0p",arr);


    end
    
endmodule
