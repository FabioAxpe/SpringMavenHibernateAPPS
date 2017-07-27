package com.fabio.dao;

import java.util.ArrayList;
import java.util.Comparator;
import java.util.List;
import java.util.Random;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.engine.Collections;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.fabio.form.Equipo;
import com.fabio.form.Jugador;

@Repository
public class JugadorDAOImpl implements JugadorDAO {

	private SessionFactory sessionFactory;
	private Random randomGenerator;

	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}

	@Autowired
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	@Transactional
	public List<Jugador> listarTodos() {
		Session session = getSessionFactory().getCurrentSession();
		session.beginTransaction();
		Criteria criteria = session.createCriteria(Jugador.class);
		List<Jugador> jugadores = (List<Jugador>) criteria.list();
		return jugadores;
	}

	@Transactional
	public void eliminarJugador(int id) {
		Session session = getSessionFactory().getCurrentSession();
		session.beginTransaction();
		Jugador jugador = (Jugador) session.get(Jugador.class, id);
		session.delete(jugador);
		session.flush();

	}

	@Transactional
	public void anadirJugador(Jugador nuevoJugador) {
		Session session = getSessionFactory().getCurrentSession();
		session.beginTransaction();
		nuevoJugador.setEquipo(null);
		session.save(nuevoJugador);
		session.flush();
	}

	@Transactional
	public void modificarJugador(Jugador nuevoJugador, int id) {
		Session session = getSessionFactory().getCurrentSession();
		session.beginTransaction();
		Jugador jugador = (Jugador) session.get(Jugador.class, id);
		jugador.setNombre(nuevoJugador.getNombre());
		jugador.setValor(nuevoJugador.getValor());

	}

	@Transactional
	public void eliminarFichaje(int idjug) {
		Session session = getSessionFactory().getCurrentSession();
		session.beginTransaction();
		Jugador jugador = (Jugador) session.get(Jugador.class, idjug);
		jugador.setEquipo(null);
		session.flush();
	}

	@Transactional
	public void hacerFichaje(String jugador, String equipo) {
		Session session = getSessionFactory().getCurrentSession();
		session.beginTransaction();
		// Sacar el id de jugador y equipo para pasarselo.
		Criteria criteria = session.createCriteria(Jugador.class);
		List<Jugador> jugadores = (List<Jugador>) criteria.list();
		int idjugador = 0;
		for (Jugador j : jugadores) {
			if (j.getNombre().equalsIgnoreCase(jugador)) {
				idjugador = j.getId();
			}
		}
		Criteria criteriae = session.createCriteria(Equipo.class);
		List<Equipo> equipos = (List<Equipo>) criteriae.list();
		int idequipo = 0;
		for (Equipo e : equipos) {
			if (e.getNombre().equalsIgnoreCase(equipo)) {
				idequipo = e.getId();
			}
		}
		Jugador jugadore = (Jugador) session.get(Jugador.class, idjugador);
		Equipo equipoe = (Equipo) session.get(Equipo.class, idequipo);
		jugadore.setEquipo(equipoe);
		session.flush();

	}

	@Transactional
	public List<Jugador> aleatorio() {
		Session session = getSessionFactory().getCurrentSession();
		session.beginTransaction();
		Criteria criteria = session.createCriteria(Jugador.class);
		List<Jugador> jugadores = (List<Jugador>) criteria.list();
		List<Jugador> sorteoList = new ArrayList<Jugador>();
		int j = 0;
		int p = 0;
		int de = 0;
		int m = 0;
		int d = 0;

		while (j < 11) {

			int random = (int) (Math.random() * jugadores.size());
			if (jugadores.get(random).getPosicion().equals("Portero") && p < 1) {
				sorteoList.add(jugadores.get(random));
				p++;
				j++;
			} else {
				if (jugadores.get(random).getPosicion().equals("Defensa") && de < 3) {
					sorteoList.add(jugadores.get(random));
					de++;
					j++;
				} else {
					if (jugadores.get(random).getPosicion().equals("Medio") && m < 4) {
						sorteoList.add(jugadores.get(random));
						m++;
						j++;
					} else {
						if (jugadores.get(random).getPosicion().equals("Delantero") && d < 3) {
							sorteoList.add(jugadores.get(random));
							d++;
							j++;
						}
					}
				}
			}
			jugadores.remove(jugadores.get(random));
		}

		return sorteoList;
	}

}
