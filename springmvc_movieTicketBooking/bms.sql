CREATE DATABASE IF NOT EXISTS bms;
USE bms;

DROP TABLE IF EXISTS bookings;
DROP TABLE IF EXISTS seats;
DROP TABLE IF EXISTS shows;
DROP TABLE IF EXISTS theatres;
DROP TABLE IF EXISTS movies;
DROP TABLE IF EXISTS users;

CREATE TABLE users (
  id INT AUTO_INCREMENT PRIMARY KEY,
  username VARCHAR(100),
  email VARCHAR(100),
  password VARCHAR(100)
);

INSERT INTO users(username,email,password) VALUES
('Girish','g@gmail.com','pass123');

CREATE TABLE movies (
 movie_id INT AUTO_INCREMENT PRIMARY KEY,
 movie_name VARCHAR(100),
 movie_image_url VARCHAR(1000)
);

INSERT INTO movies (movie_name, movie_image_url) VALUES
('Kantara', 'https://assets-in.bmscdn.com/discovery-catalog/events/tr:w-400,h-600,bg-CCCCCC/et00377351-meuxbybksb-portrait.jpg'),
('Baahubali', 'https://assets-in.bmscdn.com/discovery-catalog/events/tr:w-400,h-600,bg-CCCCCC/et00453094-keyqubedzf-portrait.jpg'),
('Narasimha', 'https://assets-in.bmscdn.com/discovery-catalog/events/tr:w-400,h-600,bg-CCCCCC/et00429289-eyrvmpkesd-portrait.jpg');

CREATE TABLE theatres (
 theatre_id INT AUTO_INCREMENT PRIMARY KEY,
 theatre_name VARCHAR(100),
 location VARCHAR(100)
);

INSERT INTO theatres (theatre_name,location) VALUES
('PVR Forum','Bangalore'),
('INOX Mall','Hyderabad');

CREATE TABLE shows (
 show_id INT AUTO_INCREMENT PRIMARY KEY,
 movie_id INT,
 theatre_id INT,
 show_time VARCHAR(50),
 FOREIGN KEY (movie_id) REFERENCES movies(movie_id),
 FOREIGN KEY (theatre_id) REFERENCES theatres(theatre_id)
);

INSERT INTO shows(movie_id,theatre_id,show_time) VALUES
(1,1,'2025-12-27 18:00'),
(1,2,'2025-12-27 21:00'),
(2,1,'2025-12-28 19:30');

CREATE TABLE seats (
 seat_id INT AUTO_INCREMENT PRIMARY KEY,
 show_id INT,
 seat_number VARCHAR(10),
 booked TINYINT DEFAULT 0,
 FOREIGN KEY(show_id) REFERENCES shows(show_id)
);

INSERT INTO seats(show_id, seat_number, booked) VALUES
(1, 'A1', 0),(1, 'A2', 0),(1, 'A3', 0),(1,'B1',0),(1,'B2',0),
(2,'A1',0),(2,'A2',0),(2,'B1',0),
(3,'A1',0),(3,'A2',0);

CREATE TABLE bookings (
 booking_id INT AUTO_INCREMENT PRIMARY KEY,
 show_id INT,
 user_email VARCHAR(100),
 seat_numbers VARCHAR(200),
 movie_name VARCHAR(100),
 theatre_name VARCHAR(100),
 show_time VARCHAR(100),
 booking_time VARCHAR(100),
 FOREIGN KEY (show_id) REFERENCES shows(show_id)
);
