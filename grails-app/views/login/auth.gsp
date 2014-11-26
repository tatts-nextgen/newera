<html>
<head>
    <meta name="layout" content="main"/>
</head>
<body>
<div class="row" style="margin-top: 40px; margin-bottom: 60px;">
    <div class="col-xs-12 text-center hidden-xs">
        <asset:image src="ubet-logo.png"/>
    </div>
    <div class="col-xs-12 text-center visible-xs">
        <asset:image src="ubet-logo.png" style="width: 310px;"/>
    </div>
</div>
<div class="col-xs-12 text-center green" style="font-size: 28pt; font-weight: bold;">
<div class="row" style="margin-top: 100px;">
    <div class="col-xs-offset-4 col-xs-4">
        <div class="panel panel-default">
            <div class="panel-heading">
                <h3 class="panel-title">Login</h3>
            </div>
            <div class="panel-body">
                <g:if test='${flash.message}'>
                    <div class="alert alert-danger" style="font-size: 12pt; text-align: left;" role="alert">${flash.message}</div>
                </g:if>
                <form action="${postUrl}" method="post" role="form">
                    <div class="form-group">
                        <label for="j_username">Username</label>
                        <div class="input-group">
                            <span class="input-group-addon"><i class="fa fa-user"></i></span>
                            <input type="text" class="form-control" id="j_username" name="j_username"
                                   value="${params.j_username}" placeholder="Username" required="true"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="j_password">Password</label>
                        <div class="input-group">
                            <span class="input-group-addon"><i class="fa fa-lock"></i></span>
                            <input type="password" class="form-control" id="j_password" name="j_password"
                                   placeholder="Password" required="true"/>
                        </div>
                    </div>
                    <div class="checkbox pull-left">
                        <label>
                            <input type="checkbox" name="_spring_security_remember_me"/> Remember me on this device
                        </label>
                    </div>
                    <input type="submit" id="login" class="btn pull-right green-background" value="Login"/>
                </form>
            </div>
        </div>
    </div>
</div>
</body>
</html>