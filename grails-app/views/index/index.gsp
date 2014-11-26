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
<div class="row" style="margin-top: 100px; margin-bottom: 10px;">
    <div class="col-xs-12 text-center green" style="font-size: 28pt; font-weight: bold;">
        WELCOME
    </div>
</div>
<div class="row">
    <div class="col-xs-12 text-center" style="font-size: 48pt; font-weight: bold;">
        READY FOR A NEW ERA?
    </div>
</div>
<div class="row" style="margin-top: 40px; margin-bottom: 60px;">
    <div class="col-xs-12 text-center hidden-xs">
        <asset:image src="ubet-logo.png"/>
    </div>
    <div class="col-xs-12 text-center visible-xs">
        <asset:image src="ubet-logo.png" style="width: 350px;"/>
    </div>
</div>
<div class='row' style="margin-top: 20px; margin-bottom: 50px;">
    <div class="col-xs-12 text-center">
        <p id="hearMore" data-toggle="modal" data-target="#myModal" style="letter-spacing: 2px;">
            <br/>HEAR<br/>MORE
        </p>
    </div>
</div>
<div class="row" style="margin-bottom: 50px;">
    <div class="col-xs-12 text-center green" style="font-size: 26pt; letter-spacing: 2px;">
        Coming soon. Watch this space.
    </div>
</div>
<footer style="text-align: center; color: #5f5f58;">
    <p>Think! About your choices.</p>
    <p>Call your state based gambling help services on 1800 858 858.  In NSW visit
        <a href="http://www.gamblinghelp.nsw.gov.au" target="_blank" style="color: #5f5f58;">
            www.gamblinghelp.nsw.gov.au
        </a>.
    </p>
    <p>In WA visit
        <a href="http://www.gamblinghelponline.org.au" target="_blank" style="color: #5f5f58;">
            www.gamblinghelponline.org.au
        </a>.
        Think of the people who need your support.  Gamble Responsibly.
    </p>
