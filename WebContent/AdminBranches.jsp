<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="org.PrinterSetupSystem.misc.AuthorizeUtil" %>
<%
	AuthorizeUtil.UserLoadedJspRedirect(request, response, "AdminBranches.jsp", "/adminbranches");
	AuthorizeUtil.AuthorizedRedirect(request, response);
 %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="context" value="${pageContext.request.contextPath}" />
<c:set var="ErrorBranchIDNotNumber" value='${requestScope["ErrorBranchIDNotNumber"]}'/>
<c:set var="ErrorMainBranchCanNotBeDeleted" value='${requestScope["ErrorMainBranchCanNotBeDeleted"]}'/>
<c:set var="ErrorMainBranchCanNotEdited" value='${requestScope["ErrorMainBranchCanNotEdited"]}'/>
<c:set var="BranchDeleted" value='${requestScope["BranchDeleted"]}'/>
<c:set var="ErrorBranchDelete" value='${requestScope["ErrorBranchDelete"]}'/>
<c:set var="NewBranchCreateSuccess" value='${requestScope["NewBranchCreateSuccess"]}'/>
<c:set var="ErrorNewBranchCreate" value='${requestScope["ErrorNewBranchCreate"]}'/>
<c:set var="ErrorBranchNotFound" value='${requestScope["ErrorBranchNotFound"]}'/>
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
		<!-- Optional JavaScript -->
		<!-- jQuery first, then Popper.js, then Bootstrap JS -->
		<script src="js/jquery-3.2.1.min.js"></script>
		<script src="js/popper.min.js"></script>
		<script src="js/bootstrap.min.js"></script>
		<title>PrintDesk - Admin Branches configuration Page</title>
	</head>
	<body class="container-fluid" style="min-width: ${MinWidth};">
		<%@include file="Navbar.jsp"%>
		<div class="row ml-4 mr-4 mt-3 mb-4">
			<div class="col-3 text-truncate p-4 border-right">
				<p class="mb-2"><em>${Home}</em></p>
				<p class="mb-1"><img class="size-16" src="img/admin/home.png" alt="Home page"/><a class="ml-2 text-body" href="${context}/adminhome">${Homepage}</a></p>
				<p class="mb-2 pt-3"><em>${Details}</em></p>
				<p class="mb-1"><img class="size-16" src="img/admin/printers.png" alt="Printers"/><a class="ml-2 text-body" href="${context}/adminprinters">${Printers}</a></p>
				<p class="mb-1"><img class="size-16" src="img/admin/branches.png" alt="Branches"/><a class="ml-2 text-body font-weight-bold" href="${context}/adminbranches"><u>${Branches}</u></a></p>
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
					<img class="size-64 mr-2" src="img/admin/branches.png" alt="Branches"/>
					<h1 class="display-5 mr-4 mt-2 mb-4">${Branches}</h1>
				</div>
				<div class="d-flex align-items-center mb-3 bg-light">
					<a class="btn btn-outline-primary m-2" data-toggle="collapse" href="#collapseBranchAdd" role="button" aria-expanded="false" aria-controls="collapseBranchAdd">${Add}</a>
				</div>
				<div class="collapse mb-4" id="collapseBranchAdd">
					<div class="card card-body bg-light">
					    <form method="post" action="adminbranches" enctype="multipart/form-data">
							<div class="form-group">
								<label for="inputBranchName" class="required">${Name}</label>
								<input name="newbranchname" type="text" class="form-control" id="inputBranchName" aria-describedby="branchNameHelp" required>
								<small id="branchNameHelp" class="form-text text-muted">${Inputfullnameofthebranch}</small>
							</div>
							<div class="form-group">
								<label for="inputBranchDescription" class="required">${Description}</label>
								<input name="newbranchdescription" type="text" class="form-control" id="inputBranchDescription" aria-describedby="branchDescriptionHelp" required>
								<small id="branchDescriptionHelp" class="form-text text-muted">${Inputdescriptionofthebranch}</small>
							</div>
							<div class="form-group">
						  		<label for="inputBranchImage" class="required">${Image}</label>
						  		<input name="newbranchimage" type="file" class="form-control-file" id="inputBranchImage">
							</div>
							<button type="submit" name="button_createbranch" class="btn btn-primary">${Create}</button>
						</form>
					</div>
				</div>
				<c:if test = "${ErrorBranchIDNotNumber == true}">
					<div class="alert alert-danger mt-3 mb-3" role="alert">${BranchIDmustbenumber}</div>
				</c:if>
				<c:if test = "${ErrorMainBranchCanNotBeDeleted == true}">
					<div class="alert alert-danger mt-3 mb-3" role="alert">${YoucannotdeleteNonetypebranch}</div>
				</c:if>
				<c:if test = "${BranchDeleted == true}">
					<div class="alert alert-success mt-3 mb-3" role="alert">${Branchdeleted}</div>
				</c:if>
				<c:if test = "${ErrorBranchDelete == true}">
					<div class="alert alert-danger mt-3 mb-3" role="alert">${Branchdeletionerror}</div>
				</c:if>
				<c:if test = "${NewBranchCreateSuccess == true}">
					<div class="alert alert-success mt-3 mb-3" role="alert">${Branchcreated}</div>
				</c:if>
				<c:if test = "${ErrorNewBranchCreate == true}">
					<div class="alert alert-danger mt-3 mb-3" role="alert">${Branchcreationerror}</div>
				</c:if>
				<c:if test = "${ErrorBranchNotFound == true}">
					<div class="alert alert-danger mt-3 mb-3" role="alert">${Branchnotfound}</div>
				</c:if>
				<c:if test = "${ErrorMainBranchCanNotEdited == true}">
					<div class="alert alert-danger mt-3 mb-3" role="alert">${YoucannoteditNonetypebranch}</div>
				</c:if>
				<table class="table">
					<thead>
						<tr class="d-flex">
							<th class="col-1"></th>
							<th class="col-1"></th>
							<th class="col-5">${Name}</th>
							<th class="col-5">${Description}</th>
						</tr>
					</thead>
					<tbody>
						<c:choose>
							<c:when test = "${branches.size() > 0}">
								<c:forEach begin="0" items="${branches}" var="branch">
									<c:if test = "${branch.GetId() != 1}">
										<tr class="d-flex">
											<td class="col-1" scope="row">
												<form method="post" action="adminbranches">
													<button type="submit" name="button_deletebranch" class="btn btn-link m-0 p-0" title="Delete branch"><span class="oi oi-x"></span></button>
													<input class="hidden" name="deletebranchid" value="${branch.GetId()}">
												</form>
											</td>
											<td class="col-1">
												<a href="${context}/adminbranchesedit?branchid=${branch.GetId()}">
													<button class="btn btn-link m-0 p-0" title="Edit branch"><span class="oi oi-wrench"></span></button>
												</a>
											</td>
											<td class="col-5">${branch.GetName()}</td>
											<td class="col-5 table-overflow">${branch.GetDescription()}</td>
										</tr>
									</c:if>
								</c:forEach>
							</c:when>
							<c:otherwise>
								<tr class="d-flex">
									<td class="col-1" scope="row"></td>
									<td class="col-1"></td>
									<td class="col-5">(${Empty})</td>
									<td class="col-5"></td>
								</tr>
							</c:otherwise>
						</c:choose>
					</tbody>
				</table>
			</div>
		</div>
	</body>
</html>