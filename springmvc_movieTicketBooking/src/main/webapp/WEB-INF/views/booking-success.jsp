<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<title>Booking Confirmed</title>

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
        padding: 35px 45px;
        border-radius: 18px;
        width: 420px;
        box-shadow: 0 4px 30px rgba(0,0,0,0.55);
        backdrop-filter: blur(12px);
        text-align: center;
        animation: fadeIn 0.7s ease-in-out;
    }

    @keyframes fadeIn {
        from { opacity: 0; transform: translateY(20px); }
        to   { opacity: 1; transform: translateY(0); }
    }

    h2 {
        font-size: 30px;
        color: #4dff4d;
        margin-bottom: 15px;
    }

    .success-icon {
        font-size: 60px;
        color: #4dff4d;
        margin-bottom: 10px;
        animation: pop 0.6s ease-in-out;
    }

    @keyframes pop {
        0% { transform: scale(0.5); opacity: 0; }
        100% { transform: scale(1); opacity: 1; }
    }

    .info-box {
        background: rgba(255,255,255,0.06);
        padding: 15px;
        border-radius: 10px;
        margin: 12px 0;
        text-align: left;
        font-size: 15px;
        border-left: 4px solid #ffcc00;
    }

    .info-box p {
        margin: 5px 0;
    }

    a {
        display: inline-block;
        margin-top: 20px;
        padding: 12px 20px;
        background: #ffcc00;
        color: #111;
        text-decoration: none;
        font-weight: bold;
        border-radius: 8px;
        transition: 0.3s;
    }

    a:hover {
        background: #ffd633;
    }
</style>

</head>

<body>

<div class="card">

    <div class="success-icon">✔</div>

    <h2>Booking Confirmed</h2>

    <div class="info-box">
        <p><strong>Movie:</strong> ${booking.movieName}</p>
        <p><strong>Theatre:</strong> ${booking.theatreName}</p>
        <p><strong>Show Time:</strong> ${booking.showTime}</p>
        <p><strong>Seats:</strong> ${booking.seatNumbers}</p>
        <p><strong>Booked At:</strong> ${booking.bookingTime}</p>
    </div>

    <a href="${pageContext.request.contextPath}/booking/my?email=${booking.userEmail}">
        View My Bookings
    </a>

</div>

</body>
</html>
