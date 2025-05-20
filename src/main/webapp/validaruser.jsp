<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" session="true" import="com.productos.seguridad.Usuario" import="java.util.Date"%>
<%
    // Obtener los par�metros del formulario de login
   

    // Crear una instancia de Usuario
    Usuario user = new Usuario();
	String nombre = request.getParameter("nombre");
	String correo = request.getParameter("usuario");
	String clave = request.getParameter("clave");
	HttpSession sesion = request.getSession();

    // Verificar las credenciales
    boolean validUser = user.verificarUsuario(correo, clave);

    if (validUser) {
        // Si el usuario es v�lido, guardar en la sesi�n
        
        sesion.setAttribute("usuario", user.getNombre());
        sesion.setAttribute("perfil", user.getPerfil());
        sesion.setAttribute("correo", user.getCorreo());
        Date fechaInicio = new Date();
        sesion.setAttribute("fechaInicio", fechaInicio);

        // Redirigir a la p�gina principal (o al men�)
        response.sendRedirect("menu.jsp");
    } else {
        // Si no es v�lido, redirigir al login con un mensaje de error
        request.setAttribute("error", "Datos incorrectos. Vuelva a intentarlo.");
        request.getRequestDispatcher("login.jsp").forward(request, response);
    }
%>
