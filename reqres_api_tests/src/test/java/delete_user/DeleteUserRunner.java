package delete_user;

import com.intuit.karate.junit5.Karate;

public class DeleteUserRunner {
    @Karate.Test
    Karate runner() {
        return Karate.run().relativeTo(getClass());
    }
}
