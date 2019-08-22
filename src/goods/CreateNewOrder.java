package goods;

import domain.Cart;
import domain.CartItem;
import domain.Order;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementCreator;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.jdbc.support.KeyHolder;
import utils.JDBCUtils;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.PreparedStatement;
import java.sql.Statement;
import java.util.Map;

@WebServlet("/CreateNewOrder")
public class CreateNewOrder extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        String unpaid = "未支付";
        HttpSession session = request.getSession();
        if (session.getAttribute("user_nickname")==null){
            response.sendRedirect("login.jsp");
        }else{
            Cart cart =(Cart) session.getAttribute("cart");
            Map<String, CartItem> goodsMap = cart.getGoodsMap();
            Order order =(Order) session.getAttribute("order");
            if (order==null){
                order = new Order();
                for (Map.Entry<String, CartItem> cartItemEntry : goodsMap.entrySet()) {
                    order.addGoods(cartItemEntry.getValue().getGoods());
                    order.getOrderMap().get(cartItemEntry.getKey()).setQuantity(cartItemEntry.getValue().getQuantity());
                }
            }else{
                for (Map.Entry<String, CartItem> cartItemEntry : goodsMap.entrySet()) {
                    order.addGoods(cartItemEntry.getValue().getGoods());
                    order.getOrderMap().get(cartItemEntry.getKey()).setQuantity(cartItemEntry.getValue().getQuantity());
                }
            }
            session.setAttribute("order",order);
            if (goodsMap.size()!=0){
                int user_id =(int) session.getAttribute("user_id");
                String user_nickname =(String) session.getAttribute("user_nickname");
                String user_phoneNumber =(String) session.getAttribute("user_phoneNumber");
                StringBuilder user_cart= new StringBuilder();
                for (Map.Entry<String, CartItem> cartItemEntry : goodsMap.entrySet()) {
                    String cart_goods_name = cartItemEntry.getValue().getGoods().getGoods_name();
                    int cart_quantity = cartItemEntry.getValue().getQuantity();
                    user_cart.append(cart_goods_name).append("*").append(cart_quantity).append("\n");
                }
                double product_totalPrice = cart.getPrice();
                JdbcTemplate jdbcTemplate = new JdbcTemplate(JDBCUtils.getDataSource());
                KeyHolder keyHolder = new GeneratedKeyHolder();
                PreparedStatementCreator preparedStatementCreator = connection -> {
                    PreparedStatement ps = connection.prepareStatement("insert into `order` values(null ,'"+user_id+"','"+unpaid+"','"+product_totalPrice+"',null,null,null,'"+user_nickname+"','"+user_phoneNumber+"','"+user_cart+"')",Statement.RETURN_GENERATED_KEYS);
                    return ps;
                };
                jdbcTemplate.update(preparedStatementCreator,keyHolder);
                order.setOrder_id( keyHolder.getKey().intValue());
                goodsMap.clear();
                response.sendRedirect("createOrder.jsp");
            }else{
                response.sendRedirect("createOrder.jsp");
            }
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }
}
