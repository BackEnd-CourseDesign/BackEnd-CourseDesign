import com.course.store.dao.UserDao;
import com.course.store.domain.User;
import com.course.store.utils.UUIDUtil;
import org.junit.*;

import java.io.IOException;
import java.sql.Timestamp;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class TestUserDao {
    private UserDao userDao;

    @Before
    public void init() throws IOException {
        userDao = new UserDao("mybatis-config.xml");
    }

    @Test
    public void findAllTest() {
        List<User> all = userDao.selectAll();
        all.forEach(System.out::println);
    }

    @Test
    public void insertTest() {

        User user = new User();
        Timestamp dateNow=new Timestamp(System.currentTimeMillis());
        user.setUid(UUIDUtil.getUUID());
        user.setUsername("wangyao");
        user.setPassword("wangyaonb2020");
        user.setEmail("1581446178@qq.com");
        user.setName("王耀");
        user.setUpdatetime(dateNow);
        userDao.addUser(user);
    }

    @Test
    public void activeUserTest(){
        String uid = "0bafb322170644988469b80f49db3298";
        userDao.activeUser(uid);
        System.out.println("激活成功");
    }

    @Test
    public void findUserByLoginTest(){
       User user;
       String username = "lyj";
       String password = "123456";
       Map<String, Object> map = new HashMap<>();
       map.put("username",username);
       map.put("password",password);
       user = userDao.findUserByLogin(map);
       System.out.println(user.toString());
    }
    @Test
    public void findUserById(){
        User user = userDao.findUserByUID("896a5171a63f4cf3841cdf4abdb1175f");
        System.out.println(user);
    }
}
