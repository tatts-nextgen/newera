<html>
<head>
    <meta name="layout" content="main"/>
</head>
<body>
<div class="row" style="margin-top: 100px;">
    <div class="col-xs-12 text-center green" style="font-size: 22pt;">
        WELCOME
    </div>
</div>
<div class="row">
    <div class="col-xs-12 text-center" style="font-size: 38pt;">
        READY FOR A NEW ERA<br/>IN BETTING?
    </div>
</div>
<div class="row" style="margin-top: 20px;">
    <div class="col-xs-offset-3 col-xs-6" style="background-color: white; height: 200px;">&nbsp;</div>
</div>
<div class="row" style="margin-top: 20px;">
    <div class="col-xs-12 text-center">
        <i class="fa fa-circle-thin" style="font-size: 100pt; cursor: pointer;" data-toggle="modal" data-target="#myModal"></i>
        <p style="position: relative; top: -90px; cursor: pointer;" data-toggle="modal" data-target="#myModal">HEAR<br/>MORE</p>
    </div>
</div>
<div class="row" style="margin-top: 50px;">
    <div class="col-xs-12 text-center green" style="font-size: 18pt;">
        Coming soon. Watch this space.
    </div>
</div>
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header" style="border-bottom: none;">
                <button type="button" class="close" data-dismiss="modal">
                    <span aria-hidden="true"><i class="fa fa-times"></i></span>
                    <span class="sr-only">Close</span>
                </button>
            </div>
            <div class="modal-body" style="margin-top: 10px;">
                <div class="text-center">
                    <i class="fa fa-circle-thin" style="color: #54D940; font-size: 75pt;"></i>
                    <i class="fa fa-envelope"
                       style="color: #54D940; font-size: 20pt; display: block; position: relative; top: -65px;"></i>
                    <p style="color: #afafaf; font-size: 18pt; margin-top: -5px; padding-bottom: 75px; border-bottom: solid 1px #afafaf;">
                        Sign up
                    </p>
                </div>
                <div class="row">
                    <div class="col-xs-6 col-xs-offset-3">
                        <g:form action="register" role="form">
                            <input type="hidden" name="over18" id="over18" value="${params.over18}"/>
                            <input type="hidden" name="privacy" id="privacy" value="${params.privacy}"/>
                            <div class="form-group">
                                <label for="email">EMAIL</label>
                                <input type="email" id="email" name="email" required="true" class="form-control"
                                    tabindex="1"/>
                            </div>
                            <div class="form-group">
                                <label for="name">NAME</label>
                                <input type="text" id="name" name="name" required="true" class="form-control"
                                    tabindex="2"/>
                            </div>
                            <div class="form-group">
                                <label for="phone" style="width: 100%;">
                                    PHONE
                                    <span class="pull-right" style="color: #dfdfdf;">Optional</span>
                                </label>
                                <input type="text" id="phone" name="phone" class="form-control"
                                    tabindex="3"/>
                            </div>
                        </form>
                    </div>
                </div>
                <div class="row" style="color: #afafaf;">
                    <div class="col-xs-1 col-xs-offset-3 vcenter">
                        <span class="fa-stack" data-hidden-field="over18">
                            <i class="fa fa-square-o checkable fa-stack-2x" tabindex="4"></i>
                            <i class="fa fa-check checkmark fa-stack-1x"></i>
                        </span>
                    </div>
                    <div class="col-xs-6 vcenter" style="font-size: 9pt;">
                        I confirm that I am over 18 years of age
                    </div>
                </div>
                <div class="row" style="color: #afafaf; margin-top: 10px;">
                    <div class="col-xs-1 col-xs-offset-3 vcenter">
                        <span class="fa-stack" data-hidden-field="privacy">
                            <i class="fa fa-square-o checkable fa-stack-2x" tabindex="5"></i>
                            <i class="fa fa-check checkmark fa-stack-1x"></i>
                        </span>
                    </div>
                    <div class="col-xs-6 vcenter" style="font-size: 9pt;">
                        I have read and agree to the Privacy Statement
                        and Privacy Policy of Tatts Group Limited
                    </div>
                </div>
            </div>
            <div class="row">
                <input id='submit' class="btn col-xs-7 col-xs-offset-3" disabled="disabled"
                    style="background-color: #afafaf; color: #000; margin-bottom: 25px;" value="SUBMIT"/>
            </div>
        </div>
    </div>
</div>
<asset:javascript src="indez.js"/>
</body>
</html>