<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="org.PrinterSetupSystem.misc.AuthorizeUtil" %>
<%
	AuthorizeUtil.UserLoadedJspRedirect(request, response, "AdminAdmins.jsp", "/adminadmins");
	AuthorizeUtil.AuthorizedRedirect(request, response);
 %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="context" value="${pageContext.request.contextPath}" />
<c:set var="ErrorResetPrintersViews" value='${requestScope["ErrorResetPrintersViews"]}'/>
<c:set var="SuccessResetPrintersViews" value='${requestScope["SuccessResetPrintersViews"]}'/>
<c:set var="ErrorCleanPrinters" value='${requestScope["ErrorCleanPrinters"]}'/>
<c:set var="SuccessCleanPrinters" value='${requestScope["SuccessCleanPrinters"]}'/>
<c:set var="ErrorCleanBranches" value='${requestScope["ErrorCleanBranches"]}'/>
<c:set var="SuccessCleanBranches" value='${requestScope["SuccessCleanBranches"]}'/>
<c:set var="ErrorCleanPrintersTypes" value='${requestScope["ErrorCleanPrintersTypes"]}'/>
<c:set var="SuccessCleanPrintersTypes" value='${requestScope["SuccessCleanPrintersTypes"]}'/>
<c:set var="ErrorResetInstallScript" value='${requestScope["ErrorResetInstallScript"]}'/>
<c:set var="SuccessResetInstallScript" value='${requestScope["SuccessResetInstallScript"]}'/>
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
		<title>PrintDesk - Admin Other settings</title>
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
				<p><img class="size-16" src="img/admin/administrators.png" alt="Administrators"/><a class="ml-2 text-body" href="${context}/adminadmins">${Administrators}</a></p>
				<p class="mb-1 pt-3"><em>${Types}</em></p>
				<p><img class="size-16" src="img/admin/printertypes.png" alt="Printer types"/><a class="ml-2 text-body" href="${context}/adminprintertypes">${Printertypes}</a></p>
				<p class="mb-1 pt-3"><em>${System}</em></p>
				<p class="mb-1"><img class="size-16" src="img/admin/help.png" alt="Manual page settings"/><a class="ml-2 text-body" href="${context}/adminmanualpage">${Manualpage}</a></p>
				<p class="mb-1"><img class="size-16" src="img/admin/installscript.png" alt="Install Script page settings"/><a class="ml-2 text-body" href="${context}/admininstallscript">${Installscript}</a></p>
				<p><img class="size-16" src="img/admin/other.png" alt="Other settings"/><a class="ml-2 text-body font-weight-bold" href="${context}/adminother"><u>${Othersettings}</u></a></p>
			</div>
			<div class="col-9 pl-4">
				<div class="d-flex align-items-center border-bottom">
					<img class="size-64 mr-2" src="img/admin/other.png" alt="Other settings"/>
					<h1 class="display-5 mr-4 mt-2 mb-4">${Othersettings}</h1>
				</div>
				<form method="post" action="adminother" class="ml-4 mr-4 mt-4">
					<h5>${Resetviewscounttoallprinters}</h5>
					<c:if test = "${ErrorResetPrintersViews == true}">
						<div class="alert alert-danger mt-3 mb-3" role="alert">${Printerviewsreseterror}</div>
					</c:if>
					<c:if test = "${SuccessResetPrintersViews == true}">
						<div class="alert alert-success mt-3 mb-3" role="alert">${Printerviewsresetsuccess}</div>
					</c:if>
					<button name="button_resetviewsallprinters" type="submit" class="btn btn-primary mt-2">${Resetviews}</button>
				</form>
				<form method="post" action="adminother" class="ml-4 mr-4 mt-4">
					<h5>${CleanallPrinters}</h5>
					<c:if test = "${ErrorCleanPrinters == true}">
						<div class="alert alert-danger mt-3 mb-3" role="alert">${Printerscleanerror}</div>
					</c:if>
					<c:if test = "${SuccessCleanPrinters == true}">
						<div class="alert alert-success mt-3 mb-3" role="alert">${Printerscleansuccess}</div>
					</c:if>
					<button name="button_cleanallprinters" type="submit" class="btn btn-warning mt-2">${Clean}</button>
				</form>
				<form method="post" action="adminother" class="ml-4 mr-4 mt-4">
					<h5>${CleanallBranches}</h5>
					<c:if test = "${ErrorCleanBranches == true}">
						<div class="alert alert-danger mt-3 mb-3" role="alert">${Branchescleanerror}</div>
					</c:if>
					<c:if test = "${SuccessCleanBranches == true}">
						<div class="alert alert-success mt-3 mb-3" role="alert">${Branchescleansuccess}</div>
					</c:if>
					<button name="button_cleanallbranches" type="submit" class="btn btn-warning mt-2">${Clean}</button>
				</form>
				<form method="post" action="adminother" class="ml-4 mr-4 mt-4">
					<h5>${CleanallPrintersTypes}</h5>
					<c:if test = "${ErrorCleanPrintersTypes == true}">
						<div class="alert alert-danger mt-3 mb-3" role="alert">${PrintersTypescleanerror}</div>
					</c:if>
					<c:if test = "${SuccessCleanPrintersTypes  == true}">
						<div class="alert alert-success mt-3 mb-3" role="alert">${PrintersTypescleansuccess}</div>
					</c:if>
					<button name="button_cleanallprinterstypes" type="submit" class="btn btn-warning mt-2">${Clean}</button>
				</form>
				<form method="post" action="adminother" class="ml-4 mr-4 mt-4">
					<h5>${Resetinstallscripttodefault}</h5>
					<c:if test = "${ErrorResetInstallScript == true}">
						<div class="alert alert-danger mt-3 mb-3" role="alert">${Installscriptreseterror}</div>
					</c:if>
					<c:if test = "${SuccessResetInstallScript  == true}">
						<div class="alert alert-success mt-3 mb-3" role="alert">${Installscriptresetsuccess}</div>
					</c:if>
					<button name="button_resetinstallscript" type="submit" class="btn btn-warning mt-2">${Reset}</button>
				</form>
			</div>
		</div>
	</body>
</html>