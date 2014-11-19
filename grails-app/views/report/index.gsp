<html>
<head>
    <meta name="layout" content="main"/>
</head>
<body>
<div class="row" style="margin-top: 100px;">
    <div class="col-xs-12 text-center green" style="font-size: 22pt;">
        NEW ERA IN BETTING - REPORTS
    </div>
</div>
<div class="row" style="margin-top: 100px;">
    <div class="col-xs-4 col-xs-offset-4">
        <div class="panel panel-default">
            <div class="panel-body" style="color: #000;">
                <ul class="list-group">
                    <li class="list-group-item">
                        <span class="badge"><g:formatNumber number="${registrationCount}" format="###,###,##0"/></span>
                        Registrations to date
                    </li>
                    <li class="list-group-item">
                        <span class="badge"><g:formatDate date="${mostRecentRegistrationDate}" format="MMM d, yyyy, h:mm:ss"/></span>
                        Most recent registration
                    </li>
                    <li class="list-group-item">
                        <span class="badge"><sec:username/></span>
                        User
                    </li>
                    <li class="list-group-item">
                        <span class="badge">${request.remoteAddr}</span>
                        IP Address
                    </li>
                    <li class="list-group-item">
                        <span class="badge"><g:meta name="app.version"/></span>
                        Application Version
                    </li>
                    <li class="list-group-item">
                        <span class="badge"><i class="fa fa-download"></i></span>
                        <g:link action="export">
                            Download Registrations
                        </g:link>
                    </li>
                    <li class="list-group-item">
                        <span class="badge"><i class="fa fa-sign-out"></i></span>
                        <g:form controller="logout" method="post" role="form">
                            <input type="submit" class="btn btn-link green" style="padding: 0;" value="Logout"/>
                        </g:form>
                    </li>
                </ul>
            </div>
        </div>
    </div>
</div>

</body>
</html>