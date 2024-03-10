package consult_user;

import com.intuit.karate.junit5.Karate;

public class ConsultUserRunner {
    @Karate.Test
    Karate runner() {
        return Karate.run().relativeTo(getClass());
    }
}
