package com.fabio.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.fabio.dao.JugadorDAO;
import com.fabio.form.Jugador;

@Service
public class JugadorServiceImpl implements JugadorService {
	
	@Autowired
	JugadorDAO jugadorDao;
	
	@Transactional
	public List<Jugador> listarJugadores() {
		List<Jugador> listaJugadores = jugadorDao.listarTodos();
		return listaJugadores;
	}

	@Transactional	
	public void eliminarJugador(int id) {
		jugadorDao.eliminarJugador(id);
		
	}

	public void anadirJugador(Jugador nuevoJugador) {
		jugadorDao.anadirJugador(nuevoJugador);
		
	}

	public void modificarJugador(Jugador nuevoJugador, int id) {
		jugadorDao.modificarJugador(nuevoJugador,id);
		
	}

	public void eliminarFichaje(int idjug) {
		jugadorDao.eliminarFichaje(idjug);
		
	}

	public void hacerFichaje(String jugador, String equipo) {
		jugadorDao.hacerFichaje(jugador,equipo);
		
	}

	public List<Jugador> aleatorio() {
		List<Jugador> sorteoList = jugadorDao.aleatorio();
		return sorteoList;
	}


}
