/*This testbench ensures that the scorehand module functions properly
and it calculates the total score for a hand based on the Baccarat scoring guide*/

module tb_scorehand();
    //declarations
    logic [3:0] card1;
    logic [3:0] card2;
    logic [3:0] card3;
    logic [3:0] total;

    scorehand dut(card1, card2, card3, total);
    
    initial begin
        //all less than 10
        card1 = 4'b0001; card2 = 4'b0010; card3 = 4'b0011;
        #5;
        assert(total == 4'b0110);

        //one above 10
        card1 = 4'b0001; card2 = 4'b0010; card3 = 4'b1011;
        #5;
        assert(total == 4'b0011);

        //two above 10
        card1 = 4'b0001; card2 = 4'b1010; card3 = 4'b1011;
        #5;
        assert(total == 4'b0001);

        //three above 10
        card1 = 4'b1100; card2 = 4'b1010; card3 = 4'b1011;
        #5;
        assert(total == 4'b0000);

        //check when sum goes above 10
        card1 = 4'b1000; card2 = 4'b1000; card3 = 4'b1000;
        #5;
        assert(total == 4'b0100);

        $display("SUCCESS scorehand");
    end

endmodule
