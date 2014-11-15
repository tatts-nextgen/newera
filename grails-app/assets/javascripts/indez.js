var showModalOnLoad

$(function () {
    // Check to enable/disable submit button every 300ms
    setInterval(checkSubmitButton, 300)

    // Pseudo-checkbox changes visual state and sets the value of a hidden field
    $('div.pseudocheckbox').click(function() {
        var t = $(this)
        var hiddenFieldId = t.attr('data-hidden-field')
        var hiddenField = $('#' + hiddenFieldId)
        if (hiddenField.val() == 'true') {
            unsetHiddenField(hiddenField, t)
        } else {
            setHiddenField(hiddenField, t)
        }
    }).keypress(function() { // makes it behave like a normal checkbox, where you can press a key to set/unset it
        $(this).click()
    })

    // Checkmark, when visible, is in front of the div and "intercepts" the click event
    $('i.fa-check').click(function(e) {
        $(this).parent('div.pseudocheckbox').click()

        // don't let the event bubble up to the div, or else it's like the user double-clicked it, i.e. no net effect!
        e.stopPropagation()
    })

    // make text to the right of checkboxes behave like labels
    $('.checkable-label').click(function() {
        $(this).prev('div').find('div.pseudocheckbox').click()

        // don't tick or untick the checkboxes if the user clicks the privacy links embedded in the checkbox labels
        if ($(e.target).tagName == 'a') {
            e.stopPropagation()
        }
    })

    // put focus in the first error field, or the email field if there are no error fields, when the modal is shown
    var errorFields = $('div.error').find('input')
    var focusField = (errorFields.length == 0) ? $('#email') : errorFields[0]
    $('#myModal').on('shown.bs.modal', function() {
        focusField.focus()
    })

    // on page load, make the over18 pseudocheckbox visually reflect the value of the hidden field ...
    if ($('#over18').val()) {
        setHiddenField($('#over18'), $('div.pseudocheckbox[data-hidden-field=over18]'))
    }

    // ... and ditto for privacy
    if ($('#privacy').val()) {
        setHiddenField($('#privacy-checkable'), $('div.pseudocheckbox[data-hidden-field=privacy]'))
    }

    // validation errors mean we should show the modal as soon as the page loads
    if (showModalOnLoad) {
        $('#myModal').modal('show')
    }

})

// Set the value of a hidden field and the correlated visual state of its corresponding pseudo-checkbox to 'true'
function setHiddenField(hiddenField, checkbox) {
    hiddenField.val('true')
    checkbox.addClass('checkedx').find('i.fa-check').show()
}

// Set the value of a hidden field and the correlated visual state of its corresponding pseudo-checkbox to 'false'
function unsetHiddenField(hiddenField, checkbox) {
    hiddenField.val('')
    checkbox.removeClass('checkedx').find('i.fa-check').hide()
}

// Check to enable/disable submit button
function checkSubmitButton() {
   if ($('#over18').val() && $('#privacy').val() && $('#name').val() && $('#email').val()) {
        $('#submit').removeAttr('disabled')
   } else {
        $('#submit').attr('disabled', 'disabled')
   }
}