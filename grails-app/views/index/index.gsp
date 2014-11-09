<html>
<head>
    <meta name="layout" content="main"/>
    <content tag="scripts">
        <asset:javascript src="indez.js"/>
        <g:if test="${cmd?.hasErrors()}">
            <script type="text/javascript">
                showModalOnLoad = true
            </script>
        </g:if>
    </content>
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
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true"
        data-backdrop="static">
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
                <g:form action="register" role="form">
                    <input type="hidden" name="over18" id="over18" value="${params.over18}"/>
                    <input type="hidden" name="privacy" id="privacy" value="${params.privacy}"/>

                    <g:if test="${cmd?.hasErrors()}">
                        <div class="row" style="margin-bottom: 10px;">
                            <div class="col-xs-offset-3 col-xs-6">
                                <div class="text-danger">
                                    <div class="col-xs-1" style="padding-left: 0;">
                                        <i class="fa fa-warning"></i>
                                    </div>
                                    <div class="col-xs-10" style="padding-left: 0;">
                                        Some information is missing or incorrect.  Please try again.
                                    </div>
                                </div>
                            </div>
                        </div>
                    </g:if>

                    <div class="row">
                        <div class="col-xs-6 col-xs-offset-3">

                            <%-- Email --%>
                            <div class="form-group">
                                <g:set var="hasFieldErrors" value="${cmd?.errors?.hasFieldErrors('email')}"/>
                                <label for="email" class="${hasFieldErrors ? 'text-danger' : ''}">
                                    EMAIL
                                    <small>
                                        <g:eachError bean="${cmd}" field="email">
                                            <br/><g:message error="${it}"/>
                                        </g:eachError>
                                    </small>
                                </label>
                                <div class="input-group">
                                    <span class="input-group-addon"><i class="fa fa-envelope"></i></span>
                                    <input type="email" required="true" id="email" name="email"
                                           class="form-control ${hasFieldErrors ? 'alert alert-danger' : ''}"
                                           value="${cmd?.email}" tabindex="1"/>
                                </div>
                            </div>

                            <%-- Name --%>
                            <div class="form-group">
                                <g:set var="hasFieldErrors" value="${cmd?.errors?.hasFieldErrors('name')}"/>
                                <label for="name" class="${hasFieldErrors ? 'text-danger' : ''}">
                                    NAME
                                    <small>
                                        <g:eachError bean="${cmd}" field="name">
                                            <br/><g:message error="${it}"/>
                                        </g:eachError>
                                    </small>
                                </label>
                                <div class="input-group">
                                    <span class="input-group-addon"><i class="fa fa-user"></i></span>
                                    <input type="text" id="name" name="name" required="true"
                                           class="form-control ${hasFieldErrors ? 'alert alert-danger' : ''}"
                                           value="${cmd?.name}" tabindex="2"/>
                                </div>
                            </div>

                            <%-- Phone --%>
                            <div class="form-group">
                                <g:set var="hasFieldErrors" value="${cmd?.errors?.hasFieldErrors('phone')}"/>
                                <label for="phone" class="${hasFieldErrors ? 'text-danger' : ''}" style="width: 100%;">
                                    PHONE
                                    <span class="pull-right" style="color: #dfdfdf;">Optional</span>
                                    <small>
                                        <g:eachError bean="${cmd}" field="phone">
                                            <br/><g:message error="${it}"/>
                                        </g:eachError>
                                    </small>
                                </label>
                                <div class="input-group">
                                    <span class="input-group-addon"><i class="fa fa-phone"></i></span>
                                    <input type="text" id="phone" name="phone"
                                           class="form-control ${hasFieldErrors ? 'alert alert-danger' : ''}"
                                           value="${cmd?.phone}" tabindex="3"/>
                                </div>
                            </div>
                        </div>
                    </div>

                    <%-- Over 18 --%>
                    <g:set var="hasFieldErrors" value="${cmd?.errors?.hasFieldErrors('over18')}"/>
                    <g:if test="${hasFieldErrors}">
                        <div class="row text-danger">
                            <div class="col-xs-offset-3 col-xs-6">
                                <small>
                                    <g:eachError bean="${cmd}" field="over18">
                                        <br/><g:message error="${it}"/>
                                    </g:eachError>
                                </small>
                            </div>
                        </div>
                    </g:if>
                    <div class="row" style="color: #afafaf; margin-bottom: 10px;">
                        <div class="col-xs-1 col-xs-offset-3 vcenter">
                            <span class="fa-stack" data-hidden-field="over18">
                                <i id='over18-checkable' class="fa fa-square-o checkable fa-stack-2x" tabindex="4"></i>
                                <i class="fa fa-check checkmark fa-stack-1x"></i>
                            </span>
                        </div>
                        <div class="col-xs-5 vcenter checkable-label ${hasFieldErrors ? 'text-danger' : ''}">
                            I confirm that I am over 18 years of age
                        </div>
                    </div>

                    <%-- Privacy --%>
                    <g:set var="hasFieldErrors" value="${cmd?.errors?.hasFieldErrors('privacy')}"/>
                    <g:if test="${hasFieldErrors}">
                        <div class="row text-danger">
                            <div class="col-xs-offset-3 col-xs-6">
                                <small>
                                    <g:eachError bean="${cmd}" field="privacy">
                                        <br/><g:message error="${it}"/>
                                    </g:eachError>
                                </small>
                            </div>
                        </div>
                    </g:if>
                    <div class="row" style="color: #afafaf; margin-bottom: 10px;">
                        <div class="col-xs-1 col-xs-offset-3 vcenter">
                            <span class="fa-stack" data-hidden-field="privacy">
                                <i id='privacy-checkable' class="fa fa-square-o checkable fa-stack-2x" tabindex="5"></i>
                                <i class="fa fa-check checkmark fa-stack-1x"></i>
                            </span>
                        </div>
                        <div class="col-xs-5 vcenter checkable-label ${hasFieldErrors ? 'text-danger' : ''}">
                            I have read and agree to the
                            <a href="http://www.tattsgroup.com/legal/privacy" target="_blank">
                                Privacy Statement and Privacy Policy
                            </a>
                            of Tatts Group Limited
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-xs-offset-3 col-xs-6">
                            <input id='submit' class="btn" disabled="disabled" type="submit"
                                   style="background-color: #afafaf; color: #000; margin-bottom: 25px; width: 100%;"
                                   value="SUBMIT"/>
                        </div>
                    </div>
                </g:form>
            </div>
        </div>
    </div>
</div>
</body>
</html>