package kz.almatv.AlmaTVTaskManager.services;

import java.util.List;
import kz.almatv.AlmaTVTaskManager.models.Task;

public interface TaskService {
    List<Task> getTaskList();
    Task getTaskById(Long id);
    void addTask(Task task);
    void updateTask(Task task);
    void deleteTaskById(Long id);
    void updateTasksStatus(Long id, String status, String comment);

    int countTascksInProcess();

}
