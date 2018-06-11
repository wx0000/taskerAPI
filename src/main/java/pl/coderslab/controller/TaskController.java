package pl.coderslab.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import pl.coderslab.entity.Task;
import pl.coderslab.entity.TaskCategory;
import pl.coderslab.repository.TaskCategoryRepository;
import pl.coderslab.repository.TaskRepository;
import pl.coderslab.service.TaskService;

import javax.validation.Valid;
import java.util.List;

@Controller
@RequestMapping("/task")
public class TaskController {

    @Autowired
    TaskRepository taskRepository;

    @Autowired
    TaskService taskService;

    @Autowired
    TaskCategoryRepository taskCategoryRepository;

    @GetMapping("")
    public String all(Model model){
        model.addAttribute("tasks", taskRepository.findAllByOrderByPriorityAscOrderAsc());
        return "taskList";
    }

    @GetMapping("/add")
    public String add(Model model){
        model.addAttribute("task", new Task());
        return "taskForm";
    }

    @PostMapping("/add")
    public String add(@Valid Task task, BindingResult result){
        if(result.hasErrors()){
            return "taskForm";
        }
        taskRepository.save(task);
        return "redirect:/task";
    }

    @GetMapping("/{id}/edit")
    public String edit(@PathVariable Long id, Model model){
        model.addAttribute("task", taskRepository.findOne( (long) id));
        return "taskForm";
    }

    @PostMapping("/{id}/edit")
    public String edit(@Valid Task task, BindingResult result){
        if(result.hasErrors()){
            return "taskForm";
        }
        taskRepository.save(task);
        return "redirect:/task";
    }

    @GetMapping("/{id}/delete")
    public String delete(@PathVariable Long id){
        taskRepository.delete(id);
        return "redirect:/task";
    }

    @GetMapping("/{id}/moveUp")
    public String moveUp(@PathVariable Long id){
        taskService.moveUpTaskOrder(id);
        return "redirect:/task";
    }

    @GetMapping("/{id}/moveDown")
    public String moveDown(@PathVariable Long id){
        taskService.moveDownTaskOrder(id);
        return "redirect:/task";
    }

    @GetMapping("/{id}/done")
    public String done(@PathVariable Long id){
        taskService.doneTask(id);
        return "redirect:/task";
    }

    @GetMapping("/{id}/undone")
    public String undone(@PathVariable Long id){
        taskService.undoneTask(id);
        return "redirect:/task";
    }

    @GetMapping("/searchTasks")
    public String allByTitle() {
        return "searchTasks";
    }

    @PostMapping("/searchTasks")
    public String searchTasks(@RequestParam String phrase, Model model) {
        model.addAttribute("tasks", taskRepository.findAllByTitle(phrase));
//        List<Task> list = taskRepository.findAllByTitle(phrase);
//        for (Task t: list
//             ) {
//            System.out.println(t.getTitle());
//        }
        return "taskList";
    }

    @ModelAttribute("taskCategoryList")
    public List<TaskCategory> categoryList() {
        return taskCategoryRepository.findAll();
    }


}
