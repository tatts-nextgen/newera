import com.tattsgroup.newera.Role
import com.tattsgroup.newera.User
import com.tattsgroup.newera.UserRole

class BootStrap {

    def init = { servletContext ->
        // Create admin user and USER role if they don't already exist
        final _user = User.find { username == 'admin' } ?:
                new User(username: 'admin', password: 'ArgyleObelisk').save(failOnError: true)

        final _role = Role.find { authority == 'ROLE_USER' } ?: new Role(authority: 'ROLE_USER').save(failOnError: true)

        if (! UserRole.find { role == _role && user == _user }) {
            UserRole.create(_user, _role, true)
        }
    }

    def destroy = {
    }
}
