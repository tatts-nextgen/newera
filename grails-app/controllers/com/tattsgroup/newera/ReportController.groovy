package com.tattsgroup.newera

import org.joda.time.DateTime
import org.joda.time.format.DateTimeFormat

/** Report on registrations */
class ReportController {

    /** Format the name of the downloaded registrations file */
    static final DATESTAMP_FORMATTER = DateTimeFormat.forPattern('YYYYMMddhhmmss')

    /** Fields and column headers to export */
    static final HEADERS = [
            name: 'Full Name',
            givenName: 'First Name',
            surname: 'Last Name',
            email: 'Email',
            normalizedPhone: 'Mobile Phone',
            dateCreated: 'Date/Time Submitted'
    ]
    static final FIELDS = HEADERS.keySet() as List

    /** Format the date/time submitted field */
    static final DATEFIELD_FORMATTER = DateTimeFormat.forPattern('HH:mm ddMMYYYY')
    static final DATEFIELD_FORMAT_CLOSURE = { registration, dateCreated ->
        DATEFIELD_FORMATTER.print(new DateTime(dateCreated))
    }
    static final FORMATTERS = [dateCreated: DATEFIELD_FORMAT_CLOSURE]

    def registrationService

    def exportService

    /** Render the reports page with some useful key stats */
    def index() {
        [
                registrationCount: registrationService.registrationCount,
                mostRecentRegistrationDate: registrationService.mostRecentRegistrationDate
        ]
    }

    /** Export registrations to a CSV file */
    def export() {
        final registrations = registrationService.allRegistrations
        final datestamp = DATESTAMP_FORMATTER.print(DateTime.now())
        response.contentType = 'text/csv'
        response.setHeader('Content-disposition', "attachment;filename=registrations-${datestamp}.csv")
        exportService.export('csv', response.outputStream, registrations, FIELDS, HEADERS, FORMATTERS, [:])
    }
}
