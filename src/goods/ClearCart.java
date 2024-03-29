package goods;

import domain.Cart;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/ClearCart")
public class ClearCart extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Cart cart = (Cart) request.getSession().getAttribute("cart");
        clearCart(cart);
        response.sendRedirect("myCart.jsp");
    }

    private void clearCart(Cart cart){
        cart.getGoodsMap().clear();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }
}
