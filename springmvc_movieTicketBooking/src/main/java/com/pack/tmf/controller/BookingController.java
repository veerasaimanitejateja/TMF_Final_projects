package com.pack.tmf.controller;

import java.util.Arrays;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import com.pack.tmf.dto.Booking;
import com.pack.tmf.service.BookingService;
import com.pack.tmf.service.MovieService;

@Controller
@RequestMapping("/booking")
public class BookingController {

    @Autowired
    private BookingService bookingService;

    @Autowired
    private MovieService movieService;   // ✅ MovieService contains seat + show methods


    @PostMapping("/confirm")
    public String confirmBooking(
            @RequestParam("showId") int showId,
            @RequestParam("userEmail") String userEmail,
            @RequestParam(value = "seatIds", required = false) Integer[] seatIds,
            Model model) {

        if (seatIds == null || seatIds.length == 0) {
            model.addAttribute("error", "Please select at least one seat!");
            model.addAttribute("showId", showId);

            // ⭐ FIX → Use MovieService (not BookingService)
            model.addAttribute("seats", movieService.getSeatsForShow(showId));
            model.addAttribute("showInfo", movieService.getShow(showId));

            return "seats";
        }

        List<Integer> ids = Arrays.asList(seatIds);

        // ⭐ Correct method exists in BookingService
        bookingService.blockSeats(ids);

        Booking booking = bookingService.createBooking(showId, ids, userEmail);

        model.addAttribute("booking", booking);
        return "booking-success";
    }

    @GetMapping("/my")
    public String myBookings(@RequestParam("email") String email, Model model) {
        model.addAttribute("bookings", bookingService.getBookings(email));
        return "mybookings";
    }
}
