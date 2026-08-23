<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<%@ include file="config.jsp" %>
<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="css/estilo.css">
    <title>Proyectos - David Muñoz</title>
</head>

<body>

    <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
        <div class="container">
    
            <a class="navbar-brand" href="index.html">David Muñoz</a>
    
            <button class="navbar-toggler" type="button"
                data-bs-toggle="collapse"
                data-bs-target="#menu">
                <span class="navbar-toggler-icon"></span>
            </button>
    
            <div class="collapse navbar-collapse" id="menu">
                <div class="navbar-nav ms-auto">
                    <a class="nav-link" href="index.html">Inicio</a>
                    <a class="nav-link" href="proyectos.html">Proyectos</a>
                    <a class="nav-link" href="habilidades.html">Habilidades</a>
                    <a class="nav-link" href="experiencia.html">Experiencia</a>
                    <a class="nav-link" href="contacto.html">Contacto</a>
                </div>
            </div>
    
        </div>
    </nav>

    <main class="container my-5">

        <h1>Mis Proyectos</h1>
        <p>Fecha de consulta: <%= new java.util.Date() %></p>
    
        <div class="row mt-4">

<%

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");

        Connection conexion = DriverManager.getConnection(
            url,
            usuario,
            clave
        );

        Statement consulta = conexion.createStatement();

        ResultSet resultados = consulta.executeQuery(
            "SELECT * FROM proyectos"
        );

        while (resultados.next()) {
%>

    <div class="col-md-6 mb-4">
        <div class="card">
            <div class="card-body">

                <h2 class="card-title">
                    <%= resultados.getString("nombre") %>
                </h2>

                <p class="card-text">
                    <%= resultados.getString("descripcion") %>
                </p>

            </div>
        </div>
    </div>

<%
        }

        resultados.close();
        consulta.close();
        conexion.close();

    } catch (Exception e) {
        out.println("<p>Error al cargar los proyectos.</p>");
    }
%>

</div>
    
    </main>
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js"></script>
</body>

</html>