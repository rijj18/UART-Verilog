timescale 1ns / 1ps
`
module uart_tx_tb;

    reg clk;
    reg rst;
    reg tx_start;
    reg [7:0] tx_data;

    // Outputs
    wire tx;
    wire tx_busy;

    // Instantiate UART Transmitter
    uart_tx DUT
    (
        .clk(clk),
        .rst(rst),
        .tx_start(tx_start),
        .tx_data(tx_data),
        .tx(tx),
        .tx_busy(tx_busy)
    );

    // Clock Generation
    // 100 MHz Clock (10 ns Period)
    always #5 clk = ~clk;

    initial
    begin
// Initialize Signals
   
        clk = 0;
        rst = 1;
        tx_start = 0;
        tx_data = 8'h00;

        // Apply Reset

        #20;
        rst = 0;
        #20;
        tx_data = 8'h41;      // ASCII 'A'
        tx_start = 1;

        #10;                  // One Clock Pulse
        tx_start = 0;

         wait(tx_busy == 0);
        // Small Delay
      
        #50;

        tx_data = 8'h55;
        tx_start = 1;

        #10;
        tx_start = 0;

        wait(tx_busy == 0);

        #100;

        $finish;

    end

endmodule
