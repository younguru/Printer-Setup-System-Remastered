<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="org.PrinterSetupSystem.misc.AuthorizeUtil" %>
<%
	AuthorizeUtil.UserLoadedJspRedirect(request, response, "Printer.jsp", "/printer");
 %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="context" value="${pageContext.request.contextPath}" />
<c:set var="ErrorPrinterNotFound" value='${requestScope["ErrorPrinterNotFound"]}'/>
<c:set var="ActiveElement" value='Home'/>
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
		<script src="js/printersetupsystem.js"></script>
		<script src="js/printer.js"></script>
		<title>Printer Setup System - Branch Printer</title>
	</head>
	<body class="container-fluid" style="min-width: ${MinWidth};">
		<%@include file="Navbar.jsp"%>
		<nav aria-label="breadcrumb">
			<ol class="breadcrumb ml-4 mr-4 mt-3">
				<li class="breadcrumb-item"><a href="${context}/home">${Home}</a></li>
				<li class="breadcrumb-item"><a href="${context}/branch?id=${printer.GetBranchId()}">${printer.GetBranchName()}</a></li>
				<li class="breadcrumb-item active" aria-current="page">${printer.GetName()}</li>
			</ol>
		</nav>
		<div class="card ml-4 mr-4 mt-2 mb-4">
			<div class="card-header">
				<div class="align-items-center">
					<span class="align-middle" id="PSSPrinterId" data-info="${printer.GetId()}">${Printer}</span>
					<c:if test = "${isAdminEntered == true}">
						<div class="d-inline align-middle float-right ml-2">
							<a href="${context}/adminprintersedit?printerid=${printer.GetId()}"><button type="button" class="btn btn-primary btn-sm"><span class="oi oi-pencil"></span></button></a>
						</div>
					</c:if>
					<div class="d-inline p-1 bg-dark text-white align-middle float-right rounded"><span class="oi oi-eye"></span> ${printer.GetViews()}</div>
				</div>
			</div>
			<div class="card-body p-0">
				<div class="row m-3">
				    <div class="col">
				    	<c:choose>
							<c:when test = "${printer.GetImage() == \"img/no-image.png\"}">
								<img class="img-fluid width-100" src="img/no-image.png" alt="Printer Image">
							</c:when>
							<c:when test = "${printer.GetImage() == \"\"}">
								<img class="img-fluid width-100" src="img/no-image.png" alt="Printer Image">
							</c:when>
							<c:otherwise>
								<img class="img-fluid width-100" src="data:image/jpg;base64,${printer.GetImage()}" alt="Printer Image">
							</c:otherwise>
						</c:choose>
				    </div>
				    <div class="col">
						<h3>${printer.GetName()} <span class="badge badge-secondary">${printertype.GetType()}</span><span id="PSSOnlineBadge" class="badge badge-success hidden ml-2">${Online}</span></h3>
						<h6 class="pt-3">${PrinterDescription}</h6>
						<p class="pt-2"><em>${printer.GetDescription()}</em></p>
						<h6 class="pt-3">${PrinterDetails}</h6>
						<table class="table">
							<tbody>
								<tr>
									<td>${Location}</td>
									<td><em>${printer.GetLocation()}</em></td>
								</tr>
								<tr>
									<td>${IP}</td>
									<td><em><a href="http://${printer.GetIp()}" target="_blank">${printer.GetIp()}</a></em></td>
								</tr>
								<tr>
									<td>${Vendor}</td>
									<td>${vendorlogo}<em>${printer.GetVendor()}</em></td>
								</tr>
								<tr>
									<td>${Createddate}</td>
									<td><em>${printer.GetCreatedDate()}</em></td>
								</tr>
								<tr>
									<td>${Serversharename}</td>
									<td><em><a href="file:${printer.GetServerShareNameLink()}" target="_blank">${printer.GetServerShareName()}</a></em></td>
								</tr>
								<tr>
									<td>${Sendprinterlinkbyemail}</td>
									<td><em><a href="mailto:${printeremaillink}">${Sendemail}</a></em></td>
								</tr>
							</tbody>
						</table>
						<h6 class="pt-3 pb-2">${PrinterInstallation}</h6>
						<a class="btn btn-primary" href="${context}/download?printerid=${printer.GetId()}" target="_blank">${Install}</a>
				    </div>
				</div>
			</div>
		</div>
	</body>
</html>