package com.fabio.service;

import java.util.List;

import com.fabio.form.Jugador;

public interface JugadorService {
	
	public List<Jugador> listarJugadores();
	public void eliminarJugador(int id);
	public void anadirJugador(Jugador nuevoJugador);
	public void modificarJugador(Jugador nuevoJugador, int id);
	public void eliminarFichaje(int idjug);
	public void hacerFichaje(String jugador, String equipo);
	public List<Jugador> aleatorio();

}
