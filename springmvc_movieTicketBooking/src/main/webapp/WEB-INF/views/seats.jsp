<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<title>Select Seats</title>

<style>
    body {
        margin: 0;
        padding: 40px;
        font-family: "Poppins", sans-serif;
        background: linear-gradient(135deg, #0f0f0f, #1c1c1c);
        color: white;
        text-align: center;
    }

    .container {
        width: 900px;
        margin: auto;
        background: rgba(255, 255, 255, 0.08);
        padding: 30px;
        border-radius: 15px;
        backdrop-filter: blur(10px);
        box-shadow: 0 6px 25px rgba(0,0,0,0.4);
        animation: fadeIn 0.5s ease-out;
    }

    @keyframes fadeIn {
        from { opacity: 0; transform: translateY(-20px); }
        to { opacity: 1; transform: translateY(0); }
    }

    h2 {
        color: #ffcc00;
        font-size: 32px;
        margin-bottom: 10px;
    }

    .info {
        font-size: 18px;
        margin-bottom: 20px;
        line-height: 1.5;
    }

    .email-box {
        margin-bottom: 15px;
        font-size: 18px;
    }

    input[type=email] {
        padding: 10px;
        width: 260px;
        border-radius: 6px;
        border: none;
        margin-left: 10px;
    }

    .seat-box {
        display: inline-block;
        margin: 6px;
        text-align: center;
    }

    .seat {
        width: 50px;
        height: 35px;
        border-radius: 6px;
        line-height: 35px;
        color: white;
        font-size: 14px;
        margin-bottom: 5px;
        font-weight: bold;
        box-shadow: 0 3px 10px rgba(0,0,0,0.4);
    }

    .seat.available {
        background: #222;
    }

    .seat.booked {
        background: #777;
        text-decoration: line-through;
    }

    button {
        margin-top: 20px;
        padding: 12px 30px;
        background: #ffcc00;
        border: none;
        font-size: 18px;
        font-weight: bold;
        border-radius: 8px;
        cursor: pointer;
        color: #111;
        transition: 0.3s;
    }

    button:hover {
        background: #ffdd33;
    }
</style>

</head>
<body>

<div class="container">

    <h2>Select Seats</h2>

    <div class="info">
        <p><b>Movie:</b> ${showInfo.movie.movieName}</p>
        <p><b>Theatre:</b> ${showInfo.theatre.theatreName} - ${showInfo.theatre.location}</p>
        <p><b>Show Time:</b> ${showInfo.showTime}</p>
    </div>

    <form method="post" action="${pageContext.request.contextPath}/booking/confirm">

        <input type="hidden" name="showId" value="${showId}"/>

        <div class="email-box">
            <label><b>Enter Email:</b></label>
            <input type="email" name="userEmail" required/>
        </div>

        <div>
            <c:forEach var="seat" items="${seats}">
                <div class="seat-box">
                    <div class="seat ${seat.booked ? 'booked' : 'available'}">
                        ${seat.seatNumber}
                    </div>

                    <div>
                      <c:if test="${!seat.booked}">
                        <input type="checkbox" name="seatIds" value="${seat.seatId}"/>
                      </c:if>
                    </div>
                </div>
            </c:forEach>
        </div>

        <button type="submit">Pay & Confirm</button>

    </form>

</div>

</body>
</html>
