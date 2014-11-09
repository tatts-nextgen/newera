package com.tattsgroup.newera

/** A visitor has registered for more information */
class Registration {

    Date dateCreated
    Date lastUpdated
    String name
    String email
    String phone

    static constraints = {
        name nullable: false, blank: false
        email nullable: false, blank: false, email: true
        phone nullable: true, blank: true
    }

    static mapping = {
        email index: 'email_idx'
    }

    String getGivenName() {
        try {
            (name =~ /(.*?)(?: .*)* (.*)/)[0][1]
        } catch (IndexOutOfBoundsException e) {
            ''
        }
    }

    String getSurname() {
        try {
            (name =~ /(.*?)(?: .*)* (.*)/)[0][2]
        } catch (IndexOutOfBoundsException e) {
            ''
        }
    }
}
