package com.tattsgroup.newera

class IndexController {

    def registrationService

    def index() {}

    def register(RegistrationCommand cmd) {
        if (cmd.validate()) {
            final registrationError = registrationService.register cmd
            if (registrationError) {
                cmd.errors.reject registrationError
                render view: 'index', model: [cmd: cmd]
            } else {
                redirect action: 'success'
            }
        } else {
            render view: 'index', model: [cmd: cmd]
        }
    }

    def success() { }

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
