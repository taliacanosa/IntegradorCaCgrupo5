<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="pF.integrador.java.MySqlConexion" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
</head>
<body>
    <%
        String nombre = request.getParameter("nombre");
        String apellido = request.getParameter("apellido");
        String correo = request.getParameter("correo");
        String categoria = request.getParameter("categoria");
        String cantidad = request.getParameter("cantidad");

        // Excluye la columna 'id' de la inserción
        String sql = "INSERT INTO ticket (nombre, apellido, email, cantidad, categoria) VALUES (?, ?, ?, ?, ?)";

        MySqlConexion conexion = new MySqlConexion();
        Connection cn = null;
        PreparedStatement pstmt = null;

        cn = conexion.conectar();

        try {
            out.println("Parámetros a insertar:");
            out.println("Nombre: " + nombre);
            out.println("Apellido: " + apellido);
            out.println("Correo: " + correo);
            out.println("Categoría: " + categoria);
            out.println("Cantidad: " + cantidad);

            pstmt = cn.prepareStatement(sql);
            pstmt.setString(1, nombre);
            pstmt.setString(2, apellido);
            pstmt.setString(3, correo);
            pstmt.setInt(4, Integer.parseInt(cantidad));
            pstmt.setString(5, categoria);
           
            pstmt.executeUpdate();
           

            out.println("DATOS CARGADOS CORRECTAMENTE");
        } catch (SQLException e) {
            out.println("No se pudieron enviar los datos. Error: " + e.getMessage());
            e.printStackTrace();
            while (e.getNextException() != null) {
                e = e.getNextException();
                out.println("Error adicional: " + e.getMessage());
                e.printStackTrace();
            }
        } finally {
            try {
                if (pstmt != null) {
                    pstmt.close();
                }
                if (cn != null) {
                    cn.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    %>
</body>
</html>



