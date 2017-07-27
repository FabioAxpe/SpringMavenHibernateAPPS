package com.fabio.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.fabio.dao.EquipoDAO;
import com.fabio.form.Equipo;

@Service
public class EquipoServiceImpl implements EquipoService {
	
	@Autowired
	EquipoDAO equipoDao;
	
	@Transactional
	public List<Equipo> listarEquipos() {
		List<Equipo> listaEquipos = equipoDao.listarTodos();
		return listaEquipos;
	}

	@Transactional	
	public void eliminarEquipo(int id) {
		equipoDao.eliminarEquipo(id);
		
	}
	@Transactional
	public void anadirEquipo(Equipo nuevoEquipo) {
		equipoDao.anadirEquipo(nuevoEquipo);
		
	}
	@Transactional
	public void modificarEquipo(Equipo nuevoEquipo, int id) {
		equipoDao.modificarEquipo(nuevoEquipo,id);
		
	}

}
