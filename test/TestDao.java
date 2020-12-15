import com.course.store.dao.UserDao;
import com.course.store.domain.User;
import com.course.store.utils.UUIDUtil;
import org.junit.*;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class TestDao {
    private UserDao UserDao;

    @Before
    public void init() throws IOException {
        UserDao = new UserDao("mybatis-config.xml");
    }

    @Test
    public void findAllTest() {
        List<User> all = UserDao.selectUser();
        all.forEach(System.out::println);
    }

    @Test
    public void insertTest() {

        User user = new User();
        user.setUid(UUIDUtil.getUUID());
        user.setUsername("wangyao");
        user.setPassword("wangyaonb2020");
        user.setEmail("123456789@qq.com");
        user.setName("王耀");
        UserDao.addUser(user);
    }

    @Test
    public void findUserByLoginTest(){
       User user;
       String username = "lyj";
       String password = "123456";
       Map<String, Object> map = new HashMap<String, Object>();
       map.put("username",username);
       map.put("password",password);
       user = UserDao.findUserByLogin(map);
       System.out.println(user.toString());
    }
}