</footer>
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true"
        data-backdrop="static">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header" style="border-bottom: none;">
                <span class="close" data-dismiss="modal">
                    <span aria-hidden="true" class="modal-close">X</span>
                    <span class="sr-only">Close</span>
                </span>
            </div>
            <div class="modal-body" style="margin-top: 10px;">
                <div class="text-center">
                    <asset:image src="layout-join-email.svg"/>
                    <p style="color: #afafaf; font-size: 18pt; padding-bottom: 10px; margin-top: 10px;">
                        Register to hear more
                    </p>
                </div>
                <g:form action="register" role="form">
                    <input type="hidden" name="over18" id="over18" value="${params.over18}"/>
                    <input type="hidden" name="privacy" id="privacy" value="${params.privacy}"/>

                    <div class="row">
                        <div class="col-sm-6 col-sm-offset-3 col-xs-12">

                            <%-- Email --%>
                            <g:set var="hasFieldErrors" value="${cmd?.errors?.hasFieldErrors('email')}"/>
                            <div class="form-group ${hasFieldErrors ? 'error' :''}">
                                <label class="control-label" for="email">EMAIL</label>
                                <div class="input-group">
                                    <span class="input-group-addon"><i class="fa fa-envelope"></i></span>
                                    <input type="email" required="true" id="email" name="email" placeholder="Email"
                                           class="form-control" value="${cmd?.email}" tabindex="1"/>
                                </div>
                                <span class="help-block">
                                    <small><em>
                                        <g:eachError bean="${cmd}" field="email">
                                            <g:message error="${it}"/><br/>
                                        </g:eachError>
                                    </em></small>
                                </span>
                            </div>

                            <%-- Name --%>
                            <g:set var="hasFieldErrors" value="${cmd?.errors?.hasFieldErrors('name')}"/>
                            <div class="form-group ${hasFieldErrors ? 'error' :''}">
                                <label class="control-label" for="name">NAME</label>
                                <div class="input-group">
                                    <span class="input-group-addon"><i class="fa fa-user"></i></span>
                                    <input type="text" id="name" name="name" required="true" placeholder="Name"
                                           class="form-control" value="${cmd?.name}" tabindex="2" />
                                </div>
                                <span class="help-block">
                                    <small><em>
                                        <g:eachError bean="${cmd}" field="name">
                                            <g:message error="${it}"/><br/>
                                        </g:eachError>
                                    </em></small>
                                </span>
                            </div>

                            <%-- Phone --%>
                            <g:set var="hasFieldErrors" value="${cmd?.errors?.hasFieldErrors('phone')}"/>
                            <div class="form-group ${hasFieldErrors ? 'error' :''}">
                                <label class="control-label" for="phone">
                                    MOBILE <span style="color: #dfdfdf;">(Optional)</span>
                                </label>
                                <div class="input-group">
                                    <span class="input-group-addon"><i class="fa fa-mobile fa-lg"></i></span>
                                    <input type="text" id="phone" name="phone" placeholder="Mobile"
                                           class="form-control" value="${cmd?.phone}" tabindex="3"/>
                                </div>
                                <span class="help-block">
                                    <small><em>
                                        <g:eachError bean="${cmd}" field="phone">
                                            <g:message error="${it}"/><br/>
                                        </g:eachError>
                                    </em></small>
                                </span>
                            </div>
                        </div>
                    </div>

                    <%-- Over 18 --%>
                    <g:set var="hasFieldErrors" value="${cmd?.errors?.hasFieldErrors('over18')}"/>
                    <div class="row" style="color: #afafaf; margin-bottom: 10px;">
                        <div class="col-sm-offset-3 col-sm-1 col-xs-2 vcenter">
                            <div class="pseudocheckbox" data-hidden-field="over18" tabindex="4">
                                <i class="fa fa-check checkmark green"></i>
                            </div>
                        </div>
                        <div class="col-sm-7 col-xs-9 vcenter checkable-label">
                            I confirm that I am over 18 years of age
                        </div>
                    </div>
                    <g:if test="${hasFieldErrors}">
                        <div class="row" style="position: relative; top: -25px;">
                            <div class="col-sm-6 col-sm-offset-3 col-xs-10">
                                <span class="error"><small><em>
                                    <g:eachError bean="${cmd}" field="over18">
                                        <br/><g:message error="${it}"/>
                                    </g:eachError>
                                </em></small></span>
                            </div>
                        </div>
                    </g:if>

                    <%-- Privacy --%>
                    <g:set var="hasFieldErrors" value="${cmd?.errors?.hasFieldErrors('privacy')}"/>
                    <div class="row" style="color: #afafaf; margin-bottom: 10px;">
                        <div class="col-sm-offset-3 col-sm-1 col-xs-2 vcenter">
                            <div class="pseudocheckbox" data-hidden-field="privacy" tabindex="5">
                                <i class="fa fa-check checkmark green"></i>
                            </div>
                        </div>
                        <div class="col-sm-6 col-xs-9 vcenter checkable-label">
                            I have read and agree to the
                            <g:link action="privacyStatement" target="_blank">
                                Privacy Statement
                            </g:link>
                            <br/>
                            and
                            <a href="http://www.tattsgroup.com/legal/privacy" target="_blank">
                                Privacy Policy
                            </a>
                            of Tatts Group Limited
                        </div>
                    </div>
                    <g:if test="${hasFieldErrors}">
                        <div class="row" style="position: relative; top: -25px;">
                            <div class="col-sm-6 col-sm-offset-3 col-xs-10">
                                <span class="error"><small><em>
                                    <g:eachError bean="${cmd}" field="privacy">
                                        <br/><g:message error="${it}"/>
                                    </g:eachError>
                                </em></small></span>
                            </div>
                        </div>
                    </g:if>

                    <div class="row" style="margin-top: 15px;">
                        <div class="col-xs-offset-3 col-xs-6">
                            <input id='submit' class="btn green-background" disabled="disabled" type="submit"
                                   style="margin-bottom: 25px; width: 100%;" value="SUBMIT" tabindex="6"/>
                        </div>
                    </div>
                </g:form>
            </div>
        </div>
    </div>
</div>
</body>
</html>