
module lms_fir(
     input   logic clk,
     input   logic rst,
     input  logic signed [15:0] x,
     input  logic signed [15:0] d,
     output logic signed [15:0] y
     );
    

    // PARAMETERS
    
    parameter WIDTH=16;
    parameter N=20;
    logic signed [35:0] prod;
    logic signed [WIDTH-1:0] delayed [N]; // Shift register for input samples
    logic signed [WIDTH-1:0] w [N];
    logic signed [35:0] e;
    logic signed [2*WIDTH-1:0] mu=16'h001;
//    real mu=1;
    logic signed [31:0] update;             // Weight update value


//    real MU=0.7;    
always_ff @(posedge clk or posedge rst)begin
    if(rst)begin
        for(int i=0;i<N;i=i+1)begin
            delayed[i]<=0;
        end 
    end else begin
        for(int i=N-1;i>0;i=i-1)begin
            delayed[i]<=delayed[i-1];
        end 
        delayed[0]<=x;
    end 
end 



    always_ff @(posedge clk or posedge rst) begin
        if (rst) begin
            y <= 0;
            e<=0;
           for(int i=0;i<N;i=i+1)begin
            w[i]<=0;
        end 
        end else begin
            prod=0;
            for (int i = 0; i < N; i = i + 1) begin
                prod = prod + delayed[i] * w[i];
                
            end

              e=d-prod[35:16];
              y <= (prod[35:20]);
             for (int i = 0; i < N; i = i + 1) begin
                    update = delayed[i] * e * mu;
                    // w[i] <= w[i] + ((delayed[i] * e * mu) >>> 24);
                    w[i]<=w[i]+update[31:16];
                
            end
          
        end
    end
endmodule