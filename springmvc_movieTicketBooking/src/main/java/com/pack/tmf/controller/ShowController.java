package com.pack.tmf.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import com.pack.tmf.service.MovieService;

@Controller
public class ShowController {

    @Autowired
    private MovieService movieService;

    // ✅ Correct: PathVariable for /movies/{movieId}/shows
    @GetMapping("/movies/{movieId}/shows")
    public String shows(@PathVariable("movieId") int movieId, Model model) {
        model.addAttribute("shows", movieService.getShowsByMovie(movieId));
        return "shows";
    }

    // ✅ Seats page - Correct
    @GetMapping("/movies/shows/{showId}/seats")
    public String seats(@PathVariable("showId") int showId, Model model) {
        model.addAttribute("showId", showId);
        model.addAttribute("seats", movieService.getSeatsForShow(showId));
        model.addAttribute("showInfo", movieService.getShow(showId));
        return "seats";
    }
}
