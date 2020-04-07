package com.kovalskiy.testproject.controller;

import com.kovalskiy.testproject.model.Field;
import com.kovalskiy.testproject.model.Response;
import com.kovalskiy.testproject.repository.FieldsRepository;
import com.kovalskiy.testproject.repository.ResponseRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;
import java.util.Map;

@Controller
public class QuestionnairePageController {

    @Autowired
    private FieldsRepository fieldsRepository;

    @Autowired
    private ResponseRepository responseRepository;

    @GetMapping("/")
    public String showQuestionnairePage(Model model) {

        List<Field> fields = fieldsRepository.findAll();

        model.addAttribute("fields", fields);
        return "questionnaire";
    }

    @PostMapping("/response")
    public String saveResponse(@RequestParam Map<String, String> allParams, Model model) {
        List<Field> fields = fieldsRepository.findAll();
        Response resp = new Response();

        for(Field f : fields) {
            String response = allParams.get(f.getLabel());
            if(response != null) {
                resp.getFieldResponse().put(f.getId(),response);
            } else {
                resp.getFieldResponse().put(f.getId(),"");
            }
        }

        responseRepository.save(resp);

        return "redirect:/confirmation";
    }

    @GetMapping("/confirmation")
    public String showConfirmationPage() {
        return "confirmation";
    }
}
