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

public class Conexion {

    private static final String URL = "jdbc:mysql://node124368-appmensajes.jelastic.saveincloud.net:3306/mensajes_db?serverTimezone=UTC";
    private static final String USER = "root";
    private static final String PASS = "LCmhk92cQC";

    public static Connection getConexion() throws SQLException, ClassNotFoundException {
        Class.forName("com.mysql.cj.jdbc.Driver");
        return DriverManager.getConnection(URL, USER, PASS);
    }

    public static void cerrar(ResultSet rs) throws SQLException {
        rs.close();
    }

    public static void cerrar(PreparedStatement ps) throws SQLException {
        ps.close();
    }

    public static void cerrar(Connection conn) throws SQLException {
        conn.close();
    }

}
