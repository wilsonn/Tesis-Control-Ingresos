/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.whnm.sicqfdp.beans;

/**
 *
 * @author wilson
 */
public class TipoEquipo {
    private int idTipoEquipo;
    private String denominacion;
    private int habilitado;
    private int indError;
    private String msjError;

    public int getIdTipoEquipo() {
        return idTipoEquipo;
    }

    public void setIdTipoEquipo(int idTipoEquipo) {
        this.idTipoEquipo = idTipoEquipo;
    }

    public String getDenominacion() {
        return denominacion;
    }

    public void setDenominacion(String denominacion) {
        this.denominacion = denominacion;
    }

    public int getHabilitado() {
        return habilitado;
    }

    public void setHabilitado(int habilitado) {
        this.habilitado = habilitado;
    }

    public int getIndError() {
        return indError;
    }

    public void setIndError(int indError) {
        this.indError = indError;
    }

    public String getMsjError() {
        return msjError;
    }

    public void setMsjError(String msjError) {
        this.msjError = msjError;
    }
    
    
}
