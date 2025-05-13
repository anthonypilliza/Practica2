<<<<<<< HEAD
<%@ page session="true" %>
<%
	HttpSession sesionOk = request.getSession();
	sesionOk.invalidate();
%>
=======
<%@ page session="true" %>
<%
	HttpSession sesionOk = request.getSession();
	sesionOk.invalidate();
%>
>>>>>>> b5bb55670ba02e47cc9202b0fab133c23613b6bd
<jsp:forward page="login.jsp"/>