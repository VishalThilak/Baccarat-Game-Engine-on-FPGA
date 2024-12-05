/* This testbench ensures that the card7seg module functions
properly and tests all possible input values and ensures that 
HEX0 has the right output */

module tb_card7seg();
    logic [3:0] SW;
    logic [6:0] HEX0;
    logic err;

    card7seg dut(SW, HEX0);

    initial begin
        SW = 4'b0000; //input
        #5;

        assert(dut.HEX0 === 7'b1111111);

        SW = 4'b0001;
        #5;

        assert(dut.HEX0 === 7'b0001000);

        SW = 4'b0010;
        #5;

        assert(dut.HEX0 === 7'b0100100);

        SW = 4'b0011;
        #5;

        assert(dut.HEX0 === 7'b0110000);

        SW = 4'b0100;
        #5;

        assert(dut.HEX0 === 7'b0011001);

        SW = 4'b0101;
        #5;

        assert(dut.HEX0 === 7'b0010010);

        SW = 4'b0110;
        #5;

        assert(dut.HEX0 === 7'b0000010);

        SW = 4'b0111;
        #5;

        assert(dut.HEX0 === 7'b1111000);

        SW = 4'b1000;
        #5;

        assert(dut.HEX0 === 7'b0000000);

        SW = 4'b1001;
        #5;

        assert(dut.HEX0 === 7'b0010000);

        SW = 4'b1010;
        #5;

        assert(dut.HEX0 === 7'b1000000);

        SW = 4'b1011;
        #5;

        assert(dut.HEX0 === 7'b1100001);

        SW = 4'b1100;
        #5;

        assert(dut.HEX0 === 7'b0011000);

        SW = 4'b1101;
        #5;

        assert(dut.HEX0 === 7'b0001001);

        SW = 4'b1110;
        #5;

        assert(dut.HEX0 === 7'b1111111);

        SW = 4'b1111;
        #5;

        assert(dut.HEX0 === 7'b1111111);
        
        $stop;

    end
						
endmodule


