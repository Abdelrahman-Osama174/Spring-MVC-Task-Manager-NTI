<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="UTF-8">

    <meta name="viewport"
          content="width=device-width, initial-scale=1.0">

    <title>Tasks</title>

    <link rel="stylesheet"
          href="<c:url value='/resources/css/style.css'/>">

</head>

<body>

<div class="app-shell">

    <header class="navbar">

        <a class="brand"
           href="<c:url value='/'/>">

            <span class="brand-icon">✓</span>
            <span>Task Manager</span>

        </a>

        <nav>

            <a href="<c:url value='/tasks'/>">
                Tasks
            </a>

            <a class="nav-button"
               href="<c:url value='/tasks/new'/>">
                + New Task
            </a>

        </nav>

    </header>


    <main class="page-container">

        <div class="page-header">

            <div>

                <span class="eyebrow">
                    TASK MANAGEMENT
                </span>

                <h1>Your Tasks</h1>

                <p>
                    View and manage all your tasks.
                </p>

            </div>

            <a class="btn btn-primary"
               href="<c:url value='/tasks/new'/>">
                + New Task
            </a>

        </div>


        <!-- Search -->

        <section class="search-panel">

            <form method="get"
                  action="<c:url value='/tasks/search'/>"
                  class="search-form">

                <div class="form-group">

                    <label for="priority">
                        Filter by priority
                    </label>

                    <select id="priority"
                            name="priority">

                        <option value="LOW"
                            <c:if test="${selectedPriority == 'LOW'}">
                                selected
                            </c:if>>
                            Low
                        </option>

                        <option value="MEDIUM"
                            <c:if test="${selectedPriority == 'MEDIUM'}">
                                selected
                            </c:if>>
                            Medium
                        </option>

                        <option value="HIGH"
                            <c:if test="${selectedPriority == 'HIGH'}">
                                selected
                            </c:if>>
                            High
                        </option>

                    </select>

                </div>

                <button type="submit"
                        class="btn btn-secondary">
                    Search
                </button>

                <a href="<c:url value='/tasks'/>"
                   class="clear-link">
                    Clear
                </a>

            </form>

        </section>


        <!-- Tasks -->

        <c:choose>

            <c:when test="${empty tasks}">

                <div class="empty-state">

                    <div class="empty-icon">
                        ✓
                    </div>

                    <h2>No tasks found</h2>

                    <p>
                        There are no tasks to display.
                    </p>

                    <a class="btn btn-primary"
                       href="<c:url value='/tasks/new'/>">
                        Create your first task
                    </a>

                </div>

            </c:when>


            <c:otherwise>

                <div class="task-grid">

                    <c:forEach var="task"
                               items="${tasks}">

                        <article class="task-card">

                            <div class="task-card-top">

                                <span class="task-id">
                                    #${task.id}
                                </span>

                                <span class="priority priority-${task.priority}">
                                    ${task.priority}
                                </span>

                            </div>


                            <h2>
                                <c:out value="${task.name}"/>
                            </h2>


                            <p class="task-description">

                                <c:choose>

                                    <c:when test="${not empty task.description}">
                                        <c:out value="${task.description}"/>
                                    </c:when>

                                    <c:otherwise>
                                        No description provided.
                                    </c:otherwise>

                                </c:choose>

                            </p>


                            <div class="task-status">

                                <c:choose>

                                    <c:when test="${task.completed}">

                                        <span class="status completed">
                                            ✓ Completed
                                        </span>

                                    </c:when>

                                    <c:otherwise>

                                        <span class="status pending">
                                            ● Pending
                                        </span>

                                    </c:otherwise>

                                </c:choose>

                            </div>


                            <div class="task-actions">

                                <!-- View by ID -->

                                <a class="btn btn-small btn-secondary"
                                   href="<c:url value='/tasks/${task.id}'/>">
                                    View
                                </a>


                                <!-- Edit by ID -->

                                <a class="btn btn-small btn-secondary"
                                   href="<c:url value='/tasks/${task.id}/edit'/>">
                                    Edit
                                </a>


                                <!-- Delete by ID -->

                                <form method="post"
                                      action="<c:url value='/tasks/${task.id}'/>"
                                      class="inline-form">

                                    <input type="hidden"
                                           name="_method"
                                           value="DELETE">

                                    <button type="submit"
                                            class="btn btn-small btn-danger"
                                            onclick="return confirm('Delete task #${task.id}?');">
                                        Delete
                                    </button>

                                </form>

                            </div>

                        </article>

                    </c:forEach>

                </div>

            </c:otherwise>

        </c:choose>

    </main>


    <footer class="footer">

        <p>Task Manager &copy; 2026</p>

    </footer>

</div>

</body>
</html>