<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.productos.seguridad.*,com.productos.negocio.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Respuesta - Nuevo Cliente</title>
    <link href="css/estilos.css?v=2" rel="stylesheet" type="text/css">
</head>
<body>
<main>
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

    <nav>
        <a class="active" href="consulta.jsp">Productos</a>
        <a href="categoria.jsp">Buscar Por Categoría</a>
        <a href="login.jsp">Login</a>
    </nav>

    <div class="agrupar">
        <section>
            <h3>Resultado del Registro</h3>

            <%
                String nombre = request.getParameter("txtNombre");
                String cedula = request.getParameter("txtCedula");
                String ecivil = request.getParameter("cmbECivil");
                String residencia = request.getParameter("rdResidencia");
                String foto = request.getParameter("fileFoto");
                String fecha = request.getParameter("fecha");
                String color = request.getParameter("colorFavorito");
                String correo = request.getParameter("txtCorreo");
                String clave = request.getParameter("txtClave");

                int estadoCivil = 0;
                switch(ecivil) {
                    case "Casado": estadoCivil = 1; break;
                    case "Soltero": estadoCivil = 2; break;
                    case "Divorciado": estadoCivil = 3; break;
                    case "Viudo": estadoCivil = 4; break;
                }

                Usuario user = new Usuario();
                user.setPerfil(2); // Cliente
                user.setNombre(nombre);
                user.setCedula(cedula);
                user.setEstadoCivil(estadoCivil);
                user.setCorreo(correo);
                user.setClave(clave);
                String resultado = user.ingresarCliente();
            %>

            <strong><%= resultado %></strong>

            <h3>Datos Ingresados</h3>
            <ul>
                <li>Nombre: <%= nombre %></li>
                <li>Cédula: <%= cedula %></li>
                <li>Estado civil: <%= ecivil %></li>
                <li>Residencia: <%= residencia %></li>
                <li>Fecha de nacimiento: <%= fecha %></li>
                <li>Correo electrónico: <%= correo %></li>
                <li>Archivo seleccionado: <u><%= foto %></u></li>
                <li>Color favorito: <span style="color:<%= color %>"><strong><%= color %></strong></span></li>
            </ul>

            <button onclick="location.href='login.jsp'">← Volver al login</button>
        </section>

        <aside>
            <a href="https://www.linkedin.com/in/anthony-pilliza-1b844335b/" target="_blank">Ver más información sobre los desarrolladores</a>
            <iframe class="mapa" src="https://www.google.com/maps/d/embed?mid=1SEc-UPnE9UzzZXHa1pYZ2Kv-x7At4J8&ehbc=2E312F" width="200" height="300"></iframe>
        </aside>
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
</main>
</body>
</html>
