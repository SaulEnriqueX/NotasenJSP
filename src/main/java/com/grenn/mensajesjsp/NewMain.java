/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Main.java to edit this template
 */
package com.grenn.mensajesjsp;

import java.sql.SQLException;
import java.util.List;

/**
 *
 * @author Saul
 */
public class NewMain {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) throws SQLException, ClassNotFoundException {
        //Conexion.getConexion();
        //System.out.println("Conexion Exitosa");

        MensajeDAO mensajeDAO = new MensajeDAO();

        /* INSERTAR OBJETO
       Mensaje msn = new Mensaje("Bienvenido", "Enrique");
       int registro = mensajeDAO.inserta(msn);
        System.out.println("Se inserto "+registro+ "registro");
         */
 /* EDITAR OBJETO
         Mensaje msn = new Mensaje(2, "Tu pedido llego", "Sr Enrique");
        int registro = mensajeDAO.editar(msn);
           System.out.println("Se acutalizo "+registro+ "registro");
         */
        Mensaje msn = new Mensaje(2);
        int registro = mensajeDAO.eliminar(msn);
        System.out.println("Se elimino " + registro + "registro");

        List<Mensaje> mensajes = mensajeDAO.seleccionar();

        for (Mensaje mensaje : mensajes) {
            System.out.println(mensaje);
        }
    }

}
