<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<title>My Bookings</title>

<style>
    body {
        margin: 0;
        padding: 30px;
        font-family: "Poppins", sans-serif;
        background: linear-gradient(135deg, #121212, #1f1f1f);
        color: white;
    }

    h2 {
        text-align: center;
        font-size: 32px;
        margin-bottom: 25px;
        color: #ffcc00;
    }

    .booking-card {
        background: rgba(255, 255, 255, 0.08);
        border-radius: 12px;
        padding: 20px;
        margin: 18px auto;
        width: 70%;
        box-shadow: 0 4px 25px rgba(0,0,0,0.4);
        backdrop-filter: blur(10px);
        border-left: 4px solid #ffcc00;
        animation: fadeIn 0.5s ease-in-out;
    }

    @keyframes fadeIn {
        from { opacity: 0; transform: translateY(12px); }
        to   { opacity: 1; transform: translateY(0); }
    }

    .field-title {
        color: #ffcc00;
        font-weight: bold;
    }

    p {
        margin: 6px 0;
        font-size: 16px;
    }

    .no-bookings {
        text-align: center;
        margin-top: 40px;
        font-size: 20px;
        color: #bbbbbb;
    }

    a.back-btn {
        display: inline-block;
        padding: 12px 20px;
        background: #ffcc00;
        color: #111;
        font-weight: bold;
        border-radius: 8px;
        text-decoration: none;
        margin: 20px auto;
        display: block;
        width: 180px;
        text-align: center;
        transition: 0.3s;
    }

    a.back-btn:hover {
        background: #ffd633;
    }
</style>

</head>
<body>

<h2>🎟 My Bookings</h2>

<c:if test="${empty bookings}">
    <div class="no-bookings">No bookings found.</div>
</c:if>

<c:forEach var="b" items="${bookings}">
    <div class="booking-card">
        <p><span class="field-title">Movie:</span> ${b.movieName}</p>
        <p><span class="field-title">Theatre:</span> ${b.theatreName}</p>
        <p><span class="field-title">Show Time:</span> ${b.showTime}</p>
        <p><span class="field-title">Seats:</span> ${b.seatNumbers}</p>
        <p><span class="field-title">Booked At:</span> ${b.bookingTime}</p>
    </div>
</c:forEach>

<a class="back-btn" href="${pageContext.request.contextPath}/movies">⬅ Back to Movies</a>

</body>
</html>
