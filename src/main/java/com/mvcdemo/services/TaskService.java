package com.mvcdemo.services;

import com.mvcdemo.enums.TaskPriority;
import com.mvcdemo.models.Task;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class TaskService {
    private final List<Task> tasks = new ArrayList<>();
    private int nextId = 0;

    public TaskService() {
        addTask(new Task("Learn Spring MVC", "Study Spring MVC fundamentals",
                TaskPriority.HIGH, false));

        addTask(new Task("Practice JSP", "Create JSP pages and forms",
                TaskPriority.MEDIUM, false));

        addTask(new Task("Build CRUD", "Implement CRUD operations for tasks",
                TaskPriority.HIGH, false));

        addTask(new Task("Learn Validation", "Practice Bean Validation with Spring MVC",
                TaskPriority.MEDIUM, true));

        addTask(new Task("Review Java", "Review OOP and Collections",
                TaskPriority.LOW, false));
    }

    public void addTask(Task task) {
        task.setId(nextId++);
        tasks.add(task);
    }

    public List<Task> getTasks() {
        return tasks;
    }

    public Task getTask(int id) {
        for (Task task : tasks) {
            if (task.getId() == id) {
                return task;
            }
        }

        return null;
    }

    public List<Task> search(TaskPriority taskPriority) {
        List<Task> result = new ArrayList<>();

        for (Task task : tasks) {
            if (task.getPriority() == taskPriority) {
                result.add(task);
            }
        }

        return result;
    }

    public boolean updateTask(int id, Task updatedTask) {

        Task existingTask = getTask(id);

        if (existingTask == null) {
            return false;
        }

        existingTask.setName(updatedTask.getName());
        existingTask.setDescription(updatedTask.getDescription());
        existingTask.setPriority(updatedTask.getPriority());
        existingTask.setCompleted(updatedTask.isCompleted());

        return true;
    }

    public boolean deleteTask(int id) {

        Task task = getTask(id);

        if (task == null) {
            return false;
        }

        return tasks.remove(task);
    }
}