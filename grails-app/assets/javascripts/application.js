//= require jquery
//= require bootstrap

$(function () {
	$('#spinner').ajaxStart(function() {
        $(this).fadeIn()
    }).ajaxStop(function() {
        $(this).fadeOut()
    })

    // Adobe Analytics
    _satellite.pageBottom()
})
