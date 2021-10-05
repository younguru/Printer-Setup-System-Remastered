<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="org.PrinterSetupSystem.misc.AuthorizeUtil" %>
<%
	AuthorizeUtil.UserLoadedJspRedirect(request, response, "AdminPrintersEdit.jsp", "/adminprintersedit");
	AuthorizeUtil.AuthorizedRedirect(request, response);
 %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="context" value="${pageContext.request.contextPath}" />
<c:set var="ErrorEditPrinterSave" value='${requestScope["ErrorEditPrinterSave"]}'/>
<c:set var="PrinterSaved" value='${requestScope["PrinterSaved"]}'/>
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
		<title>PrintDesk - Admin Edit Printer</title>
	</head>
	<body class="container-fluid" style="min-width: ${MinWidth};">
		<%@include file="Navbar.jsp"%>
		<div class="row ml-4 mr-4 mt-3 mb-4">
			<div class="col-3 text-truncate p-4 border-right">
				<p class="mb-2"><em>${Home}</em></p>
				<p class="mb-1"><img class="size-16" src="img/admin/home.png" alt="Home page"/><a class="ml-2 text-body" href="${context}/adminhome">${Homepage}</a></p>
				<p class="mb-2 pt-3"><em>${Details}</em></p>
				<p class="mb-1"><img class="size-16" src="img/admin/printers.png" alt="Printers"/><a class="ml-2 text-body font-weight-bold" href="${context}/adminprinters"><u>${Printers}</u></a> -><img class="size-16" src="img/admin/edit.png" alt="Printer Edit"/><a class="ml-2 text-body font-weight-bold" href="${context}/adminprintersedit?printerid=${printer.GetId()}"><u>${Edit}</u></a></p>
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
					<img class="size-64 mr-2" src="img/admin/edit.png" alt="Edit printer"/>
					<h1 class="display-5 mr-4 mt-2 mb-4">${Editprinter}</h1>
				</div>
				<c:if test = "${ErrorEditPrinterSave == true}">
					<div class="alert alert-danger mt-3 mb-3" role="alert">${Printersaveerror}</div>
				</c:if>
				<c:if test = "${PrinterSaved == true}">
					<div class="alert alert-success mt-3 mb-3" role="alert">${Printersaved}</div>
				</c:if>
				<form class="mt-2" method="post" action="adminprintersedit" enctype="multipart/form-data">
					<div class="form-group">
						<label for="inputPrinterName" class="required">${Name}</label>
						<input name="editprintername" type="text" class="form-control" id="inputPrinterName" aria-describedby="printerNameHelp" value="${printer.GetName()}" required>
						<small id="printerNameHelp" class="form-text text-muted">${Inputfullnameoftheprinter}</small>
					</div>
					<div class="form-group">
						<label for="inputPrinterDescription">${Description}</label>
						<textarea name="editprinterdescription" class="form-control" id="inputPrinterDescription" aria-describedby="printerDescriptionHelp" rows="4">${printer.GetDescription()}</textarea>
						<small id="printerDescriptionHelp" class="form-text text-muted">${Inputdescriptionoftheprinter}</small>
					</div>
					<div class="form-group">
						<label for="editPrinterBranch" class="required">${Branch}</label>
						<select name="editprinterbranch" class="form-control" id="editPrinterBranch" required>
							<c:choose>
								<c:when test = "${branches.size() > 0}">
									<c:forEach begin="0" items="${branches}" var="branch">
										<c:choose>
											<c:when test = "${branch.GetId() == printer.GetBranchId()}">
												<option value="${branch.GetId()}" selected>${branch.GetName()}</option>
											</c:when>
											<c:otherwise>
												<option value="${branch.GetId()}">${branch.GetName()}</option>
											</c:otherwise>
										</c:choose>
									</c:forEach>
								</c:when>
								<c:otherwise>
									<option value="1">${None}</option>
								</c:otherwise>
							</c:choose>
						</select>
					</div>
					<div class="form-group">
						<label for="inputPrinterIP">${IPaddress}</label>
						<input name="editprinterip" type="text" class="form-control" id="inputPrinterIP" aria-describedby="printerIPHelp" value="${printer.GetIp()}">
						<small id="printerIPHelp" class="form-text text-muted">${InputIPaddressoftheprinter}</small>
					</div>
					<div class="form-group">
						<label for="inputPrinterVendor">${Vendor}</label>
						<input name="editprintervendor" type="text" class="form-control" id="inputPrinterVendor" aria-describedby="printerVendorHelp" value="${printer.GetVendor()}">
						<small id="printerVendorHelp" class="form-text text-muted">${InputvendoroftheprinterForexampleHPXeroxCanonandetc}</small>
					</div>
					<div class="form-group">
						<label for="editPrinterType" class="required">${Printertype}</label>
						<select name="editprintertype" class="form-control" id="editPrinterType" required>
							<c:choose>
								<c:when test = "${printerstypes.size() > 0}">
									<c:forEach begin="0" items="${printerstypes}" var="printerstype">
										<c:choose>
											<c:when test = "${printerstype.GetId() == printer.GetPrinterTypeId()}">
												<option value="${printerstype.GetId()}" selected>${printerstype.GetType()}</option>
											</c:when>
											<c:otherwise>
												<option value="${printerstype.GetId()}">${printerstype.GetType()}</option>
											</c:otherwise>
										</c:choose>
									</c:forEach>
								</c:when>
								<c:otherwise>
									<option value="1">${None}</option>
								</c:otherwise>
							</c:choose>
						</select>
					</div>
					<div class="form-group">
						<label for="inputPrinterServerSharedName">${Serversharedname}</label>
						<input name="editprintersharename" type="text" class="form-control" id="inputPrinterServerSharedName" aria-describedby="printerServerShareNameHelp" value="${printer.GetServerShareName()}">
						<small id="printerServerShareNameHelp" class="form-text text-muted">${InputserversharednameoftheprinterForexampleserver01Printer1}</small>
					</div>
					<div class="form-group">
						<label for="inputPrinterLocation">${Location}</label>
						<input name="editprinterlocation" type="text" class="form-control" id="inputPrinterLocation" aria-describedby="printerLocationHelp" value="${printer.GetLocation()}">
						<small id="printerLocationHelp" class="form-text text-muted">${Inputlocationoftheprinter}</small>
					</div>
					<div class="form-group">
				  		<label for="inputPrinterImage">${Image}</label>
				  		<input name="editprinterimage" type="file" class="form-control-file" id="inputPrinterImage">
					</div>
					<c:choose>
						<c:when test = "${printer.GetImage() == \"img/no-image.png\"}">
							<img class="rounded size-64 mb-1" src="img/no-image.png" alt="Printer Image">
						</c:when>
						<c:when test = "${printer.GetImage() == \"\"}">
							<img class="rounded size-64 mb-1" src="img/no-image.png" alt="Printer Image">
						</c:when>
						<c:otherwise>
							<img class="rounded size-64 mb-1" src="data:image/jpg;base64,${printer.GetImage()}" alt="Printer Image">
						</c:otherwise>
					</c:choose>
					<div class="form-group">
						<label for="inputPrinterImageNull">${Deleteimage}</label>
						<input name="editprinterimagenull" type="checkbox" class="form-check-input ml-2" id="inputPrinterImageNull">
					</div>
					<div class="form-group">
						<label for="inputPrinterCustomField1">${Location}</label>
						<input name="editprintercustomfield1" type="text" class="form-control" id="inputPrinterCustomField1" aria-describedby="inputPrinterCustomField1Help" value="${printer.GetCustomField1()}">
						<small id="inputPrinterCustomField1Help" class="form-text text-muted">${Inputcustomfield1valueThisparameterisnotvisibleanywhereandcouldbeusedonlyforscriptingpurposes}</small>
					</div>
					<div class="form-group hidden">
				  		<input name="editprinterid" type="text" class="form-control hidden" value="${printer.GetId()}">
					</div>
					<br>
					<button type="submit" name="button_saveprinter" class="btn btn-primary btn-lg">${Save}</button>
				</form>
			</div>
		</div>
	</body>
</html>