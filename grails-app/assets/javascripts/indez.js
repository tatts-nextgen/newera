var showModalOnLoad

$(function () {
    // Check to enable/disable submit button every 300ms
    setInterval(checkSubmitButton, 300)

    // Simulate checkboxes with nicer-looking font-awesome icons
    $('i.checkable').click(function() {
        var t = $(this)
        t.removeClass('fa-square-o').addClass('fa-square').addClass('black')
        t.next('i').show()
        setCorrespondingHiddenFieldValue(t, 'true')
    })
    $('i.checkmark').click(function() {
        var t = $(this)
        t.prev('i').addClass('fa-square-o').removeClass('fa-square').removeClass('black')
        t.hide()
        setCorrespondingHiddenFieldValue(t, '')
    })

    // make text to the right of checkboxes behave like labels
    $('.checkable-label').click(function() {
        var prevDiv = $(this).prev('div')
        var checkmark = prevDiv.find('i.checkmark')
        if (checkmark.is(':visible')) {
            checkmark.click()
        } else {
            prevDiv.find('i.checkable').click()
        }
    })

    // don't tick or untick the checkboxes if the user clicks the privacy links embedded in the checkbox labels
    $('.checkable-label a').click(function(e) {
        e.stopPropagation()
    })

    if ($('#over18').val()) {
        $('#over18-checkable').click()
    }

    if ($('#privacy').val()) {
        $('#privacy-checkable').click()
    }

    // validation errors mean we should show the modal as soon as the page loads
    if (showModalOnLoad) {
        $('#myModal').modal('show')
    }
})

// Check to enable/disable submit button
function checkSubmitButton() {
    if ($('#over18').val() && $('#privacy').val() && $('#name').val() && $('#email').val()) {
        $('#submit').removeAttr('disabled')
    } else {
        $('#submit').attr('disabled', 'disabled')
    }
}

// Set the value of the hidden field corresponding to one of the faux checkboxes
function setCorrespondingHiddenFieldValue(t, value) {
    var hiddenFieldId = t.parent('span').attr('data-hidden-field')
    var hiddenField = $('#' + hiddenFieldId)
    hiddenField.val(value)
}