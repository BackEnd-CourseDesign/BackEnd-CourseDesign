import com.course.store.dao.OrdersDao;
import com.course.store.dao.UserDao;
import com.course.store.domain.*;
import com.course.store.utils.UUIDUtil;
import com.course.store.domain.Orders;
import org.junit.Before;
import org.junit.Test;

import java.io.IOException;
import java.sql.Timestamp;

public class TestOrdersDao {
    private OrdersDao ordersDao;

    @Before
    public void init() throws IOException {
        ordersDao = new OrdersDao("mybatis-config.xml");
    }

    @Test
    public void addOrders(){
        Orders o = new Orders();
        o.setOid(UUIDUtil.getUUID());
        Timestamp dateNow=new Timestamp(System.currentTimeMillis());
        o.setOrdertime(dateNow.toString());
        o.setUid("e1856d2ea892401e9b044600ef5591a9");
        ordersDao.addOrder(o);
    }
    @Test
    public void findOrderByOID(){
        Orders o ;
        o = ordersDao.findOrderByOID("e1856d2ea892401e9b044600ef5591a9");
        System.out.println(o);
    }
    @Test
    public void findOrderByUID(){
        Orders o ;
        o = ordersDao.findOrderByUID("b180c26bc040441896b830445255c70c");
        System.out.println(o);
    }

}
