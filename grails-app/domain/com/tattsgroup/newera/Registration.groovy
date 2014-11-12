package com.tattsgroup.newera

import com.bloomhealthco.jasypt.GormEncryptedStringType
import org.apache.commons.lang.StringUtils

/** A visitor has registered for more information.  Store encrypted. */
class Registration {

    static final TITLES = [
            'Mr',
            'Ms',
            'Mrs',
            'Miss',
            'Master',
            'Doctor',
            'Dr',
            'Professor',
            'Prof',
            'Reverend',
            'Rev',
            'Attorney',
            'Atty',
            'Governor',
            'Gov',
            'Officer',
            'Ofc',
            'President',
            'Pres'
    ]

    static final TITLES_WITH_PERIODS = TITLES.collect { "${it}." as String}

    Date dateCreated
    Date lastUpdated
    String name
    String email
    String phone

    static constraints = {
        name nullable: false, blank: false, size: 1..2000
        email nullable: false, blank: false, email: true, size: 1..2000
        phone nullable: true, blank: true, matches: / *(\+61|0) *4( *\d){8} */,  size: 1..2000
    }

    static mapping = {
        name type: GormEncryptedStringType
        email type: GormEncryptedStringType
        phone type: GormEncryptedStringType

    }

    /**
     * Extracts given or first name from full name.
     * Break the full name up into space-delimited text blocks.
     * Ignore first text block if it's a title.
     * Use full name if there's only one text block.
     */
    String getGivenName() {
        if (StringUtils.isBlank(name)) {
            return name
        }

        final splitName = name.split('\\s')

        final candidateGivenName = splitName[0]

        if (splitName.length < 3) {
            return candidateGivenName
        }

        if (TITLES.contains(candidateGivenName) || TITLES_WITH_PERIODS.contains(candidateGivenName)) {
            return splitName[1]
        }

        return candidateGivenName
    }

    /** Extracts surname or last name from full name */
    String getSurname() {
        if (StringUtils.isBlank(name)) {
            return name
        }

        final splitName = name.split('\\s')

        if (splitName.length == 1) {
            return ''
        }

        return splitName[-1]
    }

    String getNormalizedPhone() {
        if (StringUtils.isBlank(phone)) {
            return null
        }
        def normalizedPhone = phone.replaceAll('\\s', '')

        if (normalizedPhone.startsWith('+61')) {
            return normalizedPhone.replaceAll('^\\+61', '61')
        }

        if (normalizedPhone.startsWith('61')) {
            return normalizedPhone
        }

        return normalizedPhone.replaceAll('^0', '61')
    }
}
