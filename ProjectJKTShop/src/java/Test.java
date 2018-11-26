import java.util.Date;
import model.Orders;

public class Test {
    public static void main(String[] args) {
        Orders orders = new Orders(new Date(),"This place",7,2000,null);
        System.out.println("----------\n\nOrders="+orders);
	  
    }
}
