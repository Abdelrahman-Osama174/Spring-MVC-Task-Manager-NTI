package com.mvcdemo.controllers;

import com.mvcdemo.exceptions.TaskNotFoundException;
import com.mvcdemo.models.Task;
import com.mvcdemo.enums.TaskPriority;
import com.mvcdemo.services.TaskService;

import jakarta.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/tasks")
public class TaskController {

    private final TaskService taskService;

    public TaskController(TaskService taskService) {
        this.taskService = taskService;
    }

    @GetMapping
    public String getAllTasks(Model model) {
        model.addAttribute("tasks", taskService.getTasks());
        return "tasks/list";
    }

    @GetMapping("/{id}")
    public String getTask(@PathVariable("id") int id, Model model) {

        Task task = taskService.getTask(id);

        if (task == null) {
            throw new TaskNotFoundException("Task with id " + id + " not found");
        }

        model.addAttribute("task", task);

        return "tasks/details";
    }

    @GetMapping("/search")
    public String searchTasks(@RequestParam(value = "priority", required = false, defaultValue = "LOW") TaskPriority priority,
                              Model model) {

        model.addAttribute("tasks", taskService.search(priority));

        return "tasks/list";
    }

    @GetMapping("/new")
    public String showCreateForm(Model model) {

        model.addAttribute("task", new Task());

        return "tasks/form";
    }

    @PostMapping
    public String createTask(@Valid @ModelAttribute("task") Task task, BindingResult result) {

        if (result.hasErrors())
            return "tasks/form";

        taskService.addTask(task);

        return "redirect:/tasks";
    }


    @GetMapping("/{id}/edit")
    public String showEditForm(@PathVariable("id") int id, Model model) {

        Task task = taskService.getTask(id);

        if (task == null) {
            throw new TaskNotFoundException("Task with ID " + id + " was not found.");
        }

        model.addAttribute("task", task);

        return "tasks/edit-form";
    }

    @PutMapping("/{id}")
    public String updateTask(@PathVariable("id") int id,
                             @Valid @ModelAttribute("task") Task task,
                             BindingResult result) {

        if (result.hasErrors()) {
            task.setId(id);
            return "tasks/edit-form";
        }

        boolean updated = taskService.updateTask(id, task);

        if (!updated) {
            throw new TaskNotFoundException("Task with ID " + id + " was not found.");
        }

        return "redirect:/tasks/" + id;
    }

    @DeleteMapping("/{id}")
    public String deleteTask(@PathVariable("id") int id) {
        if (!taskService.deleteTask(id))
            throw new TaskNotFoundException("Task with id " + id + " not found");

        return "redirect:/tasks";
    }
}