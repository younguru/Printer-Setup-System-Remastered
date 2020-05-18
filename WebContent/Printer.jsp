<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="org.PrinterSetupSystem.misc.AuthorizeUtil" %>
<%
	AuthorizeUtil.UserLoadedJspRedirect(request, response, "Printer.jsp", "/printer");
 %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="context" value="${pageContext.request.contextPath}" />
<c:set var="ErrorPrinterNotFound" value='${requestScope["ErrorPrinterNotFound"]}'/>
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
		<title>Printer Setup System - Branch Printer</title>
	</head>
	<body>
		<nav class="navbar navbar-expand navbar-light bg-light">
			<a class="navbar-brand ml-4" href="${context}/home"><img src="img/logo.png" alt="Logo" class="printersetupsystem-logo"> RequestDesk</a>
			<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarNav">
				<ul class="navbar-nav">
					<li class="nav-item active">
						<a class="nav-link" href="${context}/home">Home<span class="sr-only">(current)</span></a>
					</li>
					<c:choose>
						<c:when test = "${isAdminEntered == true}">
							<li class="nav-item">
								<a class="nav-link" href="${context}/adminhome">Admin</a>
							</li>
						</c:when>
					</c:choose>
				</ul>
			</div>
			<c:choose>
				<c:when test = "${isAdminEntered == true}">
					<ul class="navbar-nav ">
				    	<li class="nav-item dropdown">
				        	<a href="#" class="nav-link dropdown-toggle" id="navDropDownLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><%=session.getAttribute("fullname")%> </a>
				            <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navDropDownLink">
				                <a class="dropdown-item" href="${context}/usersettings">Preferences</a>
				                <div class="dropdown-divider"></div>
				             	<a class="dropdown-item" href="Logout.jsp">Logout</a>
				       		</div>
				    	</li>
				    </ul>
				</c:when>
			</c:choose>
		</nav>
		<nav aria-label="breadcrumb">
			<ol class="breadcrumb ml-4 mr-4">
				<li class="breadcrumb-item"><a href="${context}/home">Home</a></li>
				<li class="breadcrumb-item"><a href="${context}/branch?id=${printerbranch.GetId()}">${printerbranch.GetName()}</a></li>
				<li class="breadcrumb-item active" aria-current="page">${printer.GetName()}</li>
			</ol>
		</nav>
		<div class="card ml-4 mr-4 mt-2 mb-4">
			<div class="card-header">
				<div class="d-flex align-items-center">
					<span class="align-middle">Printer</span>
				</div>
			</div>
			<div class="card-body p-0">
				<div class="row m-3">
				    <div class="col">
						<img class="img-fluid" src="${printer.GetImage()}" alt="Printer Image">
				    </div>
				    <div class="col">
						<h3>${printer.GetName()} <span class="badge badge-secondary">${printertype.GetType()}</span></h3>
						<h6 class="pt-3">Printer Description</h6>
						<p class="pt-2"><em>${printer.GetDescription()}</em></p>
						<h6 class="pt-3">Printer Details</h6>
						<table class="table">
							<tbody>
								<tr>
									<td>IP</td>
									<td><em><a href="http://${printer.GetIp()}" target="_blank">${printer.GetIp()}</a></em></td>
								</tr>
								<tr>
									<td>Vendor</td>
									<td><em>${printer.GetVendor()}</em></td>
								</tr>
								<tr>
									<td>Created date</td>
									<td><em>${printer.GetCreatedDate()}</em></td>
								</tr>
							</tbody>
						</table>
						<h6 class="pt-3 pb-2">Printer Installation</h6>
						<a class="btn btn-primary" href="">Install</a>
				    </div>
				</div>
			</div>
		</div>
	</body>
</html>