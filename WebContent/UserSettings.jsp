<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="org.PrinterSetupSystem.misc.AuthorizeUtil" %>
<%
	AuthorizeUtil.UserLoadedJspRedirect(request, response, "UserSettings.jsp", "/usersettings");
	AuthorizeUtil.AuthorizedRedirect(request, response);
 %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="context" value="${pageContext.request.contextPath}" />
<c:set var="ErrorPasswordsAreNotEqual" value='${requestScope["ErrorPasswordsAreNotEqual"]}'/>
<c:set var="PasswordChanged" value='${requestScope["PasswordChanged"]}'/>
<c:set var="ErrorPasswordChange" value='${requestScope["ErrorPasswordChange"]}'/>
<c:set var="ActiveElement" value='Usersettings'/>
<%@include file="Common.jsp"%>
<!doctype html>
<html>
	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
		<link rel="shortcut icon" href="img/logo.png" type="image/x-icon">
		<!-- All CSS -->
		<link rel="stylesheet" href="css/printersetupsystem.css">
		<!-- Bootstrap CSS -->
		<link rel="stylesheet" href="css/bootstrap.min.css">
		<link rel="stylesheet" href="css/open-iconic-bootstrap.css">
		<!-- Optional JavaScript -->
		<!-- jQuery first, then Popper.js, then Bootstrap JS -->
		<script src="js/jquery-3.2.1.min.js"></script>
		<script src="js/popper.min.js"></script>
		<script src="js/bootstrap.min.js"></script>
		<title>PrintDesk - User settings</title>
	</head>
	<body class="container-fluid" style="min-width: ${MinWidth};">
		<%@include file="Navbar.jsp"%>
		<div class="card ml-4 mr-4 mt-3 mb-4">
			<div class="card-header">
				<div class="d-flex align-items-center">
					<span class="align-middle">${Userprofilesettings}</span>
				</div>
			</div>
			<div class="card-body p-0">
				<div class="jumbotron card card-image rounded-0 border-0 usersettings-jumbotron">
					<div class="text-white text-sm-left usersettings-jumbotron-text">
						<div>
							<h2 class="card-title font-weight-light"><%=session.getAttribute("fullname")%></h2>
						</div>
					</div>
				</div>
				<form method="post" action="usersettings" class="ml-4 mr-4 mt-1 mb-5">
					<h4>${Changepassword}</h4>
					<c:if test = "${ErrorPasswordsAreNotEqual == true}">
						<div class="alert alert-danger mt-3 mb-3" role="alert">${Passwordarenotequal}</div>
					</c:if>
					<c:if test = "${PasswordChanged == true}">
						<div class="alert alert-success mt-3 mb-3" role="alert">${Passwordchanged}</div>
					</c:if>
					<c:if test = "${ErrorPasswordChange == true}">
						<div class="alert alert-danger mt-3 mb-3" role="alert">${Passwordisnotchanged}</div>
					</c:if>
					<div class="form-group">
						<label for="inputNewPassword" class="required">${Newpassword}</label>
						<input name="newpassword" type="password" class="form-control w-25" id="inputNewPassword" aria-describedby="inputNewPasswordHelp" value="${branch.GetName()}" required>
						<small id="inputNewPasswordHelp" class="form-text text-muted">${Inputnewpassword}</small>
					</div>
					<div class="form-group">
						<label for="inputNewPasswordConfirm" class="required">${Confirmnewpassword}</label>
						<input name="newpasswordconfirm" type="password" class="form-control w-25" id="inputNewPasswordConfirm" aria-describedby="inputNewPasswordConfirmHelp" value="${branch.GetName()}" required>
						<small id="inputNewPasswordConfirmHelp" class="form-text text-muted">${Inputnewpasswordagain}</small>
					</div>
					<button name="button_changepassword" type="submit" class="btn btn-primary">${Change}</button>
				</form>
			</div>
		</div>
	</body>
</html>