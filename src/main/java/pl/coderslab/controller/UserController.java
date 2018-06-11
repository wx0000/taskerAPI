package pl.coderslab.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import pl.coderslab.entity.User;
import pl.coderslab.repository.TaskRepository;
import pl.coderslab.repository.UserRepository;

import javax.validation.Valid;

@Controller
@RequestMapping("/user")
public class UserController {

    @Autowired
    TaskRepository taskRepository;

    @Autowired
    UserRepository userRepository;


    @GetMapping("")
    public String all(Model model){
        model.addAttribute("users", userRepository.findAll());
        return "userList";
    }

    @GetMapping("/add")
    public String add(Model model) {
        model.addAttribute("user", new User());
        return "userForm";
    }

    @PostMapping("/add")
    public String add(@Valid User user, BindingResult result) {
        if (result.hasErrors()) {
            return "userForm";
        }
        userRepository.save(user);
        return "redirect:/user";
    }

    @GetMapping("/{id}/tasks")
    public String userId(@PathVariable Long id, Model model) {
        model.addAttribute("task", taskRepository.findAllById(id));
        return "index";
    }

    @GetMapping("/{id}/edit")
    public String edit(@PathVariable Long id, Model model) {
        model.addAttribute("user", userRepository.findOne(id));
        return "userForm";
    }

    @PostMapping("/{id}/edit")
    public String edit(@Valid User user, BindingResult result) {
        if (result.hasErrors()) {
            return "userForm";
        }
        userRepository.save(user);
        return "redirect:/user";
    }

    @GetMapping("/{id}/delete")
    public String delete(@PathVariable Long id) {
        userRepository.delete(id);
        return "redirect:/user";
    }

}
