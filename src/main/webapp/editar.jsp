<%-- 
    Document   : editar
    Created on : 9 ene. 2023, 19:33:43
    Author     : Saul
--%>

<%@page import="com.grenn.mensajesjsp.Mensaje"%>
<%@page import="com.grenn.mensajesjsp.MensajeDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" 
              integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
        <title>EDITAR</title>
    </head>
    <body>
        <div class="modal-dialog">
            <div class="modal-content">
                <form action="editar.jsp" method="POST">
                    <div class="modal-header">
                        <h5 class="modal-title">Editar   Mensaje</h5>
                    </div>

                    <div class="modal-body">

                        <div class="form-group">
                            <input type="hidden" name="id" value="<%=request.getParameter("id")%>">
                            <label>Ingrese el Mensaje</label>
                            <textarea  class="form-control" name ="mensaje" rows="3"><%=request.getParameter("mensaje")%></textarea>
                        </div>
                        <div class="form-group">
                            <label>Autor</label>
                            <input type="text" name="autor"  class="form-control" value="<%=request.getParameter("autor")%>">
                        </div>
                    </div>

                    <div class="modal-footer">
                        <a href="index.jsp" type="submit" class="btn btn-danger" >Regresar</a>
                        <button type="submit" class="btn btn-primary" name="enviar">Guardar cambios</button>

                    </div>
                </form>
            </div>
        </div>

        <%
            
            MensajeDAO mensajeDAO = new MensajeDAO();
            
            String id = request.getParameter("id");
            
            if (request.getParameter("enviar") != null) {
                Mensaje mensaje = new Mensaje(
                Integer.parseInt(id.trim()),
                        request.getParameter("mensaje"),
                        request.getParameter("autor"));
                mensajeDAO.editar(mensaje);
            }

        %>
    </body>
</html>
