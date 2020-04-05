package com.kovalskiy.testproject.service;

import com.kovalskiy.testproject.config.MailConfig;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.stereotype.Service;

import java.util.Properties;

@Service
public class UserService {

    @Autowired
    private MailSender mailSender;

    public void send(String emailTo, String subject, String message) {
        mailSender.send(emailTo, subject, message);
    }
}
