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
    <div class="col-xs-10 col-xs-offset-2">
        <dl class="dl-horizontal">
            <dt>Registrations to date</dt>
            <dd><g:formatNumber number="${registrationCount}" format="###,###,##0"/> </dd>
            <dt>Most recent registration</dt>
            <dd><g:formatDate date="${mostRecentRegistrationDate}" format="MMM d, yyyy, h:mm:ss"/> </dd>
            <dt>User</dt>
            <dd><sec:username/></dd>
            <dt>IP Address</dt>
            <dd>${request.remoteAddr}</dd>
            <dt>Application Version</dt>
            <dd><g:meta name="app.version"/></dd>
        </dl>
    </div>
</div>
<div class="row">
    <div class="col-xs-10 col-xs-offset-2">
        <g:link action="export">Download Registrations</g:link>
    </div>
</div>
<div class="row">
    <div class="col-xs-10 col-xs-offset-2">
        <g:form controller="logout" method="post" role="form">
            <input type="submit" class="btn btn-link" style="padding-left: 0;" value="Logout"/>
        </g:form>
    </div>
</div>

</body>
</html>