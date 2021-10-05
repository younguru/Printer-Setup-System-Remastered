<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="org.PrinterSetupSystem.misc.AuthorizeUtil" %>
<%
	AuthorizeUtil.UserLoadedJspRedirect(request, response, "Search.jsp", "/search");
 %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="context" value="${pageContext.request.contextPath}" />
<c:set var="ActiveElement" value='Search'/>
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
		<title>Printer Setup System - Search</title>
	</head>
	<body class="container-fluid" style="min-width: ${MinWidth};">
		<%@include file="Navbar.jsp"%>
		<div class="card ml-4 mr-4 mt-2 mb-4">
			<div class="card-header">
				<div class="d-flex align-items-center">
					<span class="align-middle">${Search}</span>
				</div>
			</div>
			<div class="card-body">
				<div class="btn-group btn-group-toggle" data-toggle="buttons">
					<label class="btn btn-outline-primary active">
						<input type="radio" name="options" id="PSSPrintersRadio" onclick="SearchShowPrinters()" checked> ${Printers}
					</label>
					<label class="btn btn-outline-primary">
						<input type="radio" name="options" id="PSSBranchesRadio" onclick="SearchShowBranches()"> ${Branches}
					</label>
				</div>
				<br><br>
				<div id="PSSPrintersContent">
					<span class="align-middle mb-2">${Search}:</span>
					<br>
					<div class="d-flex align-middle">
						<input id="PSSPrinterName" type="text" class="form-control w-50" placeholder="${Printername}" required="required">
						<button type="button" class="btn btn-outline-primary ml-2" onclick="SearchPrinter('PSSPrinterName', 'PSSResultPrinter')">${Search}</button>
					</div>
					<br>
					<div id="PSSResultPrinter" class="row row-cols-2 row-cols-md-3 m-3 mt-3">
						
					</div>
				</div>
				<div id="PSSBranchesContent" class="hidden">
					<span class="align-middle mb-2">${Search}:</span>
					<br>
					<div class="d-flex align-middle">
						<input id="PSSBranchName" type="text" class="form-control w-50" placeholder="${Branchname}" required="required">
						<button type="button" class="btn btn-outline-primary ml-2" onclick="BranchSearch('PSSBranchName', 'PSSResultBranch')">${Search}</button>
					</div>
					<br>
					<div id="PSSResultBranch" class="row row-cols-2 row-cols-md-3 m-3 mt-3">
						
					</div>
				</div>
			</div>
		</div>
	</body>
</html>