<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.productos.negocio.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Categorías</title>
<link href="css/estilos.css" rel="stylesheet" type="text/css">
    <style>


        select, table {
            margin-top: 20px;
        }

        table {
            width: 80%;
            border-collapse: collapse;
            margin-top: 10px;
        }

        th, td {
            border: 1px solid #999;
            padding: 10px;
            text-align: left;
        }
        .contenedor {
            max-width: 900px;
            margin: 0 auto;
        }
    </style>
</head>
<header>
 <div class="logo">
 <a href="index.jsp">
 <img src="imagenes/logo.png" alt="Logo Musica Pilliza" id="logo">
 </a>
 </div>
 <h1>La Casa de los Músicos</h1>
 <h2 class="destacado">Instrumentos musicales de alta calidad</h2>
 <h4 id="favorito">Lo mejor de la música es cuando la creas</h4>
 </header>
 <nav>
 <a class="active" href="index.jsp">Inicio</a>
 <a href="consulta.jsp">Productos</a>
 <a href="categoria.jsp">Buscar Por Categoría</a>
 <a href="login.jsp">Login</a>
 </nav>
<body>
<div class="contenedor">
    <h3>Categorías de productos</h3>
<form method="get" action="categoria.jsp">
    <%
        Categoria cat = new Categoria();
        out.print(cat.mostrarCategoria());
    %>
    <input type="submit" value="Buscar productos">
</form>

<hr>

<%
    String catParam = request.getParameter("cmbCategoria");
    if (catParam != null) {
        try {
            int idCat = Integer.parseInt(catParam);
            Producto prod = new Producto();
            out.print("<h3>Productos en la categoría seleccionada:</h3>");
            out.print(prod.buscarProductoCategoria(idCat));
        } catch (NumberFormatException e) {
            out.print("<p style='color:red;'>❌ ID de categoría no válido.</p>");
        }
    }
%>
    
</div>
 <footer>
 <ul>
 <li><a href="https://www.facebook.com/anthony.pilliza.3">
 <img src="iconos/facebook.png" alt="imagen facebook" height="30" width="30"/></a></li>
 <li><a href="https://www.instagram.com/"> 
 <img src="iconos/instagram.png" alt="imagen instagram" height="30" width="30"/></a></li>
 <li><a href="https://www.tiktok.com/tiktokstudio/upload?lang=es">
 <img src="iconos/tik-tok.png" alt="imagen tiktok" height="30" width="30"/></a></li>
 </ul>
 </footer>
</body>
</html>