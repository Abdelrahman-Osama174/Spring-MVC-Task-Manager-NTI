<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="UTF-8">

    <meta name="viewport"
          content="width=device-width, initial-scale=1.0">

    <title>Create Task</title>

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

        </nav>

    </header>


    <main class="page-container narrow">

        <div class="page-header">

            <div>

                <span class="eyebrow">
                    NEW TASK
                </span>

                <h1>Create Task</h1>

                <p>
                    Add a new task to your task list.
                </p>

            </div>

        </div>


        <div class="form-card">

            <form:form method="post"
                       modelAttribute="task"
                       action="${pageContext.request.contextPath}/tasks">


                <div class="form-group">

                    <label for="name">
                        Task Name
                    </label>

                    <form:input
                            path="name"
                            id="name"
                            cssClass="form-control"
                            placeholder="Enter task name"/>

                    <form:errors
                            path="name"
                            cssClass="field-error"/>

                </div>


                <div class="form-group">

                    <label for="description">
                        Description
                    </label>

                    <form:textarea
                            path="description"
                            id="description"
                            cssClass="form-control textarea"
                            rows="5"
                            placeholder="Describe your task..."/>

                    <form:errors
                            path="description"
                            cssClass="field-error"/>

                </div>


                <div class="form-group">

                    <label for="priority">
                        Priority
                    </label>

                    <form:select
                            path="priority"
                            id="priority"
                            cssClass="form-control">

                        <form:option value=""
                                     label="Select priority"/>

                        <form:option value="LOW"
                                     label="Low"/>

                        <form:option value="MEDIUM"
                                     label="Medium"/>

                        <form:option value="HIGH"
                                     label="High"/>

                    </form:select>

                    <form:errors
                            path="priority"
                            cssClass="field-error"/>

                </div>


                <div class="checkbox-group">

                    <form:checkbox
                            path="completed"
                            id="completed"/>

                    <label for="completed">
                        Mark task as completed
                    </label>

                </div>


                <div class="form-actions">

                    <a class="btn btn-secondary"
                       href="<c:url value='/tasks'/>">
                        Cancel
                    </a>

                    <button type="submit"
                            class="btn btn-primary">
                        Create Task
                    </button>

                </div>

            </form:form>

        </div>

    </main>

</div>

</body>
</html>