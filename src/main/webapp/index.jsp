<%-- 
    Document   : index
    Created on : 9 ene. 2023, 16:13:51
    Author     : Saul
--%>

<%@page import="com.grenn.mensajesjsp.Mensaje"%>
<%@page import="java.util.*"%>
<%@page import="com.grenn.mensajesjsp.MensajeDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" 
              integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">

    </head>
    <body>



        <%-- Codigo java dentro de JSP 
        
          <%
              String nombre = "Saul";
              int edad = 23;

            out.print("Mi nombre es " + nombre + " y mi edad es " + edad);

        %>
      
        --%>



        <!-- Modal -->
        <!-- Formulario Ingreso mensaje -->

        <div class="modal-dialog">
            <div class="modal-content">
                <form action="index.jsp" method="POST">
                    <div class="modal-header">
                        <h5 class="modal-title">Crear Mensaje</h5>
                    </div>

                    <div class="modal-body">

                        <div class="form-group">
                        
                            <label>Ingrese el Mensaje</label>
                            <textarea  class="form-control" name ="mensaje" rows="3"> 
                         
                            </textarea>
                        </div>
                        <div class="form-group">
                            <label>Autor</label>
                            <input type="text" name="autor"  class="form-control"  >
                        </div>



                    </div>

                    <div class="modal-footer">
                        <button type="submit" class="btn btn-primary" name="enviar">Enviar</button>
                    </div>
                </form>
            </div>
        </div>

        <%
            MensajeDAO mensajeDAO = new MensajeDAO();
            if (request.getParameter("enviar") != null) {
                Mensaje mensaje = new Mensaje(
                        request.getParameter("mensaje"),
                        request.getParameter("autor"));
                mensajeDAO.inserta(mensaje);
            }

        %>



        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Todos los Mensaje</h5>
                </div>

                <%                    //MensajeDAO mensajeDAO = new MensajeDAO();
                    List<Mensaje> mensajes = mensajeDAO.seleccionar();

                    Collections.reverse(mensajes);

                    for (Mensaje mensaje : mensajes) {
                %>

                <div class="modal-body">
                    <div class="card">
                        <div class="card-body">
                            <h5 class="card-title"><%=mensaje.getAutor()%></h5>
                            <p class="card-text"><%=mensaje.getMensaje()%></p>
                            <p class="blockquote-footer"><cite><%=mensaje.getFecha()%></cite></p>
                            
                            <a href="editar.jsp?id=<%=mensaje.getId()%>
                               &&mensaje=<%=mensaje.getMensaje()%>
                               &&autor=<%=mensaje.getAutor()%>" 
                               class="card-link">Editar</a>
                               <a href="eliminar.jsp?id=<%=mensaje.getId()%>" class="card-link">Eliminar</a>
                        </div>
                    </div>
                </div>
                <%}%>
            </div>
        </div>






    </body>
</html>
