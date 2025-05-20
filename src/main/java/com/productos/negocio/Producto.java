package com.productos.negocio;

import java.sql.ResultSet;
import java.sql.SQLException;
import com.productos.datos.Conexion;

public class Producto {

    public String consultarTodo() {
        String sql = "SELECT * FROM tb_producto ORDER BY id_pr";
        Conexion con = new Conexion();
        StringBuilder tabla = new StringBuilder("<table border=2><th>ID</th><th>Producto</th><th>Cantidad</th><th>Precio</th>");
        ResultSet rs = con.Consulta(sql);

        if (rs == null) {
            return "Error: No se pudo ejecutar la consulta.";
        }

        try {
            while (rs.next()) {
                tabla.append("<tr><td>").append(rs.getInt(1)).append("</td>")
                     .append("<td>").append(rs.getString(3)).append("</td>")
                     .append("<td>").append(rs.getInt(4)).append("</td>")
                     .append("<td>").append(rs.getDouble(5)).append("</td></tr>");
            }
        } catch (SQLException e) {
            e.printStackTrace();
            return "Error al procesar los datos: " + e.getMessage();
        }

        tabla.append("</table>");
        return tabla.toString();
    }

    public String buscarProductoCategoria(int cat) {
        String sentencia = "SELECT nombre_pr, precio_pr FROM tb_producto WHERE id_cat=" + cat;
        Conexion con = new Conexion();
        ResultSet rs = null;
        StringBuilder resultado = new StringBuilder("<table border=3>");

        try {
            rs = con.Consulta(sentencia);
            while (rs.next()) {
                resultado.append("<tr><td>").append(rs.getString(1)).append("</td>")
                         .append("<td>").append(rs.getDouble(2)).append("</td></tr>");
            }
            resultado.append("</table>");
        } catch (SQLException e) {
            System.out.println("Error SQL: " + e.getMessage());
        }

        return resultado.toString();
    }

    public String reporteProducto() {
        String sql = "SELECT pr.id_pr, pr.nombre_pr, cat.descripcion_cat, pr.cantidad_pr, pr.precio_pr " +
                     "FROM tb_producto pr, tb_categoria cat WHERE pr.id_cat = cat.id_cat";
        Conexion con = new Conexion();
        ResultSet rs = null;
        rs = con.Consulta(sql);

        String tabla = "<table class='tabla-productos'><thead><tr>"
                     + "<th>Id</th>"
                     + "<th>Nombre</th>"
                     + "<th>Categoría</th>"
                     + "<th>Cantidad</th>"
                     + "<th>Precio</th>"
                     + "<th>Modificar</th>"
                     + "<th>Eliminar</th>"
                     + "</tr></thead><tbody>";

        try {
            while (rs.next()) {
                tabla += "<tr>"
                       + "<td>" + rs.getInt(1) + "</td>"
                       + "<td>" + rs.getString(2) + "</td>"
                       + "<td>" + rs.getString(3) + "</td>"
                       + "<td>" + rs.getInt(4) + "</td>"
                       + "<td>" + rs.getDouble(5) + "</td>"
                       + "<td><a href='actualizar.jsp?id=" + rs.getInt(1) + "'>Actualizar</a></td>"
                       + "<td><a href='eliminar.jsp?id=" + rs.getInt(1) + "'>Eliminar</a></td>"
                       + "</tr>";
            }
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("Error al procesar los datos: " + e.getMessage());
            return "<p>Error al procesar los datos: " + e.getMessage() + "</p>";
        } finally {
            try {
                if (rs != null) rs.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        tabla += "</tbody></table>";
        return tabla;
    }


}
