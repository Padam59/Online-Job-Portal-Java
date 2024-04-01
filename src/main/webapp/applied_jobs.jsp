<%@page import="com.entity.Jobs"%>
<%@page import="com.dao.JobDAO"%>
<%@page import="com.entity.Candidates"%>
<%@page import="java.util.List"%>
<%@page import="com.conn.DBConnect"%>
<%@page import="com.dao.CandidateDAO"%>
<%@page import="com.entity.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Applied Jobs</title>
<%@include file="all_component/allcss.jsp"%>
<style>
    body {
        background-color: #f0f1f2;
        font-family: 'Arial', sans-serif;
    }
    .card {
        border-radius: 20px;
        box-shadow: 0 10px 20px rgba(0, 0, 0, 0.1);
        background: #fff;
        overflow: hidden;
    }
    .card-body {
        padding: 20px;
    }
    .table {
        width: 100%;
        border-collapse: collapse;
        margin-top: 20px;
    }
    .table th, .table td {
        padding: 12px 15px;
        text-align: left;
        border-bottom: 1px solid #dee2e6;
    }
    .table th {
        background-color: #007bff;
        color: #fff;
        font-weight: 500;
        text-transform: uppercase;
    }
    .table tbody tr:nth-child(even) {
        background-color: #f2f2f2;
    }
</style>
</head>
<body>

<c:if test="${empty userobj }">
    <c:redirect url="login.jsp" />
</c:if>
<%@include file="all_component/navbar.jsp"%>

<div class="container p-5">
    <div class="row">
        <div class="col-md-10 offset-md-1">
            <div class="card">
                <div class="card-body">
                    <h4 class="text-center text-primary">Applied Jobs</h4>
                    <table class="table">
                        <thead>
                            <tr>
                                <th scope="col">Job Title</th>
                                <th scope="col">Email</th>
                                <th scope="col">Interview Date</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                            User user = (User) session.getAttribute("userobj");
                            CandidateDAO dao = new CandidateDAO(DBConnect.getConn());
                            JobDAO dao2 = new JobDAO(DBConnect.getConn());
                            List<Candidates> list = dao.getCandidatesByUser(user.getId());
                            for (Candidates c : list) {
                                Jobs j = dao2.getJobsById(c.getJobId());
                            %>
                            <tr>
                                <td><%=j.getTitle()%></td>
                                <td><%=c.getEmail()%></td>
                                <td><%=c.getInterviewDate()%></td>
                            </tr>
                            <%
                            }
                            %>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>

</body>
</html>
