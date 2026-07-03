`timescale 1ns / 1ps

`timescale 1ns / 1ps

module uart_tx
#(
    parameter CLOCK_FREQ = 100_000_000,
    parameter BAUD_RATE  = 9600
)
(
    input clk,
    input rst,
    input tx_start,
    input [7:0] tx_data,

    output reg tx,
    output reg tx_busy
);

localparam BAUD_COUNT = 10;
// For simulation:
// localparam BAUD_COUNT = 10;

// FSM States
localparam IDLE  = 2'b00;
localparam START = 2'b01;
localparam DATA  = 2'b10;
localparam STOP  = 2'b11;

reg [1:0] state;

reg [15:0] baud_counter;
reg [2:0] bit_counter;
reg [7:0] shift_reg;

always @(posedge clk or posedge rst)
begin

    if(rst)
    begin
        state <= IDLE;

        tx <= 1'b1;
        tx_busy <= 0;

        baud_counter <= 0;
        bit_counter <= 0;
        shift_reg <= 0;
    end

    else
    begin
 case(state)
-IDLE:
        begin

            tx <= 1'b1;
            tx_busy <= 0;

            baud_counter <= 0;
            bit_counter <= 0;

            if(tx_start)
            begin
                tx_busy <= 1;
                shift_reg <= tx_data;
                state <= START;
            end

        end
        START:
        begin

            tx <= 1'b0;

            if(baud_counter == BAUD_COUNT-1)
            begin
                baud_counter <= 0;
                state <= DATA;
            end

            else
                baud_counter <= baud_counter + 1;

        end
          DATA:
        begin

            tx <= shift_reg[0];

            if(baud_counter == BAUD_COUNT-1)
            begin

                baud_counter <= 0;

                shift_reg <= shift_reg >> 1;

                if(bit_counter == 7)
                begin
                    bit_counter <= 0;
                    state <= STOP;
                end

                else
                begin
                    bit_counter <= bit_counter + 1;
                end

            end

            else
                baud_counter <= baud_counter + 1;
                  end


        STOP:
        begin

            tx <= 1'b1;

            if(baud_counter == BAUD_COUNT-1)
            begin

                baud_counter <= 0;
                state <= IDLE;

            end

            else
                baud_counter <= baud_counter + 1;

        end

        default:
            state <= IDLE;

        endcase

    end

end

endmodule
