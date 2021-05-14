<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="org.PrinterSetupSystem.misc.AuthorizeUtil" %>
<%
	AuthorizeUtil.UserLoadedJspRedirect(request, response, "AdminInstallScript.jsp", "/admininstallscript");
	AuthorizeUtil.AuthorizedRedirect(request, response);
 %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="context" value="${pageContext.request.contextPath}" />
<c:set var="InstallScriptSaved" value='${requestScope["InstallScriptSaved"]}'/>
<c:set var="InstallScriptSaveError" value='${requestScope["InstallScriptSaveError"]}'/>
<c:set var="ScriptExtensionSaved" value='${requestScope["ScriptExtensionSaved"]}'/>
<c:set var="ScriptExtensionSaveError" value='${requestScope["ScriptExtensionSaveError"]}'/>
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
		<title>PrintDesk - Admin Install Script configuration Page</title>
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
				<p class="mb-1"><img class="size-16" src="img/admin/installscript.png" alt="Install Script page settings"/><a class="ml-2 text-body font-weight-bold" href="${context}/admininstallscript"><u>${Installscript}</u></a></p>
				<p><img class="size-16" src="img/admin/other.png" alt="Other settings"/><a class="ml-2 text-body" href="${context}/adminother">${Othersettings}</a></p>
			</div>
			<div class="col-9 pl-4">
				<div class="d-flex align-items-center mb-3 border-bottom">
					<img class="size-64 mr-2" src="img/admin/installscript.png" alt="Install Script"/>
					<h1 class="display-5 mr-4 mt-2 mb-4">${Installscript}</h1>
				</div>
				<p><em>${MakechangestoInstallScriptandpressSavebuttonVariableslistedbelowwillbechangedtothespecifiedvalue}</em></p>
				<ul class="mb-5">
					<li class="mb-1"><kbd>%PRINTER_NAME%</kbd> - <em>${Printername}</em></li>
					<li class="mb-1"><kbd>%PRINTER_DESCRIPTION%</kbd> - <em>${Printerdescription}</em></li>
					<li class="mb-1"><kbd>%PRINTER_SHARE_NAME%</kbd> - <em>${Printersharednameonserver}</em></li>
					<li class="mb-1"><kbd>%PRINTER_ID%</kbd> - <em>${PrinterIDinthesystem}</em></li>
					<li class="mb-1"><kbd>%PRINTER_BRANCH_ID%</kbd> - <em>${PrinterbranchIDinthesystem}</em></li>
					<li class="mb-1"><kbd>%PRINTER_IP%</kbd> - <em>${PrinterIPaddress}</em></li>
					<li class="mb-1"><kbd>%PRINTER_VENDOR%</kbd> - <em>${Printervendor}</em></li>
					<li class="mb-1"><kbd>%PRINTER_TYPE%</kbd> - <em>${Printertype}</em></li>
					<li class="mb-1"><kbd>%PRINTER_CUSTOM_FIELD1%</kbd> - <em>${Printercustomfield1}</em></li>
				</ul>
				<c:if test = "${InstallScriptSaved == true}">
					<div class="alert alert-success mt-3" role="alert">${Installscriptsaved}</div>
				</c:if>
				<c:if test = "${InstallScriptSaveError == true}">
					<div class="alert alert-danger mt-3" role="alert">${InstallscriptnotsavedError}</div>
				</c:if>
				<c:if test = "${ScriptExtensionSaved == true}">
					<div class="alert alert-success mt-3" role="alert">${Scriptextensionsaved}</div>
				</c:if>
				<c:if test = "${ScriptExtensionSaveError == true}">
					<div class="alert alert-danger mt-3" role="alert">${ScriptextensionnotsavedError}</div>
				</c:if>
				<div class="mb-3">
					<form method="post" action="admininstallscript">
						<label for="inputExtensionInput">${Scriptextension}</label>
						<input class="form-control mb-4" id="inputExtensionInput" type="text" name="adminscriptextension" value="${scriptextensionp}">
						<label for="adminscriptInput">${Script}</label>
						<textarea class="form-control" name="adminscript" id="adminscriptInput" class="w-100" rows="15" autocomplete="off" autocapitalize="off" spellcheck="false">${installscriptp}</textarea>
						<button name="savescript_button" type="submit" class="btn btn-outline-primary mt-3">${Save}</button>
					</form>
				</div>
			</div>
		</div>
	</body>
</html>