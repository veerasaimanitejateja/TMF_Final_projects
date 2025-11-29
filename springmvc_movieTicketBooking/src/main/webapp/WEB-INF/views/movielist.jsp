<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<title>Movies</title>

<style>
    body {
        margin: 0;
        padding: 0;
        font-family: 'Poppins', sans-serif;
        background: #121212;
        color: white;
    }

    h1 {
        text-align: center;
        padding: 25px 0;
        color: #ffcc00;
        font-size: 36px;
        margin-bottom: 10px;
    }

    .movie-container {
        display: grid;
        grid-template-columns: repeat(auto-fit, minmax(220px, 1fr));
        gap: 25px;
        padding: 20px 40px;
    }

    .movie-card {
        background: #1e1e1e;
        padding: 15px;
        border-radius: 12px;
        text-align: center;
        box-shadow: 0 4px 20px rgba(0,0,0,0.4);
        transition: transform 0.25s ease, box-shadow 0.25s ease;
    }

    .movie-card:hover {
        transform: translateY(-6px);
        box-shadow: 0 6px 28px rgba(255, 204, 0, 0.35);
    }

    .movie-card img {
        width: 100%;
        height: 300px;
        object-fit: cover;
        border-radius: 10px;
        margin-bottom: 12px;
    }

    .movie-name {
        font-size: 18px;
        font-weight: bold;
        margin-bottom: 12px;
        color: #ffcc00;
    }

    .btn-book {
        display: inline-block;
        padding: 10px 18px;
        background-color: #ffcc00;
        color: #111;
        text-decoration: none;
        border-radius: 8px;
        font-weight: bold;
        transition: background 0.3s;
    }

    .btn-book:hover {
        background-color: #ffdb4d;
    }
</style>

</head>

<body>

<h1>Movies</h1>

<div class="movie-container">

<c:forEach var="m" items="${movies}">
  <div class="movie-card">
    
    <img src="${m.movieImageUrl}" alt="${m.movieName}" />

    <div class="movie-name">${m.movieName}</div>

    <a class="btn-book" href="${pageContext.request.contextPath}/movies/${m.movieId}/shows">
        Book Now
    </a>
  </div>
</c:forEach>

</div>

</body>
</html>
