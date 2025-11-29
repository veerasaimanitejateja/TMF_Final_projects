package com.pack.tmf.controller;
import jakarta.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import com.pack.tmf.dto.User;
import com.pack.tmf.service.UserService;
@Controller
public class AuthController {
    @Autowired private UserService userService;
    @GetMapping("/login") public String loginPage(){ return "login"; }
    @PostMapping("/login") 
    public String doLogin(@RequestParam("email") String email,
            @RequestParam("password") String password, HttpSession session, Model m){
        User u = userService.findByEmail(email);
        if(u==null || !u.getPassword().equals(password)){ m.addAttribute("error","Invalid credentials"); return "login"; }
        session.setAttribute("userEmail", u.getEmail()); session.setAttribute("userName", u.getUsername());
        return "redirect:/movies";
    }
    @GetMapping("/register")
    public String registerPage(){ return "register"; }
    @PostMapping("/register") public String doRegister(@RequestParam("username") String username,@RequestParam("email") String email,
            @RequestParam("password") String password, Model m){
        User exists = userService.findByEmail(email); if(exists!=null){ m.addAttribute("error","Email already registered"); return "register"; }
        User u = new User(); u.setUsername(username); u.setEmail(email); u.setPassword(password); userService.register(u); m.addAttribute("msg","Registration successful. Please login."); return "login";
    }
    @GetMapping("/logout") public String logout(HttpSession session){ session.invalidate(); return "redirect:/login"; }
}
