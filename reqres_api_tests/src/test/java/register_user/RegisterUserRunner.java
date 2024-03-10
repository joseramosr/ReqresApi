package register_user;

import com.intuit.karate.junit5.Karate;

public class RegisterUserRunner {
    @Karate.Test
    Karate runner() {
        return Karate.run().relativeTo(getClass());
    }
}
