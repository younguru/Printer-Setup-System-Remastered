<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="org.PrinterSetupSystem.misc.AuthorizeUtil" %>
<%
	AuthorizeUtil.UserLoadedJspRedirect(request, response, "AdminBranchesEdit.jsp", "/adminbranchesedit");
	AuthorizeUtil.AuthorizedRedirect(request, response);
 %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="context" value="${pageContext.request.contextPath}" />
<c:set var="ErrorEditBranchSave" value='${requestScope["ErrorEditBranchSave"]}'/>
<c:set var="BranchSaved" value='${requestScope["BranchSaved"]}'/>
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
		<title>PrintDesk - Admin Edit Branch</title>
	</head>
	<body>
	<%@include file="Header.jsp"%>
		<div class="row ml-4 mr-4 mt-3 mb-4">
			<div class="col-3 p-4 border-right">
				<p class="mb-2"><em>${Home}</em></p>
				<p class="mb-1"><img class="size-16" src="img/admin/home.png" alt="Home page"/><a class="ml-2 text-body" href="${context}/adminhome">${Homepage}</a></p>
				<p class="mb-2 pt-3"><em>${Details}</em></p>
				<p class="mb-1"><img class="size-16" src="img/admin/printers.png" alt="Printers"/><a class="ml-2 text-body" href="${context}/adminprinters">${Printers}</a></p>
				<p class="mb-1"><img class="size-16" src="img/admin/branches.png" alt="Branches"/><a class="ml-2 text-body font-weight-bold" href="${context}/adminbranches"><u>${Branches}</u> -><img class="size-16" src="img/admin/edit.png" alt="Branch Edit"/><a class="ml-2 text-body font-weight-bold" href="${context}/adminbranchesedit?branchid=${branch.GetId()}"><u>${Edit}</u></a></a></p>
				<p><img class="size-16" src="img/admin/administrators.png" alt="Administrators"/><a class="ml-2 text-body" href="${context}/adminadmins">${Administrators}</a></p>
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
					<h1 class="display-5 mr-4 mt-2 mb-4">${EditBranch}</h1>
				</div>
				<c:if test = "${ErrorEditBranchSave == true}">
					<div class="alert alert-danger mt-3 mb-3" role="alert">${Branchsaveerror}</div>
				</c:if>
				<c:if test = "${BranchSaved == true}">
					<div class="alert alert-success mt-3 mb-3" role="alert">${Branchsaved}</div>
				</c:if>
				<form class="mt-2" method="post" action="adminbranchesedit" enctype="multipart/form-data">
					<div class="form-group">
						<label for="inputBranchName" class="required">${Name}</label>
						<input name="editbranchname" type="text" class="form-control" id="inputBranchName" aria-describedby="branchNameHelp" value="${branch.GetName()}" required>
						<small id="branchNameHelp" class="form-text text-muted">${Inputfullnameofthebranch}</small>
					</div>
					<div class="form-group">
						<label for="inputBranchDescription">${Description}</label>
						<textarea name="editbranchdescription" class="form-control" id="inputBranchDescription" aria-describedby="branchDescriptionHelp" rows="4">${branch.GetDescription()}</textarea>
						<small id="branchDescriptionHelp" class="form-text text-muted">${Inputdescriptionofthebranch}</small>
					</div>
					<div class="form-group">
				  		<label for="inputBranchImage">${Image}</label>
				  		<input name="editbranchimage" type="file" class="form-control-file" id="inputBranchImage">
					</div>
					<c:choose>
						<c:when test = "${branch.GetImage() == \"img/no-image.png\"}">
							<img class="rounded size-64 mb-1" src="img/no-image.png" alt="Branch Image">
						</c:when>
						<c:when test = "${branch.GetImage() == \"\"}">
							<img class="rounded size-64 mb-1" src="img/no-image.png" alt="Branch Image">
						</c:when>
						<c:otherwise>
							<img class="rounded size-64 mb-1" src="data:image/jpg;base64,${branch.GetImage()}" alt="Branch Image">
						</c:otherwise>
					</c:choose>
					<div class="form-group">
						<label for="inputBranchImageNull">${Deleteimage}</label>
						<input name="editbranchimagenull" type="checkbox" class="form-check-input ml-2" id="inputBranchImageNull">
					</div>
					<div class="form-group hidden">
				  		<input name="editbranchid" type="text" class="form-control hidden" value="${branch.GetId()}">
					</div>
					<br>
					<button type="submit" name="button_savebranch" class="btn btn-primary btn-lg">${Save}</button>
				</form>
			</div>
		</div>
	</body>
</html>