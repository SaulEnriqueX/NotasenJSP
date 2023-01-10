/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.grenn.mensajesjsp;

/**
 *
 * @author Saul
 */
import java.sql.*;
import java.util.*;
import static com.grenn.mensajesjsp.Conexion.*;
import java.util.logging.Level;
import java.util.logging.Logger;

public class MensajeDAO {

    private Connection conn = null;
    private PreparedStatement ps = null;
    private ResultSet rs = null;
    private Mensaje mensaje;

    public List<Mensaje> seleccionar() throws ClassNotFoundException {
        String sql = "Select *from mensajes";
        List<Mensaje> mensajes = new ArrayList<>();

        try {
            this.conn = getConexion();
            this.ps = this.conn.prepareCall(sql);
            this.rs = this.ps.executeQuery();

            while (this.rs.next()) {
                int id = this.rs.getInt("id_mensaje");
                String mensajee = this.rs.getString("mensaje");
                String autor = this.rs.getString("autor");
                String fecha = this.rs.getString("fecha");

                this.mensaje = new Mensaje(id, mensajee, autor, fecha);
                mensajes.add(this.mensaje);
            }
        } catch (SQLException ex) {
            ex.printStackTrace(System.out);
        } finally {
            try {
                cerrar(this.rs);
                cerrar(this.ps);
                cerrar(this.conn);
            } catch (SQLException ex) {
                ex.printStackTrace(System.out);
            }
        }
        return mensajes;
    }

    public int inserta(Mensaje mensaje) throws ClassNotFoundException {
        String sql = "insert into mensajes (mensaje,autor,fecha) values (?,?,CURRENT_TIME())";
        int registros = 0;
        try {
            this.conn = getConexion();
            this.ps = this.conn.prepareStatement(sql);

            this.ps.setString(1, mensaje.getMensaje());
            this.ps.setString(2, mensaje.getAutor());
            registros = this.ps.executeUpdate();

        } catch (SQLException ex) {
            ex.printStackTrace(System.out);
        } finally {
            try {
                cerrar(this.ps);
                cerrar(this.conn);
            } catch (SQLException ex) {
                ex.printStackTrace(System.out);
            }
        }
        return registros;
    }

    public int editar(Mensaje mensaje) throws ClassNotFoundException {
        String sql = "update  mensajes set mensaje=?,autor=? where id_mensaje=? ";
        int registros = 0;
        try {
            this.conn = getConexion();
            this.ps = this.conn.prepareStatement(sql);

            this.ps.setString(1, mensaje.getMensaje());
            this.ps.setString(2, mensaje.getAutor());
            this.ps.setInt(3, mensaje.getId());
            registros = this.ps.executeUpdate();

        } catch (SQLException ex) {
            ex.printStackTrace(System.out);
        } finally {
            try {
                cerrar(this.ps);
                cerrar(this.conn);
            } catch (SQLException ex) {
                ex.printStackTrace(System.out);
            }
        }
        return registros;
    }

    public int eliminar(Mensaje mensaje) throws ClassNotFoundException {
        String sql = "delete from  mensajes  where id_mensaje=? ";
        int registros = 0;
        try {
            this.conn = getConexion();
            this.ps = this.conn.prepareStatement(sql);

          
            this.ps.setInt(1, mensaje.getId());
            registros = this.ps.executeUpdate();

        } catch (SQLException ex) {
            ex.printStackTrace(System.out);
        } finally {
            try {
                cerrar(this.ps);
                cerrar(this.conn);
            } catch (SQLException ex) {
                ex.printStackTrace(System.out);
            }
        }
        return registros;
    }

}
