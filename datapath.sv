/*This module creates teh datapath for the card game and it deals the player
and dealer cards, contains them, calculates the scores for them, and displays
the cards on the HEX displays*/

module datapath(input logic slow_clock, input logic fast_clock, input logic resetb,
                input logic load_pcard1, input logic load_pcard2, input logic load_pcard3,
                input logic load_dcard1, input logic load_dcard2, input logic load_dcard3,
                output logic [3:0] pcard3_out,
                output logic [3:0] pscore_out, output logic [3:0] dscore_out,
                output logic [6:0] HEX5, output logic [6:0] HEX4, output logic [6:0] HEX3,
                output logic [6:0] HEX2, output logic [6:0] HEX1, output logic [6:0] HEX0);
						

    logic [3:0] dealcard;
    logic [3:0] pcard1_out; logic [3:0] pcard2_out;
    logic [3:0] dcard1_out; logic [3:0] dcard2_out; logic [3:0] dcard3_out;

    //dealing the card
    dealcard dealing(fast_clock, resetb, dealcard);

    //players cards
    reg4 p1(slow_clock, dealcard, resetb, pcard1_out, load_pcard1);
    reg4 p2(slow_clock, dealcard, resetb, pcard2_out, load_pcard2);
    reg4 p3(slow_clock, dealcard, resetb, pcard3_out, load_pcard3);

    //dealers cards
    reg4 d1(slow_clock, dealcard, resetb, dcard1_out, load_dcard1);
    reg4 d2(slow_clock, dealcard, resetb, dcard2_out, load_dcard2);
    reg4 d3(slow_clock, dealcard, resetb, dcard3_out, load_dcard3);

    //card display for player
    card7seg plight1(pcard1_out, HEX0);
    card7seg plight2(pcard2_out, HEX1);
    card7seg plight3(pcard3_out, HEX2);

    //card display for dealer
    card7seg dlight1(dcard1_out, HEX3);
    card7seg dlight2(dcard2_out, HEX4);
    card7seg dlight3(dcard3_out, HEX5);

    //calculating scores for player and dealer
    scorehand score_player(pcard1_out, pcard2_out, pcard3_out, pscore_out);
    scorehand score_dealer(dcard1_out, dcard2_out, dcard3_out, dscore_out);

endmodule

/*This module is a load enable D-flip-flop that stores the
new card to the output if load is enabled*/

module reg4(input logic slow_clock, input [3:0] new_card, input logic resetb, output logic [3:0] cardout, input logic load_pcard);
    always_ff @(posedge slow_clock) begin 
        if(!resetb) begin
            cardout <= 4'b0000;
        end else if(load_pcard) begin                 
            cardout <= new_card;
        end
    end

endmodule
