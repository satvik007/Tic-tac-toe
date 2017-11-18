`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/22/2017 12:37:39 AM
// Design Name: 
// Module Name: success
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module success(
    input [3:0] nextpos,
    input en1,
    input en2,
    input clk,
    input reset,
    output [8:0] m1,m2,
    output w1,w2
    );
    
    reg win1;
    reg win2;
    reg [8:0] mark1;
    reg [8:0] mark2;
    reg player;
    wire [8:0] mark;
    assign mark = mark1 | mark2;
    assign m1 = mark1;
    assign m2 = mark2;
    assign w1 = win1;
    assign w2 = win2;
    
    initial 
    begin
    mark1<=9'd0;
    mark2<=9'd0;
    player<=0;
    end
    
    always @(posedge clk)
    begin
        if (en1 == 1 & player==0)
        begin 
            case (nextpos)
                4'b0001: if (mark[0]==0) begin mark1[0]=1; player=1; end
                4'b0010: if (mark[1]==0) begin mark1[1]=1; player=1; end
                4'b0011: if (mark[2]==0) begin mark1[2]=1; player=1; end
                
                4'b0100: if (mark[3]==0) begin mark1[3]=1; player=1; end
                4'b0101: if (mark[4]==0) begin mark1[4]=1; player=1; end
                4'b0110: if (mark[5]==0) begin mark1[5]=1; player=1; end
              
                4'b0111: if (mark[6]==0) begin mark1[6]=1; player=1; end
                4'b1000: if (mark[7]==0) begin mark1[7]=1; player=1; end
                4'b1001: if (mark[8]==0) begin mark1[8]=1; player=1; end       
            endcase             
        end
				       
        if (en2 == 1 & player ==1)
        begin 
			if(mark1 == 1 && mark2 == 0) move = 5;
			if(mark1 == 2 && mark2 == 0) move = 1;
			if(mark1 == 3 && mark2 == 16) move = 3;
			if(mark1 == 4 && mark2 == 0) move = 5;
			if(mark1 == 5 && mark2 == 16) move = 2;
			if(mark1 == 6 && mark2 == 1) move = 4;
			if(mark1 == 6 && mark2 == 16) move = 1;
			if(mark1 == 8 && mark2 == 0) move = 1;
			if(mark1 == 9 && mark2 == 16) move = 7;
			if(mark1 == 10 && mark2 == 1) move = 5;
			if(mark1 == 11 && mark2 == 20) move = 7;
			if(mark1 == 11 && mark2 == 80) move = 3;
			if(mark1 == 12 && mark2 == 1) move = 5;
			if(mark1 == 12 && mark2 == 16) move = 1;
			if(mark1 == 13 && mark2 == 18) move = 8;
			if(mark1 == 13 && mark2 == 80) move = 2;
			if(mark1 == 14 && mark2 == 17) move = 9;
			if(mark1 == 16 && mark2 == 0) move = 1;
			if(mark1 == 18 && mark2 == 1) move = 8;
			if(mark1 == 20 && mark2 == 1) move = 7;
			if(mark1 == 22 && mark2 == 9) move = 7;
			if(mark1 == 22 && mark2 == 65) move = 4;
			if(mark1 == 22 && mark2 == 129) move = 7;
			if(mark1 == 24 && mark2 == 1) move = 6;
			if(mark1 == 26 && mark2 == 33) move = 8;
			if(mark1 == 26 && mark2 == 129) move = 6;
			if(mark1 == 28 && mark2 == 33) move = 7;
			if(mark1 == 28 && mark2 == 65) move = 6;
			if(mark1 == 30 && mark2 == 97) move = 8;
			if(mark1 == 30 && mark2 == 161) move = 7;
			if(mark1 == 30 && mark2 == 193) move = 9;
			if(mark1 == 32 && mark2 == 0) move = 3;
			if(mark1 == 33 && mark2 == 4) move = 4;
			if(mark1 == 33 && mark2 == 16) move = 2;
			if(mark1 == 34 && mark2 == 1) move = 7;
			if(mark1 == 34 && mark2 == 4) move = 4;
			if(mark1 == 35 && mark2 == 12) move = 5;
			if(mark1 == 35 && mark2 == 20) move = 7;
			if(mark1 == 36 && mark2 == 16) move = 9;
			if(mark1 == 37 && mark2 == 18) move = 8;
			if(mark1 == 37 && mark2 == 272) move = 2;
			if(mark1 == 38 && mark2 == 9) move = 7;
			if(mark1 == 38 && mark2 == 17) move = 9;
			if(mark1 == 38 && mark2 == 65) move = 4;
			if(mark1 == 38 && mark2 == 272) move = 1;
			if(mark1 == 40 && mark2 == 1) move = 5;
			if(mark1 == 40 && mark2 == 4) move = 5;
			if(mark1 == 41 && mark2 == 18) move = 7;
			if(mark1 == 41 && mark2 == 20) move = 7;
			if(mark1 == 41 && mark2 == 80) move = 2;
			if(mark1 == 42 && mark2 == 17) move = 3;
			if(mark1 == 42 && mark2 == 20) move = 1;
			if(mark1 == 42 && mark2 == 65) move = 5;
			if(mark1 == 43 && mark2 == 84) move = 8;
			if(mark1 == 44 && mark2 == 17) move = 9;
			if(mark1 == 44 && mark2 == 272) move = 1;
			if(mark1 == 45 && mark2 == 82) move = 8;
			if(mark1 == 45 && mark2 == 146) move = 7;
			if(mark1 == 45 && mark2 == 274) move = 8;
			if(mark1 == 46 && mark2 == 81) move = 9;
			if(mark1 == 46 && mark2 == 273) move = 7;
			if(mark1 == 48 && mark2 == 1) move = 4;
			if(mark1 == 48 && mark2 == 4) move = 4;
			if(mark1 == 49 && mark2 == 12) move = 9;
			if(mark1 == 50 && mark2 == 9) move = 7;
			if(mark1 == 50 && mark2 == 12) move = 8;
			if(mark1 == 50 && mark2 == 65) move = 4;
			if(mark1 == 50 && mark2 == 129) move = 4;
			if(mark1 == 51 && mark2 == 140) move = 9;
			if(mark1 == 51 && mark2 == 268) move = 8;
			if(mark1 == 52 && mark2 == 9) move = 7;
			if(mark1 == 52 && mark2 == 65) move = 4;
			if(mark1 == 54 && mark2 == 73) move = 8;
			if(mark1 == 54 && mark2 == 137) move = 7;
			if(mark1 == 54 && mark2 == 193) move = 4;
			if(mark1 == 64 && mark2 == 0) move = 5;
			if(mark1 == 65 && mark2 == 16) move = 4;
			if(mark1 == 66 && mark2 == 1) move = 5;
			if(mark1 == 66 && mark2 == 16) move = 1;
			if(mark1 == 67 && mark2 == 20) move = 4;
			if(mark1 == 67 && mark2 == 24) move = 6;
			if(mark1 == 68 && mark2 == 16) move = 2;
			if(mark1 == 69 && mark2 == 18) move = 4;
			if(mark1 == 69 && mark2 == 24) move = 2;
			if(mark1 == 70 && mark2 == 9) move = 5;
			if(mark1 == 70 && mark2 == 17) move = 4;
			if(mark1 == 71 && mark2 == 56) move = 8;
			if(mark1 == 72 && mark2 == 1) move = 2;
			if(mark1 == 72 && mark2 == 16) move = 1;
			if(mark1 == 74 && mark2 == 17) move = 9;
			if(mark1 == 76 && mark2 == 3) move = 5;
			if(mark1 == 76 && mark2 == 17) move = 2;
			if(mark1 == 76 && mark2 == 18) move = 1;
			if(mark1 == 77 && mark2 == 146) move = 6;
			if(mark1 == 78 && mark2 == 273) move = 6;
			if(mark1 == 80 && mark2 == 1) move = 3;
			if(mark1 == 82 && mark2 == 5) move = 8;
			if(mark1 == 82 && mark2 == 129) move = 3;
			if(mark1 == 88 && mark2 == 3) move = 3;
			if(mark1 == 88 && mark2 == 5) move = 2;
			if(mark1 == 88 && mark2 == 33) move = 3;
			if(mark1 == 90 && mark2 == 37) move = 9;
			if(mark1 == 90 && mark2 == 133) move = 6;
			if(mark1 == 90 && mark2 == 161) move = 3;
			if(mark1 == 96 && mark2 == 4) move = 1;
			if(mark1 == 96 && mark2 == 16) move = 2;
			if(mark1 == 97 && mark2 == 12) move = 5;
			if(mark1 == 97 && mark2 == 18) move = 8;
			if(mark1 == 97 && mark2 == 24) move = 2;
			if(mark1 == 98 && mark2 == 5) move = 5;
			if(mark1 == 98 && mark2 == 12) move = 5;
			if(mark1 == 98 && mark2 == 17) move = 9;
			if(mark1 == 99 && mark2 == 28) move = 8;
			if(mark1 == 100 && mark2 == 18) move = 8;
			if(mark1 == 100 && mark2 == 272) move = 1;
			if(mark1 == 101 && mark2 == 26) move = 8;
			if(mark1 == 101 && mark2 == 146) move = 4;
			if(mark1 == 101 && mark2 == 274) move = 8;
			if(mark1 == 102 && mark2 == 25) move = 9;
			if(mark1 == 102 && mark2 == 273) move = 4;
			if(mark1 == 104 && mark2 == 3) move = 3;
			if(mark1 == 104 && mark2 == 5) move = 2;
			if(mark1 == 104 && mark2 == 17) move = 2;
			if(mark1 == 104 && mark2 == 18) move = 1;
			if(mark1 == 104 && mark2 == 20) move = 1;
			if(mark1 == 105 && mark2 == 146) move = 3;
			if(mark1 == 106 && mark2 == 21) move = 9;
			if(mark1 == 106 && mark2 == 273) move = 3;
			if(mark1 == 108 && mark2 == 19) move = 8;
			if(mark1 == 108 && mark2 == 146) move = 1;
			if(mark1 == 108 && mark2 == 273) move = 2;
			if(mark1 == 112 && mark2 == 5) move = 2;
			if(mark1 == 112 && mark2 == 9) move = 3;
			if(mark1 == 112 && mark2 == 12) move = 1;
			if(mark1 == 113 && mark2 == 268) move = 2;
			if(mark1 == 114 && mark2 == 13) move = 8;
			if(mark1 == 114 && mark2 == 133) move = 4;
			if(mark1 == 114 && mark2 == 137) move = 3;
			if(mark1 == 114 && mark2 == 140) move = 1;
			if(mark1 == 120 && mark2 == 7) move = 8;
			if(mark1 == 128 && mark2 == 0) move = 2;
			if(mark1 == 129 && mark2 == 2) move = 7;
			if(mark1 == 129 && mark2 == 16) move = 4;
			if(mark1 == 130 && mark2 == 1) move = 5;
			if(mark1 == 131 && mark2 == 20) move = 4;
			if(mark1 == 131 && mark2 == 24) move = 3;
			if(mark1 == 132 && mark2 == 2) move = 7;
			if(mark1 == 132 && mark2 == 16) move = 4;
			if(mark1 == 133 && mark2 == 18) move = 4;
			if(mark1 == 133 && mark2 == 24) move = 6;
			if(mark1 == 133 && mark2 == 66) move = 5;
			if(mark1 == 134 && mark2 == 9) move = 5;
			if(mark1 == 134 && mark2 == 17) move = 4;
			if(mark1 == 134 && mark2 == 24) move = 1;
			if(mark1 == 135 && mark2 == 56) move = 7;
			if(mark1 == 136 && mark2 == 1) move = 3;
			if(mark1 == 136 && mark2 == 2) move = 7;
			if(mark1 == 137 && mark2 == 66) move = 5;
			if(mark1 == 137 && mark2 == 80) move = 3;
			if(mark1 == 138 && mark2 == 5) move = 5;
			if(mark1 == 138 && mark2 == 17) move = 3;
			if(mark1 == 139 && mark2 == 84) move = 6;
			if(mark1 == 140 && mark2 == 17) move = 9;
			if(mark1 == 140 && mark2 == 66) move = 5;
			if(mark1 == 141 && mark2 == 82) move = 6;
			if(mark1 == 142 && mark2 == 273) move = 6;
			if(mark1 == 144 && mark2 == 1) move = 2;
			if(mark1 == 144 && mark2 == 2) move = 1;
			if(mark1 == 145 && mark2 == 66) move = 9;
			if(mark1 == 148 && mark2 == 3) move = 7;
			if(mark1 == 148 && mark2 == 65) move = 4;
			if(mark1 == 148 && mark2 == 66) move = 1;
			if(mark1 == 149 && mark2 == 322) move = 4;
			if(mark1 == 150 && mark2 == 73) move = 6;
			if(mark1 == 152 && mark2 == 3) move = 3;
			if(mark1 == 152 && mark2 == 5) move = 2;
			if(mark1 == 152 && mark2 == 33) move = 2;
			if(mark1 == 152 && mark2 == 66) move = 6;
			if(mark1 == 153 && mark2 == 98) move = 9;
			if(mark1 == 153 && mark2 == 322) move = 6;
			if(mark1 == 156 && mark2 == 35) move = 7;
			if(mark1 == 156 && mark2 == 67) move = 6;
			if(mark1 == 156 && mark2 == 97) move = 2;
			if(mark1 == 156 && mark2 == 98) move = 1;
			if(mark1 == 160 && mark2 == 2) move = 7;
			if(mark1 == 160 && mark2 == 4) move = 1;
			if(mark1 == 161 && mark2 == 12) move = 5;
			if(mark1 == 161 && mark2 == 18) move = 7;
			if(mark1 == 161 && mark2 == 24) move = 3;
			if(mark1 == 161 && mark2 == 66) move = 5;
			if(mark1 == 162 && mark2 == 5) move = 5;
			if(mark1 == 162 && mark2 == 12) move = 5;
			if(mark1 == 162 && mark2 == 17) move = 3;
			if(mark1 == 162 && mark2 == 65) move = 4;
			if(mark1 == 163 && mark2 == 28) move = 7;
			if(mark1 == 163 && mark2 == 84) move = 4;
			if(mark1 == 164 && mark2 == 24) move = 9;
			if(mark1 == 164 && mark2 == 66) move = 9;
			if(mark1 == 164 && mark2 == 272) move = 1;
			if(mark1 == 165 && mark2 == 26) move = 9;
			if(mark1 == 165 && mark2 == 82) move = 9;
			if(mark1 == 165 && mark2 == 274) move = 4;
			if(mark1 == 165 && mark2 == 280) move = 2;
			if(mark1 == 165 && mark2 == 322) move = 4;
			if(mark1 == 166 && mark2 == 25) move = 7;
			if(mark1 == 166 && mark2 == 73) move = 5;
			if(mark1 == 166 && mark2 == 273) move = 4;
			if(mark1 == 166 && mark2 == 280) move = 1;
			if(mark1 == 168 && mark2 == 5) move = 2;
			if(mark1 == 168 && mark2 == 17) move = 2;
			if(mark1 == 168 && mark2 == 20) move = 1;
			if(mark1 == 168 && mark2 == 66) move = 5;
			if(mark1 == 169 && mark2 == 82) move = 3;
			if(mark1 == 169 && mark2 == 84) move = 2;
			if(mark1 == 170 && mark2 == 21) move = 7;
			if(mark1 == 170 && mark2 == 81) move = 3;
			if(mark1 == 172 && mark2 == 19) move = 9;
			if(mark1 == 172 && mark2 == 82) move = 9;
			if(mark1 == 172 && mark2 == 273) move = 2;
			if(mark1 == 172 && mark2 == 322) move = 5;
			if(mark1 == 176 && mark2 == 3) move = 3;
			if(mark1 == 176 && mark2 == 5) move = 2;
			if(mark1 == 176 && mark2 == 9) move = 2;
			if(mark1 == 176 && mark2 == 12) move = 2;
			if(mark1 == 176 && mark2 == 66) move = 4;
			if(mark1 == 177 && mark2 == 14) move = 9;
			if(mark1 == 177 && mark2 == 74) move = 9;
			if(mark1 == 177 && mark2 == 268) move = 2;
			if(mark1 == 177 && mark2 == 322) move = 4;
			if(mark1 == 178 && mark2 == 73) move = 3;
			if(mark1 == 180 && mark2 == 11) move = 7;
			if(mark1 == 180 && mark2 == 67) move = 4;
			if(mark1 == 180 && mark2 == 73) move = 2;
			if(mark1 == 180 && mark2 == 74) move = 1;
			if(mark1 == 180 && mark2 == 322) move = 4;
			if(mark1 == 184 && mark2 == 7) move = 7;
			if(mark1 == 192 && mark2 == 2) move = 9;
			if(mark1 == 192 && mark2 == 16) move = 9;
			if(mark1 == 193 && mark2 == 24) move = 6;
			if(mark1 == 193 && mark2 == 258) move = 4;
			if(mark1 == 193 && mark2 == 272) move = 4;
			if(mark1 == 194 && mark2 == 17) move = 9;
			if(mark1 == 194 && mark2 == 272) move = 1;
			if(mark1 == 195 && mark2 == 28) move = 6;
			if(mark1 == 195 && mark2 == 56) move = 3;
			if(mark1 == 195 && mark2 == 280) move = 6;
			if(mark1 == 196 && mark2 == 18) move = 9;
			if(mark1 == 196 && mark2 == 24) move = 6;
			if(mark1 == 196 && mark2 == 258) move = 5;
			if(mark1 == 196 && mark2 == 272) move = 1;
			if(mark1 == 197 && mark2 == 26) move = 6;
			if(mark1 == 197 && mark2 == 56) move = 2;
			if(mark1 == 197 && mark2 == 266) move = 5;
			if(mark1 == 197 && mark2 == 274) move = 4;
			if(mark1 == 197 && mark2 == 280) move = 6;
			if(mark1 == 198 && mark2 == 25) move = 6;
			if(mark1 == 198 && mark2 == 56) move = 1;
			if(mark1 == 198 && mark2 == 273) move = 4;
			if(mark1 == 200 && mark2 == 3) move = 3;
			if(mark1 == 200 && mark2 == 5) move = 2;
			if(mark1 == 200 && mark2 == 17) move = 9;
			if(mark1 == 200 && mark2 == 258) move = 1;
			if(mark1 == 200 && mark2 == 272) move = 1;
			if(mark1 == 202 && mark2 == 21) move = 9;
			if(mark1 == 202 && mark2 == 273) move = 3;
			if(mark1 == 204 && mark2 == 19) move = 9;
			if(mark1 == 204 && mark2 == 259) move = 5;
			if(mark1 == 204 && mark2 == 273) move = 2;
			if(mark1 == 204 && mark2 == 274) move = 1;
			if(mark1 == 208 && mark2 == 3) move = 3;
			if(mark1 == 208 && mark2 == 5) move = 2;
			if(mark1 == 208 && mark2 == 258) move = 3;
			if(mark1 == 209 && mark2 == 262) move = 6;
			if(mark1 == 209 && mark2 == 266) move = 3;
			if(mark1 == 216 && mark2 == 7) move = 6;
			if(mark1 == 216 && mark2 == 35) move = 3;
			if(mark1 == 216 && mark2 == 37) move = 2;
			if(mark1 == 216 && mark2 == 259) move = 3;
			if(mark1 == 216 && mark2 == 262) move = 1;
			if(mark1 == 224 && mark2 == 5) move = 2;
			if(mark1 == 224 && mark2 == 18) move = 9;
			if(mark1 == 224 && mark2 == 258) move = 1;
			if(mark1 == 224 && mark2 == 272) move = 1;
			if(mark1 == 225 && mark2 == 26) move = 9;
			if(mark1 == 225 && mark2 == 28) move = 9;
			if(mark1 == 225 && mark2 == 266) move = 3;
			if(mark1 == 225 && mark2 == 274) move = 4;
			if(mark1 == 225 && mark2 == 280) move = 2;
			if(mark1 == 226 && mark2 == 21) move = 9;
			if(mark1 == 226 && mark2 == 28) move = 9;
			if(mark1 == 226 && mark2 == 273) move = 3;
			if(mark1 == 228 && mark2 == 259) move = 5;
			if(mark1 == 228 && mark2 == 273) move = 2;
			if(mark1 == 228 && mark2 == 274) move = 1;
			if(mark1 == 228 && mark2 == 280) move = 1;
			if(mark1 == 232 && mark2 == 7) move = 5;
			if(mark1 == 232 && mark2 == 19) move = 3;
			if(mark1 == 232 && mark2 == 21) move = 2;
			if(mark1 == 232 && mark2 == 259) move = 3;
			if(mark1 == 232 && mark2 == 273) move = 2;
			if(mark1 == 232 && mark2 == 274) move = 1;
			if(mark1 == 240 && mark2 == 7) move = 4;
			if(mark1 == 240 && mark2 == 11) move = 3;
			if(mark1 == 240 && mark2 == 13) move = 2;
			if(mark1 == 240 && mark2 == 14) move = 1;
			if(mark1 == 240 && mark2 == 259) move = 3;
			if(mark1 == 240 && mark2 == 262) move = 1;
			if(mark1 == 256 && mark2 == 0) move = 5;
			if(mark1 == 257 && mark2 == 16) move = 2;
			if(mark1 == 258 && mark2 == 1) move = 5;
			if(mark1 == 258 && mark2 == 16) move = 1;
			if(mark1 == 259 && mark2 == 20) move = 4;
			if(mark1 == 260 && mark2 == 16) move = 6;
			if(mark1 == 261 && mark2 == 18) move = 6;
			if(mark1 == 261 && mark2 == 48) move = 2;
			if(mark1 == 262 && mark2 == 9) move = 6;
			if(mark1 == 262 && mark2 == 17) move = 6;
			if(mark1 == 262 && mark2 == 48) move = 4;
			if(mark1 == 263 && mark2 == 56) move = 7;
			if(mark1 == 264 && mark2 == 1) move = 3;
			if(mark1 == 264 && mark2 == 16) move = 1;
			if(mark1 == 265 && mark2 == 18) move = 7;
			if(mark1 == 265 && mark2 == 80) move = 2;
			if(mark1 == 266 && mark2 == 5) move = 5;
			if(mark1 == 266 && mark2 == 17) move = 3;
			if(mark1 == 267 && mark2 == 84) move = 6;
			if(mark1 == 268 && mark2 == 17) move = 6;
			if(mark1 == 268 && mark2 == 48) move = 1;
			if(mark1 == 269 && mark2 == 50) move = 8;
			if(mark1 == 269 && mark2 == 82) move = 8;
			if(mark1 == 269 && mark2 == 146) move = 6;
			if(mark1 == 270 && mark2 == 49) move = 7;
			if(mark1 == 272 && mark2 == 1) move = 3;
			if(mark1 == 274 && mark2 == 5) move = 8;
			if(mark1 == 274 && mark2 == 129) move = 3;
			if(mark1 == 276 && mark2 == 65) move = 4;
			if(mark1 == 278 && mark2 == 41) move = 7;
			if(mark1 == 278 && mark2 == 73) move = 6;
			if(mark1 == 278 && mark2 == 193) move = 4;
			if(mark1 == 280 && mark2 == 5) move = 2;
			if(mark1 == 280 && mark2 == 33) move = 2;
			if(mark1 == 282 && mark2 == 133) move = 6;
			if(mark1 == 282 && mark2 == 161) move = 3;
			if(mark1 == 284 && mark2 == 35) move = 7;
			if(mark1 == 284 && mark2 == 97) move = 2;
			if(mark1 == 288 && mark2 == 4) move = 1;
			if(mark1 == 288 && mark2 == 16) move = 3;
			if(mark1 == 289 && mark2 == 12) move = 5;
			if(mark1 == 289 && mark2 == 18) move = 3;
			if(mark1 == 289 && mark2 == 20) move = 2;
			if(mark1 == 290 && mark2 == 5) move = 7;
			if(mark1 == 290 && mark2 == 12) move = 7;
			if(mark1 == 290 && mark2 == 17) move = 3;
			if(mark1 == 290 && mark2 == 20) move = 7;
			if(mark1 == 290 && mark2 == 65) move = 3;
			if(mark1 == 291 && mark2 == 28) move = 7;
			if(mark1 == 291 && mark2 == 76) move = 5;
			if(mark1 == 291 && mark2 == 84) move = 4;
			if(mark1 == 293 && mark2 == 146) move = 4;
			if(mark1 == 294 && mark2 == 73) move = 5;
			if(mark1 == 296 && mark2 == 5) move = 2;
			if(mark1 == 296 && mark2 == 17) move = 3;
			if(mark1 == 296 && mark2 == 20) move = 1;
			if(mark1 == 297 && mark2 == 22) move = 7;
			if(mark1 == 297 && mark2 == 82) move = 3;
			if(mark1 == 297 && mark2 == 84) move = 2;
			if(mark1 == 298 && mark2 == 21) move = 7;
			if(mark1 == 298 && mark2 == 69) move = 5;
			if(mark1 == 298 && mark2 == 81) move = 3;
			if(mark1 == 298 && mark2 == 84) move = 1;
			if(mark1 == 304 && mark2 == 5) move = 2;
			if(mark1 == 304 && mark2 == 9) move = 3;
			if(mark1 == 304 && mark2 == 12) move = 1;
			if(mark1 == 306 && mark2 == 13) move = 7;
			if(mark1 == 306 && mark2 == 69) move = 4;
			if(mark1 == 306 && mark2 == 73) move = 3;
			if(mark1 == 306 && mark2 == 76) move = 1;
			if(mark1 == 306 && mark2 == 133) move = 4;
			if(mark1 == 306 && mark2 == 137) move = 7;
			if(mark1 == 306 && mark2 == 140) move = 1;
			if(mark1 == 308 && mark2 == 73) move = 2;
			if(mark1 == 312 && mark2 == 7) move = 7;
			if(mark1 == 320 && mark2 == 16) move = 8;
			if(mark1 == 321 && mark2 == 18) move = 8;
			if(mark1 == 321 && mark2 == 24) move = 6;
			if(mark1 == 321 && mark2 == 144) move = 2;
			if(mark1 == 322 && mark2 == 17) move = 8;
			if(mark1 == 322 && mark2 == 144) move = 1;
			if(mark1 == 323 && mark2 == 28) move = 6;
			if(mark1 == 323 && mark2 == 56) move = 3;
			if(mark1 == 324 && mark2 == 18) move = 8;
			if(mark1 == 324 && mark2 == 48) move = 4;
			if(mark1 == 324 && mark2 == 144) move = 2;
			if(mark1 == 325 && mark2 == 26) move = 6;
			if(mark1 == 325 && mark2 == 50) move = 4;
			if(mark1 == 325 && mark2 == 56) move = 2;
			if(mark1 == 325 && mark2 == 146) move = 4;
			if(mark1 == 326 && mark2 == 25) move = 6;
			if(mark1 == 326 && mark2 == 41) move = 5;
			if(mark1 == 326 && mark2 == 49) move = 4;
			if(mark1 == 326 && mark2 == 56) move = 1;
			if(mark1 == 326 && mark2 == 145) move = 6;
			if(mark1 == 328 && mark2 == 3) move = 3;
			if(mark1 == 328 && mark2 == 5) move = 2;
			if(mark1 == 328 && mark2 == 17) move = 8;
			if(mark1 == 328 && mark2 == 144) move = 2;
			if(mark1 == 329 && mark2 == 146) move = 3;
			if(mark1 == 330 && mark2 == 21) move = 8;
			if(mark1 == 330 && mark2 == 145) move = 3;
			if(mark1 == 332 && mark2 == 19) move = 8;
			if(mark1 == 332 && mark2 == 49) move = 8;
			if(mark1 == 332 && mark2 == 145) move = 2;
			if(mark1 == 332 && mark2 == 146) move = 1;
			if(mark1 == 336 && mark2 == 5) move = 2;
			if(mark1 == 338 && mark2 == 133) move = 4;
			if(mark1 == 344 && mark2 == 7) move = 6;
			if(mark1 == 344 && mark2 == 35) move = 3;
			if(mark1 == 344 && mark2 == 37) move = 2;
			if(mark1 == 352 && mark2 == 5) move = 2;
			if(mark1 == 352 && mark2 == 18) move = 8;
			if(mark1 == 352 && mark2 == 20) move = 8;
			if(mark1 == 352 && mark2 == 144) move = 2;
			if(mark1 == 353 && mark2 == 22) move = 8;
			if(mark1 == 353 && mark2 == 26) move = 8;
			if(mark1 == 353 && mark2 == 28) move = 8;
			if(mark1 == 353 && mark2 == 146) move = 3;
			if(mark1 == 353 && mark2 == 148) move = 2;
			if(mark1 == 354 && mark2 == 21) move = 8;
			if(mark1 == 354 && mark2 == 28) move = 8;
			if(mark1 == 354 && mark2 == 145) move = 3;
			if(mark1 == 354 && mark2 == 148) move = 1;
			if(mark1 == 356 && mark2 == 146) move = 1;
			if(mark1 == 360 && mark2 == 7) move = 5;
			if(mark1 == 360 && mark2 == 19) move = 3;
			if(mark1 == 360 && mark2 == 21) move = 2;
			if(mark1 == 360 && mark2 == 145) move = 2;
			if(mark1 == 360 && mark2 == 146) move = 1;
			if(mark1 == 360 && mark2 == 148) move = 2;
			if(mark1 == 368 && mark2 == 7) move = 4;
			if(mark1 == 368 && mark2 == 13) move = 2;
			if(mark1 == 384 && mark2 == 2) move = 7;
			if(mark1 == 384 && mark2 == 16) move = 7;
			if(mark1 == 385 && mark2 == 18) move = 7;
			if(mark1 == 385 && mark2 == 24) move = 6;
			if(mark1 == 385 && mark2 == 66) move = 5;
			if(mark1 == 385 && mark2 == 80) move = 3;
			if(mark1 == 386 && mark2 == 17) move = 7;
			if(mark1 == 386 && mark2 == 80) move = 1;
			if(mark1 == 387 && mark2 == 28) move = 6;
			if(mark1 == 387 && mark2 == 56) move = 3;
			if(mark1 == 387 && mark2 == 84) move = 4;
			if(mark1 == 388 && mark2 == 24) move = 6;
			if(mark1 == 388 && mark2 == 48) move = 4;
			if(mark1 == 388 && mark2 == 66) move = 6;
			if(mark1 == 388 && mark2 == 80) move = 6;
			if(mark1 == 389 && mark2 == 26) move = 6;
			if(mark1 == 389 && mark2 == 50) move = 4;
			if(mark1 == 389 && mark2 == 56) move = 2;
			if(mark1 == 389 && mark2 == 82) move = 6;
			if(mark1 == 389 && mark2 == 98) move = 5;
			if(mark1 == 389 && mark2 == 112) move = 4;
			if(mark1 == 390 && mark2 == 25) move = 6;
			if(mark1 == 390 && mark2 == 41) move = 5;
			if(mark1 == 390 && mark2 == 49) move = 4;
			if(mark1 == 390 && mark2 == 56) move = 1;
			if(mark1 == 390 && mark2 == 81) move = 4;
			if(mark1 == 390 && mark2 == 112) move = 4;
			if(mark1 == 392 && mark2 == 5) move = 2;
			if(mark1 == 392 && mark2 == 17) move = 7;
			if(mark1 == 392 && mark2 == 66) move = 3;
			if(mark1 == 392 && mark2 == 80) move = 3;
			if(mark1 == 393 && mark2 == 70) move = 5;
			if(mark1 == 393 && mark2 == 82) move = 3;
			if(mark1 == 393 && mark2 == 84) move = 2;
			if(mark1 == 394 && mark2 == 21) move = 7;
			if(mark1 == 394 && mark2 == 81) move = 3;
			if(mark1 == 394 && mark2 == 84) move = 1;
			if(mark1 == 396 && mark2 == 49) move = 7;
			if(mark1 == 396 && mark2 == 81) move = 6;
			if(mark1 == 396 && mark2 == 82) move = 6;
			if(mark1 == 396 && mark2 == 98) move = 1;
			if(mark1 == 396 && mark2 == 112) move = 1;
			if(mark1 == 400 && mark2 == 3) move = 3;
			if(mark1 == 400 && mark2 == 5) move = 2;
			if(mark1 == 400 && mark2 == 66) move = 1;
			if(mark1 == 404 && mark2 == 67) move = 4;
			if(mark1 == 404 && mark2 == 73) move = 2;
			if(mark1 == 404 && mark2 == 98) move = 1;
			if(mark1 == 408 && mark2 == 7) move = 6;
			if(mark1 == 408 && mark2 == 35) move = 3;
			if(mark1 == 408 && mark2 == 67) move = 3;
			if(mark1 == 408 && mark2 == 70) move = 1;
			if(mark1 == 408 && mark2 == 98) move = 1;
			if(mark1 == 416 && mark2 == 5) move = 2;
			if(mark1 == 416 && mark2 == 20) move = 7;
			if(mark1 == 416 && mark2 == 66) move = 3;
			if(mark1 == 416 && mark2 == 80) move = 3;
			if(mark1 == 417 && mark2 == 22) move = 7;
			if(mark1 == 417 && mark2 == 28) move = 7;
			if(mark1 == 417 && mark2 == 70) move = 5;
			if(mark1 == 417 && mark2 == 82) move = 3;
			if(mark1 == 417 && mark2 == 84) move = 2;
			if(mark1 == 418 && mark2 == 21) move = 7;
			if(mark1 == 418 && mark2 == 28) move = 7;
			if(mark1 == 418 && mark2 == 69) move = 4;
			if(mark1 == 418 && mark2 == 73) move = 3;
			if(mark1 == 418 && mark2 == 76) move = 1;
			if(mark1 == 418 && mark2 == 81) move = 3;
			if(mark1 == 418 && mark2 == 84) move = 1;
			if(mark1 == 424 && mark2 == 7) move = 5;
			if(mark1 == 424 && mark2 == 19) move = 3;
			if(mark1 == 424 && mark2 == 21) move = 2;
			if(mark1 == 424 && mark2 == 70) move = 1;
			if(mark1 == 424 && mark2 == 81) move = 3;
			if(mark1 == 424 && mark2 == 82) move = 3;
			if(mark1 == 424 && mark2 == 84) move = 1;
			if(mark1 == 432 && mark2 == 7) move = 4;
			if(mark1 == 432 && mark2 == 11) move = 3;
			if(mark1 == 432 && mark2 == 13) move = 2;
			if(mark1 == 432 && mark2 == 14) move = 1;
			if(mark1 == 432 && mark2 == 67) move = 3;
			if(mark1 == 432 && mark2 == 70) move = 1;
			if(mark1 == 432 && mark2 == 74) move = 1;
			if(mark1 == 449 && mark2 == 56) move = 2;
			if(mark1 == 452 && mark2 == 56) move = 1;
			if(mark1 == 456 && mark2 == 7) move = 5;
			if(mark1 == 464 && mark2 == 7) move = 4;
			if(mark1 == 480 && mark2 == 7) move = 4;
			
            case (nextpos)
                4'b0001: if (mark[0]==0) begin mark2[0]=1; player=0; end
                4'b0010: if (mark[1]==0) begin mark2[1]=1; player=0; end
                4'b0011: if (mark[2]==0) begin mark2[2]=1; player=0; end
                
                4'b0100: if (mark[3]==0) begin mark2[3]=1; player=0; end
                4'b0101: if (mark[4]==0) begin mark2[4]=1; player=0; end
                4'b0110: if (mark[5]==0) begin mark2[5]=1; player=0; end
              
                4'b0111: if (mark[6]==0) begin mark2[6]=1; player=0; end
                4'b1000: if (mark[7]==0) begin mark2[7]=1; player=0; end
                4'b1001: if (mark[8]==0) begin mark2[8]=1; player=0; end                
            endcase             
        end
        if (reset == 1)
        begin 
            mark1=0;
            mark2=0;
            win1 = 0;
            win2 = 0;
        end
  
        if ((m1[0]& m1[1]& m1[2]) | (m1[3]& m1[4]& m1[5]) | (m1[6]& m1[7]& m1[8]) | (m1[0]& m1[3]& m1[6]) | (m1[1]& m1[4]& m1[7]) | (m1[2]& m1[5]& m1[8]) | (m1[0]& m1[4]& m1[8]) | (m1[2]& m1[4]& m1[6]))
        win1 = 1;
        else if ((m2[0]& m2[1]& m2[2]) | (m2[3]& m2[4]& m2[5]) | (m2[6]& m2[7]& m2[8]) | (m2[0]& m2[3]& m2[6]) | (m2[1]& m2[4]& m2[7]) | (m2[2]& m2[5]& m2[8]) | (m2[0]& m2[4]& m2[8]) | (m2[2]& m2[4]& m2[6]))
        win2 = 1;
        else if (mark == 9'b111111111)
        begin
        win1=1;
        win2=1;
        end   
    end //always
endmodule
// accept in order 
// stop accepting when there is a winner.
