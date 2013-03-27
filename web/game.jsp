<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="ratlla.Player"%>
<%@page import="ratlla.Tauler"%>


<!DOCTYPE HTML>
<html>
	<head>
                
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>3 en ratlla</title>
	
        <script type="text/javascript" src="http://code.jquery.com/jquery-1.9.1.min.js"></script>
        <script type="text/javascript" src="./js/pag_joc_javascript.js"></script>



        <%
            
            Player player = (Player)request.getSession().getAttribute("player");
            Tauler tauler =  (Tauler)request.getSession().getAttribute("tauler");
            int player1 = 0;
            int player2 = 0;
            String color;
            String td_color="";
            String click = "";
            if(tauler.activePlayer != null){
                if(tauler.activePlayer.getName().equals(tauler.players[0].getName())){
                    player2 = 1;
                }else{
                    player1 = 1;
                }
            }
            if(player.getName().equals(tauler.players[0].getName())){
                color = "#2E8B57";
            }else{
                color = "#f00";
            }
        %>
        <link rel="StyleSheet" href="./Style/pag_joc_estils.css" type="text/css">
        <style type="text/css">
            #taulell_joc td:hover{                
                background-color:<%=color%>;
            }
        </style>

	</head>
	<body <% if(tauler.activePlayer == null){
                    out.println("onload='startTimeout()'");
                 }else if(tauler.activePlayer.getName().equals(player.getName())){
                     out.println("onload='startTimeout()'");

                 } %> >
            <h1>3 EN RATLLA</h1>
		<div id="capa_joc">
			<div id="capa_taulell" align="center">
				<table id="taulell_joc">
                                    <%for(int f=0; f<3; f++){%>
                                        <tr>
                                        <%
                                        for(int j=0; j<3; j++){                                            
                                            td_color = "";
                                            click = "";
                                            if(tauler.caselles[f][j] == 1){                                                
                                                td_color = "style='background-color:#2E8B57'";
                                            }else if(tauler.caselles[f][j] == 2){
                                                td_color = "style='background-color:#f00'";
                                            }else if(tauler.activePlayer != null){
                                                if(!tauler.activePlayer.getName().equals(player.getName())){
                                                click = "onclick='select(this.id)'";
                                                }
                                            }
                                            %>
                                            <td id='<%=f+"_"+j%>' <%=td_color%>  <%=click%> >&nbsp;</td>
                                            <%
                                        }
                                        %>
                                        </tr>
                                        <%
                                    }
                                        %>
				</table>
				
				<table id="taula_lateral">
					<tr> 
						<td>&nbsp;</td>
						<td>&nbsp;</td>
					</tr>
					<tr> 
						<td>&nbsp;</td>
						<td>&nbsp;</td>
					</tr>
					<tr> 
						<td colspan="2">&nbsp;</td>
					</tr>
					<tr> 
						<td colspan="2">&nbsp;</td>
					</tr>
				</table>
				<div id="capa_info">
					<table id="taula_infoJoc" width='100%'>
						<tr>
							<td style="background-color:#2E8B57" class="num_jugadors">1</td>
							<td id="nomJugador1"
                                                            <%
                                                                if(player1 == 1){
                                                                    out.println("style='text-decoration:underline'");
                                                                }
                                                            %>
                                                            ><% if(tauler.players[0] != null){out.println(tauler.players[0].getName());}%> </td>
						</tr>
						<tr>
							<td style="background-color:#f00" class="num_jugadors">2</td>
							<td id="nomJugador2"
                                                            <%
                                                                if(player2 == 1){
                                                                    out.println("style='text-decoration:underline'");
                                                                }
                                                            %>
                                                            ><% if(tauler.players[1] != null){out.println(tauler.players[1].getName());}%></td>
						</tr>
						<tr>
							<td id="explicacioJoc" colspan="2">wee</td>
						</tr>
						<tr>
							<td id="contador" colspan="2">10</td>
						</tr>
					</table>
                                    <form id="main_form" method="POST" action="main">
                                        <input type="hidden" id="x" name ="x" value=""/>
                                        <input type="hidden" id="y" name ="y" value=""/>
                                    </form>
				</div>
			</div>
		</div>
		<div id="nom_tauler">Tauler: <% out.println(tauler.numTauler); %></div>
	</body>
</html>

