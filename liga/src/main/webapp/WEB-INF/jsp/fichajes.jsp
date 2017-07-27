<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<title>LaLiga</title>
<spring:url value="/resources/css/style.css" var="estiloCSS" />
<link href="${estiloCSS}" rel="stylesheet" />
<link rel="shortcut icon" href="/resources/images/favicon.ico" />
</head>
<body>
	<form:form method="post" action="hacerFichajes" id="formFichajes"
		name="formFichajes">
		<div id="paginafichajes">
			<div id="jugadores">
				<h2>JUGADORES</h2>
				<c:if test="${!empty jugadorList}">
					<table id="tablaListar">
						<tr>
							<th><spring:message code="label.nombre" /></th>
						</tr>
						<c:forEach items="${jugadorList}" var="jugador">
							<tr>
							
								<td><input type="checkbox" name="jugadorselected" id="jugadorselected" value="${jugador.nombre}"/>${jugador.nombre}</td>
								<input type="hidden" id="idOculto" name="idOculto" value="${jugador.id}">
							</tr>
						</c:forEach>
					</table>
				</c:if>
				<c:if test="${empty jugadorList}">
					<p>
						<spring:message code="label.sinjug" />
					</p>
				</c:if>
				<button class="botonanadir" onclick="hacerfichaje()">Hacer fichaje</button>
				<button class="botonanadir" onclick="volverallistado()">Volver
				al listado</button>
			</div>
			<div id="equipos">
				<h2>EQUIPOS</h2>
				<c:if test="${!empty equipoList}">
					<table id="tablaListar">
						<tr>	
							<th><spring:message code="label.nombree" /></th>
						</tr>
						<c:forEach items="${equipoList}" var="equipo">
							<tr>
							<td><input type="checkbox" name="equiposelected" id="equiposelected" value="${equipo.nombre}"/>${equipo.nombre}</td>
							<input type="hidden" id="idOcult" name="idOcult" value="${equipo.id}">
							</tr>
						</c:forEach>
					</table>
				</c:if>
				<c:if test="${empty equipoList}">
					<p>
						<spring:message code="label.sinjug" />
					</p>
				</c:if>
				
			</div>
		</div>
	</form:form>
	<script>
	function volverallistado() {
		document.getElementById('formFichajes').action = 'listarjugadores';
	};
	function hacerfichaje(jugador,equipo){
		jugadorseleccionado=document.getElementById('jugadorselected').value;
		equiposeleccionado=document.getElementById('equiposelected').value;
		jugadorseleccionado=jugador;
		equiposeleccionado=equipo;
		document.getElementById('formFichajes').action = 'hacerfichaje';
	}
		</script>
</body>
</html>