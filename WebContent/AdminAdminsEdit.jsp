<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="org.PrinterSetupSystem.misc.AuthorizeUtil" %>
<%
	AuthorizeUtil.UserLoadedJspRedirect(request, response, "AdminAdminsEdit.jsp", "/adminadminsedit");
	AuthorizeUtil.AuthorizedRedirect(request, response);
 %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="context" value="${pageContext.request.contextPath}" />
<c:set var="ErrorEditAdminSave" value='${requestScope["ErrorEditAdminSave"]}'/>
<c:set var="AdminSaved" value='${requestScope["AdminSaved"]}'/>
<%@include file="Translater.jsp"%>
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
		<title>PrintDesk - Admin Edit Administrator</title>
	</head>
	<body>
	<%@include file="Header.jsp"%>
		<div class="row ml-4 mr-4 mt-3 mb-4">
			<div class="col-3 p-4 border-right">
				<p class="mb-2"><em>${Home}</em></p>
				<p class="mb-1"><img class="size-16" src="img/admin/home.png" alt="Home page"/><a class="ml-2 text-body" href="${context}/adminhome">${Homepage}</a></p>
				<p class="mb-2 pt-3"><em>${Details}</em></p>
				<p class="mb-1"><img class="size-16" src="img/admin/printers.png" alt="Printers"/><a class="ml-2 text-body" href="${context}/adminprinters">${Printers}</a></p>
				<p class="mb-1"><img class="size-16" src="img/admin/branches.png" alt="Branches"/><a class="ml-2 text-body" href="${context}/adminbranches">${Branches}</a></p>
				<p><img class="size-16" src="img/admin/administrators.png" alt="Administrators"/><a class="ml-2 text-body font-weight-bold" href="${context}/adminadmins"><u>${Administrators}</u></a> -><img class="size-16" src="img/admin/edit.png" alt="Admin Edit"/><a class="ml-2 text-body font-weight-bold" href="${context}/adminadminsedit?adminid=${admin.GetId()}"><u>${Edit}</u></a></p>
				<p class="mb-1 pt-3"><em>${Types}</em></p>
				<p><img class="size-16" src="img/admin/printertypes.png" alt="Printer types"/><a class="ml-2 text-body" href="${context}/adminprintertypes">${Printertypes}</a></p>
				<p class="mb-1 pt-3"><em>${System}</em></p>
				<p class="mb-1"><img class="size-16" src="img/admin/help.png" alt="Manual page settings"/><a class="ml-2 text-body" href="${context}/adminmanualpage">${Manualpage}</a></p>
				<p class="mb-1"><img class="size-16" src="img/admin/installscript.png" alt="Install Script page settings"/><a class="ml-2 text-body" href="${context}/admininstallscript">${Installscript}</a></p>
				<p><img class="size-16" src="img/admin/other.png" alt="Other settings"/><a class="ml-2 text-body" href="${context}/adminother">${Othersettings}</a></p>
			</div>
			<div class="col-9 pl-4">
				<div class="d-flex align-items-center border-bottom">
					<img class="size-64 mr-2" src="img/admin/edit.png" alt="Edit branch"/>
					<h1 class="display-5 mr-4 mt-2 mb-4">${EditAdmin}</h1>
				</div>
				<c:if test = "${ErrorEditAdminSave == true}">
					<div class="alert alert-danger mt-3 mb-3" role="alert">${Administratorsaveerror}</div>
				</c:if>
				<c:if test = "${AdminSaved == true}">
					<div class="alert alert-success mt-3 mb-3" role="alert">${Administratorsaved}</div>
				</c:if>
				<form class="mt-2" method="post" action="adminadminsedit">
					<div class="form-group">
						<label for="inputAdminPassword" class="required">${NewPassword}</label>
						<input name="editadminpassword" type="text" class="form-control" id="inputAdminPassword" aria-describedby="inputAdminPasswordHelp" required>
						<small id="inputAdminPasswordHelp" class="form-text text-muted">${Inputnewpasswordofadministrator}</small>
					</div>
					<div class="form-group hidden">
				  		<input name="editadminid" type="text" class="form-control hidden" value="${adminid}">
					</div>
					<br>
					<button type="submit" name="button_saveadmin" class="btn btn-primary btn-lg">${Save}</button>
				</form>
			</div>
		</div>
	</body>
</html>