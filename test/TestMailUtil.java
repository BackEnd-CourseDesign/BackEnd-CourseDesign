import com.course.store.utils.MailUtil;
import org.junit.Test;

import javax.mail.MessagingException;
import java.security.GeneralSecurityException;

public class TestMailUtil {
    @Test
    public void mailSendTest() throws GeneralSecurityException, MessagingException {
        MailUtil.sendMail("testcourse2020@163.com","helloworld");
    }
}
