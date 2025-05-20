<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*, com.productos.seguridad.*" %>
<%
    ArrayList<auditoria> lista = auditoria.obtenerBitacora();
%>
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
  <a href="bitacora.jsp">Bitacora</a>
 <a href="usuarios.jsp">Agregar Usuario</a>
 <a href="cerrarsesion.jsp">Cerrar Sesion</a>
 </nav>

    <div class="agrupar">
      <section>
        <h3>Bitácora de Auditoría</h3>
        <div class="form-login">
          <table border="1" style="width: 100%; border-collapse: collapse;">
              <tr style="background-color: #f2f2f2;">
                  <th>ID</th>
                  <th>Tabla</th>
                  <th>Operación</th>
                  <th>Valor Anterior</th>
                  <th>Valor Nuevo</th>
                  <th>Fecha</th>
                  <th>Usuario</th>
              </tr>
              <%
                  for (auditoria a : lista) {
              %>
              <tr>
                  <td><%= a.getId() %></td>
                  <td><%= a.getTabla() %></td>
                  <td><%= a.getOperacion() %></td>
                  <td><%= a.getValorAnterior() %></td>
                  <td><%= a.getValorNuevo() %></td>
                  <td><%= a.getFecha() %></td>
                  <td><%= a.getUsuario() %></td>
              </tr>
              <%
                  }
              %>
          </table>
        </div>
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
  </main>
</body>
</html>
