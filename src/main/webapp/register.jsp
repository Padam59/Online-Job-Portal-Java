<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Register page</title>
<%@include file="all_component/allcss.jsp"%>
<style>
    body {
        background-color: #f7f7f7;
        font-family: 'Arial', sans-serif;
    }
    .card {
        border: none;
        border-radius: 20px;
        box-shadow: 0 10px 20px rgba(0, 0, 0, 0.2);
        background: #fff;
        overflow: hidden;
        position: relative;
    }
    .card-body {
        padding: 40px;
    }
    .form-group label {
        font-weight: bold;
    }
    .btn-primary {
        background-color: #4a90e2; /* Blue color */
        border-color: #4a90e2; /* Blue color */
        border-radius: 20px;
        padding: 10px 30px;
        font-size: 18px;
        letter-spacing: 1px;
        transition: all 0.3s ease;
    }
    .btn-primary:hover {
        background-color: #3b7dd8; /* Darker shade of blue */
        border-color: #3b7dd8; /* Darker shade of blue */
    }
    .alert {
        margin-top: 20px;
        border-radius: 20px;
    }
    .alert-success {
        background-color: #77dd77;
        color: #fff;
    }
    .alert-danger {
        background-color: #ff6961;
        color: #fff;
    }
    .text-center {
        text-align: center;
    }
    .fa-user-plus {
        color: #4a90e2; /* Blue color */
    }
    /* Animation */
    .animated {
        animation-duration: 1s;
        animation-fill-mode: both;
    }
    @keyframes fadeIn {
        from {
            opacity: 0;
            transform: translateY(-20px);
        }
        to {
            opacity: 1;
            transform: translateY(0);
        }
    }
    .fadeIn {
        animation-name: fadeIn;
    }
</style>
</head>
<body>

<%@include file="all_component/navbar.jsp"%>

<div class="container-fluid">
    <div class="row p-4 animated fadeIn">
        <div class="col-md-4 offset-md-4">
            <div class="card">
                <div class="card-body">
                    <div class="text-center">
                        <i class="fa fa-user-plus fa-2x" aria-hidden="true"></i>
                        <h5>Registration</h5>
                    </div>
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
                    <form action="register" method="post">
                        <div class="form-group">
                            <label>Enter Full Name</label>
                            <input type="text" required="required" class="form-control" aria-describedby="emailHelp" name="name">
                        </div>
                        <div class="form-group">
                            <label>Enter Qualification</label>
                            <select name="qua" required class="form-control">
                                <option>--choose--</option>
                                <option value="BCA">BCA</option>
                                <option value="MCA">MCA</option>
                                <option value="BTECH">BTECH</option>
                                <option value="MTECH">MTECH</option>
                                <option value="BSC">BSC</option>
                                <option value="MSC">MSC</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <label>Enter Email</label>
                            <input type="email" required="required" class="form-control" aria-describedby="emailHelp" name="email">
                        </div>
                        <div class="form-group">
                            <label for="exampleInputPassword1">Enter Password</label>
                            <input required="required" type="password" class="form-control" id="exampleInputPassword1" name="ps">
                        </div>
                        <button type="submit" class="btn btn-primary badge-pill btn-block">Register</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

<%@include file="all_component/footer.jsp"%>

<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/2.11.6/umd/popper.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.3.0/js/bootstrap.min.js"></script>
</body>
</html>
