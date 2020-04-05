package com.kovalskiy.testproject.controller;

import com.kovalskiy.testproject.model.User;
import com.kovalskiy.testproject.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class UserController {

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private PasswordEncoder passwordEncoder;

    @GetMapping("/profileEdit")
    public String showEditProfilePage(@AuthenticationPrincipal User user, Model model) {
        model.addAttribute("usr", user);
        return "profileEdit";
    }

    @PostMapping("/changeProfile")
    public String saveChanges(@AuthenticationPrincipal User user,
                              @RequestParam String firstName,
                              @RequestParam String lastName,
                              @RequestParam String email,
                              @RequestParam String phoneNumber,
                              Model model) {
        user.setEmail(email);
        user.setFirstName(firstName);
        user.setLastName(lastName);
        user.setPhoneNumber(phoneNumber);

        userRepository.save(user);

        return "redirect:/fields";
    }


    @GetMapping("/passwordChange")
    public String showPasswordChangePage(Model model) {
        return "/passwordChange";
    }

    @PostMapping("/saveNewPassword")
    public String saveNewPassword(@AuthenticationPrincipal User user,
                                  @RequestParam String currentPassword,
                                  @RequestParam String newPassword,
                                  @RequestParam String password2,
                                  Model model) {
        if (currentPassword != null) {
            if (passwordEncoder.matches(currentPassword, user.getPassword())) {
                if (newPassword != null && newPassword != "" && newPassword.equals(password2)) {
                    user.setPassword(passwordEncoder.encode(newPassword));
                    userRepository.save(user);
                    return "redirect:/fields";
                } else {
                    model.addAttribute("error", "Passwords are different");
                }
            }
        } else {
            model.addAttribute("error", "Current Password Field is empty");
        }
        return "redirect:/passwordChange";
    }
}
