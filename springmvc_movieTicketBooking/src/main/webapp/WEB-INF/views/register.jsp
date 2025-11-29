<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<title>Register</title>

<style>
    body {
        margin: 0;
        padding: 0;
        font-family: "Poppins", sans-serif;
        background: linear-gradient(135deg, #0d0d0d, #1a1a1a);
        height: 100vh;
        display: flex;
        justify-content: center;
        align-items: center;
        color: white;
    }

    .card {
        background: rgba(255, 255, 255, 0.08);
        padding: 30px 40px;
        border-radius: 15px;
        width: 360px;
        box-shadow: 0 4px 25px rgba(0,0,0,0.45);
        backdrop-filter: blur(14px);
    }

    h2 {
        text-align: center;
        margin-bottom: 25px;
        font-size: 28px;
        color: #ffcc00;
    }

    input {
        width: 100%;
        padding: 12px;
        margin: 10px 0;
        border: none;
        border-radius: 8px;
        background: #242424;
        color: white;
        font-size: 14px;
        outline: none;
        transition: 0.3s;
    }

    input:focus {
        background: #333;
        border: 1px solid #ffcc00;
    }

    button {
        width: 100%;
        padding: 12px;
        margin-top: 15px;
        background: #ffcc00;
        border: none;
        border-radius: 8px;
        color: #111;
        font-weight: bold;
        cursor: pointer;
        font-size: 15px;
        transition: 0.3s;
    }

    button:hover {
        background: #ffd633;
    }

    .msg-error {
        color: #ff4d4d;
        margin-top: 8px;
        font-size: 14px;
        text-align: center;
    }

    .msg-success {
        color: #4dff4d;
        margin-top: 8px;
        font-size: 14px;
        text-align: center;
    }

</style>

</head>

<body>

<div class="card">
<h2>Register</h2>

<form method="post" action="${pageContext.request.contextPath}/register">

    <input type="text" name="username" placeholder="Full name" required/>
    <input type="email" name="email" placeholder="Email" required/>
    <input type="password" name="password" placeholder="Password" required/>

    <c:if test="${not empty error}">
        <div class="msg-error">${error}</div>
    </c:if>

    <c:if test="${not empty msg}">
        <div class="msg-success">${msg}</div>
    </c:if>

    <button type="submit">Register</button>
</form>

</div>

</body>
</html>
