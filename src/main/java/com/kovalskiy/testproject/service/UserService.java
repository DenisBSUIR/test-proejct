package com.kovalskiy.testproject.service;

import com.kovalskiy.testproject.config.MailConfig;
import com.kovalskiy.testproject.model.User;
import com.kovalskiy.testproject.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import java.util.Properties;

@Service
public class UserService{

    @Autowired
    private MailSender mailSender;

    @Autowired
    private PasswordEncoder passwordEncoder;

    @Autowired
    private UserRepository userRepository;

    public void send(String emailTo, String subject, String message) {
        mailSender.send(emailTo, subject, message);
    }

    public boolean addUser(User user) {

        User userFromDB = userRepository.findByEmail(user.getEmail());
        if(userFromDB != null) {
            return false;
        }

        String message = String.format("Hello, %s!\n" +
                "You have successfully registered on the site: http://localhost:8080/", user.getFirstName());
        send(user.getEmail(), "Notification", message);

        user.setPassword(passwordEncoder.encode(user.getPassword()));

        userRepository.save(user);

        return true;
    }
}
