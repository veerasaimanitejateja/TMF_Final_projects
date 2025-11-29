package com.pack.tmf.service;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pack.tmf.dao.BookingDao;
import com.pack.tmf.dao.SeatDao;
import com.pack.tmf.dao.ShowDao;
import com.pack.tmf.dto.Booking;
import com.pack.tmf.dto.Show;

@Service
public class BookingServiceImpl implements BookingService {

    @Autowired 
    private SeatDao seatDao;

    @Autowired 
    private BookingDao bookingDao;

    @Autowired 
    private ShowDao showDao;


    /** ✅ BLOCK SEATS */
    @Override
    public void blockSeats(List<Integer> seatIds) {
        seatDao.blockByIds(seatIds);   // your existing method
    }


    /** ✅ CREATE & SAVE BOOKING */
    @Override
    public Booking createBooking(int showId, List<Integer> seatIds, String userEmail) {

        // 1️⃣ Fetch show info
        Show show = showDao.getById(showId);

        // 2️⃣ Convert seat IDs → seat numbers (A1, A2...)
        List<String> seatNumbers = seatDao.getSeatNumbersByIds(seatIds);
        String seatsJoined = String.join(", ", seatNumbers);

        // 3️⃣ Create booking DTO
        Booking b = new Booking();
        b.setShowId(showId);
        b.setUserEmail(userEmail);
        b.setSeatNumbers(seatsJoined);

        // Details from Show object
        b.setMovieName(show.getMovie().getMovieName());
        b.setTheatreName(show.getTheatre().getTheatreName());
        b.setShowTime(show.getShowTime());

        // Add Timestamp
        b.setBookingTime(LocalDateTime.now()
                .format(DateTimeFormatter.ofPattern("dd-MM-yyyy HH:mm")));

        // 4️⃣ Save booking in DB
        bookingDao.save(b);

        return b;
    }


    /** ✅ GET USER BOOKINGS */
    @Override
    public List<Booking> getBookings(String email) {
        return bookingDao.getByEmail(email);
    }
}
