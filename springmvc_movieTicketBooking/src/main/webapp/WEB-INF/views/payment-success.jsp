<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Payment Successful</title>

<style>
    body {
        margin: 0;
        padding: 40px;
        font-family: "Poppins", sans-serif;
        background: linear-gradient(135deg, #121212, #1f1f1f);
        color: white;
        text-align: center;
    }

    .card {
        margin: 40px auto;
        background: rgba(255, 255, 255, 0.08);
        padding: 30px;
        width: 480px;
        border-radius: 15px;
        backdrop-filter: blur(10px);
        box-shadow: 0 6px 25px rgba(0,0,0,0.4);
        animation: slideDown 0.6s ease-out;
        border-top: 4px solid #00c853;
    }

    @keyframes slideDown {
        from { opacity: 0; transform: translateY(-18px); }
        to   { opacity: 1; transform: translateY(0); }
    }

    h2 {
        font-size: 30px;
        color: #00e676;
        margin-bottom: 10px;
    }

    p {
        font-size: 18px;
        margin: 10px 0;
    }

    .label {
        color: #ffcc00;
        font-weight: bold;
    }

    a.view-btn {
        display: inline-block;
        margin-top: 20px;
        padding: 12px 22px;
        background: #ffcc00;
        color: #111;
        font-weight: bold;
        border-radius: 8px;
        text-decoration: none;
        transition: 0.3s;
    }

    a.view-btn:hover {
        background: #ffd633;
    }

    .success-icon {
        font-size: 60px;
        margin-bottom: 10px;
        color: #00e676;
        animation: pop 0.5s ease-out;
    }

    @keyframes pop {
        0% { transform: scale(0.4); opacity: 0; }
        100% { transform: scale(1); opacity: 1; }
    }
</style>

</head>
<body>

<div class="card">
    <div class="success-icon">✔</div>

    <h2>Payment Successful 🎉</h2>

    <p><span class="label">Movie:</span> ${booking.movieName}</p>
    <p><span class="label">Theatre:</span> ${booking.theatreName}</p>
    <p><span class="label">Show Time:</span> ${booking.showTime}</p>
    <p><span class="label">Seats:</span> ${booking.seatNumbers}</p>
    <p><span class="label">Booked At:</span> ${booking.bookingTime}</p>

    <a class="view-btn"
       href="${pageContext.request.contextPath}/booking/my?email=${booking.userEmail}">
       View My Bookings
    </a>
</div>

</body>
</html>
