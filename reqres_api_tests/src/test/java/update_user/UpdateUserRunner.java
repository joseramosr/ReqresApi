package update_user;

import com.intuit.karate.junit5.Karate;

public class UpdateUserRunner {
    @Karate.Test
    Karate runner() {
        return Karate.run().relativeTo(getClass());
    }
}
