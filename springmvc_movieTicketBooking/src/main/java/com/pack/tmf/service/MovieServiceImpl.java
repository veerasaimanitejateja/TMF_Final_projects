package com.pack.tmf.service;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.pack.tmf.dao.MovieDao;
import com.pack.tmf.dao.SeatDao;
import com.pack.tmf.dao.ShowDao;
import com.pack.tmf.dto.Movie;
import com.pack.tmf.dto.Seat;
import com.pack.tmf.dto.Show;
@Service
public class MovieServiceImpl implements MovieService {
    @Autowired private MovieDao movieDao;
    @Autowired private SeatDao seatDao;
    @Autowired private ShowDao showDao;
    @Override public List<Movie> getAll(){ return movieDao.getAll(); }
    @Override public List<Show> getShowsByMovie(int movieId){ return movieDao.getShowsByMovie(movieId); }
    @Override public List<Seat> getSeatsForShow(int showId){ return seatDao.getByShow(showId); }
    @Override public Show getShow(int showId){ return showDao.getById(showId); }
}
