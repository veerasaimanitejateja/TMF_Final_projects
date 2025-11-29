package com.pack.tmf.service;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.pack.tmf.dao.UserDao;
import com.pack.tmf.dto.User;
@Service
public class UserServiceImpl implements UserService {
    @Autowired private UserDao userDao;
    @Override public User findByEmail(String email){ return userDao.findByEmail(email); }
    @Override public void register(User u){ userDao.save(u); }
}
