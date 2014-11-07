package com.tattsgroup.newera

class IndexController {

    def index() {}

    def register(RegistrationCommand cmd) {
        if (! cmd.validate()) {
            render view: 'index', model: [cmd: cmd]
        }
    }
}

class RegistrationCommand {
    String name
    String email
    String phone
    Boolean over18
    Boolean privacy

    static constraints = {
        name nullable: false, blank: false
        email nullable: false, blank: false, email: true
        phone nullable: true, blank: true
        over18: validator: { it == 'true' }
        privacy: validator: { it == 'true' }
    }
}
