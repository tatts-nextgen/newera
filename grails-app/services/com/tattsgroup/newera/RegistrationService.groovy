package com.tattsgroup.newera

class RegistrationService {

    /**
     * Register a visitor.  Return the error code of an unrecoverable error, or null if registration succeeded.
     *
     * If an email is already registered, just create another registration record.  Emails are not unique.
     * If an email is registered more than once, the business can figure out how to react to that.
     */
    def register(final registrationCmd) {
        if (! registrationCmd) {
            return 'registration.null'
        }

        Registration registration =
                new Registration(email: registrationCmd.email, name: registrationCmd.name, phone: registrationCmd.phone)

        if (registration.validate()) {
            try {
                registration.save()
                return null
            } catch (Exception e) {
                log.error "Unable to save registration for ${registrationCmd.email}", e
                return 'registration.error'
            }
        } else {
            log.error "Registration for ${registrationCmd.email} doesn't validate"
            registration.errors.each { log.error it }
            return 'registration.invalid'
        }
    }

    /** Retrieve all registrations, ordered by date created descending */
    def getAllRegistrations() {
        Registration.listOrderByDateCreated([order: 'desc'])
    }

    /** Get the number of registrations */
    def getRegistrationCount() {
        Registration.count()
    }

    /** Get the date of the most recent registration */
    def getMostRecentRegistrationDate() {
        Registration.withCriteria {
            projections {
                max 'dateCreated'
            }
        }?.getAt(0)
    }
}
