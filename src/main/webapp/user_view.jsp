<%@page import="com.entity.Jobs"%>
<%@page import="java.util.List"%>
<%@page import="com.conn.DBConnect"%>
<%@page import="com.dao.JobDAO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>User : View Jobs</title>
<%@include file="all_component/allcss.jsp"%>
<style type="text/css">
    body {
        background-color: #fffcfa;
        font-family: 'Arial', sans-serif;
    }
    .back-img {
        width: 100%;
        height: 30vh;
        background: linear-gradient(rgba(0, 0, 0, .4), rgba(0, 0, 0, .4)), url("img/img2.jpg");
        background-repeat: no-repeat;
        background-size: cover;
        background-position: center top;
        background-position-y: 30%;
    }
    .jobcard {
        transition: transform 0.3s;
    }
    .jobcard:hover {
        transform: translateY(-5px);
    }
    .jobcard a {
        text-decoration: none;
        color: black;
    }
    .jobcard a:hover {
        text-decoration: none;
        color: black;
    }
    .card {
        border: none;
        border-radius: 20px;
        box-shadow: 0 10px 20px rgba(0, 0, 0, 0.1);
        background: #fff;
        overflow: hidden;
    }
    .card-body {
        padding: 20px;
    }
    .fa-shopping-bag, .fa-map-marker-alt, .fa-calendar-alt, .fa-clipboard {
        margin-right: 5px;
    }
</style>
</head>
<body>

<%@include file="all_component/navbar.jsp"%>

<div class="back-img justify-content-center p-5">
    <form class="form-inline" action="more_view.jsp" method="get">
        <div class="form-group col-md-5 mt-1">
            <h5>Location</h5>
        </div>
        <div class="form-group col-md-4 mt-1">
            <h5>Category</h5>
        </div>
        <div class="form-group col-md-5">
            <select name="loc" class="custom-select " id="inlineFormCustomSelectPref">
                <option selected value="lo">Choose...</option>
                <option value="Kathmandu">Kathmandu</option>
                <option value="Pokhara">Pokhara</option>
                <option value="Butwal">Butwal</option>
                <option value="Dhangadi">Dhangadi</option>
                <option value="Ghorahi">Ghorahi</option>
                <option value="Janakpur">Janakpur</option>
                <option value="Biratnagar">Biratnagar</option>
            </select>
        </div>
        <div class="form-group col-md-5">
            <select class="custom-select " id="inlineFormCustomSelectPref" name="cat">
                <option value="ca" selected>Choose...</option>
                <option value="IT">IT</option>
                <option value="Devloper">Devloper</option>
                <option value="Banking">Banking</option>
                <option value="Engineer">Engineer</option>
                <option value="Teacher">Teacher</option>
            </select>
        </div>
        <div class="form-group col-md-2">
            <button class="btn btn-primary btn-lg">Search</button>
        </div>
    </form>
</div>

<div class="container">
    <h3 class="text-center text-primary">All Jobs</h3>
    <div class="row">
        <% JobDAO dao = new JobDAO(DBConnect.getConn());
            List<Jobs> list = dao.getJobsByStatus();
            for (Jobs j : list) { %>
        <div class="col-md-10 offset-md-1 mt-3 jobcard p-0 ">
            <a href="one_view.jsp?id=<%=j.getId()%>">
                <div class="card">
                    <div class="card-body">
                        <h5 class="ml-2"><%=j.getTitle()%></h5>
                        <div class="row p-2">
                            <div class="col-md-3">
                                <i class="fas fa-shopping-bag text-primary"></i> Category :
                                <%=j.getCategory()%>
                            </div>
                            <div class="col-md-3">
                                <i class="fas fa-map-marker-alt text-warning"></i>
                                <%=j.getLocation()%>
                            </div>
                            <div class="col-md-4">
                                <i class="fas fa-calendar-alt text-primary"></i> Publish Date :
                                <%=j.getPdate().toString()%>
                            </div>
                        </div>
                        <div class="p-2">
                            <%
                                int l = j.getDescription().length();
                                if (l < 120) { %>
                            <p>
                                <i class="far fa-clipboard text-primary"></i><%=j.getDescription()%></p>
                            <% } else { %>
                            <p>
                                <i class="far fa-clipboard text-primary"></i><%=j.getDescription().substring(1, 180)%>...
                                <span class="text-primary">Read more</span>
                            </p>
                            <% } %>
                        </div>
                    </div>
                </div>
            </a>
        </div>
        <% } %>
    </div>
</div>

</body>
</html>
