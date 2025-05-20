<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.productos.negocio.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Registro</title>
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
 <nav>
 <a class="active" href="consulta.jsp">Productos</a>
 <a href="cambiarclave.jsp">cambiarclave</a>
 <a href="cerrarsesion.jsp">cerrar sesion</a>
 </nav>
 <main>
<h3> Registro Nuevo Cliente</h3>
<div class="agrupar">
<form action="confirmacion.jsp" method="post">
<table border="1">
<tr><td>Clave Anterior</td><td><input type="password" id= "clave" name="txtClaveA" required/>*Campo obligatorio </td></tr>
<tr><td>Clave Nueva</td><td><input type="password" id= "clave" name="txtClaveN" required/>*Campo obligatorio </td></tr>
<tr><td>Clave Repetir</td><td><input type="password" id= "clave" name="txtClaveR" required/>*Campo obligatorio </td></tr>

<tr>
<td><input type="submit" name="btnEnviar" id="btnEnviar" value="Cambiar Clave"/></td>
<td><input type="reset" /></td>
</tr>
</table>
<button type="button" onclick="location.href='index.jsp'">← Regresar</button>
</form>
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