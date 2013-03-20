<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="ratlla.main"%>

<!DOCTYPE HTML>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>3 EN RATLLA</title>
		
		<link rel="StyleSheet" href="pag_joc_estils.css" type="text/css">
	</head>
	<body>
		<div id="divPare_formLogin">
			<div id="div_formLogin">
				<fieldset id="fieldset_formLogin">
					<legend align= "center">INICIAR SESSIÓ</legend>
					<form action="./main" method="post" id="formLogin" name="formLogin">
						Escriu un nick:  
						<input type="text" id="inputNomFormLogin" name="inputNomFormLogin" />
						<input type="submit" id="submitFormLogin" name="submitFormLogin" value="ENTRAR" />
					</form>
				</fieldset>
			</div>
		</div>
	</body>
</html>

