<%@ page language="java" contentType="text/html; charset=UTF-8" 
    pageEncoding="UTF-8" session="true" 
    import="com.productos.seguridad.*" 
    import="java.util.Date, java.text.SimpleDateFormat" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>La Casa del Músico - Menú</title>
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

    <%
        // Validar sesión
        HttpSession sesion = request.getSession();
        if (sesion.getAttribute("usuario") == null) {
    %>
        <jsp:forward page="login.jsp">
            <jsp:param name="error" value="Debe registrarse en el sistema." />
        </jsp:forward>
    <%
        } else {
            String usuario = (String) sesion.getAttribute("usuario");
            int perfil = (Integer) sesion.getAttribute("perfil");

            Date fechaInicio = (Date) sesion.getAttribute("fechaInicio");
            String fechaFormateada = "";
            if (fechaInicio != null) {
                SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
                fechaFormateada = sdf.format(fechaInicio);
            }

            // Determinar el rol
            String rol = "";
            switch (perfil) {
                case 1: rol = "USUARIO ADMINISTRADOR " + usuario + "\n\r" + fechaFormateada; break;
                case 2: rol = "USUARIO CLIENTE "+ usuario+ "\n\r" + fechaFormateada;; break;
                case 3: rol = "USUARIO VENDEDOR "+ usuario+ "\n\r" + fechaFormateada;; break;
                case 4: rol = "USUARIO EMPLEADO "+ usuario+ "\n\r" + fechaFormateada;; break;
                default: rol = "USUARIO no identificado";
            }

            // Obtener menú dinámico
            Pagina pag = new Pagina();
            String menu = pag.mostrarMenu(perfil);
    %>

    <!-- Menú dinámico dentro del nav -->
    <nav>
        <%= menu %>
    </nav>

    <div class="agrupar">
        <section>
            <h2>Bienvenido <%= usuario %></h2>
            <p style="font-weight: bold;"><%= rol %></p>
        </section>

        <aside>
            <a href="https://www.linkedin.com/in/anthony-pilliza-1b844335b/" target="_blank">
                Ver más información sobre los desarrolladores
            </a>
            <iframe class="mapa" src="https://www.google.com/maps/d/embed?mid=1SEc-UPnE9UzzZXHa1pYZ2Kv-x7At4J8&ehbc=2E312F" width="200" height="300"></iframe>
        </aside>
    </div>

    <footer>
        <ul>
            <li><a href="https://www.facebook.com/"><img src="iconos/facebook.png" alt="facebook" height="30" width="30"/></a></li>
            <li><a href="https://www.instagram.com/"><img src="iconos/instagram.png" alt="instagram" height="30" width="30"/></a></li>
            <li><a href="https://www.tiktok.com/"><img src="iconos/tik-tok.png" alt="tiktok" height="30" width="30"/></a></li>
        </ul>
    </footer>

    <%
        } // Cierre del else de sesión
    %>
</main>
</body>
</html>
