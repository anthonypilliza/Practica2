<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.productos.negocio.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>La Casa del Músico</title>
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
 <h1>La Casa de los Músicos</h1>
 <h2 class="destacado">Instrumentos musicales de alta calidad</h2>
 <h4 id="favorito">Lo mejor de la música es cuando la creas</h4>
 </header>
 <nav>
 <a class="active" href="index.jsp">Inicio</a>
 <a class="active" href="consulta.jsp">Productos</a>
 <a href="categoria.jsp">Buscar Por Categoría</a>
 <a href="login.jsp">Login</a>
 </nav>
 <div class="agrupar">
 <section>
 <h3>LLISTA DE PRODUCTOS </h3>
 <p>
		Página en construccion 
		<div>
        <%
        Producto prod = new Producto();
        out.print(prod.consultarTodo());
    %>
    </div>
 </p>
 </section>
 <aside>
 <a href="https://www.linkedin.com/in/anthony-pilliza-1b844335b/" target="_blank">Ver más información sobre los desarrolladores</a>
 <iframe class="mapa" src="https://www.google.com/maps/d/embed?mid=1SEc-UPnE9UzzZXHa1pYZ2Kv-x7At4J8&ehbc=2E312F" width="200" height="300"></iframe>
 </aside>
 </div>
 <footer>
 <ul>
 <li><a href="https://www.facebook.com/">
 <img src="iconos/facebook.png" alt="imagen facebook" height="30" width="30"/></a></li>
 <li><a href="https://www.instagram.com/"> 
 <img src="iconos/instagram.png" alt="imagen instagram" height="30" width="30"/></a></li>
 <li><a href="https://www.tiktok.com/">
 <img src="iconos/tik-tok.png" alt="imagen tiktok" height="30" width="30"/></a></li>
 </ul>
 </footer>
 </main>
</body>
</html>