package pl.coderslab.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import pl.coderslab.entity.Task;
import pl.coderslab.repository.TaskRepository;

@Service
public class TaskService {


    @Autowired
    TaskRepository taskRepository;

    public void moveUpTaskOrder(Long id) {
        Task task = taskRepository.findOne(id);
        task.setOrder(task.getOrder() - 1);
        taskRepository.save(task);

    }

    public void moveDownTaskOrder(Long id) {
        Task task = taskRepository.findOne(id);
        task.setOrder(task.getOrder() + 1);
        taskRepository.save(task);

    }

    public void doneTask(Long id){
        Task task = taskRepository.findOne(id);
        task.setDone(true);
        taskRepository.save(task);
    }

    public void undoneTask(Long id){
        Task task = taskRepository.findOne(id);
        task.setDone(false);
        taskRepository.save(task);
    }
}
