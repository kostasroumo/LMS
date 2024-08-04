
module tb_lut_example;

    // Parameters
    parameter WIDTH = 16;
    parameter N = 20;

    // Inputs
    logic clk;
    logic rst;
    logic signed [15:0] x;
    logic signed [15:0] d;

    // Outputs
    logic signed [15:0] y=0;

    // Instantiate the lms_fir module
    lms_fir #(.WIDTH(WIDTH), .N(N)) dut (
        .clk(clk),
        .rst(rst),
        .x(x),
        .d(d),
        .y(y)
    );

    // LUT Module Signals
    logic [9:0] address;
    logic [15:0] sine_2;
    logic [15:0] sine_30;
    logic [15:0] noisy;

    // Instantiate the lut_example module
    lut_example lut_inst (
        .address(address),
        .sine_2(sine_2),
        .sine_30(sine_30),
        .noisy(noisy)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    // Testbench process
    initial begin
        // Initialize inputs
        rst = 1;
        x = 0;
        d = 0;
        address = 0;

        // Apply reset
        #10;
        rst = 0;

        // Test sequence
        for(int j=0;j<4;j=j+1)begin
        for (int i = 0; i < 500; i = i + 1) begin
            address = i;
            // #2;

            // Set the input signal x and desired signal d
            x = noisy;  // Input signal (noisy)
            d = sine_2; // Desired signal (clean sine wave)
            #1;
        end
        end 
        // Finish simulation
        // #100;
        // $finish;
    end

endmodule
