<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="org.PrinterSetupSystem.misc.AuthorizeUtil" %>
<%
	AuthorizeUtil.UserLoadedJspRedirect(request, response, "Branch.jsp", "/branch");
 %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="context" value="${pageContext.request.contextPath}" />
<c:set var="ErrorPrinterNotFound" value='${requestScope["ErrorPrinterNotFound"]}'/>
<c:set var="ActiveElement" value='Home'/>
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
		<script src="js/printersetupsystem.js"></script>
		<title>Printer Setup System - Branch Printers</title>
	</head>
	<body class="container-fluid" style="min-width: ${MinWidth};">
		<%@include file="Navbar.jsp"%>
		<c:choose>
			<c:when test = "${ErrorPrinterNotFound == true}">
				<div class="alert alert-danger ml-4 mr-4 mt-2 mb-4" role="alert">${Printernotfound}</div>
			</c:when>
		</c:choose>
		<c:choose>
			<c:when test = "${ErrorPrinterNotNumber == true}">
				<div class="alert alert-danger ml-4 mr-4 mt-2 mb-4" role="alert">${EmptyprinterIDPleaseenteravalidprinterid}</div>
			</c:when>
		</c:choose>
		<c:choose>
			<c:when test = "${ErrorBranchNotNumber == true}">
				<div class="alert alert-danger ml-4 mr-4 mt-2 mb-4" role="alert">${Branchnumbermustbeentered}</div>
			</c:when>
		</c:choose>
		<nav aria-label="breadcrumb">
			<ol class="breadcrumb ml-4 mr-4 mt-3">
				<li class="breadcrumb-item"><a href="${context}/home">${Home}</a></li>
				<li class="breadcrumb-item active" aria-current="page">${branch.GetName()}</li>
			</ol>
		</nav>
		<div class="card ml-4 mr-4 mt-2 mb-4">
			<div class="card-header">
				<div class="d-flex align-items-center">
					<span class="align-middle" id="PSSBranchID" data-info="${branch.GetId()}">${BranchPrinters}</span>
					<div class="border-left vertical-separator ml-4 mr-4"></div>
					<span class="align-middle pr-2">${Search}:</span>
					<div class="d-flex align-middle">
						<input id="PSSPrinterName" type="text" class="form-control" placeholder="${Printername}" required="required">
						<div class="btn-group pl-2" role="group">
							<button type="button" class="btn btn-outline-primary" onclick="SearchBranchPrinter('PSSBranchID', 'PSSPrinterName', 'PSSResult')">${Search}</button>
							<button type="button" class="btn btn-outline-primary" onclick="ResetBranchPrinter('PSSBranchID', 'PSSResult')">${Reset}</button>
						</div>
					</div>
				</div>
			</div>
			<div class="card-body p-0">
				<div id="PSSResult" class="row m-3">
					<c:choose>
						<c:when test = "${printers.size() > 0}">
							<c:forEach begin="0" items="${printers}" var="printer">
								<div class="col mb-4">
									<div class="card position-relative" style="width: 200px;">
										<c:choose>
											<c:when test = "${printer.GetImage() == \"img/no-image.png\"}">
												<img src="img/no-image.png" class="card-img-top" style="height: 200px;" alt="Printer Image">
											</c:when>
											<c:when test = "${printer.GetImage() == \"\"}">
												<img src="img/no-image.png" class="card-img-top" style="height: 200px;" alt="Printer Image">
											</c:when>
											<c:otherwise>
												<img src="data:image/jpg;base64,${printer.GetImage()}" class="card-img-top" style="height: 200px;" alt="Printer Image">
											</c:otherwise>
										</c:choose>
										<div class="card-body">
											<h5 class="card-title">${printer.GetName()}</h5>
											<p class="card-text">${printer.GetDescription()}</p>
											<a href="${context}/printer?id=${printer.GetId()}" class="stretched-link"></a>
										</div>
									</div>
								</div>
							</c:forEach>
						</c:when>
						<c:otherwise>
							<div class="col mb-4">
								<div class="card position-relative">
									<div class="card-body">
										<h5 class="card-title">(${Empty})</h5>
									</div>
								</div>
							</div>
						</c:otherwise>
					</c:choose>
				</div>
			</div>
		</div>
	</body>
</html>