package com.fabio.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.fabio.form.Equipo;
import com.fabio.form.Jugador;
import com.fabio.service.EquipoService;
import com.fabio.service.JugadorService;

@Controller
public class JugadorController {

	
@Autowired
private JugadorService jugadorService;
@Autowired
private EquipoService equipoService;


@RequestMapping("/listarjugadores")
public String listarJugadores(Model model){	
	model.addAttribute("jugadorList", jugadorService.listarJugadores());
	model.addAttribute("equipoList", equipoService.listarEquipos());
	return "listarJugadores";
}
	

@RequestMapping(value ="/eliminar")
public String eliminarJugador(HttpServletRequest request, HttpServletResponse response, Model model){
	int id = Integer.parseInt(request.getParameter("idOculto"));
	jugadorService.eliminarJugador(id);
	model.addAttribute("jugadorList", jugadorService.listarJugadores());
	model.addAttribute("equipoList", equipoService.listarEquipos());
	return "listarJugadores";
}
@RequestMapping(value ="/eliminare")
public String eliminarEquippo(HttpServletRequest request, HttpServletResponse response, Model model){
	int ide = Integer.parseInt(request.getParameter("idOcult"));
	equipoService.eliminarEquipo(ide);
	model.addAttribute("jugadorList", jugadorService.listarJugadores());
	model.addAttribute("equipoList", equipoService.listarEquipos());
	return "listarJugadores";
}

@RequestMapping(value ="/anadir")
public String anadirJugador(Model model){
	model.addAttribute("nuevoJugador", new Jugador());
	model.addAttribute("jugadorList", jugadorService.listarJugadores());
	return "anadir";
}
@RequestMapping(value ="/anadira")
public String anadirJugador(@ModelAttribute("nuevoJugador") Jugador nuevoJugador,Model model){
	jugadorService.anadirJugador(nuevoJugador);
	model.addAttribute("nuevoJugador", new Jugador());
	model.addAttribute("jugadorList", jugadorService.listarJugadores());
	return "anadir";
}
@RequestMapping(value ="/modificar")
public String modificarJugador(@ModelAttribute("nuevoJugador") Jugador nuevoJugador,HttpServletRequest request, HttpServletResponse response, Model model){
	int id = Integer.parseInt(request.getParameter("idOcult"));
//	System.out.println(id);
//	System.out.println(nuevoJugador.getNombre());
//	System.out.println(nuevoJugador.getValor());
//	Me trae todos los valores
	jugadorService.modificarJugador(nuevoJugador,id);
	model.addAttribute("nuevoJugador", new Jugador());
	model.addAttribute("jugadorList", jugadorService.listarJugadores());
	return "anadir";
}

@RequestMapping(value ="/modificare")
public String anadirEquipo(Model model){
	model.addAttribute("nuevoEquipo", new Equipo());
	model.addAttribute("equipoList", equipoService.listarEquipos());
	return "modificare";
}
@RequestMapping(value ="/modificarejug")
public String modificarEquipo(@ModelAttribute("nuevoEquipo") Equipo nuevoEquipo,HttpServletRequest request, HttpServletResponse response, Model model){
	int id = Integer.parseInt(request.getParameter("idOculte"));
	equipoService.modificarEquipo(nuevoEquipo,id);
	model.addAttribute("nuevoEquipo", new Equipo());
	model.addAttribute("equipoList", equipoService.listarEquipos());
	return "modificare";
}

@RequestMapping(value ="/modificara")
public String anadirEquipo(@ModelAttribute("nuevoEquipo") Equipo nuevoEquipo,Model model){
	equipoService.anadirEquipo(nuevoEquipo);
	model.addAttribute("nuevoEquipo", new Equipo());
	model.addAttribute("equipoList", equipoService.listarEquipos());
	return "modificare";
}
@RequestMapping(value ="/eliminarfichaje")
public String eliminarFichaje(HttpServletRequest request, HttpServletResponse response, Model model){
	int idjug = Integer.parseInt(request.getParameter("idjugOcult"));
	jugadorService.eliminarFichaje(idjug);
	model.addAttribute("jugadorList", jugadorService.listarJugadores());
	model.addAttribute("equipoList", equipoService.listarEquipos());
	return "listarJugadores";
}
@RequestMapping(value ="/anadirfichaje")
public String anadirFichaje(Model model){
	model.addAttribute("jugadorList", jugadorService.listarJugadores());
	model.addAttribute("equipoList", equipoService.listarEquipos());
	return "fichajes";
}
@RequestMapping(value ="/hacerfichaje")
public String hacerFichaje(HttpServletRequest request, HttpServletResponse response, Model model){
	String jugador=request.getParameter("jugadorselected");
	String equipo=request.getParameter("equiposelected");
	jugadorService.hacerFichaje(jugador,equipo);
	model.addAttribute("jugadorList", jugadorService.listarJugadores());
	model.addAttribute("equipoList", equipoService.listarEquipos());
	return "listarJugadores";
}
@RequestMapping(value ="/aleatorio")
public String aleatorio(HttpServletRequest request, HttpServletResponse response, Model model){
	model.addAttribute("jugadorList", jugadorService.listarJugadores());
	model.addAttribute("equipoList", equipoService.listarEquipos());
	model.addAttribute("sorteoList", jugadorService.aleatorio());
	return "listarJugadores";
}
}
