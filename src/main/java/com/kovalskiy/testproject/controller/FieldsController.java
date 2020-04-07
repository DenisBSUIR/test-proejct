package com.kovalskiy.testproject.controller;

import com.kovalskiy.testproject.model.Field;
import com.kovalskiy.testproject.model.Response;
import com.kovalskiy.testproject.repository.FieldsRepository;
import com.kovalskiy.testproject.repository.ResponseRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.*;

@Controller
public class FieldsController {

    @Autowired
    private ResponseRepository responseRepository;

    @Autowired
    private FieldsRepository fieldsRepository;

    @GetMapping("/fields")
    public String showFieldsPage(Model model) {
        Iterable<Field> fields = fieldsRepository.findAll();
        model.addAttribute("fields", fields);
        return "/fields";
    }

    @PostMapping("/changeField")
    public String changeField(Field field, Model model) {

        Optional<Field> optionalFieldFromDb = fieldsRepository.findById(field.getId());
        if(optionalFieldFromDb.isPresent()) {
            Field fieldFromDB = optionalFieldFromDb.get();
            fieldFromDB.setLabel(field.getLabel());
            fieldFromDB.setActive(field.isActive());
            fieldFromDB.setType(field.getType());
            fieldFromDB.setRequired(field.isRequired());

            HashSet<String> temp = new HashSet<>(field.getOptions());
            fieldFromDB.getOptions().clear();
            for (String s: temp) {
                String[] options = s.split("\n");
                for(String option: options) {
                    if (option != null && option != "") {
                        field.getOptions().add(option);
                    }
                }
            }

            fieldsRepository.save(fieldFromDB);
        }

        return "redirect:/fields";
    }

    @PostMapping("/getField")
    public String getField(@RequestParam String field_id, Model model) {
        Optional<Field> optionalFieldFromDb = fieldsRepository.findById(Long.parseLong(field_id));
        if(optionalFieldFromDb.isPresent()) {
            Field field = optionalFieldFromDb.get();
            model.addAttribute("fieldForChange", field);
            model.addAttribute("showModal", false);
        }
        return "redirect:/fields";
    }

    @PostMapping("/afterLogin")
    public String post(){
        return "redirect:/fields";
    }

    @PostMapping("/addField")
    public String addField(Field field, Model model) {
        HashSet<String> temp = new HashSet<>(field.getOptions());
        field.getOptions().clear();
        for (String s: temp) {
            String[] options = s.split("\n");
            for(String option: options) {
                if (option != null && option != "") {
                    field.getOptions().add(option);
                }
            }
        }

        fieldsRepository.save(field);
        return "redirect:/fields";
    }

    @GetMapping("/responses")
    public String showResponses(Model model) {

        model.addAttribute("fields", fieldsRepository.findAll());

        List<Response> responses = responseRepository.findAll();

        model.addAttribute("responses",responses);


        return "responses";
    }
}
