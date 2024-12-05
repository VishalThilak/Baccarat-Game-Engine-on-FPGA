`define nothing 7'b1111111 //nothing
`define ace 7'b0001000 //A
`define two 7'b0100100 //2
`define three 7'b0110000 //3
`define four 7'b0011001 //4
`define five 7'b0010010 //5
`define six 7'b0000010 //6
`define seven 7'b1111000 //7
`define eight 7'b0000000 //8
`define nine 7'b0010000 //9
`define zero 7'b1000000 //0
`define jack 7'b1100001 //J 
`define queen 7'b0011000 //Q
`define king 7'b0001001 //K

/* This testbench ensures that the datapath module functions properly. */
module tb_datapath();
    //declarations
    logic slow_clock, fast_clock, resetb;
    logic load_pcard1, load_pcard2, load_pcard3;
    logic load_dcard1, load_dcard2, load_dcard3;
    logic [3:0] pcard3_out;
    logic [3:0] pscore_out;
    logic [3:0] dscore_out;
    logic [6:0] HEX5; logic [6:0] HEX4; logic [6:0] HEX3;
    logic [6:0] HEX2; logic [6:0] HEX1; logic [6:0] HEX0;


    datapath dp(slow_clock, fast_clock, resetb,
                load_pcard1, load_pcard2, load_pcard3,
                load_dcard1, load_dcard2, load_dcard3,
                pcard3_out,
                pscore_out, dscore_out,
                HEX5, HEX4, HEX3,
                HEX2, HEX1, HEX0);

    //fast clock
    initial begin
        fast_clock = 1'b0;
        forever #5 fast_clock = ~fast_clock;
    end 

    initial begin
        //forcing all the displays to have all values
        #10;
        force dp.pcard1_out = 4'b0001;
        #10;
        assert(HEX0 == `ace) 
        #10;
        force dp.pcard1_out = 4'b0010;
        #10;
        assert(HEX0 == `two) 
        #10;
        force dp.pcard1_out = 4'b0011;
        #10;
        assert(HEX0 == `three) 
        #10;
        force dp.pcard1_out = 4'b0100;
        #10;
        assert(HEX0 == `four) 
        #10;
        force dp.pcard1_out = 4'b0101;
        #10;
        assert(HEX0 == `five) 
        #10;
        force dp.pcard1_out = 4'b0110;
        #10;
        assert(HEX0 == `six) 
        #10;
        force dp.pcard1_out = 4'b0111;
        #10;
        assert(HEX0 == `seven) 
        #10;
        force dp.pcard1_out = 4'b1000;
        #10;
        assert(HEX0 == `eight) 
        #10;
        force dp.pcard1_out = 4'b1001;
        #10;
        assert(HEX0 == `nine) 
        #10;
        force dp.pcard1_out = 4'b1010;
        #10;
        assert(HEX0 == `zero) 
        #10;
        force dp.pcard1_out = 4'b1011;
        #10;
        assert(HEX0 == `jack) 
        #10;
        force dp.pcard1_out = 4'b1100;
        #10;
        assert(HEX0 == `queen) 
        #10;
        force dp.pcard1_out = 4'b1101;
        #10;
        assert(HEX0 == `king) 
        #10;
        release dp.pcard1_out;

        //pcard2
        #10;
        force dp.pcard2_out = 4'b0001;
        #10;
        assert(HEX1 == `ace) 
        #10;
        force dp.pcard2_out = 4'b0010;
        #10;
        assert(HEX1 == `two) 
        #10;
        force dp.pcard2_out = 4'b0011;
        #10;
        assert(HEX1 == `three) 
        #10;
        force dp.pcard2_out = 4'b0100;
        #10;
        assert(HEX1 == `four) 
        #10;
        force dp.pcard2_out = 4'b0101;
        #10;
        assert(HEX1 == `five) 
        #10;
        force dp.pcard2_out = 4'b0110;
        #10;
        assert(HEX1 == `six) 
        #10;
        force dp.pcard2_out = 4'b0111;
        #10;
        assert(HEX1 == `seven) 
        #10;
        force dp.pcard2_out = 4'b1000;
        #10;
        assert(HEX1 == `eight) 
        #10;
        force dp.pcard2_out = 4'b1001;
        #10;
        assert(HEX1 == `nine) 
        #10;
        force dp.pcard2_out = 4'b1010;
        #10;
        assert(HEX1 == `zero) 
        #10;
        force dp.pcard2_out = 4'b1011;
        #10;
        assert(HEX1 == `jack) 
        #10;
        force dp.pcard2_out = 4'b1100;
        #10;
        assert(HEX1 == `queen) 
        #10;
        force dp.pcard2_out = 4'b1101;
        #10;
        assert(HEX1 == `king) 
        #10;
        release dp.pcard2_out;

        //pcard3
        #10;
        force dp.pcard3_out = 4'b0001;
        #10;
        assert(HEX2 == `ace) 
        #10;
        force dp.pcard3_out = 4'b0010;
        #10;
        assert(HEX2 == `two) 
        #10;
        force dp.pcard3_out = 4'b0011;
        #10;
        assert(HEX2 == `three) 
        #10;
        force dp.pcard3_out = 4'b0100;
        #10;
        assert(HEX2 == `four) 
        #10;
        force dp.pcard3_out = 4'b0101;
        #10;
        assert(HEX2 == `five) 
        #10;
        force dp.pcard3_out = 4'b0110;
        #10;
        assert(HEX2 == `six) 
        #10;
        force dp.pcard3_out = 4'b0111;
        #10;
        assert(HEX2 == `seven) 
        #10;
        force dp.pcard3_out = 4'b1000;
        #10;
        assert(HEX2 == `eight) 
        #10;
        force dp.pcard3_out = 4'b1001;
        #10;
        assert(HEX2 == `nine) 
        #10;
        force dp.pcard3_out = 4'b1010;
        #10;
        assert(HEX2 == `zero) 
        #10;
        force dp.pcard3_out = 4'b1011;
        #10;
        assert(HEX2 == `jack) 
        #10;
        force dp.pcard3_out = 4'b1100;
        #10;
        assert(HEX2 == `queen) 
        #10;
        force dp.pcard3_out = 4'b1101;
        #10;
        assert(HEX2 == `king) 
        #10;
        release dp.pcard3_out;

        //dcard1
        #10;
        force dp.dcard1_out = 4'b0001;
        #10;
        assert(HEX3 == `ace) 
        #10;
        force dp.dcard1_out = 4'b0010;
        #10;
        assert(HEX3 == `two) 
        #10;
        force dp.dcard1_out = 4'b0011;
        #10;
        assert(HEX3 == `three) 
        #10;
        force dp.dcard1_out = 4'b0100;
        #10;
        assert(HEX3 == `four) 
        #10;
        force dp.dcard1_out = 4'b0101;
        #10;
        assert(HEX3 == `five) 
        #10;
        force dp.dcard1_out = 4'b0110;
        #10;
        assert(HEX3 == `six) 
        #10;
        force dp.dcard1_out = 4'b0111;
        #10;
        assert(HEX3 == `seven) 
        #10;
        force dp.dcard1_out = 4'b1000;
        #10;
        assert(HEX3 == `eight) 
        #10;
        force dp.dcard1_out = 4'b1001;
        #10;
        assert(HEX3 == `nine) 
        #10;
        force dp.dcard1_out = 4'b1010;
        #10;
        assert(HEX3 == `zero) 
        #10;
        force dp.dcard1_out = 4'b1011;
        #10;
        assert(HEX3 == `jack) 
        #10;
        force dp.dcard1_out = 4'b1100;
        #10;
        assert(HEX3 == `queen) 
        #10;
        force dp.dcard1_out = 4'b1101;
        #10;
        assert(HEX3 == `king) 
        #10;
        release dp.dcard1_out;

        //dcard2
        #10;
        force dp.dcard2_out = 4'b0001;
        #10;
        assert(HEX4 == `ace) 
        #10;
        force dp.dcard2_out = 4'b0010;
        #10;
        assert(HEX4 == `two) 
        #10;
        force dp.dcard2_out = 4'b0011;
        #10;
        assert(HEX4 == `three) 
        #10;
        force dp.dcard2_out = 4'b0100;
        #10;
        assert(HEX4 == `four) 
        #10;
        force dp.dcard2_out = 4'b0101;
        #10;
        assert(HEX4 == `five) 
        #10;
        force dp.dcard2_out = 4'b0110;
        #10;
        assert(HEX4 == `six) 
        #10;
        force dp.dcard2_out = 4'b0111;
        #10;
        assert(HEX4 == `seven) 
        #10;
        force dp.dcard2_out = 4'b1000;
        #10;
        assert(HEX4 == `eight) 
        #10;
        force dp.dcard2_out = 4'b1001;
        #10;
        assert(HEX4 == `nine) 
        #10;
        force dp.dcard2_out = 4'b1010;
        #10;
        assert(HEX4 == `zero) 
        #10;
        force dp.dcard2_out = 4'b1011;
        #10;
        assert(HEX4 == `jack) 
        #10;
        force dp.dcard2_out = 4'b1100;
        #10;
        assert(HEX4 == `queen) 
        #10;
        force dp.dcard2_out = 4'b1101;
        #10;
        assert(HEX4 == `king) 
        #10;
        release dp.dcard2_out;

        //dcard3
        #10;
        force dp.dcard3_out = 4'b0001;
        #10;
        assert(HEX5 == `ace) 
        #10;
        force dp.dcard3_out = 4'b0010;
        #10;
        assert(HEX5 == `two) 
        #10;
        force dp.dcard3_out = 4'b0011;
        #10;
        assert(HEX5 == `three) 
        #10;
        force dp.dcard3_out = 4'b0100;
        #10;
        assert(HEX5 == `four) 
        #10;
        force dp.dcard3_out = 4'b0101;
        #10;
        assert(HEX5 == `five) 
        #10;
        force dp.dcard3_out = 4'b0110;
        #10;
        assert(HEX5 == `six) 
        #10;
        force dp.dcard3_out = 4'b0111;
        #10;
        assert(HEX5 == `seven) 
        #10;
        force dp.dcard3_out = 4'b1000;
        #10;
        assert(HEX5 == `eight) 
        #10;
        force dp.dcard3_out = 4'b1001;
        #10;
        assert(HEX5 == `nine) 
        #10;
        force dp.dcard3_out = 4'b1010;
        #10;
        assert(HEX5 == `zero) 
        #10;
        force dp.dcard3_out = 4'b1011;
        #10;
        assert(HEX5 == `jack) 
        #10;
        force dp.dcard3_out = 4'b1100;
        #10;
        assert(HEX5 == `queen) 
        #10;
        force dp.dcard3_out = 4'b1101;
        #10;
        assert(HEX5 == `king) 
        #10;
        release dp.dcard3_out;

        $display("SUCCESS datapath");
        $stop;
    end 
endmodule
