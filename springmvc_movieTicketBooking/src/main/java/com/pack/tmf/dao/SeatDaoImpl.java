package com.pack.tmf.dao;
import java.util.List;
import java.util.stream.Collectors;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;
import com.pack.tmf.dto.Seat;
@Repository
public class SeatDaoImpl implements SeatDao {
    @Autowired private JdbcTemplate jdbc;
    @Override public List<Seat> getByShow(int showId){
        String sql = "SELECT seat_id, seat_number, booked FROM seats WHERE show_id = ?";
        return jdbc.query(sql, new Object[]{showId}, (rs,rowNum)->{ Seat s=new Seat(); s.setSeatId(rs.getInt("seat_id")); s.setSeatNumber(rs.getString("seat_number")); s.setBooked(rs.getBoolean("booked")); s.setShowId(showId); return s; });
    }
    @Override public void blockByIds(java.util.List<Integer> ids){
        if(ids==null || ids.isEmpty()) return;
        String placeholders = ids.stream().map(i->"?").collect(Collectors.joining(","));
        String sql = "UPDATE seats SET booked = 1 WHERE seat_id IN ("+placeholders+")";
        jdbc.update(sql, ids.toArray());
    }
    @Override public java.util.List<String> getSeatNumbersByIds(java.util.List<Integer> ids){
        if(ids==null || ids.isEmpty()) return java.util.List.of();
        String placeholders = ids.stream().map(i->"?").collect(Collectors.joining(","));
        String sql = "SELECT seat_number FROM seats WHERE seat_id IN ("+placeholders+")";
        return jdbc.queryForList(sql, ids.toArray(), String.class);
    }
}
