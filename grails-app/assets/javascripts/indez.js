//= require jquery

$(function () {
    $('i.checkable').click(function() {
        var t = $(this)
        var hiddenFieldId = t.parent('span').attr('data-hidden-field')
        var hiddenField = $('#' + hiddenFieldId)
        if (t.hasClass('fa-square-o')) {
            t.removeClass('fa-square-o').addClass('fa-square').addClass('green')
            t.next('i').show()
            hiddenField.val('true')
        }
    })
    $('i.checkmark').click(function() {
        var t = $(this)
        var hiddenFieldId = t.parent('span').attr('data-hidden-field')
        var hiddenField = $('#' + hiddenFieldId)
        t.prev('i').addClass('fa-square-o').removeClass('fa-square').removeClass('green')
        t.hide()
        hiddenField.val('false')
    })
})