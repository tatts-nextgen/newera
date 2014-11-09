package com.tattsgroup.newera

import org.codehaus.groovy.grails.io.support.ClassPathResource
import org.joda.time.DateTime
import org.joda.time.format.DateTimeFormat
import pl.touk.excel.export.WebXlsxExporter

class ReportController {

    static final DATESTAMP_FORMATTER = DateTimeFormat.forPattern('YYYYMMddhhmmss')

    static final REGISTRATION_PROPERTIES = ['name', 'givenName', 'surname', 'email', 'phone', 'dateCreated']

    def registrationService

    def index() {
        [registrationCount: registrationService.registrationCount]
    }

    def export() {
        final registrations = registrationService.allRegistrations
        final datestamp = DATESTAMP_FORMATTER.print(DateTime.now())
        new WebXlsxExporter(new ClassPathResource('/registrations-export-template.xlsx').file.absolutePath).with {
            dateCellFormat = 'MMM d, yyyy, h:m'
            setHeaders(response, "newera-registrations-${datestamp}.xlsx")
            add(registrations, REGISTRATION_PROPERTIES)
            save(response.outputStream)
        }
    }
}
