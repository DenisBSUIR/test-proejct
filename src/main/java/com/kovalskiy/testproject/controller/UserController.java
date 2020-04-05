package com.kovalskiy.testproject.controller;

import com.kovalskiy.testproject.model.User;
import com.kovalskiy.testproject.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class UserController {

    @Autowired
    private UserRepository userRepository;

    @GetMapping("/profileEdit")
    public String showEditProfilePage(@AuthenticationPrincipal User user, Model model) {

        model.addAttribute("user", user);
        return "profileEdit";
    }

    @GetMapping("/passwordChange")
    public String showPasswordChangePage(Model model) {
        return "/passwordChange";
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

    @PostMapping("/saveNewPassword")
    public String saveNewPassword(@AuthenticationPrincipal User user,
                                  @RequestParam String currentPassword,
                                  @RequestParam String newPassword,
                                  @RequestParam String confirm) {

        if(user.getPassword().equals(currentPassword)) {
            if(newPassword.equals(confirm)) {
                user.setPassword(newPassword);
                userRepository.save(user);
            }
        }

        return "redirect:/fields";
    }

}
