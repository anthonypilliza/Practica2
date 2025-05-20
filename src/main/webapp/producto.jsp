<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.productos.negocio.*"%>
<%
    String mensaje = "";
    if ("POST".equalsIgnoreCase(request.getMethod())) {
        try {
            String nombre = request.getParameter("txtNombre");
            int idCategoria = Integer.parseInt(request.getParameter("cmbCategoria"));
            int cantidad = Integer.parseInt(request.getParameter("cantidad"));
            double precio = Double.parseDouble(request.getParameter("precio"));

            Producto prInsert = new Producto();
            mensaje = prInsert.insertarProducto(nombre, idCategoria, cantidad, precio);
        } catch (Exception e) {
            mensaje = "❌ Error al insertar el producto: " + e.getMessage();
        }
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Productos</title>
    <link href="css/estilos.css?v=2" rel="stylesheet" type="text/css">
</head>
<body>
<header>
    <div class="logo">
        <a href="index.jsp">
            <img src="imagenes/logo.png" alt="Logo Musica Pilliza" id="logo">
        </a>
    </div>
    <h1>La Casa del Músico</h1>
    <h2 class="destacado">Instrumentos musicales de alta calidad</h2>
    <h4 id="favorito">Lo mejor de la música es cuando la creas</h4>
</header>

<h2>Registrar Producto</h2>

<% if (!mensaje.isEmpty()) { %>
    <p style="color: green;"><strong><%= mensaje %></strong></p>
<% } %>

<form action="producto.jsp" method="post">
    <div class="mb-3">
        <label for="nombre" class="formlabel">Nombre</label>
        <input type="text" class="form-control" id="nombre" name="txtNombre" required>
    </div>

    <div class="mb-3">
        <label for="categoria">Categoría:</label><br>
        <%
            Categoria cat = new Categoria();
            out.print(cat.mostrarCategoria());
        %>
    </div>

    <div class="mb-3">
        <label for="cantidad">Cantidad:</label>
        <input type="number" name="cantidad" id="cantidad" min="1" required>
    </div>

    <div class="mb-3">
        <label for="precio">Precio (USD):</label>
        <input type="number" name="precio" id="precio" step="0.01" min="0" required>
    </div>

    <div class="mb-3">
        <label for="foto">Foto:</label>
        <input type="file" name="foto" id="foto" accept="image/*" disabled>
        <!-- Este campo está deshabilitado porque aún no manejamos la carga -->
    </div>

    <button type="submit">Enviar</button>
    <button type="reset">Borrar</button>
</form>

<h4p>Listado de Productos</h4>
<%
    Producto pr = new Producto();
    out.print(pr.reporteProducto());
%>

</body>
</html>
