import com.tattsgroup.newera.Role
import com.tattsgroup.newera.User
import com.tattsgroup.newera.UserRole

import javax.crypto.Cipher
import java.security.NoSuchAlgorithmException

class BootStrap {

    def init = { servletContext ->
        // Create admin user and USER role if they don't already exist
        final _user = User.find { username == 'admin' } ?:
                new User(username: 'admin', password: 'ArgyleObelisk').save(failOnError: true)

        final _role = Role.find { authority == 'ROLE_USER' } ?: new Role(authority: 'ROLE_USER').save(failOnError: true)

        if (! UserRole.find { role == _role && user == _user }) {
            UserRole.create(_user, _role, true)
        }

        try {
            final allowedKeyLength = Cipher.getMaxAllowedKeyLength('AES')
            log.info "Max allowed AES key length is $allowedKeyLength"
            if (allowedKeyLength <= 256) {
                log.error "Max allowed AES key length is too short! JASYPT probably won't work."
            }
        } catch (NoSuchAlgorithmException e) {
            log.error 'No AES encryption algorithm installed!', e
        }
    }

    def destroy = {
    }
}
