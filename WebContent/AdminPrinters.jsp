<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="org.PrinterSetupSystem.misc.AuthorizeUtil" %>
<%
	AuthorizeUtil.UserLoadedJspRedirect(request, response, "AdminPrinters.jsp", "/adminprinters");
	AuthorizeUtil.AuthorizedRedirect(request, response);
 %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="context" value="${pageContext.request.contextPath}" />
<c:set var="ErrorPrinterIDNotNumber" value='${requestScope["ErrorPrinterIDNotNumber"]}'/>
<c:set var="PrinterDeleted" value='${requestScope["PrinterDeleted"]}'/>
<c:set var="ErrorPrinterDelete" value='${requestScope["ErrorPrinterDelete"]}'/>
<c:set var="NewPrinterCreateSuccess" value='${requestScope["NewPrinterCreateSuccess"]}'/>
<c:set var="ErrorNewPrinterCreate" value='${requestScope["ErrorNewPrinterCreate"]}'/>
<c:set var="ErrorPrinterNotNumber" value='${requestScope["ErrorPrinterNotNumber"]}'/>
<c:set var="ErrorPrinterNotFound" value='${requestScope["ErrorPrinterNotFound"]}'/>
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
		<title>PrintDesk - Admin Printers configuration</title>
	</head>
	<body>
		<%@include file="Header.jsp"%>
		<div class="row ml-4 mr-4 mt-3 mb-4">
			<div class="col-3 p-4 border-right">
				<p class="mb-2"><em>${Home}</em></p>
				<p class="mb-1"><img class="size-16" src="img/admin/home.png" alt="Home page"/><a class="ml-2 text-body" href="${context}/adminhome">${Homepage}</a></p>
				<p class="mb-2 pt-3"><em>${Details}</em></p>
				<p class="mb-1"><img class="size-16" src="img/admin/printers.png" alt="Printers"/><a class="ml-2 text-body font-weight-bold" href="${context}/adminprinters"><u>${Printers}</u></a></p>
				<p class="mb-1"><img class="size-16" src="img/admin/branches.png" alt="Branches"/><a class="ml-2 text-body" href="${context}/adminbranches">${Branches}</a></p>
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
					<img class="size-64 mr-2" src="img/admin/printers.png" alt="Printers"/>
					<h1 class="display-5 mr-4 mt-2 mb-4">${Printers}</h1>
				</div>
				<div class="d-flex align-items-center mb-3 bg-light">
					<a class="btn btn-outline-primary m-2" href="${context}/adminprinterscreate" role="button">${Createprinter}</a>
				</div>
				<c:if test = "${ErrorPrinterIDNotNumber == true}">
					<div class="alert alert-danger mt-3 mb-3" role="alert">${PrinterIDmustbenumber}</div>
				</c:if>
				<c:if test = "${PrinterDeleted == true}">
					<div class="alert alert-success mt-3 mb-3" role="alert">${Printerdeleted}</div>
				</c:if>
				<c:if test = "${ErrorPrinterDelete == true}">
					<div class="alert alert-danger mt-3 mb-3" role="alert">${Printerdeletionerror}</div>
				</c:if>
				<c:if test = "${NewPrinterCreateSuccess == true}">
					<div class="alert alert-success mt-3 mb-3" role="alert">${Printercreated}</div>
				</c:if>
				<c:if test = "${ErrorNewPrinterCreate == true}">
					<div class="alert alert-danger mt-3 mb-3" role="alert">${Printercreationerror}</div>
				</c:if>
				<c:if test = "${ErrorPrinterNotNumber == true}">
					<div class="alert alert-danger mt-3 mb-3" role="alert">${PrinterIDisnotnumber}</div>
				</c:if>
				<c:if test = "${ErrorPrinterNotFound == true}">
					<div class="alert alert-danger mt-3 mb-3" role="alert">${Printernotfound}</div>
				</c:if>
				<table class="table">
					<thead>
						<tr class="d-flex">
							<th class="col-1"></th>
							<th class="col-1"></th>
							<th class="col-4">${Name}</th>
							<th class="col-3">${Branch}</th>
							<th class="col-3">${IP}</th>
						</tr>
					</thead>
					<tbody>
						<c:choose>
							<c:when test = "${printers.size() > 0}">
								<c:forEach begin="0" items="${printers}" var="printer">
									<tr class="d-flex">
										<td class="col-1" scope="row">
											<form method="post" action="adminprinters">
												<button type="submit" name="button_deleteprinter" class="btn btn-link m-0 p-0" title="Delete printer"><span class="oi oi-x"></span></button>
												<input class="hidden" name="deleteprinterid" value="${printer.GetId()}">
											</form>
										</td>
										<td class="col-1">
											<a href="${context}/adminprintersedit?printerid=${printer.GetId()}">
												<button class="btn btn-link m-0 p-0" title="Edit printer"><span class="oi oi-wrench"></span></button>
											</a>
										</td>
										<td class="col-4 table-overflow">${printer.GetName()}</td>
										<td class="col-3 table-overflow">${printer.GetBranchName()}</td>
										<td class="col-3 table-overflow"><a href="http://${printer.GetIp()}" target="_blank">${printer.GetIp()}</a></td>
									</tr>
								</c:forEach>
							</c:when>
							<c:otherwise>
								<tr class="d-flex">
									<td class="col-1" scope="row"></td>
									<td class="col-1"></td>
									<td class="col-4">(${Empty})</td>
									<td class="col-3"></td>
									<td class="col-3"></td>
								</tr>
							</c:otherwise>
						</c:choose>
					</tbody>
				</table>
			</div>
		</div>
	</body>
</html>