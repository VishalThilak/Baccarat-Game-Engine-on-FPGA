/*This module calculates the total score for a hand of three cards.
Each card from 0-9 retains their face value, and higher than that is 0.
Then its added together and the LSB is outputed in the total*/

module scorehand(input logic [3:0] card1, input logic [3:0] card2, input logic [3:0] card3, output logic [3:0] total);

    logic [3:0] c1;
    logic [3:0] c2;
    logic [3:0] c3;

    /* This always block assigns a value of 0 to a card if it 10 or higher
    and otherwise it retains their face value*/
    always_comb begin
        c1 = card1 >= 4'b1010 ? 4'b0000 : card1; 
        c2 = card2 >= 4'b1010 ? 4'b0000 : card2; 
        c3 = card3 >= 4'b1010 ? 4'b0000 : card3; 
    end
    
    //calculating the LSB of the total
    assign total = (c1 + c2 + c3) % 10;
endmodule

