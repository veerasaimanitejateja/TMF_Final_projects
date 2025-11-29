package com.pack.tmf.controller;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import com.pack.tmf.service.MovieService;
@Controller
public class MovieController {
    @Autowired private MovieService movieService;
    @GetMapping({"/","/movies"})
    public String list(Model m){ m.addAttribute("movies", movieService.getAll()); return "movielist"; }
}
