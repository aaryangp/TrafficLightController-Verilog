`include "trafficlight2.v"
`timescale 1ns/1ps

module trafficlight2_tb;

    reg clk;
    reg rst;
    reg x;

    wire [1:0] highway;
    wire [1:0] country;

    // DUT instantiation
    trafficlight2 dut (
        .clk(clk),
        .rst(rst),
        .x(x),
        .highway(highway),
        .country(country)
    );

    // Clock generation (10 ns period)
    always #5 clk = ~clk;

    // Stimulus
    initial begin
        clk = 0;
        rst = 1;
        x   = 0;

        // Hold reset
        #20;
        rst = 0;

        // No car on country road → highway stays GREEN
        #100;

        // Car arrives on country road
        x = 1;
        #150;

        // Car leaves country road
        x = 0;
        #200;

        // Another car arrives
        x = 1;
        #150;

        // End simulation
        #200;
        $finish;
    end

    // Monitor outputs
    initial begin
        $display("Time | x | Highway | Country");
        $monitor("%4t | %b |   %b    |   %b",
                 $time, x, highway, country);
    end

    // Dump waveform
    initial begin
        $dumpfile("trafficlight2.vcd");
        $dumpvars(0, trafficlight2_tb);
    end

endmodule
