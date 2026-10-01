# Spring-MVC-Task-Manager-NTI

A classic **Spring MVC + JSP** task management web application built as part of the **NTI (National Telecommunication Institute)** training program.

This project demonstrates a traditional Spring MVC architecture **without Spring Boot**, including full CRUD operations, server-side validation, global exception handling, request timing interceptor, and JSP view rendering.

---

## 📌 Features

- List all tasks
- View task details
- Create a new task
- Edit an existing task
- Delete a task
- Search tasks by priority: `HIGH`, `MEDIUM`, `LOW`
- Bean Validation for required fields
- Global exception handling for:
  - Task not found
  - Unexpected errors
- Request timing interceptor for `/tasks/**`
- In-memory data storage — no database required
- JSP-based views with Spring MVC

---

## 🛠️ Tech Stack

| Layer | Technology |
|---|---|
| Language | Java 17+ |
| Web Framework | Spring MVC 6 |
| View Technology | JSP |
| Servlet API | Jakarta Servlet 6.0 |
| Validation | Jakarta Bean Validation |
| Build Tool | Maven |
| Server | Apache Tomcat 10.1+ |
| Architecture | MVC |
| Storage | In-memory `List<Task>` |

> ⚠️ This project uses **Jakarta EE**, so it must be deployed on **Tomcat 10+**, not Tomcat 9.

---

## 🧱 Project Structure

```text
src/main/java/com/mvcdemo/
├── config/
│   └── WebConfig.java
├── controllers/
│   ├── HomeController.java
│   └── TaskController.java
├── enums/
│   └── TaskPriority.java
├── exceptions/
│   ├── GlobalException.java
│   └── TaskNotFoundException.java
├── interceptors/
│   └── RequestTimingInterceptor.java
├── models/
│   └── Task.java
└── services/
    └── TaskService.java

src/main/webapp/
├── WEB-INF/
│   └── web.xml
├── views/
│   ├── index.jsp
│   ├── tasks/
│   │   ├── list.jsp
│   │   ├── details.jsp
│   │   ├── form.jsp
│   │   └── edit-form.jsp
│   └── error/
│       ├── not-found.jsp
│       └── general.jsp
└── resources/
```

---

## 🔁 Application Flow

1. Request comes to `DispatcherServlet`
2. `DispatcherServlet` uses `WebConfig` as the Spring configuration
3. Controller handles the request
4. Service processes data
5. Controller adds data to `Model`
6. `InternalResourceViewResolver` resolves JSP view
7. JSP renders the final HTML response

View resolver configuration:

```java
resolver.setPrefix("/views/");
resolver.setSuffix(".jsp");
```

So a return value like `"tasks/list"` maps to:

```text
/views/tasks/list.jsp
```

---

## 🧭 Endpoints

| Method | URL | Description |
|---|---|---|
| GET | `/` | Home page |
| GET | `/tasks` | List all tasks |
| GET | `/tasks/{id}` | View task details |
| GET | `/tasks/search?priority=LOW` | Search tasks by priority |
| GET | `/tasks/new` | Show create task form |
| POST | `/tasks` | Create a new task |
| GET | `/tasks/{id}/edit` | Show edit task form |
| PUT | `/tasks/{id}` | Update an existing task |
| DELETE | `/tasks/{id}` | Delete a task |

Supported priorities:

```text
HIGH
MEDIUM
LOW
```

---

## ✅ Validation

The `Task` model uses Jakarta Bean Validation:

```java
@NotBlank(message = "Name is required")
private String name;

@NotBlank(message = "Description is required")
private String description;

@NotNull(message = "Priority is required")
private TaskPriority priority;
```

If validation fails, the user is returned to the form with error messages.

---

## 🚨 Exception Handling

Global exception handling is implemented using `@ControllerAdvice`.

### Task Not Found

```java
@ExceptionHandler(TaskNotFoundException.class)
public String handleNotFound(TaskNotFoundException ex, Model model) {
    model.addAttribute("message", ex.getMessage());
    return "error/not-found";
}
```

### Unexpected Errors

```java
@ExceptionHandler(Exception.class)
public String handleUnexpected(Exception ex, Model model) {
    model.addAttribute("message", "Something went wrong.\n" + ex.getMessage());
    return "error/general";
}
```

---

## ⏱️ Request Timing Interceptor

`RequestTimingInterceptor` measures how long each request under `/tasks/**` takes.

It stores the start time in `preHandle`:

```java
request.setAttribute("startTime", System.currentTimeMillis());
```

Then calculates and logs the duration in `afterCompletion`:

```java
long startTime = (Long) request.getAttribute("startTime");
long duration = System.currentTimeMillis() - startTime;

logger.info(request.getMethod() + " " + request.getRequestURI()
        + " - Response timing: " + duration + " ms");
```

---

## ⚙️ Configuration

### `web.xml`

- Registers `DispatcherServlet`
- Uses `AnnotationConfigWebApplicationContext`
- Loads `com.mvcdemo.config.WebConfig`
- Maps dispatcher to `/`
- Registers `HiddenHttpMethodFilter` to support:
    - `POST + _method=PUT`
    - `POST + _method=DELETE`

### `WebConfig.java`

- Enables Spring MVC with `@EnableWebMvc`
- Scans `com.mvcdemo`
- Configures `InternalResourceViewResolver`
- Registers `RequestTimingInterceptor` for `/tasks/**`
- Maps static resources under `/resources/**`

---

## 🚀 Getting Started

### Prerequisites

- JDK 17 or higher
- Maven 3.8+
- Apache Tomcat 10.1+ or any Jakarta EE compatible server
- IDE such as IntelliJ IDEA or Eclipse

### Build the Project

```bash
mvn clean package
```

This generates a WAR file inside:

```text
target/
```

### Deploy on Tomcat

Copy the generated WAR file to:

```text
$TOMCAT_HOME/webapps/
```

Start Tomcat:

```bash
$TOMCAT_HOME/bin/startup.sh
```

On Windows:

```bash
$TOMCAT_HOME\bin\startup.bat
```

### Access the Application

If the WAR file is named `Spring-MVC-Task-Manager-NTI.war`, open:

```text
http://localhost:8080/Spring-MVC-Task-Manager-NTI/
```

---

## 📦 Sample Data

The application starts with five sample tasks defined inside `TaskService`:

- Learn Spring MVC
- Practice JSP
- Build CRUD
- Learn Validation
- Review Java

Data is stored in memory only. Restarting the server resets all tasks.

---

## 🔮 Future Improvements

- Add database support using JPA/Hibernate
- Add pagination and sorting
- Add user authentication and authorization
- Add REST API endpoints
- Add unit and integration tests
- Improve UI with Bootstrap or Tailwind CSS
- Add Docker support
- Add Spring Security

---

## 👨‍💻 Author

**NTI Training Project**  
Built as part of the **National Telecommunication Institute (NTI)** Spring MVC & JSP training.

---

## 📄 License

This project is for educational purposes as part of the NTI training program.