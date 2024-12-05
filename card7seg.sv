/*This module converts a 4-bit binary input (card) into a 
7-bit binary output to be used for a 7-segment display (seg7) */

module card7seg(input logic [3:0] card, output logic [6:0] seg7);

    /*This always block uses a case statement to convert a 4-bit
    binary input card to a 7-bit binary output (seg7). Each input 
    represents a card as shown down below. Default state is all turned off*/
    always_comb begin
    case(card)
        4'b0000 : seg7 = 7'b1111111; //nothing
        4'b0001 : seg7 = 7'b0001000; //A
        4'b0010 : seg7 = 7'b0100100; //2
        4'b0011 : seg7 = 7'b0110000; //3
        4'b0100 : seg7 = 7'b0011001; //4
        4'b0101 : seg7 = 7'b0010010; //5
        4'b0110 : seg7 = 7'b0000010; //6
        4'b0111 : seg7 = 7'b1111000; //7
        4'b1000 : seg7 = 7'b0000000; //8
        4'b1001 : seg7 = 7'b0010000; //9
        4'b1010 : seg7 = 7'b1000000; //0
        4'b1011 : seg7 = 7'b1100001; //J 
        4'b1100 : seg7 = 7'b0011000; //Q
        4'b1101 : seg7 = 7'b0001001; //K
        default : seg7 = 7'b1111111; //nothing
    endcase
   end
endmodule

