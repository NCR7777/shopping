package goods;

import domain.Cart;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/DeleteCartGoods")
public class DeleteCartGoods extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        String goods_id = request.getParameter("goods_id");
        Cart cart = (Cart) request.getSession().getAttribute("cart");
        deleteGoods(goods_id,cart);
        response.sendRedirect("myCart.jsp");
    }

    private void deleteGoods(String id, Cart cart){
        cart.getGoodsMap().remove(id);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }
}
