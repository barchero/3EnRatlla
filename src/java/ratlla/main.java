package ratlla;

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author DAW
 */
public class main extends HttpServlet {
    public ArrayList<Tauler> Taulers;
    public ArrayList<Player> Players;
    
    public main(){
        
        Taulers = new ArrayList<Tauler>();
        Players = new ArrayList<Player>();
    }
    
    @Override
    public void init() throws ServletException {
        super.init();              
        startTaulers(5);
    }

     protected void startTaulers(int num){
        for(int i = 0; i<num; i++){
            addTauler(i);
        }
    }
    
    protected void resetTaulers(){
        for(int i = 0; i<this.Taulers.size(); i++){
           this.Taulers.set(i ,new Tauler(i));
        }
    }
    protected void addTauler(int num){
        this.Taulers.add(new Tauler(num));
    }
    
    
    protected Tauler getTaulerLliure(){        
        for(Tauler tauler: Taulers){
            if(tauler.getStatus() == 0){
                return tauler;
            }
        }
        return null;
    }
    
    protected boolean playerRepeat(String name){
        for(Player player: Players){
            if(player.getName() == name){
                return true;
            }
        }
        return false;
    }
    
    /**
     * Processes requests for both HTTP
     * <code>GET</code> and
     * <code>POST</code> methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
          HttpSession session = request.getSession(true);
          String text;
          Player player;
          Tauler tauler;
          String url;
          
          if ((Player)session.getAttribute("player") == null) {
            String nom = (String)request.getParameter("inputNomFormLogin");
            if( playerRepeat(nom) == false){
                player = new Player(nom);
                tauler = getTaulerLliure();
                
                session.setAttribute("tauler", tauler);
                session.setAttribute("player", player);
                
                tauler.addPlayer(player);
                Players.add(player);
                url = "/game.jsp";
                
            }else{
                url = "/index.jsp";
            }            
          } else {
            /*tauler = (Tauler)session.getAttribute("tauler");
            player = (Player)session.getAttribute("player");*/
            url = "/game.jsp";
          }
          request.getRequestDispatcher(url).forward(request, response);
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        super.doGet(request, response); //To change body of generated methods, choose Tools | Templates.
        processRequest(request, response);
    }

    /**
     * Handles the HTTP
     * <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}
