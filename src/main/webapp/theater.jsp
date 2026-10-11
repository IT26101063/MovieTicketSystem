<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Add Theater Show</title>
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
            background: #764ba2;
            color: white;
            border: none;
            border-radius: 5px;
            font-size: 16px;
            font-weight: bold;
            cursor: pointer;
            transition: background 0.3s;
        }
        button:hover {
            background: #5a3576;
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
    </style>
</head>
<body>
    <div class="container">
        <h1>🎬 Add Theater Show</h1>
        <form action="TheaterServlet" method="POST">
            <input type="hidden" name="action" value="add">

            <label>Theater Name:</label>
            <input type="text" name="theater" placeholder="e.g., PVR Cinema" required>

            <label>Show Time:</label>
            <input type="time" name="time" required>

            <button type="submit">Add Show</button>
        </form>
        <div class="link">
            <a href="shows.jsp">View All Shows →</a>
        </div>
    </div>
</body>
</html>