<c:if test = "${isAdminEntered == true}">
    <nav class="navbar navbar-expand-md navbar-light bg-light">
</c:if>
<c:if test = "${isAdminEntered == false}">
    <nav class="navbar navbar-expand navbar-light bg-light">
</c:if>
<a class="navbar-brand ml-4" href="${context}/home"><img src="img/logo.png" alt="Logo" class="printersetupsystem-logo"> ${PrintDesk}</a>
<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
</button>
<div class="collapse navbar-collapse" id="navbarNav">
    <ul class="navbar-nav mr-auto">
        <li class="nav-item <c:if test="${ActiveElement == 'Home'}">active</c:if>" id="statusAct" value="1">
            <a class="nav-link" href="${context}/home">${Home}<span class="sr-only">(current)</span></a>
        </li>
        <li class="nav-item <c:if test="${ActiveElement == 'Search'}">active</c:if>">
            <a class="nav-link" href="${context}/search">${Search}<span class="sr-only">(current)</span></a>
        </li>
        <li class="nav-item <c:if test="${ActiveElement == 'Help'}">active</c:if>">
            <a class="nav-link" href="${context}/help">${Help}<span class="sr-only">(current)</span></a>
        </li>
        <c:if test = "${isAdminEntered == true}">
            <li class="nav-item">
                <a class="nav-link <c:if test="${ActiveElement == 'Adminhome'}">active</c:if>" href="${context}/adminhome">${Admin}</a>
            </li>
        </c:if>
    </ul>
    <c:if test="${isAdminEntered == true}">
    <form class="d-flex">
        <ul class="navbar-nav">
            <li class="nav-item dropdown <c:if test="${ActiveElement == 'Usersettings'}">active</c:if>">
                <a href="#" class="nav-link dropdown-toggle" id="navDropDownLink" data-toggle="dropdown"
                   aria-haspopup="true" aria-expanded="false"><%=session.getAttribute("fullname")%>
                </a>
                <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navDropDownLink">
                    <a class="dropdown-item" href="${context}/usersettings">${Preferences}</a>
                    <div class="dropdown-divider"></div>
                    <a class="dropdown-item" href="Logout.jsp">${Logout}</a>
                </div>
            </li>
        </ul>
    </form>
    </c:if>
</div>
</nav>
