<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="UTF-8">

    <meta name="viewport"
          content="width=device-width, initial-scale=1.0">

    <title>Task Manager</title>

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


    <main class="hero">

        <div class="hero-content">

            <span class="eyebrow">
                SIMPLE TASK MANAGEMENT
            </span>

            <h1>
                Organize your work.<br>
                <span>Get things done.</span>
            </h1>

            <p>
                Create, manage, edit and track your tasks
                from one simple and clean interface.
            </p>

            <div class="hero-actions">

                <a class="btn btn-primary"
                   href="<c:url value='/tasks'/>">
                    View Tasks
                </a>

                <a class="btn btn-secondary"
                   href="<c:url value='/tasks/new'/>">
                    Create Task
                </a>

            </div>

        </div>

    </main>


    <section class="features">

        <div class="feature-card">

            <div class="feature-icon">
                +
            </div>

            <h3>Create</h3>

            <p>
                Add new tasks with a name, description
                and priority.
            </p>

        </div>


        <div class="feature-card">

            <div class="feature-icon">
                #
            </div>

            <h3>Track by ID</h3>

            <p>
                Open, edit and delete a specific task
                using its unique ID.
            </p>

        </div>


        <div class="feature-card">

            <div class="feature-icon">
                ✓
            </div>

            <h3>Stay Organized</h3>

            <p>
                Keep your tasks organized and mark them
                as completed.
            </p>

        </div>

    </section>


    <footer class="footer">

        <p>
            Task Manager &copy; 2026
        </p>

    </footer>

</div>

</body>
</html>