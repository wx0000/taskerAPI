<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB" crossorigin="anonymous">
    <title>Task Form</title>
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
<a href="/category/add">Add Task Category</a><br/>
    <form action="/task/searchTasks" method="post" class="form-inline">
        <input input name="phrase" value="" placeholder="Search for a task" class="form-control mr-sm-2" type="search" aria-label="Search">
        <button class="btn btn-outline-info my-2my-sm-0" type="submit">Search</button>
    </form>
</nav>
<form:form method="post" modelAttribute="task">
    <form:hidden path="id" />

    <label>Priority</label>
    <form:select path="priority">
        <form:option value="1" label="High" />
        <form:option value="2" label="Medium" />
        <form:option value="3" label="Low" />
    </form:select>
    <form:errors path="priority" />
    <br/>
    <label>Order</label>
    <form:input path="order" type="number" placeholder="Task order"/>
    <form:errors path="order" />
    <br/>

    <label>Task</label>
    <form:input path="title" placeholder="Task title" />
    <form:errors path="title" />
    <br/>

    <label>Description</label>
    <form:input path="description" placeholder="Task escription" />
    <form:errors path="description" />
    <br/>

    <label>Category</label>
    <form:select path="taskCategory.id" items="${taskCategoryList}" itemLabel="category" itemValue="id"/>
    <form:errors path="taskCategory" />
    <br/>

    <label>Task done</label>
    <form:checkbox path="done" />
    <form:errors path="done" />
    <br/>


    <input type="submit" value="Save to tasks list">

</form:form>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js" integrity="sha384-smHYKdLADwkXOn1EmN1qk/HfnUcbVRZyYmZ4qpPea6sjB/pTJ0euyQp0Mk8ck+5T" crossorigin="anonymous"></script>
</body>
</html>