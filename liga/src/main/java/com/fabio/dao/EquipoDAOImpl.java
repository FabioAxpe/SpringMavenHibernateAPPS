package com.fabio.dao;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;
import com.fabio.form.Equipo;

@Repository
public class EquipoDAOImpl implements EquipoDAO{
	
	private SessionFactory sessionFactory;

	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}

	@Autowired
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	@Transactional
	public List<Equipo> listarTodos() {
		Session session = getSessionFactory().getCurrentSession();
		session.beginTransaction();
		Criteria criteria = session.createCriteria(Equipo.class);
		List<Equipo> equipos = (List<Equipo>) criteria.list();
		return equipos;
	}

	@Transactional
	public void eliminarEquipo(int id) {
		Session session = getSessionFactory().getCurrentSession();
		session.beginTransaction();
		Equipo equipo = (Equipo) session.get(Equipo.class, id);
		session.delete(equipo);
		session.flush();
		
	}
	
	@Transactional
	public void anadirEquipo(Equipo nuevoEquipo) {
		Session session = getSessionFactory().getCurrentSession();
		session.beginTransaction();
		session.save(nuevoEquipo);
		session.flush();	
		
		
	}
	@Transactional
	public void modificarEquipo(Equipo nuevoEquipo, int id) {
		Session session = getSessionFactory().getCurrentSession();
		session.beginTransaction();
		Equipo equipo = (Equipo) session.get(Equipo.class, id);
		equipo.setNombre(nuevoEquipo.getNombre());	
				
	}

}
