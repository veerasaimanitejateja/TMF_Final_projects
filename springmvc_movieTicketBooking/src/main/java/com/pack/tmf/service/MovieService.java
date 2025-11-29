package com.pack.tmf.service;
import java.util.List;
import com.pack.tmf.dto.Movie;
import com.pack.tmf.dto.Show;
import com.pack.tmf.dto.Seat;
public interface MovieService { List<Movie> getAll(); List<Show> getShowsByMovie(int movieId); List<Seat> getSeatsForShow(int showId); Show getShow(int showId); }
