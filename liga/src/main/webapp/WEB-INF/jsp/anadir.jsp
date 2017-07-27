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
	<form:form method="post" action="anadir" id="formAnadir"
		name="formAnadir" modelAttribute="nuevoJugador">
		<div id="paginaanadir">
			<h2>AÑADE O MODIFICA JUGADORES</h2>

			<form:label path="nombre">
				<spring:message code="label.nombre" />
			</form:label>
			<form:input path="nombre" />

			<form:label path="valor">
				<spring:message code="label.valor" />
			</form:label>
			<form:input path="valor" />
			<form:label path="posicion">
				<spring:message code="label.posicion" />
			</form:label>
			<form:input path="posicion" />


			<c:if test="${!empty jugadorList}">
				<table id="tablaListar">
					<tr>
						<th><spring:message code="label.nombre" /></th>
						<th><spring:message code="label.valor" /></th>
						<th><spring:message code="label.posicion" /></th>
						<th>&nbsp;</th>
						
					</tr>
					<c:forEach items="${jugadorList}" var="jugador">
						<tr>
							<td>${jugador.nombre}</td>
							<td>${jugador.valor}</td>
							<td>${jugador.posicion}</td>
							<td><button class="botonupdate" onclick="modificar(${jugador.id})">Modificar</button></td>								
								<input type="hidden" id="idOcult" name="idOcult" value="${jugador.id}">
						</tr>
					</c:forEach>
				</table>
			</c:if>
			<c:if test="${empty jugadorList}">
				<p>
					<spring:message code="label.sinjug" />
				</p>
			</c:if>
			<button class="botonanadir" onclick="anadirallistado()">Añadir</button>
			
			<button class="botonanadir" onclick="volverallistado()">Volver
				al listado</button>
		</div>
	</form:form>
	<script>
		function anadirallistado() {
			document.getElementById('formAnadir').action = 'anadira';

		};
		function volverallistado() {
			document.getElementById('formAnadir').action = 'listarjugadores';
		};
		function modificar(id){
			document.getElementById("idOcult").value=id;
			document.getElementById("formAnadir").action='modificar';	
		}
	</script>
</body>
</html>