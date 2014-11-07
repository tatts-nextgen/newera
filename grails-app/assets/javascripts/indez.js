//= require jquery

$(function () {
    setInterval(checkSubmitButton, 300)

    $('i.checkable').click(function() {
        var t = $(this)
        if (t.hasClass('fa-square-o')) {
            t.removeClass('fa-square-o').addClass('fa-square').addClass('green')
            t.next('i').show()
            setCorrespondingHiddenFieldValue(t, 'true')
        }
    })
    $('i.checkmark').click(function() {
        var t = $(this)
        t.prev('i').addClass('fa-square-o').removeClass('fa-square').removeClass('green')
        t.hide()
        setCorrespondingHiddenFieldValue(t, '')
    })
})

function checkSubmitButton() {
    if ($('#over18').val() && $('#privacy').val() && $('#name').val() && $('#email').val()) {
        $('#submit').removeAttr('disabled')
    } else {
        $('#submit').attr('disabled', 'disabled')
    }
}

function setCorrespondingHiddenFieldValue(t, value) {
    var hiddenFieldId = t.parent('span').attr('data-hidden-field')
    var hiddenField = $('#' + hiddenFieldId)
    hiddenField.val(value)
}