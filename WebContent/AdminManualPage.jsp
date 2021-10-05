<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="org.PrinterSetupSystem.misc.AuthorizeUtil" %>
<%
	AuthorizeUtil.UserLoadedJspRedirect(request, response, "AdminManualPage.jsp", "/adminmanualpage");
	AuthorizeUtil.AuthorizedRedirect(request, response);
 %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="context" value="${pageContext.request.contextPath}" />
<c:set var="ManualPageSaved" value='${requestScope["ManualPageSaved"]}'/>
<c:set var="ManualPageSaveError" value='${requestScope["ManualPageSaveError"]}'/>
<c:set var="ActiveElement" value='Adminhome'/>
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
		<link rel="stylesheet" href="css/summernote-bs4.min.css">
		<!-- Optional JavaScript -->
		<!-- jQuery first, then Popper.js, then Bootstrap JS -->
		<script src="js/jquery-3.2.1.min.js"></script>
		<script src="js/popper.min.js"></script>
		<script src="js/bootstrap.min.js"></script>
		<script src="js/summernote-bs4.min.js"></script>
		<script src="js/manualpage.js"></script>
		<title>PrintDesk - Admin Manual Page</title>
	</head>
	<body class="container-fluid" style="min-width: ${MinWidth};">
		<%@include file="Navbar.jsp"%>
		<div class="row ml-4 mr-4 mt-3 mb-4">
			<div class="col-3 text-truncate p-4 border-right">
				<p class="mb-2"><em>${Home}</em></p>
				<p class="mb-1"><img class="size-16" src="img/admin/home.png" alt="Home page"/><a class="ml-2 text-body" href="${context}/adminhome">${Homepage}</a></p>
				<p class="mb-2 pt-3"><em>${Details}</em></p>
				<p class="mb-1"><img class="size-16" src="img/admin/printers.png" alt="Printers"/><a class="ml-2 text-body" href="${context}/adminprinters">${Printers}</a></p>
				<p class="mb-1"><img class="size-16" src="img/admin/branches.png" alt="Branches"/><a class="ml-2 text-body" href="${context}/adminbranches">${Branches}</a></p>
				<p><img class="size-16" src="img/admin/administrators.png" alt="Administrators"/><a class="ml-2 text-body" href="${context}/adminadmins">${Administrators}</a></p>
				<p class="mb-1 pt-3"><em>${Types}</em></p>
				<p><img class="size-16" src="img/admin/printertypes.png" alt="Printer types"/><a class="ml-2 text-body" href="${context}/adminprintertypes">${Printertypes}</a></p>
				<p class="mb-1 pt-3"><em>${System}</em></p>
				<p class="mb-1"><img class="size-16" src="img/admin/help.png" alt="Manual page settings"/><a class="ml-2 text-body font-weight-bold" href="${context}/adminmanualpage"><u>${Manualpage}</u></a></p>
				<p class="mb-1"><img class="size-16" src="img/admin/installscript.png" alt="Install Script page settings"/><a class="ml-2 text-body" href="${context}/admininstallscript">${Installscript}</a></p>
				<p><img class="size-16" src="img/admin/other.png" alt="Other settings"/><a class="ml-2 text-body" href="${context}/adminother">${Othersettings}</a></p>
			</div>
			<div class="col-9 pl-4">
				<div class="d-flex align-items-center mb-3 border-bottom">
					<img class="size-64 mr-2" src="img/admin/help.png" alt="Manual page settings"/>
					<h1 class="display-5 mr-4 mt-2 mb-4">${Manualpage}</h1>
				</div>
				<c:if test = "${ManualPageSaved == true}">
					<div class="alert alert-success mt-3" role="alert">${Manualsaved}</div>
				</c:if>
				<c:if test = "${ManualPageSaveError == true}">
					<div class="alert alert-danger mt-3" role="alert">${ManualnotsavedError}</div>
				</c:if>
				<p><em>${MakechangestoManualpageandpressSavebutton}</em></p>
				<div class="mb-3">
					<form method="post" action="adminmanualpage">
						<textarea name="adminmanual" id="adminmanualInput" rows="15" autocomplete="off" autocorrect="off" autocapitalize="off" spellcheck="false">${helpmanual}</textarea>
						<button name="savemanual_button" type="submit" class="btn btn-outline-primary mt-3">${Save}</button>
					</form>
				</div>
			</div>
		</div>
	</body>
</html>