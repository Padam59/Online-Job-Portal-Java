<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login Page</title>
<%@include file="all_component/allcss.jsp"%>
<style>
    body {
        background-color: #f7f7f7;
        font-family: 'Arial', sans-serif;
    }
    .container {
        margin-top: 50px;
    }
    .card {
        border: none;
        border-radius: 20px;
        box-shadow: 0 10px 20px rgba(0, 0, 0, 0.2);
        background: #fff;
        overflow: hidden;
        position: relative;
    }
    .nav-pills .nav-link.active, .nav-pills .show>.nav-link {
        background-color: #4a90e2; /* Blue color */
        border-color: #4a90e2; /* Blue color */
    }
    .nav-pills .nav-link {
        color: #4a90e2; /* Blue color */
        font-weight: bold;
        border-radius: 20px;
        transition: all 0.3s ease;
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
    .card-header {
        background: linear-gradient(to right, #4a90e2, #4a90e2); /* Blue color */
        color: #fff;
        border-top-left-radius: 20px;
        border-top-right-radius: 20px;
        text-align: center;
        padding: 20px 0;
        position: relative;
    }
    .card-header h2 {
        margin: 0;
        font-size: 28px;
    }
    .form-control {
        border-radius: 20px;
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

<div class="container animated fadeIn">
    <div class="row">
        <div class="col-md-6 offset-md-3">
            <div class="card">
                <div class="card-header">
                    <h2>Login</h2>
                </div>
                <div class="card-body">
                    <ul class="nav nav-pills mb-3 justify-content-center" id="pills-tab" role="tablist">
                        <li class="nav-item">
                            <a class="nav-link active" id="pills-home-tab" data-toggle="pill" href="#pills-home" role="tab" aria-controls="pills-home" aria-selected="true">User</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" id="pills-profile-tab" data-toggle="pill" href="#pills-profile" role="tab" aria-controls="pills-profile" aria-selected="false">Admin</a>
                        </li>
                    </ul>
                    <div class="tab-content" id="pills-tabContent">
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
								}, 2000); // 1000 milliseconds = 1 second
							</script>
							<c:remove var="succMsg" />
						</c:if>
                        <div class="tab-pane fade show active" id="pills-home" role="tabpanel" aria-labelledby="pills-home-tab">
                            <h3 class="text-center">User Login</h3>
                            <form action="login" method="post">
                                <input type="hidden" name="userType" value="user">
                                <div class="form-group">
                                    <label for="exampleInputEmail1">Email address</label>
                                    <input type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" required="required" name="em">
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputPassword1">Password</label>
                                    <input type="password" class="form-control" id="exampleInputPassword1" required="required" name="ps">
                                </div>
                                <div class="text-center">
                                    <button type="submit" class="btn btn-primary">Login</button>
                                    <br> <a href="register.jsp">Create Account</a><br>
                                </div>
                            </form>
                        </div>
                        <div class="tab-pane fade" id="pills-profile" role="tabpanel" aria-labelledby="pills-profile-tab">
                            <form action="login" method="post">
                                <input type="hidden" name="userType" value="admin">
                                <h3 class="text-center">Admin Login</h3>
                                <div class="form-group">
                                    <label for="exampleInputEmail1">Email address</label>
                                    <input type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" required="required" name="em">
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputPassword1">Password</label>
                                    <input type="password" class="form-control" id="exampleInputPassword1" required="required" name="ps">
                                </div>
                                <div class="text-center">
                                    <button type="submit" class="btn btn-primary">Login</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<%@include file="all_component/footer.jsp"%>

<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/2.11.6/umd/popper.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.3.0/js/bootstrap.min.js"></script>
<script>
    $(document).ready(function () {
        $('.nav-pills .nav-link').click(function() {
            $('.nav-pills .nav-link').removeClass('active');
            $(this).addClass('active');
            var targetTab = $(this).attr('href');
            $('.tab-pane').removeClass('show active');
            $(targetTab).addClass('show active');
        });
    });
</script>

</body>
</html>
