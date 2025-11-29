package com.pack.tmf.dao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;
import com.pack.tmf.dto.Show;
import com.pack.tmf.dto.Movie;
import com.pack.tmf.dto.Theatre;
@Repository
public class ShowDaoImpl implements ShowDao {
    @Autowired private JdbcTemplate jdbc;
    @Override public Show getById(int showId){
        String sql = "SELECT s.show_id, s.show_time, m.movie_id, m.movie_name, m.movie_image_url, t.theatre_id, t.theatre_name, t.location FROM shows s JOIN movies m ON s.movie_id = m.movie_id JOIN theatres t ON s.theatre_id = t.theatre_id WHERE s.show_id = ?";
        return jdbc.queryForObject(sql, new Object[]{showId}, (rs,rowNum)->{ Show s=new Show(); s.setShowId(rs.getInt("show_id")); s.setShowTime(rs.getString("show_time")); Movie m=new Movie(); m.setMovieId(rs.getInt("movie_id")); m.setMovieName(rs.getString("movie_name")); m.setMovieImageUrl(rs.getString("movie_image_url")); s.setMovie(m); Theatre t=new Theatre(); t.setTheatreId(rs.getInt("theatre_id")); t.setTheatreName(rs.getString("theatre_name")); t.setLocation(rs.getString("location")); s.setTheatre(t); return s; });
    }
}
