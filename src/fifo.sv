module fifo #(
    parameter DEPTH = 16,
    parameter DATA_WIDTH = 8
) (
    input logic clk,
    input logic rst_n,

    input logic [DATA_WIDTH-1:0] data_in,
    input logic wr_en,
    input logic rd_en,

    output logic [DATA_WIDTH-1:0] data_out,
    output logic empty,
    output logic full
);

    localparam ADDR_WIDTH = $clog2(DEPTH);  
    logic [DATA_WIDTH-1:0] mem [0:DEPTH-1]; //memory declaration
    logic [ADDR_WIDTH:0] wr_ptr; //allowing extra 1 bit(MSB) for wrap around 
    logic [ADDR_WIDTH:0] rd_ptr; //allowing extra 1 bit(MSB) for wrap around

    //FIFO Write operation
    always_ff @( posedge clk or negedge rst_n ) begin : fifo_write
        if (!rst_n)
        begin
            wr_ptr <= '0;
        end
        else if (wr_en && !full)
        begin
            mem[wr_ptr[ADDR_WIDTH-1:0]] <= data_in;
            wr_ptr <= wr_ptr + 1;
        end

    end

    //FIFO Read operation
    always_ff @( posedge clk or negedge rst_n ) begin : fifo_read
        if (!rst_n)
        begin
            rd_ptr <= '0;
            data_out <= '0;
        end
        else if (rd_en && !empty)
        begin
            data_out <= mem[rd_ptr[ADDR_WIDTH-1:0]];
            rd_ptr <= rd_ptr + 1;
        end
    end

    //fifo empty and full condition logic
    assign empty = (wr_ptr == rd_ptr);
    assign full = (wr_ptr[ADDR_WIDTH] != rd_ptr[ADDR_WIDTH]) &&
                  (wr_ptr[ADDR_WIDTH-1:0] == rd_ptr[ADDR_WIDTH-1:0]);

endmodule