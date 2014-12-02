package com.tattsgroup.newera

class IndexController {

    def registrationService

    /** Show the home page.  Include an indication of whether we are running in mobile or not. */
    def index() {
        final mobile = request.getHeader('User-Agent').contains('Mobile') || params.mobile
        [useModal: ! mobile]
    }

    /** Register a visitor. */
    def register(RegistrationCommand cmd) {
        final view = params.view ?: 'index'
        if (cmd.validate()) {
            final registrationError = registrationService.register cmd
            if (registrationError) {
                cmd.errors.reject registrationError
                render view: view, model: [cmd: cmd]
            } else {
                redirect action: 'success'
            }
        } else {
            render view: view, model: [cmd: cmd]
        }
    }

    /** Show the mobile registration page. */
    def mobile() { }

    /** Show the success page. */
    def success() { }

    /** Show the privacy statement. */
    def privacyStatement() { }
}

class RegistrationCommand {
    String name
    String email
    String phone
    Boolean over18
    Boolean privacy

    static constraints = {
        importFrom Registration
    }
}
