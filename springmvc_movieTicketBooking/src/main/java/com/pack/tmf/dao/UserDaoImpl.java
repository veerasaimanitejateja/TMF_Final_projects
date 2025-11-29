package com.pack.tmf.dao;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;
import com.pack.tmf.dto.User;
@Repository
public class UserDaoImpl implements UserDao {
    @Autowired private JdbcTemplate jdbc;
    @Override public User findByEmail(String email){
        String sql="SELECT id, username, email, password FROM users WHERE email = ?";
        List<User> list = jdbc.query(sql, new Object[]{email}, (rs,rn)->{ User u=new User(); u.setId(rs.getInt("id")); u.setUsername(rs.getString("username")); u.setEmail(rs.getString("email")); u.setPassword(rs.getString("password")); return u; });
        return list.isEmpty()?null:list.get(0);
    }
    @Override public void save(User u){ jdbc.update("INSERT INTO users(username,email,password) VALUES(?,?,?)", u.getUsername(), u.getEmail(), u.getPassword()); }
}
