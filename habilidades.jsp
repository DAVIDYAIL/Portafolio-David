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

    <title>Habilidades - David Muñoz</title>
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
                    <a class="nav-link" href="proyectos.jsp">Proyectos</a>
                    <a class="nav-link" href="habilidades.jsp">Habilidades</a>
                    <a class="nav-link" href="experiencia.html">Experiencia</a>
                    <a class="nav-link" href="contacto.html">Contacto</a>
                </div>
            </div>

        </div>
    </nav>

    <main class="container my-5">

        <h1>Habilidades</h1>

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
                    "SELECT * FROM habilidades"
                );
        %>

        <ul class="mt-4">

        <%
                while (resultados.next()) {
        %>

            <li><%= resultados.getString("nombre") %></li>

        <%
                }
        %>

        </ul>

        <%
                resultados.close();
                consulta.close();
                conexion.close();

            } catch (Exception e) {
                out.println("<p>Error al cargar las habilidades.</p>");
            }
        %>

    </main>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js"></script>

</body>

</html>