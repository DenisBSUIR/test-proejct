package com.kovalskiy.testproject.controller;

import com.kovalskiy.testproject.model.User;
import com.kovalskiy.testproject.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class RegistrationController {

    @Autowired
    private UserRepository userRepository;

    @GetMapping("/registration")
    public String showLoginPage(Model model) {
        return "/registration";
    }

    @PostMapping("/registration")
    public String registry(User user, Model model) {

        userRepository.save(user);
        return "redirect:/login";
    }
}