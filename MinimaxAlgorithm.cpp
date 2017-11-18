// C++ program to find the next optimal move for
// a player
// Code partially take from Geeksfromgeeks.com
#include<bits/stdc++.h>
using namespace std;

int dp[1<<10][1<<10];
struct Move {
    int row, col;
};
char player = 'x', opponent = 'o';
bool isMovesLeft(char board[3][3]) {
    for (int i = 0; i<3; i++)
        for (int j = 0; j<3; j++)
            if (board[i][j]=='_')
                return true;
    return false;
}
int evaluate(char b[3][3]) {
    // Checking for Rows for X or O victory.
    for (int row = 0; row<3; row++)
    {
        if (b[row][0]==b[row][1] &&
            b[row][1]==b[row][2])
        {
            if (b[row][0]==player)
                return +10;
            else if (b[row][0]==opponent)
                return -10;
        }
    }

    // Checking for Columns for X or O victory.
    for (int col = 0; col<3; col++)
    {
        if (b[0][col]==b[1][col] &&
            b[1][col]==b[2][col])
        {
            if (b[0][col]==player)
                return +10;

            else if (b[0][col]==opponent)
                return -10;
        }
    }

    // Checking for Diagonals for X or O victory.
    if (b[0][0]==b[1][1] && b[1][1]==b[2][2])
    {
        if (b[0][0]==player)
            return +10;
        else if (b[0][0]==opponent)
            return -10;
    }

    if (b[0][2]==b[1][1] && b[1][1]==b[2][0])
    {
        if (b[0][2]==player)
            return +10;
        else if (b[0][2]==opponent)
            return -10;
    }

    // Else if none of them have won then return 0
    return 0;
}
int minimax(char board[3][3], int depth, bool isMax) {
    int score = evaluate(board);

    // If Maximizer has won the game return his/her
    // evaluated score
    if (score == 10)
        return score;

    // If Minimizer has won the game return his/her
    // evaluated score
    if (score == -10)
        return score;

    // If there are no more moves and no winner then
    // it is a tie
    if (isMovesLeft(board)==false)
        return 0;

    // If this maximizer's move
    if (isMax)
    {
        int best = -1000;

        // Traverse all cells
        for (int i = 0; i<3; i++)
        {
            for (int j = 0; j<3; j++)
            {
                // Check if cell is empty
                if (board[i][j]=='_')
                {
                    // Make the move
                    board[i][j] = player;

                    // Call minimax recursively and choose
                    // the maximum value
                    best = max( best,
                                minimax(board, depth+1, !isMax) );

                    // Undo the move
                    board[i][j] = '_';
                }
            }
        }
        return best;
    }

        // If this minimizer's move
    else
    {
        int best = 1000;

        // Traverse all cells
        for (int i = 0; i<3; i++)
        {
            for (int j = 0; j<3; j++)
            {
                // Check if cell is empty
                if (board[i][j]=='_')
                {
                    // Make the move
                    board[i][j] = opponent;

                    // Call minimax recursively and choose
                    // the minimum value
                    best = min(best,
                               minimax(board, depth+1, !isMax));

                    // Undo the move
                    board[i][j] = '_';
                }
            }
        }
        return best;
    }
}
Move findBestMove(char board[3][3]) {
    int bestVal = -1000;
    Move bestMove;
    bestMove.row = -1;
    bestMove.col = -1;

    // Traverse all cells, evalutae minimax function for
    // all empty cells. And return the cell with optimal
    // value.
    for (int i = 0; i<3; i++)
    {
        for (int j = 0; j<3; j++)
        {
            // Check if celll is empty
            if (board[i][j]=='_')
            {
                // Make the move
                board[i][j] = player;

                // compute evaluation function for this
                // move.
                int moveVal = minimax(board, 0, false);

                // Undo the move
                board[i][j] = '_';

                // If the value of the current move is
                // more than the best value, then update
                // best/
                if (moveVal > bestVal)
                {
                    bestMove.row = i;
                    bestMove.col = j;
                    bestVal = moveVal;
                }
            }
        }
    }
    return bestMove;
}

void backtrack(int human, int computer, int chance){
    //cout << bitset<9>(human) << endl << bitset<9>(computer) << endl << endl;
    if((human | computer) == ((1<<9)-1)) {
        //cout << "returning bye.\n";
        return;
    }
    if(chance){
        char board[3][3]; memset(board, '_', sizeof board);
        for(int j=0; j<9; j++){
            if(computer & (1<<j)) board[j/3][j%3]='x';
            if(human & (1<<j)) board[j/3][j%3]='o';
        }
        Move bestMove = findBestMove(board);
        int ans = bestMove.row*3+bestMove.col;
        dp[human][computer] = ans;
        backtrack(human, computer|(1<<ans), 0);
        return;
    }
    for(int i=0; i<9; i++){
        if(human & (1<<i) || computer & (1<<i)) continue;
        else backtrack(human | (1<<i), computer, 1);
    }
}
// Driver code
int main()
{
    freopen("out.txt", "w", stdout);
    memset(dp, -1, sizeof dp);
    backtrack(0, 0, 0);
    //backtrack(0, 0, 1);
    //cout << "  human    computer   move\n";
    for(int i=0; i<(1<<9); i++) {
        for(int j=0; j<(1<<9); j++){
            if(dp[i][j] != -1){
                cout << "\t\t\telse if(mark1 == " << i << " && mark2 == " << j
                     << ") move = " << dp[i][j]+1 << ";\n";
            }
        }
    }
    return 0;
}
