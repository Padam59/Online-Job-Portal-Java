<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Job Portal</title>
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

    /* Profile modal styles */
    .profile-modal {
        border-radius: 10px;
        box-shadow: 0 10px 20px rgba(0, 0, 0, 0.2);
    }

    .profile-modal .modal-body {
        background-color: #f0f1f2;
    }

    .profile-modal .modal-content {
        border: none;
    }

    .profile-modal .modal-title {
        color: #343a40;
    }

    .profile-modal .modal-dialog {
        max-width: 500px;
    }

    .profile-modal .btn-primary {
        background-color: #007bff;
        border-color: #007bff;
    }

    .profile-modal .btn-primary:hover {
        background-color: #0056b3;
        border-color: #0056b3;
    }

</style>
</head>
<body>

<nav class="navbar navbar-expand-lg navbar-dark bg-primary">
    <a class="navbar-brand"
        href="<c:choose><c:when test='${userobj.role eq "admin"}'>admin.jsp</c:when><c:otherwise>index.jsp</c:otherwise></c:choose>">Job Portal</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
        aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav mr-auto">
            <li class="nav-item active">
    <a class="nav-link" href="<c:choose>
        <c:when test='${userobj.role eq "admin"}'>admin.jsp</c:when>
        <c:otherwise>index.jsp</c:otherwise>
    </c:choose>">
        <i class="fas fa-home"></i> Home <span class="sr-only">(current)</span>
    </a>
</li>

            <c:if test="${empty userobj}">
                <li class="nav-item"><a class="nav-link" href="user_view.jsp"><i class="fas fa-server"></i> Jobs</a></li>
            </c:if>

            <c:if test="${userobj.name eq 'admin' }">
				<li class="nav-item"><a class="nav-link" href="admin.jsp"><i
						class="fa fa-plus-circle"></i>Jobs</a></li>
            </c:if>

            <c:if test="${userobj.role eq 'user' }">
                <li class="nav-item"><a class="nav-link" href="user_view.jsp">View All Jobs</a></li>
                <li class="nav-item"><a class="nav-link" href="applied_jobs.jsp"> Applied Jobs</a></li>
            </c:if>
        </ul>

		<form class="form-inline my-2 my-lg-0">
			<!-- Remaining code -->
			<c:if test="${userobj.name eq 'admin' }">
				<a href="#" class="btn btn-light my-2 my-sm-0" type="submit"><i
					class="fas fa-user"></i> ${userobj.name }</a>

				<a href="logout?id=u" class="btn btn-light my-2 my-sm-0 ml-1"
					type="submit"><i class="fas fa-user-circle"></i> Logout</a>
			</c:if>

			<c:if test="${not empty userobj}">
				<c:if test="${userobj.role eq 'user'  }">
					<a data-toggle="modal" data-target="#exampleModal"
						class="btn btn-light my-2 my-sm-0" type="submit"><i
						class="fas fa-user"></i> ${userobj.name }</a>

					<a href="logout?id=u" class="btn btn-light my-2 my-sm-0 ml-1"
						type="submit"><i class="fas fa-user-circle"></i> Logout</a>
				</c:if>
			</c:if>

			<c:if test="${ empty userobj }">
				<a href="login.jsp" class="btn btn-light my-2 my-sm-0" type="submit"><i
					class="fas fa-sign-in-alt"></i> Login</a>

				<a href="register.jsp" class="btn btn-light my-2 my-sm-0 ml-1"
					type="submit"><i class="fas fa-user-circle"></i> Signup</a>

			</c:if>
		</form>
	</div>
</nav>

<!-- Modal -->
<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content profile-modal"> <!-- Add profile-modal class here -->
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Profile</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <div class="card">
                    <div class="card-body">
                        <div class="text-center text-primary">
                            <i class="fas fa-user-circle fa-3x"></i>
                        </div>
                        <table class="table">
                            <tbody>
                                <tr>
                                    <th scope="row">Name</th>
                                    <th>${userobj.name }</th>
                                </tr>
                                <tr>
                                    <th scope="row">Qualification</th>
                                    <th>${userobj.qualification }</th>
                                </tr>
                                <tr>
                                    <th scope="row">Email</th>
                                    <th>${userobj.email }</th>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                <a href="edit_profile.jsp" class="btn btn-primary">Edit</a>
            </div>
        </div>
    </div>
</div>
</body>
</html>
