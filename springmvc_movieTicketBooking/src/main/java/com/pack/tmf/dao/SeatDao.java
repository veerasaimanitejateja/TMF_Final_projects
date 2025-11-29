package com.pack.tmf.dao;
import java.util.List;
import com.pack.tmf.dto.Seat;
public interface SeatDao { List<Seat> getByShow(int showId); void blockByIds(java.util.List<Integer> ids); java.util.List<String> getSeatNumbersByIds(java.util.List<Integer> ids); }
