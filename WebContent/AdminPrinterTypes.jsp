<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="org.PrinterSetupSystem.misc.AuthorizeUtil" %>
<%
	AuthorizeUtil.UserLoadedJspRedirect(request, response, "AdminPrinterTypes.jsp", "/adminprintertypes");
	AuthorizeUtil.AuthorizedRedirect(request, response);
 %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="context" value="${pageContext.request.contextPath}" />
<c:set var="ErrorTypeIDNotNumber" value='${requestScope["ErrorTypeIDNotNumber"]}'/>
<c:set var="ErrorNoneTypeNotBeDeleted" value='${requestScope["ErrorNoneTypeNotBeDeleted"]}'/>
<c:set var="PrinterTypeDeleted" value='${requestScope["PrinterTypeDeleted"]}'/>
<c:set var="ErrorPrinterTypeDelete" value='${requestScope["ErrorPrinterTypeDelete"]}'/>
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
		<title>PrintDesk - Admin Printer Types</title>
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
				<p><img class="size-16" src="img/admin/printertypes.png" alt="Printer types"/><a class="ml-2 text-body font-weight-bold" href="${context}/adminprintertypes"><u>${Printertypes}</u></a></p>
				<p class="mb-1 pt-3"><em>${System}</em></p>
				<p class="mb-1"><img class="size-16" src="img/admin/help.png" alt="Manual page settings"/><a class="ml-2 text-body" href="${context}/adminmanualpage">${Manualpage}</a></p>
				<p class="mb-1"><img class="size-16" src="img/admin/installscript.png" alt="Install Script page settings"/><a class="ml-2 text-body" href="${context}/admininstallscript">${Installscript}</a></p>
				<p><img class="size-16" src="img/admin/other.png" alt="Other settings"/><a class="ml-2 text-body" href="${context}/adminother">${Othersettings}</a></p>
			</div>
			<div class="col-9 pl-4">
				<div class="d-flex align-items-center border-bottom">
					<img class="size-64 mr-2" src="img/admin/printertypes.png" alt="Printer types"/>
					<h1 class="display-5 mr-4 mt-2 mb-4">${Printertypes}</h1>
				</div>
				<div class="d-flex align-items-center mb-3 bg-light">
					<a class="btn btn-outline-primary m-2" data-toggle="collapse" href="#collapseAdminAdd" role="button" aria-expanded="false" aria-controls="collapseAdminAdd">${Add}</a>
				</div>
				<div class="collapse mb-4" id="collapseAdminAdd">
					<div class="card card-body bg-light">
					    <form method="post" action="adminprintertypes">
							<div class="form-group">
								<label for="inputPrinterTypeName" class="required">${Printertype}</label>
								<input name="newprintertype" type="text" class="form-control" id="inputPrinterTypeName" aria-describedby="printerTypeNameHelp" required>
								<small id="printerTypeNameHelp" class="form-text text-muted">${Enterprintertypehere}</small>
							</div>
							<button type="submit" name="button_createprintertype" class="btn btn-primary">${Create}</button>
						</form>
					</div>
				</div>
				<c:if test = "${ErrorTypeIDNotNumber == true}">
					<div class="alert alert-danger mt-3 mb-3" role="alert">${PrintertypeIDmustbenumber}</div>
				</c:if>
				<c:if test = "${ErrorNoneTypeNotBeDeleted == true}">
					<div class="alert alert-danger mt-3 mb-3" role="alert">${PrinterNonetypecannotbedeleted}</div>
				</c:if>
				<c:if test = "${PrinterTypeDeleted == true}">
					<div class="alert alert-success mt-3 mb-3" role="alert">${Printertypedeleted}</div>
				</c:if>
				<c:if test = "${ErrorPrinterTypeDelete == true}">
					<div class="alert alert-danger mt-3 mb-3" role="alert">${Errorprintertypedelete}</div>
				</c:if>
				<table class="table">
					<thead>
						<tr class="d-flex">
							<th class="col-1"></th>
							<th class="col-11">${Printertype}</th>
						</tr>
					</thead>
					<tbody>
						<c:choose>
							<c:when test = "${printerstypes.size() > 0}">
								<c:forEach begin="0" items="${printerstypes}" var="printerstype">
									<c:if test = "${printerstype.GetId() != 1}">
										<tr class="d-flex">
											<td class="col-1" scope="row">
												<form method="post" action="adminprintertypes">
													<button type="submit" name="button_printerstype" class="btn btn-link m-0 p-0" title="Delete printer type"><span class="oi oi-x"></span></button>
													<input class="hidden" name="deleteprinterstypeid" value="${printerstype.GetId()}">
												</form>
											</td>
											<td class="col-11">${printerstype.GetType()}</td>
										</tr>
									</c:if>
								</c:forEach>
							</c:when>
							<c:otherwise>
								<tr class="d-flex">
									<td class="col-1" scope="row"></td>
									<td class="col-11">(${Empty})</td>
								</tr>
							</c:otherwise>
						</c:choose>
					</tbody>
				</table>
			</div>
		</div>
	</body>
</html>