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
    
    protected int[][] caselles;
    public Player[] players;
    public Player activePlayer;
    public int numTauler;
    
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
        for(int i = 0; i< players.length; i++){
            if(this.players[i].getName() != this.activePlayer.getName()){
                this.activePlayer = this.players[i];
                break;
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
    
}