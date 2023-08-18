package kz.almatv.AlmaTVTaskManager.services.impl;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;
import kz.almatv.AlmaTVTaskManager.models.Task;
import kz.almatv.AlmaTVTaskManager.repositories.TaskRepository;
import kz.almatv.AlmaTVTaskManager.services.TaskService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class TaskServiceImpl implements TaskService {

  @Autowired
  public TaskRepository taskRepository;

  @Override
  public List<Task> getTaskList() {
    return taskRepository.findAll();
  }

  @Override
  public Task getTaskById(Long id) {
    return taskRepository.findById(id).orElse(null);
  }

  @Override
  public void addTask(Task task) {
    LocalDateTime currentDateTime = LocalDateTime.now();
    DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm");
    String formattedDateTime = currentDateTime.format(formatter);
    task.setDateTimeLog(formattedDateTime);
    task.setStatus("В процессе");
    taskRepository.save(task);
  }

  @Override
  public void updateTask(Task task) {
    LocalDateTime currentDateTime = LocalDateTime.now();
    DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm");
    String formattedDateTime = currentDateTime.format(formatter);
    task.setDateTimeLog(formattedDateTime);
    task.setStatus("В процессе");
    taskRepository.save(task);
  }

  @Override
  public void deleteTaskById(Long id) {
    taskRepository.deleteById(id);
  }

  @Override
  public void updateTasksStatus(Long id, String status, String comment) {
    Task task = getTaskById(id);
    task.setStatus(status);
    task.setComment(comment);
    taskRepository.save(task);
  }

  @Override
  public int countTascksInProcess() {
    int count = 0;
    List<Task> tasks = getTaskList();
    for(Task t : tasks){
      if(t.getStatus().equals("В процессе")){
        count ++;
      }
    }
    return count;
  }
}
