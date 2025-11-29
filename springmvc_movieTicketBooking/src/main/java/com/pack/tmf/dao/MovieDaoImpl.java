package com.pack.tmf.dao;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;
import com.pack.tmf.dto.Movie;
import com.pack.tmf.dto.Show;
import com.pack.tmf.dto.Theatre;
@Repository
public class MovieDaoImpl implements MovieDao {
    @Autowired private JdbcTemplate jdbc;
    @Override public List<Movie> getAll(){
        String sql = "SELECT movie_id, movie_name, movie_image_url FROM movies";
        return jdbc.query(sql, (rs,rowNum)->{ Movie m=new Movie(); m.setMovieId(rs.getInt("movie_id")); m.setMovieName(rs.getString("movie_name")); m.setMovieImageUrl(rs.getString("movie_image_url")); return m; });
    }
    @Override public List<Show> getShowsByMovie(int movieId){
        String sql = "SELECT s.show_id, s.show_time, t.theatre_id, t.theatre_name, t.location FROM shows s JOIN theatres t ON s.theatre_id = t.theatre_id WHERE s.movie_id = ?";
        return jdbc.query(sql, new Object[]{movieId}, (rs,rowNum)->{ Show s=new Show(); s.setShowId(rs.getInt("show_id")); s.setShowTime(rs.getString("show_time")); Theatre t=new Theatre(); t.setTheatreId(rs.getInt("theatre_id")); t.setTheatreName(rs.getString("theatre_name")); t.setLocation(rs.getString("location")); s.setTheatre(t); return s; });
    }
}
