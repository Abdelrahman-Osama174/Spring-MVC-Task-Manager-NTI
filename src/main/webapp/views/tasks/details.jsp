<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="UTF-8">

    <meta name="viewport"
          content="width=device-width, initial-scale=1.0">

    <title>Task #${task.id}</title>

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


    <main class="page-container narrow">

        <div class="breadcrumb">

            <a href="<c:url value='/tasks'/>">
                Tasks
            </a>

            <span>/</span>

            <span>Task #${task.id}</span>

        </div>


        <div class="details-card">

            <div class="details-header">

                <div>

                    <span class="task-id">
                        Task #${task.id}
                    </span>

                    <h1>
                        <c:out value="${task.name}"/>
                    </h1>

                </div>


                <span class="priority priority-${task.priority}">
                    ${task.priority}
                </span>

            </div>


            <div class="details-status">

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


            <div class="details-section">

                <h3>Description</h3>

                <p>

                    <c:choose>

                        <c:when test="${not empty task.description}">
                            <c:out value="${task.description}"/>
                        </c:when>

                        <c:otherwise>
                            No description provided.
                        </c:otherwise>

                    </c:choose>

                </p>

            </div>


            <div class="details-actions">

                <!-- Edit EXACT task ID -->

                <a class="btn btn-primary"
                   href="<c:url value='/tasks/${task.id}/edit'/>">
                    Edit Task
                </a>


                <form method="post"
                      action="<c:url value='/tasks/${task.id}'/>"
                      class="inline-form">

                    <input type="hidden"
                           name="_method"
                           value="DELETE">

                    <button type="submit"
                            class="btn btn-danger"
                            onclick="return confirm('Delete task #${task.id}?');">
                        Delete Task
                    </button>

                </form>


                <a class="btn btn-secondary"
                   href="<c:url value='/tasks'/>">
                    Back to Tasks
                </a>

            </div>

        </div>

    </main>

</div>

</body>
</html>