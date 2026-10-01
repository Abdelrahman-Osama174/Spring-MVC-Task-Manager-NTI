<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="UTF-8">

    <meta name="viewport"
          content="width=device-width, initial-scale=1.0">

    <title>Something Went Wrong</title>

    <link rel="stylesheet"
          href="<c:url value='/resources/css/style.css'/>">

</head>

<body>

<div class="error-page">

    <div class="error-card">

        <div class="error-code error">
            !
        </div>

        <h1>Something Went Wrong</h1>

        <p>
            ${message}
        </p>

        <div class="error-actions">

            <a class="btn btn-primary"
               href="<c:url value='/tasks'/>">
                Back to Tasks
            </a>

            <a class="btn btn-secondary"
               href="<c:url value='/'/>">
                Home
            </a>

        </div>

    </div>

</div>

</body>
</html>