<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.movie.Showtime" %>
<%@ page import="com.movie.TheaterManager" %>
<!DOCTYPE html>
<html>
<head>
    <title>Edit Show</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            margin: 0;
        }
        .container {
            background: white;
            padding: 40px;
            border-radius: 15px;
            box-shadow: 0 10px 30px rgba(0,0,0,0.3);
            width: 400px;
        }
        h1 {
            text-align: center;
            color: #764ba2;
            margin-bottom: 30px;
        }
        label {
            display: block;
            margin-bottom: 5px;
            color: #333;
            font-weight: bold;
        }
        input {
            width: 100%;
            padding: 10px;
            margin-bottom: 20px;
            border: 2px solid #ddd;
            border-radius: 5px;
            font-size: 14px;
            box-sizing: border-box;
        }
        input:focus {
            outline: none;
            border-color: #764ba2;
        }
        button {
            width: 100%;
            padding: 12px;
            background: #28a745;
            color: white;
            border: none;
            border-radius: 5px;
            font-size: 16px;
            font-weight: bold;
            cursor: pointer;
        }
        button:hover {
            background: #1e7e34;
        }
        .link {
            text-align: center;
            margin-top: 20px;
        }
        .link a {
            color: #764ba2;
            text-decoration: none;
            font-weight: bold;
        }
        .error {
            background: #ffebee;
            color: #c62828;
            padding: 15px;
            border-radius: 5px;
            text-align: center;
        }
    </style>
</head>
<body>
    <div class="container">
        <%
            String showIdStr = request.getParameter("showId");
            Showtime show = null;

            if (showIdStr != null) {
                int showId = Integer.parseInt(showIdStr);
                TheaterManager manager = new TheaterManager();
                show = manager.getShowById(showId);
            }

            if (show == null) {
        %>
            <div class="error">
                <h3>Show not found!</h3>
            </div>
            <div class="link">
                <a href="shows.jsp">← Back to Shows</a>
            </div>
        <%
            } else {
        %>
            <h1>✏️ Edit Show</h1>
            <form action="TheaterServlet" method="POST">
                <input type="hidden" name="action" value="update">
                <input type="hidden" name="showId" value="<%= show.getShowId() %>">

                <label>Theater Name:</label>
                <input type="text" name="theater"
                       value="<%= show.getTheater() %>" required>

                <label>Show Time:</label>
                <input type="time" name="time"
                       value="<%= show.getTime() %>" required>

                <button type="submit">Update Show</button>
            </form>
            <div class="link">
                <a href="shows.jsp">← Back to Shows</a>
            </div>
        <%
            }
        %>
    </div>
</body>
</html>