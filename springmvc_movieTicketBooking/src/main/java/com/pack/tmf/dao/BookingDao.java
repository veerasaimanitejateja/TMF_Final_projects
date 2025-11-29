package com.pack.tmf.dao;
import java.util.List;
import com.pack.tmf.dto.Booking;
public interface BookingDao { void save(Booking b); List<Booking> getByEmail(String email); }
