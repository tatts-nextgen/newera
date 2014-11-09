<html>
<head>
    <meta name="layout" content="main"/>
</head>
<body>

<div class="row" style="margin-top: 100px;">
    <div class="col-xs-12 text-center green" style="font-size: 22pt;">
        THANK YOU FOR SIGNING UP FOR THE NEW ERA IN BETTING
    </div>
</div>

<div class="row" style="margin-top: 100px;">
    <div class="col-xs-10 col-xs-offset-2" style="font-size: 15pt;">
        <p>We will contact you soon with more information on the new era in betting.</p>
        <p>Here is the contact information you provided:</p>
        <dl class="dl-horizontal">
            <dt>Name</dt>
            <dd>${cmd.name}</dd>
            <dt>Email</dt>
            <dd>${cmd.email}</dd>
            <dt>Phone</dt>
            <dd>${cmd.phone ?: 'Not provided'}</dd>
        </dl>
        <p>You'll be able to update your information once we contact you.</p>
    </div>
</div>

<script type="text/javascript">
    _satellite.track('formcapture')
</script>
</body>
</html>