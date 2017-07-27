package com.fabio.dao;

import java.util.List;

import com.fabio.form.Jugador;

public interface JugadorDAO {

	public List<Jugador> listarTodos();

	public void eliminarJugador(int id);

	public void anadirJugador(Jugador nuevoJugador);

	public void modificarJugador(Jugador nuevoJugador, int id);

	public void eliminarFichaje(int idjug);

	public void hacerFichaje(String jugador, String equipo);

	public List<Jugador> aleatorio();



}
