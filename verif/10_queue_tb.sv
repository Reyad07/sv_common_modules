module queue_tb;

   int arr[$]; 
   int a = 0;

   initial begin
       arr = {1,3,4};  // queue of size 3, ' is not requried like array
       $display("arr: %0p",arr);

       // push_front: addind data to 0th index arr[0]
       // push_back: addind data to at the end of last index arr[3]
       
       arr.push_front(8);   // now total element is 4
       $display("ater push_front arr: %0p",arr);    // arr: 8,1,3,4

       arr.push_back(6);    // now total element is 5
       $display("after push_back arr: %0p",arr);    // arr: 8,1,3,4,6

       arr.insert(2,5); // add 5 to index number 2, now total element is 6
       $display("after insert(2,5) arr: %0p",arr);    // arr: 8,1,5,3,4,6
       
       // taking out the values from the queue

       a = arr.pop_front(); // take out the value from 0th index arr[0]
       $display("value pop_front a: %0d",a);
       $display("after pop_front arr: %0p",arr);    // arr: 1,5,3,4,6

       a = arr.pop_back();  // remove the value from the last index arr[4]
       $display("value pop back a: %0d",a);
       $display("after pop_back arr: %0p",arr);    // arr: 1,5,3,4

       arr.delete(1);   // delete a particular index value arr[1]
       $display("after delete(1) arr: %0p",arr);    // arr: 1,5,3,4


   end

endmodule
