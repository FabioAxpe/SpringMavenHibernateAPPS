package com.fabio.service;

import java.util.List;

import com.fabio.form.Equipo;

public interface EquipoService {
	
	public List<Equipo> listarEquipos();
	public void eliminarEquipo(int id);
	public void anadirEquipo(Equipo nuevoEquipo);
	public void modificarEquipo(Equipo nuevoEquipo, int id);

}
