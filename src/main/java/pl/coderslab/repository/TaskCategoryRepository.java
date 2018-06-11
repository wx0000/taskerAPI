package pl.coderslab.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import pl.coderslab.entity.TaskCategory;

public interface TaskCategoryRepository extends JpaRepository<TaskCategory, Long> {


}
