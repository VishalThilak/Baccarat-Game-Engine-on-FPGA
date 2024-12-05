`define p_card1 4'b0001
`define d_card1 4'b0010
`define p_card2 4'b0011
`define d_card2 4'b0100
`define p_card3 4'b0101
`define d_card3 4'b0110
`define tie 4'b0111
`define p_win 4'b1000
`define d_win 4'b1001

/* This testbench ensures that the statemachine functions proplery.
It simulate every possible path that can be taken in the states and checking 
the outputs */
module tb_statemachine();
    //declarations
    logic slow_clock;
    logic resetb;
    logic [3:0] dscore;
    logic [3:0] pscore;
    logic [3:0] pcard3;
    logic load_pcard1, load_pcard2, load_pcard3;
    logic load_dcard1, load_dcard2, load_dcard3;
    logic player_win_light, dealer_win_light;
    int num;

    statemachine state(slow_clock, resetb, dscore, pscore, pcard3, load_pcard1, load_pcard2, load_pcard3,
                        load_dcard1, load_dcard2, load_dcard3, player_win_light, dealer_win_light);

    initial begin
        slow_clock = 1'b0;;
        forever begin
            #5;
            slow_clock = 1'b1; 
            #5;
            slow_clock = 1'b0; 
        end
    end

    initial begin
      
        num = 0;

        //simulating all possible paths
        repeat(20) begin
            resetb = 1'b0;
            #10;    
            assert(state.present_state == `p_card1);
            assert(state.load_pcard1 == 1'b1);
            assert(state.load_pcard2 == 1'b0);
            assert(state.load_pcard3 == 1'b0);
            assert(state.load_dcard1 == 1'b0);
            assert(state.load_dcard2 == 1'b0);
            assert(state.load_dcard3 == 1'b0);
            assert(state.player_win_light == 1'b0);
            assert(state.dealer_win_light == 1'b0);

            resetb = 1'b1;
            pscore = 4'b0000; dscore = 4'b0000;
            #10;
            assert(state.present_state == `d_card1);
            assert(state.load_pcard1 == 1'b0);
            assert(state.load_pcard2 == 1'b0);
            assert(state.load_pcard3 == 1'b0);
            assert(state.load_dcard1 == 1'b1);
            assert(state.load_dcard2 == 1'b0);
            assert(state.load_dcard3 == 1'b0);
            assert(state.player_win_light == 1'b0);
            assert(state.dealer_win_light == 1'b0);

            #10;
            assert(state.present_state == `p_card2);
            assert(state.load_pcard1 == 1'b0);
            assert(state.load_pcard2 == 1'b1);
            assert(state.load_pcard3 == 1'b0);
            assert(state.load_dcard1 == 1'b0);
            assert(state.load_dcard2 == 1'b0);
            assert(state.load_dcard3 == 1'b0);
            assert(state.player_win_light == 1'b0);
            assert(state.dealer_win_light == 1'b0);

            #10;
            assert(state.present_state == `d_card2);
            assert(state.load_pcard1 == 1'b0);
            assert(state.load_pcard2 == 1'b0);
            assert(state.load_pcard3 == 1'b0);
            assert(state.load_dcard1 == 1'b0);
            assert(state.load_dcard2 == 1'b1);
            assert(state.load_dcard3 == 1'b0);
            assert(state.player_win_light == 1'b0);
            assert(state.dealer_win_light == 1'b0);

            case(num)
                0: begin
                    //tie
                    pscore = 4'b1000; dscore = 4'b1000;
                    #10;
                    assert(state.present_state == `tie);
                    assert(state.load_pcard1 == 1'b0);
                    assert(state.load_pcard2 == 1'b0);
                    assert(state.load_pcard3 == 1'b0);
                    assert(state.load_dcard1 == 1'b0);
                    assert(state.load_dcard2 == 1'b0);
                    assert(state.load_dcard3 == 1'b0);
                    assert(state.player_win_light == 1'b1);
                    assert(state.dealer_win_light == 1'b1);
                end
                1: begin
                    //player win
                    pscore = 4'b1000; dscore = 4'b0000;
                    #10;
                    assert(state.present_state == `p_win);
                    assert(state.load_pcard1 == 1'b0);
                    assert(state.load_pcard2 == 1'b0);
                    assert(state.load_pcard3 == 1'b0);
                    assert(state.load_dcard1 == 1'b0);
                    assert(state.load_dcard2 == 1'b0);
                    assert(state.load_dcard3 == 1'b0);
                    assert(state.player_win_light == 1'b1);
                    assert(state.dealer_win_light == 1'b0);
                end
                2: begin
                    //dealer win
                    pscore = 4'b0000; dscore = 4'b1000;
                    #10;
                    assert(state.present_state == `d_win);
                    assert(state.load_pcard1 == 1'b0);
                    assert(state.load_pcard2 == 1'b0);
                    assert(state.load_pcard3 == 1'b0);
                    assert(state.load_dcard1 == 1'b0);
                    assert(state.load_dcard2 == 1'b0);
                    assert(state.load_dcard3 == 1'b0);
                    assert(state.player_win_light == 1'b0);
                    assert(state.dealer_win_light == 1'b1);
                end
                3: begin
                    //all p_card3
                    pscore = 4'b0101;
                    #10;

                    assert(state.present_state == `p_card3);
                    assert(state.load_pcard1 == 1'b0);
                    assert(state.load_pcard2 == 1'b0);
                    assert(state.load_pcard3 == 1'b1);
                    assert(state.load_dcard1 == 1'b0);
                    assert(state.load_dcard2 == 1'b0);
                    assert(state.load_dcard3 == 1'b0);
                    assert(state.player_win_light == 1'b0);
                    assert(state.dealer_win_light == 1'b0);

                    dscore = 4'b0010;
                    #10;
                    assert(state.present_state == `d_card3);
                    assert(state.load_pcard1 == 1'b0);
                    assert(state.load_pcard2 == 1'b0);
                    assert(state.load_pcard3 == 1'b0);
                    assert(state.load_dcard1 == 1'b0);
                    assert(state.load_dcard2 == 1'b0);
                    assert(state.load_dcard3 == 1'b1);
                    assert(state.player_win_light == 1'b0);
                    assert(state.dealer_win_light == 1'b0);

                    pscore = 4'b0100; dscore = 4'b0001;
                    #10;
                    assert(state.present_state == `p_win);
                end
                4: begin
                    //all p_card3
                    pscore = 4'b0101;
                    #10;

                    assert(state.present_state == `p_card3);

                    dscore = 4'b0011; pcard3 = 4'b0010;
                    #10;
                    assert(state.present_state == `d_card3);

                    pscore = 4'b0100; dscore = 4'b0101;
                    #10;
                    assert(state.present_state == `d_win);
                end
                5: begin
                    //all p_card3
                    pscore = 4'b0101;
                    #10;

                    assert(state.present_state == `p_card3);

                    dscore = 4'b0100; pcard3 = 4'b0010;
                    #10;
                    assert(state.present_state == `d_card3);

                    pscore = 4'b0100; dscore = 4'b0100;
                    #10;
                    assert(state.present_state == `tie);
                end
                6: begin
                    //all p_card3
                    pscore = 4'b0101;
                    #10;

                    assert(state.present_state == `p_card3);

                    dscore = 4'b0101; pcard3 = 4'b0100;
                    #10;
                    assert(state.present_state == `d_card3);

                    pscore = 4'b0100; dscore = 4'b0100;
                    #10;
                    assert(state.present_state == `tie);
                end
                7: begin
                    pscore = 4'b0101;
                    #10;

                    assert(state.present_state == `p_card3);

                    dscore = 4'b0110; pcard3 = 4'b0110;
                    #10;
                    assert(state.present_state == `d_card3);
                end
                8: begin
                    //all p_card3
                    pscore = 4'b0101;
                    #10;

                    assert(state.present_state == `p_card3);

                    dscore = 4'b0111; pscore = 4'b0110;
                    #10;
                    assert(state.present_state == `d_win);
                end
                10: begin
                    //all p_card3
                    pscore = 4'b0101;
                    #10;

                    assert(state.present_state == `p_card3);

                    dscore = 4'b0111; pscore = 4'b0000;
                    #10;
                    assert(state.present_state == `d_win);
                end
                11: begin
                    //4th else if statement in d_card2
                    pscore = 4'b0110; dscore = 4'b0101;
                    #10;
                    assert(state.present_state == `d_card3);

                    #10;
                    assert(state.present_state == `p_win);
                end
                12: begin
                    //last else in d_card2
                    pscore = 4'b0110; dscore = 4'b0110;
                    #10;
                    assert(state.present_state == `tie);
                end
                13: begin
                    // Scenario where p_card3 does not trigger d_card3
                    pscore = 4'b0101; dscore = 4'b1001; pcard3 = 4'b0111;
                    #10;
                    assert(state.present_state == `d_win);
                end
                14: begin
                    // Checking for p_card3 high score
                    pscore = 4'b0111; dscore = 4'b0010; pcard3 = 4'b0101;
                    #10;
                    assert(state.present_state == `d_card3);
                    #10;
                    assert(state.present_state == `p_win);
                end
                15: begin
                    // Validate state when pscore > dscore directly in p_card3
                    pscore = 4'b0110; dscore = 4'b0101; pcard3 = 4'b0011;
                    #10;
                    assert(state.present_state == `d_card3);
                    #10;
                    assert(state.present_state == `p_win);
                end
                
                16: begin
                    // Both scores are equal and result in a tie.
                    pscore = 4'b0111;  
                    dscore = 4'b0111;  
                    pcard3 = 4'b0000;  
                    #10;
                    assert(state.present_state == `tie);  
                end

                17: begin
                    // Both scores are equal and result in a tie after `d_card3`.
                    pscore = 4'b1000; 
                    dscore = 4'b1000; 
                    pcard3 = 4'b0000;  
                    #10;
                    assert(state.present_state == `tie);  
                end

                18: begin
                    // Dealer wins due to higher score.
                    pscore = 4'b1010;  
                    dscore = 4'b1100;  
                    pcard3 = 4'b0000;  
                    #10;
                    assert(state.present_state == `d_win); 
                end

                19: begin
                    // Both scores are below threshold but player wins after drawing `p_card3`.
                    pscore = 4'b0101;
                    dscore = 4'b0100;
                    pcard3 = 4'b0000;
                    #10;
                    assert(state.present_state == `p_card3);
                    pscore = 4'b1000; // Player's final score higher than dealer's.
                    #10;
                    assert(state.present_state == `p_win);
                end
                
            endcase
            num = num + 1;
        end

        
        $display("SUCCESS statemachine");
        $stop;
    end

endmodule
