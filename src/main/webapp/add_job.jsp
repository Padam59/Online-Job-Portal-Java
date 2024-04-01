<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin: Add Jobs</title>
<%@include file="all_component/allcss.jsp"%>
<style type="text/css">
/* Additional styles for the body content */
body {
	background-color: #f0f1f2;
	font-family: 'Arial', sans-serif;
}

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

label {
	font-weight: bold;
}

.form-control {
	border-radius: 20px;
}

.btn-success {
	background-color: #28a745; /* Green color */
	border-color: #28a745; /* Green color */
	border-radius: 20px;
	padding: 10px 30px;
	font-size: 18px;
	letter-spacing: 1px;
	transition: all 0.3s ease;
}

.btn-success:hover {
	background-color: #218838; /* Darker shade of green */
	border-color: #218838; /* Darker shade of green */
}
</style>
</head>
<body>

	<c:if test="${empty userobj }">
		<c:redirect url="login.jsp" />
	</c:if>
	<%@include file="all_component/navbar.jsp"%>
	<div class="container p-2">
		<div class="col-md-10 offset-md-1">
			<div class="card">
				<div class="card-body">
					<div class="text-center text-success">
						<i class="fas fa-user-friends fa-3x"></i>
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


						<h5>Add Jobs</h5>
					</div>
					<form action="addJob" method="post">
						<div class="form-group">
							<label>Enter Title</label> <input type="text" name="title"
								required class="form-control">
						</div>
						<div class="form-row">
							<div class="form-group col-md-4">
								<label>Location</label> <select name="location"
									class="custom-select " id="inlineFormCustomSelectPref">
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
									<option selected>Choose...</option>
									<option value="IT">IT</option>
									<option value="Devloper">Devloper</option>
									<option value="Banking">Banking</option>
									<option value="Engineer">Engineer</option>
									<option value="Teacher">Teacher</option>
								</select>
							</div>

							<div class="form-group col-md-4">
								<label>Status</label> <select class="form-control" name="status">
									<option class="Active" value="Active">Active</option>
									<option class="Inactive" value="Inactive">Inactive</option>
								</select>
							</div>
						</div>

						<div class="form-group">
							<label>Enter Description</label>
							<textarea required rows="6" cols="" name="desc"
								class="form-control"></textarea>
						</div>
						<button class="btn btn-success">Publish Job</button>
					</form>
				</div>
			</div>

		</div>
	</div>
</body>
</html>
