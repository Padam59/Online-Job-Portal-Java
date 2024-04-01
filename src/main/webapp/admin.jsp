<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Admin</title>
    <%@include file="all_component/allcss.jsp"%>
    <!-- Bootstrap and Font Awesome CDN links -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.3.0/css/bootstrap.min.css">
    <style type="text/css">
    .back-img-container {
        background: url(img/img-back.jpg) no-repeat center center fixed; 
        background-size: cover;
        height: 100vh; /* Adjusted to cover the entire viewport */
    }

    /* Additional styles for the body content */
    .container {
        margin-top: 20px;
    }

    .card {
        margin-bottom: 10px; /* Reduced margin to minimize space */
        border: 1px solid #ddd;
        border-radius: 10px;
        transition: all 0.3s ease;
    }

    .card:hover {
        transform: translateY(-5px);
        box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
    }

    .card-body {
        padding: 10px; /* Reduced padding to minimize space */
    }

    .nav-link {
        padding: 5px 10px; /* Adjusted padding for navigation links */
    }

    .nav-item {
        margin-bottom: 5px; /* Adjusted margin for navigation items */
    }

    .left-mid-container {
        position: absolute;
        top: 50%;
        left: 10%; /* Adjust the left position as needed */
        transform: translateY(-50%);
    }

    a {
        text-decoration: none;
        color: black;
    }

    a:hover {
        text-decoration: none;
        color: black;
    }
</style>

</head>
<body>
    <c:if test="${empty userobj }">
        <c:redirect url="login.jsp" />
    </c:if>
    <%@include file="all_component/navbar.jsp"%>
    <div class="container-fluid back-img-container">
        <div class="left-mid-container">
            <div class="card">
                <div class="card-body">
                    <a href="add_job.jsp">
                        <i class="fas fa-plus-circle fa-3x text-success"></i><br>
                        <h4>Add Jobs</h4>
                    </a>
                </div>
            </div>
            <div class="card">
                <div class="card-body">
                    <a href="view_jobs.jsp">
                        <i class="fas fa-server fa-3x text-success"></i><br>
                        <h4>Edit Jobs</h4>
                    </a>
                </div>
            </div>
            <div class="card">
                <div class="card-body">
                    <a href="candidates.jsp">
                        <i class="fas fa-user-circle fa-3x text-success"></i><br>
                        <h4>Candidates</h4>
                    </a>
                </div>
            </div>
        </div>
    </div>

    <!-- Bootstrap and jQuery CDN links -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.3.0/js/bootstrap.bundle.min.js"></script>
    <%@include file="all_component/footer.jsp"%>
</body>

</html>
