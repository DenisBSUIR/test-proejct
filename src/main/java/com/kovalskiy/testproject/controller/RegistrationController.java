package com.kovalskiy.testproject.controller;

import com.kovalskiy.testproject.model.User;
import com.kovalskiy.testproject.repository.UserRepository;
import com.kovalskiy.testproject.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import javax.validation.Valid;
import java.util.Map;

@Controller
public class RegistrationController {

    @Autowired
    private UserService userService;

    @GetMapping("/registration")
    public String showLoginPage(Model model) {
        return "/registration";
    }

    @PostMapping("/registration")
    public String registry(@Valid User user,
                           BindingResult bindingResult,
                           Model model) {

        if(bindingResult.hasErrors()) {
            Map<String, String> errorsMap = ControllerUtil.getErrors(bindingResult);
            model.mergeAttributes(errorsMap);
            model.addAttribute("usr", user);
            return "registration";
        } else {
            if(user.getPassword()!= null && !user.getPassword().equals(user.getPassword2())) {
                model.addAttribute("usr", user);
                model.addAttribute("passwordError", "Passwords are different");
                return "registration";
            }

            if(!userService.addUser(user)) {
                model.addAttribute("message", "User exists!");
                return "registration";
            }
        }
        return "redirect:/login";
    }
}