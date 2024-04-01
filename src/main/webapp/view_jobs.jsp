<%@page import="com.entity.Jobs"%>
<%@page import="java.util.List"%>
<%@page import="com.conn.DBConnect"%>
<%@page import="com.dao.JobDAO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Admin : View Jobs</title>
    <%@include file="all_component/allcss.jsp"%>
    <style type="text/css">
        .back-img {
            width: 100%;
            height: 30vh;
            background: linear-gradient(rgba(0, 0, 0, .4), rgba(0, 0, 0, .4)), url("img/img2.jpg");
            background-repeat: no-repeat;
            background-size: cover;
            background-position: center top;
            background-position-y: 30%;
        }

        .jobcard:hover {
            box-shadow: 0 0 8px 0 rgba(0, 0, 0, 0.3);
            transition: box-shadow 0.3s ease-in-out;
        }

        .jobcard a {
            text-decoration: none;
            color: black;
        }

        .jobcard a:hover {
            text-decoration: none;
            color: black;
        }

        /* Add your custom styles here */
        .container {
            margin-top: 20px;
        }

        .card {
            margin-bottom: 20px;
            border: 1px solid #ddd;
            border-radius: 10px;
            box-shadow: 0 10px 20px rgba(0, 0, 0, 0.2);
            background: #fff;
            overflow: hidden;
            position: relative;
        }

        .card-body {
            padding: 20px;
        }

        .btn-sm {
            padding: 5px 10px;
            font-size: 14px;
            border-radius: 5px;
        }

        .bg-success {
            background-color: #28a745 !important; /* Green color */
        }

        .bg-danger {
            background-color: #dc3545 !important; /* Red color */
        }

        .text-white {
            color: #fff !important;
        }

        .text-primary {
            color: #007bff !important; /* Blue color */
        }

        .text-warning {
            color: #ffc107 !important; /* Yellow color */
        }

        .fa-shopping-bag, .fa-map-marker-alt, .fa-calendar-alt, .fa-clipboard {
            margin-right: 5px;
        }
    </style>
</head>
<body style="background-color: #fffcfa;">

    <%@include file="all_component/navbar.jsp"%>

    <div class="back-img justify-content-center p-5"></div>

    <div class="container">
        <h3 class="text-center text-primary">All Jobs</h3>
        <div class="row">
            <%
            JobDAO dao = new JobDAO(DBConnect.getConn());
            List<Jobs> list = dao.getJobsByStatus();
            for (Jobs j : list) {
            %>
            <div class="col-md-10 offset-md-1 mt-3 jobcard p-0 ">
                <div class="card">
                    <div class="card-body">
                        <h5 class="ml-2"><%=j.getTitle()%></h5>
                        <div class="row p-2">
                            <div class="col-md-3">
                                <i class="fas fa-shopping-bag text-primary"></i> Category : <%=j.getCategory()%>
                            </div>
                            <div class="col-md-3">
                                <i class="fas fa-map-marker-alt text-warning"></i> <%=j.getLocation()%>
                            </div>
                            <div class="col-md-4">
                                <i class="fas fa-calendar-alt text-primary"></i> Publish Date : <%=j.getPdate().toString()%>
                            </div>
                        </div>
                        <div class="p-2">
                            <%
                            int l = j.getDescription().length();
                            if (l < 120) { %>
                            <p><i class="far fa-clipboard text-primary"></i><%=j.getDescription()%></p>
                            <% } else { %>
                            <p><i class="far fa-clipboard text-primary"></i><%=j.getDescription().substring(1, 180)%>... <span class="text-primary">Read more</span></p>
                            <% } %>
                        </div>
                        <div class="text-center ">
                            <a href="edit_job.jsp?id=<%=j.getId()%>" class="btn btn-sm bg-success text-white">Edit</a>
                            <a href="delete?id=<%=j.getId()%>" class="btn btn-sm bg-danger text-white">Delete</a>
                        </div>
                    </div>
                </div>
            </div>
            <% } %>
        </div>
    </div>

</body>
</html>
