<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<html>
<head>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB" crossorigin="anonymous">
    <title>User Form</title>
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
    <a href="/user">All Users</a><br/>
        <form action="/task/searchTasks" method="post" class="form-inline">
            <input input name="phrase" value="" placeholder="Search for a task" class="form-control mr-sm-2" type="search" aria-label="Search">
            <button class="btn btn-outline-info my-2my-sm-0" type="submit">Search</button>
        </form>
    </nav>

    <div class="container">
        <div class="row">
            <div class="col-sm">
                <form:form method="post" action="/user/add" modelAttribute="user">
                    <form:hidden path="id" />

                    <label>Name:</label>
                    <form:input path="firstName" placeholder="First Name"/>
                    <form:errors path="firstName" />

                    <label>Surname:</label>
                    <form:input path="lastName" placeholder="Last Name"/>
                    <form:errors path="lastName" />

                    <label>E-mail:</label>
                    <form:input path="email" placeholder="E-mail"/>
                    <form:errors path="email" />
                    <input type="submit" value="save">
                </form:form>

            </div>
        </div>
    </div>


<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js" integrity="sha384-smHYKdLADwkXOn1EmN1qk/HfnUcbVRZyYmZ4qpPea6sjB/pTJ0euyQp0Mk8ck+5T" crossorigin="anonymous"></script>
</body>
</html>
