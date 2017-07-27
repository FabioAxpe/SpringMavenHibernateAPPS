package com.fabio.dao;

import java.util.List;

import com.fabio.form.Equipo;

public interface EquipoDAO {

	public List<Equipo> listarTodos();

	public void eliminarEquipo(int id);

	public void anadirEquipo(Equipo nuevoEquipo);

	public void modificarEquipo(Equipo Equipo, int id);

}
