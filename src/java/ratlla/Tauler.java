package ratlla;

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 *
 * @author DAW
 */
public class Tauler {
    
    public int[][] caselles;
    public Player[] players;
    public Player activePlayer;
    public int numTauler;
    public int winner=0;
    
    public Tauler(int number){
        this.numTauler = number;
        players = new Player[2];
        caselles = new int[3][3];
        for(int y = 0; y<3; y++){
            for(int x = 0; x<3; x++){
                caselles[x][y] = 0;
            }
        }
    }
    
    public int getStatus(){

        if(players[0] != null && players[1] != null){
            return 1;
        }else{
            return 0;
        }
    }
    public void changeTurn(){
        if(this.activePlayer != null){
            if(this.players[0].getName().equals(activePlayer.getName())){
                activePlayer = this.players[1];
            }else{
                activePlayer = this.players[0];
            }
        }
    }
    
    public void addPlayer(Player player){

        if(this.players[0]==null){
            this.players[0] = player;
        }else{
            this.players[1] = player;
            this.activePlayer = player;
        }
            
    }
    public void choiceCell(String i_x, String i_y, Player player){
        
        int x = Integer.parseInt(i_x);
        int y = Integer.parseInt(i_y);
        if(player.getName().equals(players[0].getName())){
            caselles[x][y] = 1;
        }else{
            caselles[x][y] = 2;
        }
    }
    public void checkWinner(){
        //horitzontal
        for(int i = 0; i<3; i++){
            if(caselles[i][0] == caselles[i][1] && caselles[i][1] == caselles[i][2]){
                winner = caselles[i][0];
            }
        }
        //vertical
        if(winner == 0){
        
            for(int v = 0; v<3; v++){
                if(caselles[0][v] == caselles[1][v] && caselles[1][v]==caselles[2][v]){
                    winner = caselles[0][v];
                }
            }
        }
        //diagonal
        if(winner == 0){
            if(caselles[0][0] == caselles[1][1] && caselles[1][1] == caselles[2][2]){
                winner = caselles[0][0];
            }else if(caselles[0][2] == caselles[1][1] && caselles[1][1] == caselles[2][0] ){
                winner = caselles[0][2];
            }
            
        }        
    }
    
}
