import com.course.store.domain.Product;
import com.course.store.service.ProductService;
import com.course.store.service.UserService;
import org.junit.Before;
import org.junit.Test;

import java.io.IOException;
import java.util.List;

public class ProductTest {
    private ProductService productService;

    @Before
    public void init() throws IOException {
        productService = new ProductService();
    }
    @Test
    public void getNew(){
        try {
            List<Product> aNew = productService.getNew();
            aNew.stream()
                    .forEach(System.out::println);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
