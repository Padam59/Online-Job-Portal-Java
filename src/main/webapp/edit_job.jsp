<%@page import="com.entity.Jobs"%>
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
<title>Admin: Edit Jobs</title>
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
    .btn-success {
        background-color: #28a745;
        border-color: #28a745;
        transition: background-color 0.3s, border-color 0.3s;
    }
    .btn-success:hover {
        background-color: #218838;
        border-color: #1e7e34;
    }
</style>
</head>
<body>

<c:if test="${empty userobj}">
    <c:redirect url="login.jsp" />
</c:if>
<%@include file="all_component/navbar.jsp"%>
<div class="container p-2">
    <div class="col-md-10 offset-md-1">
        <div class="card mt-5">
            <div class="card-body">
            <c:if test="${not empty succMsg}">
							<div id="successAlert" class="alert alert-success" role="alert">${succMsg}</div>
							<script>
								// Remove the success alert after 1 second
								setTimeout(function() {
									var successAlert = document
											.getElementById('successAlert');
									if (successAlert) {
										successAlert.remove();
									}
								}, 1000); // 1000 milliseconds = 1 second
							</script>
							<c:remove var="succMsg" />
						</c:if>
                <!-- Display update successful alert message -->
                <c:if test="${not empty succMsg}">
                    <div class="alert alert-success" role="alert">${succMsg}</div>
                    <c:remove var="succMsg" />
                </c:if>

                <div class="text-center text-success">
                    <i class="fas fa-user-friends fa-3x"></i>
                    <%
                    int id = Integer.parseInt(request.getParameter("id"));
                    JobDAO dao = new JobDAO(DBConnect.getConn());
                    Jobs j = dao.getJobsById(id);
                    %>
                    <h5>Edit Jobs</h5>
                </div>
                <form action="update" method="post">
                    <input type="hidden" name="id" value="<%=j.getId()%>">

                    <div class="form-group">
                        <label>Enter Title</label> <input type="text" name="title"
                            class="form-control" value="<%=j.getTitle()%>">
                    </div>
                    <div class="form-row">
                        <div class="form-group col-md-4">
                            <label>Location</label> <select name="location"
                                class="custom-select " id="inlineFormCustomSelectPref">
                                <option value="<%=j.getLocation()%>" selected><%=j.getLocation()%></option>
                                <option selected>Choose...</option>
                                <option value="Kathmandu">Kathmandu</option>
                                <option value="Pokhara">Pokhara</option>
                                <option value="Butwal">Butwal</option>
                                <option value="Dhangadi">Dhangadi</option>
                                <option value="Ghorahi">Ghorahi</option>
                                <option value="Janakpur">Janakpur</option>
                                <option value="Biratnagar">Biratnagar</option>
                            </select>
                        </div>
                        <div class="form-group col-md-4">
                            <label>Category</label> <select class="custom-select "
                                id="inlineFormCustomSelectPref" name="category">
                                <option value="<%=j.getCategory()%>" selected><%=j.getCategory()%></option>
                                <option value="IT">IT</option>
                                <option value="Devloper">Devloper</option>
                                <option value="Banking">Banking</option>
                                <option value="Engineer">Engineer</option>
                                <option value="Teacher">Teacher</option>
                            </select>
                        </div>
                        <div class="form-group col-md-4">
                            <label>Status</label> <select class="form-control" name="status">
                                <%
                                if ("Active".equals(j.getStatus())) {
                                %>
                                <option value="Active">Active</option>
                                <option value="Inactive">Inactive</option>
                                <%
                                } else {
                                %>
                                <option value="Inactive">Inactive</option>
                                <option value="Active">Active</option>
                                <%
                                }
                                %>
                            </select>
                        </div>
                    </div>

                    <div class="form-group">
                        <label>Enter Description</label>
                        <textarea rows="6" cols="" name="desc" class="form-control"><%=j.getDescription()%></textarea>
                    </div>
                    <button class="btn btn-success">Update Job</button>
                </form>
            </div>
        </div>
    </div>
</div>

</body>
</html>
