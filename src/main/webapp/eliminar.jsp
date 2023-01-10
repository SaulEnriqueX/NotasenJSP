<%-- 
    Document   : eliminar
    Created on : 9 ene. 2023, 20:04:02
    Author     : Saul
--%>

<%@page import="com.grenn.mensajesjsp.MensajeDAO"%>
<%@page import="com.grenn.mensajesjsp.Mensaje"%>
<%@page import="com.grenn.mensajesjsp.Mensaje"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" 
              integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">    
        <title>Eliminar</title>

    </head>
    <body>
        <%

            String id = request.getParameter("id");
            Mensaje mensaje = new Mensaje(Integer.valueOf(id));
            MensajeDAO mensajeDAO = new MensajeDAO();
            mensajeDAO.eliminar(mensaje);
           // request.getRequestDispatcher("index.jsp".forward(request,response));
            request.getRequestDispatcher("index.jsp").forward(request, response);


        %>
    </body>
</html>
