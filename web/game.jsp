<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="ratlla.Player"%>
<%@page import="ratlla.Tauler"%>


<!DOCTYPE HTML>
<html>
	<head>
                
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>3 en ratlla</title>
		
        <script type="text/javascript" src="./js/pag_joc_javascript.js"></script>
        <link rel="StyleSheet" href="./Style/pag_joc_estils.css" type="text/css">
        <%
            Player player = (Player)request.getSession().getAttribute("player");
            Tauler tauler =  (Tauler)request.getSession().getAttribute("tauler");
        %>
	</head>
	<body <% if(tauler.activePlayer.getName() != player.getName()){out.println("onload='startTimeout()'");} %> >
            <h1>3 EN RATLLA</h1>
		<div id="capa_joc">
			<div id="capa_taulell" align="center">
				<table id="taulell_joc">
					<tr>
                                            <td id ="0_0" onclick="select(this.id)">&nbsp;</td>
						<td id ="0_1" onclick="select(this.id)">&nbsp;</td>
						<td id ="0_2" onclick="select(this.id)">&nbsp;</td>
					</tr>
					<tr>
						<td id ="1_0" onclick="select(this.id)">&nbsp;</td>
						<td id ="1_1" onclick="select(this.id)">&nbsp;</td> 
						<td id ="1_2" onclick="select(this.id)">&nbsp;</td>
					</tr>
					<tr>
						<td id ="2_0" onclick="select(this.id)">&nbsp;</td>
						<td id ="2_1" onclick="select(this.id)">&nbsp;</td>
						<td id ="2_2" onclick="select(this.id)">&nbsp;</td>
					</tr>
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
							<td class="num_jugadors">1</td>
							<td id="nomJugador1"><% out.println(tauler.players[0].getName());%> </td>
						</tr>
						<tr>
							<td class="num_jugadors">2</td>
							<td id="nomJugador2"><% out.println(tauler.players[1].getName());%></td>
						</tr>
						<tr>
							<td id="explicacioJoc" colspan="2">wee</td>
						</tr>
						<tr>
							<td id="contador" colspan="2">10</td>
						</tr>
					</table>
                                    <form id="main_form" method="POST" action="/main">
                                        <input type="hidden" id="x" value=""/>
                                        <input type="hidden" id="y" value=""/>
                                    </form>
				</div>
			</div>
		</div>
		<div id="nom_tauler">Tauler: <% out.println(tauler.numTauler); %></div>
	</body>
</html>

