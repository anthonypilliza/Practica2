package com.productos.datos;

import java.sql.*;

public class ConexionUser {
    private Statement st;
    private final String driver = "org.postgresql.Driver";
    private final String user = "postgres";
    private final String pwd = "1234";
    private final String cadena = "jdbc:postgresql://localhost:5432/USER"; // Cambiar el nombre de la base de datos a USER
    private Connection con;

    public ConexionUser() {
        con = crearConexion();
    }

    public Connection getConexion() {
        return this.con;
    }

    private Connection crearConexion() {
        try {
            Class.forName(driver);
            con = DriverManager.getConnection(cadena, user, pwd);
            System.out.println("✅ Conexión exitosa a la base de datos USER.");
            return con;
        } catch (ClassNotFoundException e) {
            System.err.println("❌ Error: No se encontró el driver de PostgreSQL.");
            e.printStackTrace();
        } catch (SQLException e) {
            System.err.println("❌ Error al conectar con la base de datos USER:");
            e.printStackTrace();
        }
        return null;
    }

    public String Ejecutar(String sql) {
        String error = "";
        try {
            st = getConexion().createStatement();
            st.execute(sql);
            error = "Datos insertados correctamente.";
        } catch (Exception ex) {
            ex.printStackTrace();
            error = ex.getMessage();
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

