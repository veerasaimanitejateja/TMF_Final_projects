package com.pack.tmf.dao;
import java.util.List;
import com.pack.tmf.dto.Movie;
import com.pack.tmf.dto.Show;
public interface MovieDao { java.util.List<Movie> getAll(); java.util.List<Show> getShowsByMovie(int movieId); }
