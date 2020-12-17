import com.course.store.dao.UserDao;
import com.course.store.domain.User;
import com.course.store.expection.ActiveCodeException;
import com.course.store.service.UserService;
import com.course.store.utils.UUIDUtil;
import org.junit.Before;
import org.junit.Test;

import java.io.IOException;
import java.sql.Timestamp;

public class TestUserService {
    private UserService userService;

    @Before
    public void init() throws IOException {
        userService = new UserService();
    }

    @Test
    public void registerTest() throws Exception {
        User user = new User();
        Timestamp dateNow=new Timestamp(System.currentTimeMillis());
        user.setUid(UUIDUtil.getUUID());
        user.setUsername("wangyao");
        user.setPassword("wangyaonb2020");
        user.setEmail("1581446178@qq.com");
        user.setName("王耀");
        user.setUpdatetime(dateNow);
        userService.register(user);
    }

    @Test
    public void activeUserTest() throws IOException, ActiveCodeException {
        String activecode = "Qg4y4T74";
        userService.activeUser(activecode);
        System.out.println("激活成功");
    }

}
