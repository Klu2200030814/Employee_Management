<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Login</title>
    <style>
        body, html {
            margin: 0;
            padding: 0;
            font-family: Arial, sans-serif;
            background: linear-gradient(45deg, #9be15d, #00e3ae);
            height: 100%;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .login-container {
            text-align: center;
            color: #fff;
        }

        .login-buttons {
            margin-top: 20px;
        }

        .login-button {
            text-decoration: none;
            padding: 15px 30px;
            border-radius: 5px;
            color: #fff;
            font-size: 18px;
            margin: 10px;
            transition: transform 0.3s ease-in-out;
            border: none; /* Ensure buttons have no border */
            cursor: pointer; /* Add cursor pointer for better UX */
        }

        .admin {
            background-color: #f44336;
        }

        .manager {
            background-color: #3f51b5;
        }

        .login-button:hover {
            transform: scale(1.1);
            box-shadow: 0px 4px 15px rgba(0, 0, 0, 0.2);
        }

        .navbarbackground {
            background-color: #007bff; /* Blue color */
            width: 100%; /* Full width */
            position: fixed; /* Fixed position */
            top: 0; /* Stick to the top */
            left: 0; /* Align to the left */
            z-index: 1000; /* Ensure it is on top */
        }

        /* Navbar links color */
        .navbar-nav .nav-link {
            color: #fff; /* White text */
        }

        /* Navbar links color on hover */
        .navbar-nav .nav-link:hover {
            color: #e0e0e0; /* Slightly lighter color on hover */
        }

        /* Search button color */
        .btn-outline-success {
            border-color: #28a745; /* Green border */
            color: #28a745; /* Green text */
        }

        /* Search button color on hover */
        .btn-outline-success:hover {
            background-color: #28a745; /* Green background on hover */
            color: #fff; /* White text on hover */
        }

        /* Make sure the content below the navbar is not hidden */
        body {
            padding-top: 70px; /* Adjust this value based on your navbar height */
        }

        /* Form styling */
        form {
            display: flex;
            flex-direction: column;
            align-items: center;
        }

        input[type="text"], input[type="password"] {
            padding: 10px;
            margin: 10px;
            border: none;
            border-radius: 5px;
            font-size: 16px;
            width: 250px; /* Set a fixed width */
        }

        input[type="text"]::placeholder, input[type="password"]::placeholder {
            color: #ddd;
        }
    </style>
</head>
<body>
    <div class="login-container">
        <h2>Admin Login</h2>
        <form action="AdminServlet" method="post">
            <input type="text" name="username" placeholder="Username" required>
            <input type="password" name="password" placeholder="Password" required>
            <button type="submit" class="login-button admin">Login</button>
        </form>
    </div>
</body>
</html>
