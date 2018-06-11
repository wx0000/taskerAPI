<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB" crossorigin="anonymous">
    <title>Tasks List</title>
    <style>
        body {
            background-image: url("/images/background.png");
            background-size: 100% 100%;
            color: fuchsia;
        }
        a{
            color: fuchsia;
            text-decoration:none;
        }
        .navbar {
            padding-bottom: 0px;
        }
    </style>
</head>
<body>
<nav class="navbar navbar-dark bg-dark">
    <a href="/home">Back to home page</a><br/>
    <a href="/task/add">Add New Task</a><br/>
<a href="/category">Check Category list</a><br/>
    <form action="/task/searchTasks" method="post" class="form-inline">
        <input input name="phrase" value="" placeholder="Search for a task" class="form-control mr-sm-2" type="search" aria-label="Search">
        <button class="btn btn-outline-info my-2my-sm-0" type="submit">Search</button>
    </form>
</nav>
<h2>All Tasks</h2>

<table border="1">
    <thead>
    <tr>
        <th>Priority</th>
        <th>Order</th>
        <th>Category</th>
        <th>Task</th>
        <th>Description</th>
        <th>Operations</th>
    </tr>
    </thead>
    <tbody>
    <c:out value="${tasks}"/>
    <c:forEach items="${tasks}" var="task">
        <c:if test="${task.done == false}">
            <tr>
                <td>${task.priority}</td>
                <td>${task.order}</td>
                <td>${task.taskCategory.category}</td>
                <td>${task.title}</td>
                <td>${task.description}</td>
                <td>
                    <a href="/task/${task.id}/done">Done</a>
                    <a href="/task/${task.id}/moveUp">Move up</a>
                    <a href="/task/${task.id}/moveDown">Move down</a>
                    <a href="/task/${task.id}/edit">Edit</a>
                    <a href="/task/${task.id}/delete">Delete</a>
                </td>
            </tr>
        </c:if>
    </c:forEach>
    </tbody>
</table>

<h2>Finished Tasks</h2>
<table border="1">
    <thead>
    <tr>
        <th>Priority</th>
        <th>Order</th>
        <th>Category</th>
        <th>Task</th>
        <th>Description</th>
        <th>Operations</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${tasks}" var="task">
        <c:if test="${task.done == true}">
            <tr>
                <td>${task.priority}</td>
                <td>${task.order}</td>
                <td>${task.title}</td>
                <td>${task.description}</td>
                <td>${task.taskCategory.category}</td>
                <td>
                    <a href="/task/${task.id}/undone">Undone</a>
                </td>
            </tr>
        </c:if>
    </c:forEach>
    </tbody>
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js" integrity="sha384-smHYKdLADwkXOn1EmN1qk/HfnUcbVRZyYmZ4qpPea6sjB/pTJ0euyQp0Mk8ck+5T" crossorigin="anonymous"></script>
</body>
</html>
