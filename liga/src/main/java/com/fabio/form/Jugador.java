package com.fabio.form;

import java.awt.Image;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name = "Jugador")
public class Jugador {

	@Id
	@GeneratedValue
	@Column(name = "id")
	private int id;

	@Column(name = "nombre")
	private String nombre;

	@Column(name = "valor")
	private int valor;

	@Column(name = "posicion")
	private String posicion;



	@OneToOne(fetch = FetchType.EAGER)
	@JoinTable(name = "asociacion", joinColumns = { @JoinColumn(name = "idjugador") }, inverseJoinColumns = {
			@JoinColumn(name = "idequipo") })
	private Equipo equipo = new Equipo();

	public int getId() {
		return id;
	}

	public Equipo getEquipo() {
		return equipo;
	}

	public void setEquipo(Equipo equipo) {
		this.equipo = equipo;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public int getValor() {
		return valor;
	}

	public void setValor(int valor) {
		this.valor = valor;
	}

	public String getPosicion() {
		return posicion;
	}

	public void setPosicion(String posicion) {
		this.posicion = posicion;
	}
	@Override
	public String toString() {
		return "Jugador [id=" + id + ", nombre=" + nombre + ", valor=" + valor + ", posicion=" + posicion + ", equipo="
				+ equipo + "]";
	}
}
