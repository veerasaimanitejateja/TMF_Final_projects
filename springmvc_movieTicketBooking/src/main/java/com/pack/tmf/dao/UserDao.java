package com.pack.tmf.dao;
import com.pack.tmf.dto.User;
public interface UserDao { User findByEmail(String email); void save(User u); }
