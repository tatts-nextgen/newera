package com.tattsgroup.newera

import grails.test.mixin.TestFor
import spock.lang.Specification
import spock.lang.Unroll

/**
 * See the API for {@link grails.test.mixin.domain.DomainClassUnitTestMixin} for usage instructions
 */
@TestFor(Registration)
class RegistrationSpec extends Specification {

    def setup() {
    }

    def cleanup() {
    }

    @Unroll
    void "Mobile phone regex works"() {
        expect:
        new Registration(phone: phone).validate(['phone']) == valid

        where:
        phone              | valid
        '0429999999'       | true
        '+61429999999'     | true
        '0429 999 999'     | true
        '+61 429 999 999'  | true
        ' 0429 999 999'    | true
        '0429 999 999 '    | true
        ' 0429 999 999 '   | true
        '  0429 999 999  ' | true
        '07 3000 4000'     | false
        'abc'              | false
        '0429 999 99'      | false
    }

    @Unroll
    void 'Normalized phone number works'() {
        expect:
        new Registration(phone: phone).normalizedPhone == normalizedPhone

        where:
        phone                 | normalizedPhone
        '61429999999'         | '61429999999'
        '+61429999999'        | '61429999999'
        '+61 429999999'       | '61429999999'
        '+61 429 999 999'     | '61429999999'
        '  +61 429 999 999  ' | '61429999999'
        '0429 999 999'        | '61429999999'
        '0429999999'          | '61429999999'
    }

    @Unroll
    void 'First name works'() {
        when:
        Registration registration = new Registration(name: name)

        then:
        registration.givenName == givenName

        and:
        registration.surname == surname

        where:

        name                     | givenName | surname
        'Jerry Gaines'           | 'Jerry'   | 'Gaines'
        'Jerry'                  | 'Jerry'   | ''
        'Dr. Jerry Gaines'       | 'Jerry'   | 'Gaines'
        "Mr Jerry O'Toole"       | 'Jerry'   | "O'Toole"
        'Professor Jerry Gaines' | 'Jerry'   | 'Gaines'
        'Doctor Jerry Gaines'    | 'Jerry'   | 'Gaines'

    }
}
