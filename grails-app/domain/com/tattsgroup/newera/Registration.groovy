package com.tattsgroup.newera

import com.bloomhealthco.jasypt.GormEncryptedStringType

/** A visitor has registered for more information.  Store encrypted. */
class Registration {

    Date dateCreated
    Date lastUpdated
    String name
    String email
    String phone

    static constraints = {
        name nullable: false, blank: false, size: 1..2000
        email nullable: false, blank: false, email: true, size: 1..2000
        phone nullable: true, blank: true, size: 1..2000
    }

    static mapping = {
        name type: GormEncryptedStringType
        email type: GormEncryptedStringType
        phone type: GormEncryptedStringType

    }

    /** Extracts given or first name from full name */
    String getGivenName() {
        try {
            (name =~ /(.*?)(?: .*)* (.*)/)[0][1]
        } catch (IndexOutOfBoundsException e) {
            ''
        }
    }

    /** Extracts surname or last name from full name */
    String getSurname() {
        try {
            (name =~ /(.*?)(?: .*)* (.*)/)[0][2]
        } catch (IndexOutOfBoundsException e) {
            ''
        }
    }
}
