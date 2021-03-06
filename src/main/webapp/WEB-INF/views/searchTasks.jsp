<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css"
          integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB" crossorigin="anonymous">
    <title>Search for a task</title>
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
</nav>
<table>
    <thead>
    <tr>
        <th></th>
    </tr>
    </thead>
    <tbody>

    <form action="/task/searchTasks" method="post">
        <label>Search task </label>
        <input name="phrase" value="" placeholder="Search"/>
        <input type="Submit" value="Search"/>
    </form>

    </tbody>

</table>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
        integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
        crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"
        integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49"
        crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"
        integrity="sha384-smHYKdLADwkXOn1EmN1qk/HfnUcbVRZyYmZ4qpPea6sjB/pTJ0euyQp0Mk8ck+5T"
        crossorigin="anonymous"></script>
</body>
</html>
