package login;

import com.intuit.karate.junit5.Karate;

public class LoginRunner {
    @Karate.Test
    Karate runner() {
        return Karate.run().relativeTo(getClass());
    }
}
