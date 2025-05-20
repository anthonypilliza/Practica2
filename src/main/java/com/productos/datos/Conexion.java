package com.productos.datos;

import java.sql.*;

public class Conexion {
    private Statement st;
    private final String driver = "org.postgresql.Driver";
    private final String user = "postgres";
    private final String pwd = "admin";
    private final String cadena = "jdbc:postgresql://localhost:5432/BD_PRODUCTOS";
    private Connection con;

    public Conexion() {
        con = crearConexion();
    }

    public Connection getConexion() {
        return this.con;
    }

    private Connection crearConexion() {
        try {
            Class.forName(driver);
            con = DriverManager.getConnection(cadena, user, pwd);
            System.out.println("✅ Conexión exitosa a la base de datos BD_PRODUCTOS.");
            return con;
        } catch (ClassNotFoundException e) {
            System.err.println("❌ Error: No se encontró el driver de PostgreSQL.");
            e.printStackTrace();
        } catch (SQLException e) {
            System.err.println("❌ Error al conectar con la base de datos BD_PRODUCTOS:");
            e.printStackTrace();
        }
        return null;
    }

    public String Ejecutar(String sql) {
        String error = "";
        try {
            st = getConexion().createStatement();
            st.execute(sql);
            error = "✅ Datos insertados correctamente.";
        } catch (Exception ex) {
            ex.printStackTrace();
            error = "❌ Error al ejecutar SQL: " + ex.getMessage();
        }
        return error;
    }

    public ResultSet Consulta(String sql) {
        ResultSet reg = null;
        try {
            st = getConexion().createStatement();
            reg = st.executeQuery(sql);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return reg;
    }
}
