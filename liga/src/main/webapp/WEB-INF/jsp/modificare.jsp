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
	<form:form method="post" action="modificare" id="formModificare"
		name="formModificare" modelAttribute="nuevoEquipo">
		<div id="paginamodificar">
			<h2>AÑADE O MODIFICA EQUIPOS</h2>

			<form:label path="nombre">
				<spring:message code="label.nombree" />
			</form:label>
			<form:input path="nombre" />


			<c:if test="${!empty equipoList}">
				<table id="tablaListar">
					<tr>
						<th><spring:message code="label.nombree" /></th>
					
						<th>&nbsp;</th>
						
					</tr>
					<c:forEach items="${equipoList}" var="equipo">
						<tr>
							<td>${equipo.nombre}</td>
							<td><button class="botonupdate" onclick="modificare(${equipo.id})">Modificar</button></td>								
								<input type="hidden" id="idOculte" name="idOculte" value="${equipo.id}">
						</tr>
					</c:forEach>
				</table>
			</c:if>
			<c:if test="${empty equipoList}">
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
			document.getElementById('formModificare').action = 'modificara';

		};
		function volverallistado() {
			document.getElementById('formModificare').action = 'listarjugadores';
		};
		function modificare(id){
			document.getElementById("idOculte").value=id;
			document.getElementById("formModificare").action='modificarejug';	
		}
	</script>
</body>
</html>