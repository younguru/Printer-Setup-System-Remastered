<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="org.PrinterSetupSystem.misc.AuthorizeUtil" %>
<%
	AuthorizeUtil.UserLoadedJspRedirect(request, response, "AdminHome.jsp", "/adminhome");
	AuthorizeUtil.UserLoadedJspRedirect(request, response, "/admin", "/adminhome");
	AuthorizeUtil.AuthorizedRedirect(request, response);
 %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="context" value="${pageContext.request.contextPath}" />
<c:set var="ActiveElement" value='Adminhome'/>
<%@include file="Common.jsp" %>
<!doctype html>
<html>
	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
		<link rel="shortcut icon" href="img/logo.png" type="image/x-icon">
		<!-- All CSS -->
		<link rel="stylesheet" href="css/printersetupsystem.css">
		<link rel="stylesheet" href="css/adminhome.css">
		<!-- Bootstrap CSS -->
		<link rel="stylesheet" href="css/bootstrap.min.css">
		<link rel="stylesheet" href="css/open-iconic-bootstrap.css">
		<!-- Optional JavaScript -->
		<!-- jQuery first, then Popper.js, then Bootstrap JS -->
		<script src="js/jquery-3.2.1.min.js"></script>
		<script src="js/popper.min.js"></script>
		<script src="js/bootstrap.min.js"></script>
		<title>PrintDesk - Admin Home</title>
	</head>
	<body class="container-fluid" style="min-width: ${MinWidth};">
		<%@include file="Navbar.jsp"%>
		<div class="m-3">
			<h1 class="display-5 ml-4 mr-4 mt-2 mb-4">${Details}</h1>
			<div class="row ml-4 mr-4 mt-2 mb-4">
	            <div class="thumbnails">
				    <a class="thumbnail" href="${context}/adminprinters">
				        <img class="thumbnail-image" src="img/admin/printers.png" alt="Printers" />
				        <p class="caption mt-1">${Printers}</p>
				    </a>
				    <a class="thumbnail" href="${context}/adminbranches">
				        <img class="thumbnail-image" src="img/admin/branches.png" alt="Branches" />
				        <p class="caption mt-1">${Branches}</p>
				    </a>
				    <a class="thumbnail" href="${context}/adminadmins">
				        <img class="thumbnail-image" src="img/admin/administrators.png" alt="Administrators" />
				        <p class="caption mt-1">${Administrators}</p>
				    </a>
				</div>
	        </div>
	        <h1 class="display-5 ml-4 mr-4 mt-2 mb-4">${Types}</h1>
			<div class="row ml-4 mr-4 mt-2 mb-4">
	            <div class="thumbnails">
				    <a class="thumbnail" href="${context}/adminprintertypes">
				        <img class="thumbnail-image" src="img/admin/printertypes.png" alt="Printer types" />
				        <p class="caption mt-1">${Printertypes}</p>
				    </a>
				</div>
	        </div>
	        <h1 class="display-5 ml-4 mr-4 mt-2 mb-4">${System}</h1>
			<div class="row ml-4 mr-4 mt-2 mb-4">
	            <div class="thumbnails">
				    <a class="thumbnail" href="${context}/adminmanualpage">
				        <img class="thumbnail-image" src="img/admin/help.png" alt="Manual page settings" />
				        <p class="caption mt-1">${Manualpage}</p>
				    </a>
				</div>
				<div class="thumbnails">
				    <a class="thumbnail" href="${context}/admininstallscript">
				        <img class="thumbnail-image" src="img/admin/installscript.png" alt="Install Script settings" />
				        <p class="caption mt-1">${Installscript}</p>
				    </a>
				</div>
				<div class="thumbnails">
				    <a class="thumbnail" href="${context}/adminother">
				        <img class="thumbnail-image" src="img/admin/other.png" alt="Other settings" />
				        <p class="caption mt-1">${Othersettings}</p>
				    </a>
				</div>
	        </div>
        </div>
	</body>
</html>