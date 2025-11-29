package com.pack.tmf.dao;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;
import com.pack.tmf.dto.Booking;
@Repository
public class BookingDaoImpl implements BookingDao {
    @Autowired private JdbcTemplate jdbc;
    @Override public void save(Booking b){ String sql = "INSERT INTO bookings (show_id, user_email, seat_numbers, movie_name, theatre_name, show_time, booking_time) VALUES (?,?,?,?,?,?,?)"; jdbc.update(sql, b.getShowId(), b.getUserEmail(), b.getSeatNumbers(), b.getMovieName(), b.getTheatreName(), b.getShowTime(), b.getBookingTime()); }
    @Override public List<Booking> getByEmail(String email){ String sql = "SELECT booking_id, show_id, user_email, seat_numbers, movie_name, theatre_name, show_time, booking_time FROM bookings WHERE user_email = ? ORDER BY booking_id DESC"; return jdbc.query(sql, new Object[]{email}, (rs,rowNum)->{ Booking b=new Booking(); b.setBookingId(rs.getInt("booking_id")); b.setShowId(rs.getInt("show_id")); b.setUserEmail(rs.getString("user_email")); b.setSeatNumbers(rs.getString("seat_numbers")); b.setMovieName(rs.getString("movie_name")); b.setTheatreName(rs.getString("theatre_name")); b.setShowTime(rs.getString("show_time")); b.setBookingTime(rs.getString("booking_time")); return b; }); }
}
