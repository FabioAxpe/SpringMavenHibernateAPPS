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
	<form:form method="post" action="listarJugadores" id="formListar"
		name="formListar">
		<div id="paginalistar1">
			<div id="jugadores1">
				<h2>JUGADORES</h2>
				<c:if test="${!empty jugadorList}">
					<table id="tablaListar">
						<tr>
							<th><spring:message code="label.idjug" /></th>
							<th><spring:message code="label.nombre" /></th>
							<th><spring:message code="label.valor" /></th>
							<th><spring:message code="label.posicion" /></th>
							<th>&nbsp;</th>
						</tr>
						<c:forEach items="${jugadorList}" var="jugador">
							<tr>
								<td>${jugador.id}</td>
								<td>${jugador.nombre}</td>
								<td>${jugador.valor}</td>
								<td>${jugador.posicion}</td>

								<td><button class="botonborrar"
										onclick="eliminar(${jugador.id})">X</button></td>
								<input type="hidden" id="idOculto" name="idOculto"
									value="${jugador.id}">
							</tr>
						</c:forEach>
					</table>
				</c:if>
				<c:if test="${empty jugadorList}">
					<p>
						<spring:message code="label.sinjug" />
					</p>
				</c:if>
				<button class="botonanadir" onclick="anadir()">Añadir o
					Modificar Jugador</button>
			</div>

			<div id="equipos1">
				<h2>EQUIPOS</h2>
				<c:if test="${!empty equipoList}">
					<table id="tablaListar">
						<tr>
							<th><spring:message code="label.ide" /></th>
							<th><spring:message code="label.nombree" /></th>
							<th>&nbsp;</th>
						</tr>
						<c:forEach items="${equipoList}" var="equipo">
							<tr>
								<td>${equipo.id}</td>
								<td>${equipo.nombre}</td>

								<td><button class="botonborrar"
										onclick="eliminare(${equipo.id})">X</button></td>
								<input type="hidden" id="idOcult" name="idOcult"
									value="${equipo.id}">
							</tr>
						</c:forEach>
					</table>
				</c:if>
				<c:if test="${empty equipoList}">
					<p>
						<spring:message code="label.sinjug" />
					</p>
				</c:if>
				<button class="botonanadir" onclick="anadire()">Añadir o
					Modificar Equipo</button>
			</div>
			<div id="fichajes1">
				<h2>FICHAJES</h2>

				<table id="tablaListar">
					<tr>
						<th><spring:message code="label.nombre" /></th>
						<th><spring:message code="label.nombree" /></th>
						<th>&nbsp;</th>
					</tr>
					<c:forEach items="${jugadorList}" var="jugador">
						<c:if test="${!empty jugador.equipo}">
							<tr>
								<td>${jugador.nombre}</td>
								<td>${jugador.equipo.nombre}</td>
								<td><button class="botonborrar"
										onclick="eliminarf(${jugador.id})">X</button></td>
								<input type="hidden" id="idjugOcult" name="idjugOcult"
									value="${jugador.id}">
							</tr>
						</c:if>
					</c:forEach>
					<c:if test="${empty jugadorList}">
						<p>
							<spring:message code="label.sinjug" />
						</p>
					</c:if>

				</table>

				<button class="botonanadir" onclick="anadirfich()">Añadir o
					Modificar Fichaje</button>
			</div>
			<div id="jugadores1">
				<h2>EQUIPO SORTEADO</h2>
				<c:if test="${!empty sorteoList}">
					<table id="tablaCampo">
						<tr>
						<c:set var = "valorporteros" value = "0"/>
						<c:forEach items="${sorteoList}" var="jugador">
							<c:if test="${jugador.posicion=='Portero'}">
							<c:set var = "valorunportero" value="${jugador.valor}"/>
								<td colspan="12" style="text-align: center;">${jugador.nombre}(${jugador.valor}) ${jugador.equipo.nombre}</td>
							<c:set var = "valorporteros" value = "${valorporteros + valorunportero}"/>
							</c:if>
						</c:forEach>
						</tr>
						<tr>
						<c:set var = "valordefensas" value = "0"/>
							<c:forEach items="${sorteoList}" var="jugador">
								<c:if test="${jugador.posicion=='Defensa'}">
									<c:set var = "valorundefensa" value="${jugador.valor}"/>
									<td colspan="4" style="text-align: center;">${jugador.nombre}(${jugador.valor}) ${jugador.equipo.nombre}</td>
								<c:set var = "valordefensas" value = "${valordefensas + valorundefensa}"/>
								</c:if>
							</c:forEach>
						</tr>
						<tr>
						<c:set var = "valormedios" value = "0"/>
							<c:forEach items="${sorteoList}" var="jugador">

								<c:if test="${jugador.posicion=='Medio'}">
								<c:set var = "valordeunmedio" value="${jugador.valor}"/>
									
									<td colspan="3" style="text-align: center;">${jugador.nombre}(${jugador.valor}) ${jugador.equipo.nombre}</td>
								<c:set var = "valormedios" value = "${valormedios + valordeunmedio}"/>
								</c:if>
							</c:forEach>
						</tr>
						<tr>
						<c:set var = "valordelanteros" value = "0"/>
							<c:forEach items="${sorteoList}" var="jugador">
								<c:if test="${jugador.posicion=='Delantero'}">
								<c:set var = "valordeundelantero" value="${jugador.valor}"/>
									<td colspan="4" style="text-align: center;">${jugador.nombre}(${jugador.valor}) ${jugador.equipo.nombre}</td>
								<c:set var = "valordelanteros" value = "${valordelanteros + valordeundelantero}"/>
								</c:if>
							</c:forEach>
						</tr>
					</table>
				</c:if>
				<c:if test="${empty sorteoList}">
					<p>
						<spring:message code="label.sinjug" />
					</p>
				</c:if>
				<h4>P: ${valorporteros} - Def: ${valordefensas} - M: ${valormedios} - Del: ${valordelanteros} -- VALOR TOTAL: ${valorporteros+valordefensas+valormedios+valordelanteros}</h3>
				<button class="botonanadir" onclick="aleatorio()">Sortear
					equipo</button>
			</div>
		</div>
	</form:form>
	<script>
	function eliminar(id){
		document.getElementById("idOculto").value=id;
		document.getElementById("formListar").action='eliminar';	
	}
	function eliminare(id){
		document.getElementById("idOcult").value=id;
		document.getElementById("formListar").action='eliminare';	
	}
		function anadir(){
		document.getElementById("formListar").action='anadir';	
	}
	function anadire(){
		document.getElementById("formListar").action='modificare';	
	}
	function eliminarf(idjug){
		document.getElementById("idjugOcult").value=idjug;
		document.getElementById("formListar").action='eliminarfichaje';	
	}
	function anadirfich(){
		document.getElementById("formListar").action='anadirfichaje';
	}
	function aleatorio(){
		document.getElementById("formListar").action='aleatorio';
	}
		</script>
</body>
</html>