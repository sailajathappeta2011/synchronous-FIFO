`timescale 1ns/1ps

module sync_fifo_tb;

    reg clk;
    reg rst;
    reg wr_en;
    reg rd_en;
    reg [7:0] din;

    wire [7:0] dout;
    wire full;
    wire empty;

    sync_fifo uut (
        .clk(clk),
        .rst(rst),
        .wr_en(wr_en),
        .rd_en(rd_en),
        .din(din),
        .dout(dout),
        .full(full),
        .empty(empty)
    );

    // Clock generation
    always #5 clk = ~clk;

    initial begin

        clk = 0;
        rst = 1;
        wr_en = 0;
        rd_en = 0;
        din = 0;

        // Reset
        #10;
        rst = 0;

        // Write 10
        #10;
        wr_en = 1;
        din = 8'h10;

        #10;
        din = 8'h20;

        #10;
        din = 8'h30;

        #10;
        din = 8'h40;

        // Stop writing
        #10;
        wr_en = 0;

        // Read data
        #10;
        rd_en = 1;

        #10;
        rd_en = 1;

        #10;
        rd_en = 1;

        #10;
        rd_en = 1;

        #10;
        rd_en = 0;

        #20;
        $finish;
    end

    initial begin
        $monitor("Time=%0t | WR=%b RD=%b DIN=%h DOUT=%h FULL=%b EMPTY=%b",
                 $time, wr_en, rd_en, din, dout, full, empty);
    end

endmodule