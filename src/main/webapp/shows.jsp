<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.movie.Showtime" %>
<%@ page import="com.movie.TheaterManager" %>
<!DOCTYPE html>
<html>
<head>
    <title>All Shows</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            min-height: 100vh;
            margin: 0;
            padding: 40px 20px;
        }
        .container {
            max-width: 800px;
            margin: 0 auto;
            background: white;
            padding: 30px;
            border-radius: 15px;
            box-shadow: 0 10px 30px rgba(0,0,0,0.3);
        }
        h1 {
            color: #764ba2;
            text-align: center;
            margin-bottom: 30px;
        }
        .btn {
            display: inline-block;
            padding: 10px 20px;
            background: #764ba2;
            color: white;
            text-decoration: none;
            border-radius: 5px;
            font-weight: bold;
            margin-bottom: 20px;
        }
        .btn:hover {
            background: #5a3576;
        }
        table {
            width: 100%;
            border-collapse: collapse;
        }
        th, td {
            padding: 12px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }
        th {
            background: #764ba2;
            color: white;
        }
        tr:hover {
            background: #f5f5f5;
        }
        .btn-edit {
            background: #28a745;
            color: white;
            padding: 6px 12px;
            text-decoration: none;
            border-radius: 4px;
            margin-right: 5px;
            font-size: 12px;
        }
        .btn-delete {
            background: #dc3545;
            color: white;
            padding: 6px 12px;
            text-decoration: none;
            border-radius: 4px;
            font-size: 12px;
        }
        .empty {
            text-align: center;
            color: #999;
            padding: 30px;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>🎭 All Theater Shows</h1>

        <a href="theater.jsp" class="btn">+ Add New Show</a>

        <%
            // Manager එකක් හදලා, හැම show එකක්ම ගන්නවා
            TheaterManager manager = new TheaterManager();
            List<Showtime> shows = manager.getAllShows();
        %>

        <% if (shows.isEmpty()) { %>
            <div class="empty">
                <h3>No shows added yet</h3>
                <p>Click "Add New Show" to get started!</p>
            </div>
        <% } else { %>
            <table>
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Theater</th>
                        <th>Time</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <% for (Showtime s : shows) { %>
                        <tr>
                            <td><%= s.getShowId() %></td>
                            <td><%= s.getTheater() %></td>
                            <td><%= s.getTime() %></td>
                            <td>
                                <a href="editShow.jsp?showId=<%= s.getShowId() %>" class="btn-edit">Edit</a>
                                <a href="TheaterServlet?action=delete&showId=<%= s.getShowId() %>"
                                   class="btn-delete"
                                   onclick="return confirm('Delete this show?');">Delete</a>
                            </td>
                        </tr>
                    <% } %>
                </tbody>
            </table>
        <% } %>
    </div>
</body>
</html>