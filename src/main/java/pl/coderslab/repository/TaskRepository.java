package pl.coderslab.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import pl.coderslab.entity.Task;

import java.util.List;

public interface TaskRepository extends JpaRepository<Task, Long> {

    List<Task> findAllByOrderByPriorityAscOrderAsc();
    List<Task> findAllById(Long id);
    @Query("Select t from Task t Where t.title like :beginTitle%")
    List<Task> findAllByTitle(@Param("beginTitle") String beginTitle);
}
