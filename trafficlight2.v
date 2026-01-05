module trafficlight2(
    input x , clk , rst ,
    output reg [1:0] highway , country 
);

parameter [1:0] GREEN = 2'b00 ;
parameter [1:0] YELLOW = 2'b01 ;
parameter [1:0] RED = 2'b10 ;

parameter [2:0] s0 = 3'b000 ;
parameter [2:0] s1 = 3'b001 ;
parameter [2:0] s2 = 3'b010 ;
parameter [2:0] s3 = 3'b011 ;
parameter [2:0] s4 = 3'b100 ;

reg [3:0] counter ;
reg [2:0] ps , ns ;

//PRESENT STATE LOGIC
always@(posedge clk) begin
    if(rst) begin
        ps <= s0 ;
    end
    else
        ps <= ns ;
end

//COUNTER LOGIC
always @(posedge clk) begin
    if (rst)
        counter <= 4'b0000;
    else if (ps != ns)
        counter <= 4'b0000;   // reset when state changes
    else
        counter <= counter + 1'b1;
end

always@(*) begin

    case(ps)

    s0 : begin
         
        highway = GREEN ;
        country = RED ;

        if(x==1) 
            ns = s1 ;
        else 
            ns = s0 ;

    end

    s1 : begin
         
        highway = YELLOW ;
        country = RED ;
        
        if(counter == 4'b0100)
        ns = s2 ;
        else 
        ns = s1 ;

    end

    s2 : begin
         
        highway = RED ;
        country = RED ;
        
        if(counter == 4'b1000)
        ns = s3 ;
        else 
        ns = s2 ;

    end

        s3 : begin
         
        highway = RED;
        country = GREEN ;

       if(x==0) 
            ns = s4 ;
        else 
            ns = s3 ;
    end

        s4 : begin
         
        highway = RED ;
        country = YELLOW ;

        if(counter == 4'b0100)
        ns = s0 ;
        else 
        ns = s4 ;

    end

    default : ns = s0 ;

    endcase
    
end

endmodule 