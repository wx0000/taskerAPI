package pl.coderslab.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import pl.coderslab.entity.TaskCategory;
import pl.coderslab.repository.TaskCategoryRepository;

import javax.validation.Valid;

@Controller
@RequestMapping("/category")
public class TaskCategoryController {

    @Autowired
    TaskCategoryRepository taskCategoryRepository;

    @GetMapping("")
    public String all(Model model){
        model.addAttribute("categories", taskCategoryRepository.findAll());
        return "taskCategoryList";
    }

    @GetMapping("/add")
    public String add(Model model) {
        model.addAttribute("category", new TaskCategory());
        return "taskCategoryForm";
    }

    @PostMapping("/add")
    public String add(@Valid TaskCategory taskCategory, BindingResult result) {
        if (result.hasErrors()) {
            return "taskCategoryForm";
        }
        taskCategoryRepository.save(taskCategory);
        return "redirect:/category";
    }

    @GetMapping("/{id}/edit")
    public String edit(@PathVariable Long id, Model model) {
        model.addAttribute("category", taskCategoryRepository.findOne(id));
        return "taskCategoryForm";
    }

    @PostMapping("/{id}/edit")
    public String edit(@Valid TaskCategory taskCategory, BindingResult result) {
        if (result.hasErrors()) {
            return "taskCategoryForm";
        }
        taskCategoryRepository.save(taskCategory);
        return "redirect:/category";
    }

    @GetMapping("/{id}/delete")
    public String delete(@PathVariable Long id) {
        taskCategoryRepository.delete(id);
        return "redirect:/category";
    }


}
