<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<title>Login</title>

<style>
    body {
        margin: 0;
        padding: 0;
        font-family: Arial, sans-serif;
        background: linear-gradient(135deg, #1e3c72, #2a5298);
        height: 100vh;
        display: flex;
        justify-content: center;
        align-items: center;
    }

    .login-container {
        background: #ffffff;
        padding: 40px 35px;
        border-radius: 12px;
        width: 350px;
        box-shadow: 0 8px 25px rgba(0,0,0,0.3);
        animation: fadeIn 0.6s ease-in-out;
    }

    h2 {
        text-align: center;
        margin-bottom: 20px;
        color: #1e3c72;
    }

    input[type="email"],
    input[type="password"] {
        width: 100%;
        padding: 12px;
        margin: 10px 0;
        border-radius: 6px;
        border: 1px solid #ccc;
        font-size: 15px;
    }

    input:focus {
        outline: none;
        border-color: #2a5298;
        box-shadow: 0 0 5px rgba(42, 82, 152, 0.4);
    }

    button {
        width: 100%;
        padding: 12px;
        background: #1e3c72;
        color: white;
        border: none;
        font-size: 16px;
        border-radius: 6px;
        cursor: pointer;
        margin-top: 15px;
        transition: 0.3s;
    }

    button:hover {
        background: #16325c;
    }

    .error-box {
        background: #ffdddd;
        color: #c70000;
        padding: 8px;
        margin-top: 10px;
        border-radius: 5px;
        text-align: center;
        font-size: 14px;
    }

    p {
        text-align: center;
        margin-top: 15px;
    }

    a {
        color: #2a5298;
        text-decoration: none;
        font-weight: bold;
    }

    a:hover {
        text-decoration: underline;
    }

    @keyframes fadeIn {
        from { opacity: 0; transform: translateY(-10px); }
        to   { opacity: 1; transform: translateY(0); }
    }
</style>
</head>

<body>

<div class="login-container">
<h2>Login</h2>

<form method="post" action="${pageContext.request.contextPath}/login">

    <input type="email" name="email" placeholder="Email" required/><br/>
    <input type="password" name="password" placeholder="Password" required/><br/>

    <c:if test="${not empty error}">
        <div class="error-box">${error}</div>
    </c:if>

    <button type="submit">Login</button>
</form>

<p><a href="${pageContext.request.contextPath}/register">Register</a></p>
</div>

</body>
</html>
