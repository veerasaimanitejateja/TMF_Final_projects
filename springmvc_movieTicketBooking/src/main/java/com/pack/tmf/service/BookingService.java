package com.pack.tmf.service;

import java.util.List;
import com.pack.tmf.dto.Booking;

public interface BookingService {

    // Block seats before confirming
    void blockSeats(List<Integer> seatIds);

    // Create booking entry after payment
    Booking createBooking(int showId, List<Integer> seatIds, String userEmail);

    // View user bookings
    List<Booking> getBookings(String email);
}
