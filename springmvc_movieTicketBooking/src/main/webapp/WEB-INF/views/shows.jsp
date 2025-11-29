<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<title>Shows</title>

<style>
/* <![CDATA[ */

    body {
        margin: 0;
        padding: 40px;
        font-family: Arial, sans-serif;
        background: #111;
        color: #fff;
        text-align: center;
    }

    h2 {
        color: #ffcc00;
        font-size: 32px;
        margin-bottom: 25px;
    }

    .show-container {
        width: 850px;
        margin: auto;
    }

    .show-card {
        background: #1c1c1c;
        padding: 20px;
        margin-bottom: 20px;
        border-radius: 10px;
        border-left: 6px solid #ffcc00;
        box-shadow: 0px 4px 15px rgba(0,0,0,0.5);
        text-align: left;
        transition: 0.3s;
    }

    .show-card:hover {
        transform: translateY(-4px);
        background: #242424;
    }

    .theatre {
        color: #ffdd55;
        font-size: 20px;
        margin: 0;
        font-weight: bold;
    }

    .show-time {
        color: #bbb;
        margin-top: 6px;
        font-size: 16px;
    }

    .btn {
        display: inline-block;
        margin-top: 10px;
        padding: 10px 18px;
        background: #ffcc00;
        color: #000;
        font-weight: bold;
        border-radius: 8px;
        text-decoration: none;
        transition: 0.2s;
    }

    .btn:hover {
        background: #ffdd33;
    }

/* ]]> */
</style>

</head>
<body>

<h2>Available Shows</h2>

<div class="show-container">

    <c:forEach var="s" items="${shows}">
        <div class="show-card">

            <p class="theatre">
                Theatre: ${s.theatre.theatreName} (${s.theatre.location})
            </p>

            <p class="show-time">
                Show Time: <b>${s.showTime}</b>
            </p>

            <a class="btn" href="${pageContext.request.contextPath}/movies/shows/${s.showId}/seats">
                Select Seats
            </a>

        </div>
    </c:forEach>

</div>

</body>
</html>
