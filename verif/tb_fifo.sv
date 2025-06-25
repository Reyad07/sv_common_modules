
module tb_fifo;
    parameter DEPTH = 4;
    parameter DATA_WIDTH = 8;

    logic clk;
    logic rst_n;
    logic [DATA_WIDTH-1:0] data_in;
    logic wr_en;
    logic rd_en;
    logic [DATA_WIDTH-1:0] data_out;
    logic empty;
    logic full;

    fifo #(
        .DEPTH(DEPTH),
        .DATA_WIDTH(DATA_WIDTH)
    ) u_fifo (
        .clk(clk),
        .rst_n(rst_n),
        .data_in(data_in),
        .wr_en(wr_en),
        .rd_en(rd_en),
        .data_out(data_out),
        .empty(empty),
        .full(full)
    );

    //clock generation
    always #5 clk = ~clk;

    //testbench model for fifo
    int wr_cnt;
    int rd_cnt;
    bit [DATA_WIDTH-1:0] wr_data_q[$]; //store data to test with rtl

    initial begin
        // value initialization
        $display("TEST Start:");
        $display("Data Initialization Started");
        clk = 0;
        data_in = 0;
        wr_en = 0;
        rd_en = 0;
        wr_cnt = 0;
        rd_cnt = 0;
        $display("Reset asserted");
        rst_n = 0;
        #10;
        $display("Reset deasserted");
        rst_n = 1;
        #10;

        //data write in fifo(rtl) and queue(model)
        $display("\nWriting data to FIFO start"); 
        while (!full)
        begin
            wr_en = 1;
            data_in = $urandom_range(0,255);
            wr_data_q.push_back(data_in);
            @(posedge clk)
            wr_cnt++;
        end
        wr_en = 0;
        $display("\nWriting data to FIFO is complete");
        $display("\nTotal %0d data item written",wr_cnt);

        //data read from the fifo(rtl) and the queue(model)
        #10;
        while (!empty) begin
            rd_en = 1;
            @(posedge clk);
            $display("Reading data: RTL/DUT: %0d QUEUE/MODEL: %0d",data_out, wr_data_q[rd_cnt]);
            assert(data_out == wr_data_q[rd_cnt])
                else $fatal("Data mismatched at index/read count: %0d",rd_cnt);
            rd_cnt++;
        end
        rd_en = 0;

        $display("\nReading data from FIFO is complete");
        $display("\nTotal %0d data item read",rd_cnt);

        $stop;        

    end

endmodule