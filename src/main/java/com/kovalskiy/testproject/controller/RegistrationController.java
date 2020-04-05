package com.kovalskiy.testproject.controller;

import com.kovalskiy.testproject.model.User;
import com.kovalskiy.testproject.repository.UserRepository;
import com.kovalskiy.testproject.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class RegistrationController {

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private UserService userService;

    @GetMapping("/registration")
    public String showLoginPage(Model model) {
        return "/registration";
    }

    @PostMapping("/registration")
    public String registry(User user, Model model) {

        /*User userFromDB = userRepository.findByEmail(user.getEmail());
        if(userFromDB != null) {
            model.addAttribute("message", "User exists!");
            return "registration";
        }*/

        if(!StringUtils.isEmpty(user.getEmail())) {
            System.out.println("E");
            userService.send(user.getEmail(), "Activation", "message");
        }

        System.out.println("W");

        userRepository.save(user);
        return "redirect:/login";
    }
}