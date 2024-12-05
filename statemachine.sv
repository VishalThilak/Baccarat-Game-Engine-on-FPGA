`define p_card1 4'b0001
`define d_card1 4'b0010
`define p_card2 4'b0011
`define d_card2 4'b0100
`define p_card3 4'b0101
`define d_card3 4'b0110
`define tie 4'b0111
`define p_win 4'b1000
`define d_win 4'b1001

/*This module controls the card game where it loads the player and dealer cards
and determines who wins or if a tie occurs*/
module statemachine(input logic slow_clock, input logic resetb,
                    input logic [3:0] dscore, input logic [3:0] pscore, input logic [3:0] pcard3,
                    output logic load_pcard1, output logic load_pcard2, output logic load_pcard3,
                    output logic load_dcard1, output logic load_dcard2, output logic load_dcard3,
                    output logic player_win_light, output logic dealer_win_light);

    logic [3:0] present_state;

    /* This always block controls the state transitions of the game. It 
    moves between different state, by first dealing the first 4 cards. Then by checking
    the stores it determines where to proceed (either more cards or dealt or a winner is announced).*/
    always_ff @(posedge slow_clock) begin
        if(!resetb) begin
            present_state <= `p_card1;
        end else begin
            case(present_state)
                `p_card1: present_state <= `d_card1;
                `d_card1: present_state <= `p_card2;
                `p_card2: present_state <= `d_card2;
                `d_card2: begin
                    if((pscore == 4'b1000 || pscore == 4'b1001) && (dscore == 4'b1000 || dscore == 4'b1001)) present_state <= `tie;
                    else if((pscore == 4'b1000 || pscore == 4'b1001)) present_state <= `p_win;
                    else if((dscore == 4'b1000 || dscore == 4'b1001)) present_state <= `d_win;
                    else if(pscore <= 4'b0101) present_state <= `p_card3;
                    else if(pscore >= 4'b0110 && dscore <= 4'b0101) present_state <= `d_card3;
                    else present_state <= pscore > dscore ? `p_win : (pscore == dscore ? `tie : `d_win);
                end
                `p_card3: if(dscore < 4'b0111) begin
                    if(dscore <= 4'b0010) present_state <= `d_card3;
                    else if(dscore == 4'b0011 && pcard3 !== 4'b1000) present_state <= `d_card3;
                    else if(dscore == 4'b0100 && (pcard3 == 4'b0010 || pcard3 == 4'b0011 || pcard3 == 4'b0100 || pcard3 == 4'b0101 || pcard3 == 4'b0110 || pcard3 == 4'b0111)) present_state <= `d_card3;
                    else if(dscore == 4'b0101 && (pcard3 == 4'b0100 || pcard3 == 4'b0101 || pcard3 == 4'b0110 || pcard3 == 4'b0111)) present_state <= `d_card3;
                    else if(dscore == 4'b0110 && (pcard3 == 4'b0110 || pcard3 == 4'b0111)) present_state <= `d_card3;
                    else present_state <= pscore > dscore ? `p_win : (pscore == dscore ? `tie : `d_win);
                end else begin
                    present_state <= pscore > dscore ? `p_win : (pscore == dscore ? `tie : `d_win);
                end
                `d_card3: present_state <= pscore > dscore ? `p_win : (pscore == dscore ? `tie : `d_win);
                default: present_state <= 4'bxxxx;
            endcase

        end
    end

    /*This always block controls the output signals based on the present state, and sets
    the card load signals to load the right cards and also to activate the win lights if
    we are in the right state*/
    always_comb begin
         case(present_state)
                `p_card1: begin
                    load_pcard1 = 1'b1;
                    load_pcard2 = 1'b0;
                    load_pcard3 = 1'b0;
                    load_dcard1 = 1'b0;
                    load_dcard2 = 1'b0;
                    load_dcard3 = 1'b0;
                    player_win_light = 1'b0;
                    dealer_win_light = 1'b0;
                end
                `p_card2: begin
                    load_pcard1 = 1'b0;
                    load_pcard2 = 1'b1;
                    load_pcard3 = 1'b0;
                    load_dcard1 = 1'b0;
                    load_dcard2 = 1'b0;
                    load_dcard3 = 1'b0;
                    player_win_light = 1'b0;
                    dealer_win_light = 1'b0;
                end
                `p_card3: begin
                    load_pcard1 = 1'b0;
                    load_pcard2 = 1'b0;
                    load_pcard3 = 1'b1;
                    load_dcard1 = 1'b0;
                    load_dcard2 = 1'b0;
                    load_dcard3 = 1'b0;
                    player_win_light = 1'b0;
                    dealer_win_light =1'b0;
                end

                `d_card1: begin
                    load_pcard1 = 1'b0;
                    load_pcard2 = 1'b0;
                    load_pcard3 = 1'b0;
                    load_dcard1 = 1'b1;
                    load_dcard2 = 1'b0;
                    load_dcard3 = 1'b0;
                    player_win_light = 1'b0;
                    dealer_win_light = 1'b0;
                end

                d_card2: begin
                    load_pcard1 = 1'b0;
                    load_pcard2 = 1'b0;
                    load_pcard3 = 1'b0;
                    load_dcard1 = 1'b0;
                    load_dcard2 = 1'b1;
                    load_dcard3 = 1'b0;
                    player_win_light = 1'b0;
                    dealer_win_light = 1'b0;
                end

                `d_card3: begin
                    load_pcard1 = 1'b0;
                    load_pcard2 = 1'b0;
                    load_pcard3 = 1'b0;
                    load_dcard1 = 1'b0;
                    load_dcard2 = 1'b0;
                    load_dcard3 = 1'b1;
                    player_win_light = 1'b0;
                    dealer_win_light = 1'b0;
                end

                `p_win: begin
                    load_pcard1 = 1'b0;
                    load_pcard2 = 1'b0;
                    load_pcard3 = 1'b0;
                    load_dcard1 = 1'b0;
                    load_dcard2 = 1'b0;
                    load_dcard3 = 1'b0;
                    player_win_light = 1'b1;
                    dealer_win_light = 1'b0;
                end

                `d_win: begin
                    load_pcard1 = 1'b0;
                    load_pcard2 = 1'b0;
                    load_pcard3 = 1'b0;
                    load_dcard1 = 1'b0;
                    load_dcard2 = 1'b0;
                    load_dcard3 = 1'b0;
                    player_win_light = 1'b0;
                    dealer_win_light = 1'b1;
                end

                `tie: begin
                    load_pcard1 = 1'b0;
                    load_pcard2 = 1'b0;
                    load_pcard3 = 1'b0;
                    load_dcard1 = 1'b0;
                    load_dcard2 = 1'b0;
                    load_dcard3 = 1'b0;
                    player_win_light = 1'b1;
                    dealer_win_light = 1'b1;
                end

                default: begin
                    load_pcard1 = 1'bx;
                    load_pcard2 = 1'bx;
                    load_pcard3 = 1'bx;
                    load_dcard1 = 1'bx;
                    load_dcard2 = 1'bx;
                    load_dcard3 = 1'bx;
                    player_win_light = 1'bx;
                    dealer_win_light = 1'bx;
                end

            endcase
    end

    
endmodule

