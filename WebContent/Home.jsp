<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="org.PrinterSetupSystem.misc.AuthorizeUtil" %>
<%
    AuthorizeUtil.UserLoadedJspRedirect(request, response, "Home.jsp", "/home");
    AuthorizeUtil.AuthorizedRedirectHome(request, response);
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="context" value="${pageContext.request.contextPath}"/>
<c:set var="ErrorBranchNotFound" value='${requestScope["ErrorBranchNotFound"]}'/>
<c:set var="ErrorEmptyBranchID" value='${requestScope["ErrorEmptyBranchID"]}'/>
<c:set var="ErrorBranchNotNumber" value='${requestScope["ErrorBranchNotNumber"]}'/>
<c:set var="ActiveElement" value='Home'/>
<%@include file="Common.jsp" %>
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
    <script src="js/printersetupsystem.js"></script>
    <title>Printer Setup System - Home</title>
</head>
<body class="container-fluid" style="min-width: ${MinWidth};">
    <%@include file="Navbar.jsp" %>
    <c:choose>
        <c:when test="${ErrorBranchNotFound == true}">
            <div class="alert alert-danger ml-4 mr-4 mt-2 mb-4" role="alert">${Branchnotfound}</div>
        </c:when>
    </c:choose>
    <c:choose>
        <c:when test="${ErrorEmptyBranchID == true}">
            <div class="alert alert-danger ml-4 mr-4 mt-2 mb-4"
                 role="alert">${EmptybranchIDPleaseenteravalidbranchid}</div>
        </c:when>
    </c:choose>
    <c:choose>
        <c:when test="${ErrorBranchNotNumber == true}">
            <div class="alert alert-danger ml-4 mr-4 mt-2 mb-4" role="alert">${Branchnumbermustbeentered}</div>
        </c:when>
    </c:choose>
    <nav aria-label="breadcrumb">
        <ol class="breadcrumb ml-4 mr-4 mt-3">
            <li class="breadcrumb-item">${Home}</li>
        </ol>
    </nav>
    <div class="card ml-4 mr-4 mt-2 mb-4">
        <div class="card-header">
            <div class="d-flex align-items-center">
                <span class="align-middle">${Branches}</span>
                <div class="border-left vertical-separator ml-4 mr-4"></div>
                <span class="align-middle pr-2">${Search}:</span>
                <div class="d-flex align-middle">
                    <input id="PSSBranchName" type="text" class="form-control" placeholder="${Branchname}"
                           required="required">
                    <div class="btn-group pl-2" role="group">
                        <button type="button" class="btn btn-outline-primary"
                                onclick="BranchSearch('PSSBranchName', 'PSSResult')">${Search}</button>
                        <button type="button" class="btn btn-outline-primary"
                                onclick="BranchReset('PSSResult')">${Reset}</button>
                    </div>
                </div>
            </div>
        </div>
        <div class="card-body p-0">
            <div id="PSSResult" class="row m-3">
                <c:choose>
                    <c:when test="${branches.size() > 0}">
                        <c:forEach begin="0" items="${branches}" var="branch">
                            <div class="col mb-4">
                                <div class="card position-relative" style="width: 200px;">
                                    <c:choose>
                                        <c:when test="${branch.GetImage() == \"img/no-image.png\"}">
                                            <img src="img/no-image.png" class="card-img-top" style="height: 200px;"
                                                 alt="Printer Image">
                                        </c:when>
                                        <c:otherwise>
                                            <img src="data:image/jpg;base64,${branch.GetImage()}" class="card-img-top"
                                                 style="height: 200px;" alt="Printer Image">
                                        </c:otherwise>
                                    </c:choose>
                                    <div class="card-body">
                                        <h6 class="card-title text-truncate">${branch.GetName()}</h6>
                                            <%--											<p class="card-text">${branch.GetDescription()}</p>--%>
                                        <a href="${context}/branch?id=${branch.GetId()}" class="stretched-link"></a>
                                    </div>
                                    <c:if test="${isAdminEntered == true}">
                                        <div class="card-footer branch-edit">
                                            <a href="${context}/adminbranchesedit?branchid=${branch.GetId()}">
                                                <button type="button" class="btn btn-primary btn-sm"><span
                                                        class="oi oi-pencil"></span></button>
                                            </a>
                                        </div>
                                    </c:if>
                                </div>
                            </div>
                        </c:forEach>
                    </c:when>
                    <c:otherwise>
                        <div class="col mb-4">
                            <div class="card position-relative">
                                <div class="card-body">
                                    <h5 class="card-title">(${Empty})</h5>
                                </div>
                            </div>
                        </div>
                    </c:otherwise>
                </c:choose>
            </div>
        </div>
    </div>
</body>
</html>