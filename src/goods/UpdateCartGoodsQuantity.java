package goods;

import domain.Cart;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/UpdateCartGoodsQuantity")
public class UpdateCartGoodsQuantity extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        String goods_id = request.getParameter("goods_id");
        String quantity = request.getParameter("quantity");
        Cart cart = (Cart) request.getSession().getAttribute("cart");
        if ("1".equals(goods_id)){
            if ("0".equals(quantity)) {
                updateQuantity(goods_id, cart, quantity);
            } else {
                updateQuantity(goods_id, cart, "1");
            }
            response.sendRedirect("myCart.jsp");
        }else{
            updateQuantity(goods_id,cart,quantity);
            response.sendRedirect("myCart.jsp");
        }

    }
    private void updateQuantity(String id, Cart cart, String quantity){
        cart.getGoodsMap().get(id).setQuantity(Integer.parseInt(quantity));
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }
}
