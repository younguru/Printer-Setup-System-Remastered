<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="org.PrinterSetupSystem.misc.AuthorizeUtil" %>
<%
	AuthorizeUtil.UserLoadedJspRedirect(request, response, "Help.jsp", "/help");
 %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="context" value="${pageContext.request.contextPath}" />
<c:set var="ActiveElement" value='Help'/>
<%@include file="Common.jsp" %>
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
		<title>Printer Setup System - Help</title>
	</head>
	<body class="container-fluid" style="min-width: ${MinWidth};">
		<%@include file="Navbar.jsp"%>
		<div class="card ml-4 mr-4 mt-2 mb-4">
			<div class="card-header">
				<div class="align-items-center">
					<span class="align-middle">${Help}</span>
					<c:if test = "${isAdminEntered == true}">
						<div class="d-inline align-middle float-right">
							<a href="${context}/adminmanualpage"><button type="button" class="btn btn-primary btn-sm"><span class="oi oi-pencil"></span></button></a>
						</div>
					</c:if>
				</div>
			</div>
			<div class="card-body">
				<p>${helpmanual}</p>
			</div>
		</div>
	</body>
</html>